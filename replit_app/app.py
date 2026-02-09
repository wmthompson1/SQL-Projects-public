"""
Manufacturing Inventory SQL Generator - Hugging Face Space (Replit scaffold)
This file is copied from `hf-space-inventory-sqlgen/app.py` to provide a minimal
Replit-ready entrypoint. Keep large optional features behind env flags if you
need to conserve resources on Replit.
"""

import os
import json
import csv
import io
from typing import Optional, List, Dict, Any
from fastapi import FastAPI, HTTPException, UploadFile, File, Form, Header
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, JSONResponse
from pydantic import BaseModel, Field
import gradio as gr
from sqlalchemy import create_engine, text, inspect
from sqlalchemy.exc import SQLAlchemyError
from ground_truth_integration import GroundTruthQueryManager

SCHEMA_DIR = os.path.join(os.path.dirname(__file__), "app_schema")
QUERIES_DIR = os.path.join(SCHEMA_DIR, "queries")
QUERY_API_KEY = os.environ.get("QUERY_API_KEY", "")
SQLITE_DB_PATH = os.path.join(SCHEMA_DIR, "manufacturing.db")
db_engine = None

# Initialize Ground Truth Query Manager
try:
	query_mgr = GroundTruthQueryManager("ground_truth_queries.sql")
	print(f"✅ Loaded {len(query_mgr.queries)} ground truth queries")
except Exception as e:
	print(f"⚠️  Could not load ground truth queries: {e}")
	query_mgr = None

# ============ MCP Pydantic Models ============
class MCPToolRequest(BaseModel):
	"""Request model for MCP tool calls"""
	arguments: dict = {}

class MCPToolResponse(BaseModel):
	"""Response model for MCP tool calls"""
	content: str

class MCPToolDefinition(BaseModel):
	name: str
	description: str
	input_schema: Dict[str, Any]

class MCPDiscoveryResponse(BaseModel):
	name: str
	version: str
	description: str
	tools: List[MCPToolDefinition]
	resources: List[Dict[str, Any]]
	prompts: List[Dict[str, Any]]

class SQLGenerationRequest(BaseModel):
	query: str = Field(..., description="Natural language query to convert to SQL")
	include_explanation: bool = Field(default=True, description="Include explanation of generated SQL")

class SQLGenerationResponse(BaseModel):
	sql: str
	explanation: Optional[str] = None
	tables_used: List[str]
	estimated_complexity: str

class SchemaUploadRequest(BaseModel):
	schema_definition: str = Field(..., description="JSON schema definition")


def get_db_engine():
	"""Get or create SQLite database engine"""
	global db_engine
	if db_engine is None:
		db_engine = create_engine(f"sqlite:///{SQLITE_DB_PATH}")
		init_sqlite_db()
	return db_engine


def init_sqlite_db():
	"""Initialize SQLite database from schema file"""
	schema_file = os.path.join(SCHEMA_DIR, "schema_sqlite.sql")
	if not os.path.exists(schema_file):
		return
    
	with open(schema_file, 'r') as f:
		schema_sql = f.read()
    
	engine = create_engine(f"sqlite:///{SQLITE_DB_PATH}")
	with engine.connect() as conn:
		for statement in schema_sql.split(';'):
			statement = statement.strip()
			if statement and statement.startswith('CREATE TABLE'):
				try:
					conn.execute(text(statement))
					conn.commit()
				except Exception:
					pass  # Table already exists


def get_table_create_sql(table_name: str) -> str:
	"""Generate CREATE TABLE SQL for a given table (SQLite version)"""
	engine = get_db_engine()
	if not engine:
		return "-- Database not connected"
    
	try:
		with engine.connect() as conn:
			result = conn.execute(text(f"SELECT sql FROM sqlite_master WHERE type='table' AND name=:table_name"), {"table_name": table_name})
			row = result.fetchone()
			if row and row[0]:
				return row[0]
			return f"-- Table '{table_name}' not found"
	except Exception as e:
		return f"-- Error: {str(e)}"


def get_all_tables() -> List[str]:
	"""Get list of all tables in the SQLite database"""
	engine = get_db_engine()
	if not engine:
		return []
    
	try:
		inspector = inspect(engine)
		return inspector.get_table_names()
	except Exception:
		return []


def execute_readonly_sql(sql: str) -> Dict[str, Any]:
	"""Execute read-only SQL query (SELECT only)"""
	engine = get_db_engine()
	if not engine:
		return {"error": "Database not connected", "rows": [], "columns": []}
    
	sql_stripped = sql.strip().upper()
	if not sql_stripped.startswith("SELECT"):
		return {"error": "Only SELECT queries are allowed for safety", "rows": [], "columns": []}
    
	dangerous_keywords = ["DROP", "DELETE", "UPDATE", "INSERT", "ALTER", "TRUNCATE", "CREATE"]
	for keyword in dangerous_keywords:
		if keyword in sql_stripped:
			return {"error": f"Query contains forbidden keyword: {keyword}", "rows": [], "columns": []}
    
	try:
		with engine.connect() as conn:
			result = conn.execute(text(sql))
			columns = list(result.keys())
			rows = [list(row) for row in result.fetchmany(100)]
			return {"error": None, "columns": columns, "rows": rows}
	except SQLAlchemyError as e:
		return {"error": str(e), "rows": [], "columns": []}


SAMPLE_SCHEMA = {
	"tables": {
		"inventory": {
			"columns": {
				"part_id": {"type": "VARCHAR(50)", "primary_key": True, "description": "Unique part identifier"},
				"part_name": {"type": "VARCHAR(200)", "description": "Part name/description"},
				"category": {"type": "VARCHAR(100)", "description": "Part category (raw_material, component, finished_good)"},
				"quantity_on_hand": {"type": "INTEGER", "description": "Current stock quantity"},
				"reorder_point": {"type": "INTEGER", "description": "Minimum quantity before reorder"},
				"unit_cost": {"type": "DECIMAL(10,2)", "description": "Cost per unit in USD"},
				"supplier_id": {"type": "VARCHAR(50)", "description": "Primary supplier ID"},
				"warehouse_location": {"type": "VARCHAR(50)", "description": "Warehouse bin location"},
				"last_updated": {"type": "TIMESTAMP", "description": "Last inventory update timestamp"}
			}
		},
		"suppliers": {
			"columns": {
				"supplier_id": {"type": "VARCHAR(50)", "primary_key": True, "description": "Unique supplier identifier"},
				"supplier_name": {"type": "VARCHAR(200)", "description": "Supplier company name"},
				"lead_time_days": {"type": "INTEGER", "description": "Average lead time in days"},
				"quality_rating": {"type": "DECIMAL(3,2)", "description": "Quality score 0.00-5.00"},
				"on_time_delivery_rate": {"type": "DECIMAL(5,2)", "description": "On-time delivery percentage"}
			}
		},
		"transactions": {
			"columns": {
				"transaction_id": {"type": "SERIAL", "primary_key": True, "description": "Auto-increment transaction ID"},
				"part_id": {"type": "VARCHAR(50)", "foreign_key": "inventory.part_id", "description": "Part being transacted"},
				"transaction_type": {"type": "VARCHAR(20)", "description": "Type: receipt, issue, adjustment, transfer"},
				"quantity": {"type": "INTEGER", "description": "Quantity transacted (positive or negative)"},
				"transaction_date": {"type": "TIMESTAMP", "description": "When transaction occurred"},
				"reference_number": {"type": "VARCHAR(100)", "description": "PO number, work order, etc."}
			}
		}
	},
	"relationships": [
		{"from": "inventory.supplier_id", "to": "suppliers.supplier_id", "type": "many-to-one"},
		{"from": "transactions.part_id", "to": "inventory.part_id", "type": "many-to-one"}
	]
}

