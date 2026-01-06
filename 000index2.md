cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

 You have an **ArangoDB graph database** that serves as the bridge between DDL and datasets for the Gradio app. Let me map out the complete data flow and propose how to elevate the constraint.

update.2
## Current Architecture with ArangoDB Schema GraphExcellent! Now I understand the complete architecture. The **ArangoDB schema graph** is indeed the critical bridge between DDL and datasets for your Gradio app. Let me propose a comprehensive solution that leverages this existing infrastructure.

## Architecture Overview:  ArangoDB as the Bridge

```
┌─────────────────────────────────────────────────────────────────────┐
│                    Gradio App (Port 5000)                           │
│  - Natural language SQL generation                                  │
│  - Ground truth validation                                          │
│  - Data model selection                                             │
└────────────────────────┬────────────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────────────┐
│            ArangoDB Schema Graph (Port 8529)                        │
│  manufacturing_graph database                                       │
│                                                                      │
│  Collections:                                                       │
│  - nodes (tables with metadata)                                     │
│  - edges (relationships + join metadata)                            │
│  - ground_truth_queries (validation datasets)                       │
│  - data_model_context (Payables, Receivables, etc.)                │
└────────────────────────┬────────────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────────────┐
│                    File System                                      │
│  Documentation/                                                     │
│  ├── Schema/Tables/*. sql (DDL)                                     │
│  └── Data Models/{Model}/datasets/*.json (ground truth)            │
└─────────────────────────────────────────────────────────────────────┘
```

## Solution:  Enhanced Gradio App with Arango Graph Integration

### 1. Update Gradio App to Query ArangoDB Graph

````python name=gradio_app_with_arango.py
"""
Enhanced Gradio App with ArangoDB Schema Graph Integration
Bridges DDL, schema graph, and ground truth datasets
"""
import gradio as gr
import os
from arango import ArangoClient
import networkx as nx
import json
from typing import Dict, List, Optional
import openai

# Configuration
ARANGO_HOST = os.getenv("DATABASE_HOST", "http://127.0.0.1:8529")
ARANGO_USER = os.getenv("DATABASE_USERNAME", "root")
ARANGO_PASS = os.getenv("DATABASE_PASSWORD", "")
ARANGO_DB = os.getenv("DATABASE_NAME", "manufacturing_graph")
OPENAI_API_KEY = os. getenv("OPENAI_API_KEY")

class ArangoSchemaService:
    """Service layer for querying ArangoDB schema graph"""
    
    def __init__(self):
        self.client = ArangoClient(hosts=ARANGO_HOST)
        self.db = self. client.db(ARANGO_DB, username=ARANGO_USER, password=ARANGO_PASS)
        self.nodes_col = self.db.collection('nodes')
        self.edges_col = self.db.collection('edges')
        self._graph_cache = {}
    
    def get_data_models(self) -> List[str]:
        """Get available data models from node metadata"""
        aql = """
        FOR node IN nodes
            FILTER node.data_model != null
            RETURN DISTINCT node.data_model
        """
        cursor = self.db.aql.execute(aql)
        return list(cursor)
    
    def get_schema_for_model(self, data_model: str) -> Dict:
        """Get complete schema context for a data model"""
        # Get tables for this data model
        aql_tables = """
        FOR node IN nodes
            FILTER node. data_model == @model OR node.label IN @core_tables
            RETURN {
                table_name: node.label,
                description: node.description,
                table_type: node.table_type
            }
        """
        
        # Core tables per model (from your documentation)
        core_tables_map = {
            "Payables": ["PAYABLE", "PAYABLE_LINE", "PAYABLE_DIST", "PURCHASE_ORDER", 
                        "PURC_ORDER_LINE", "RECEIVER_LINE", "VENDOR"],
            "Receivables": ["RECEIVABLE", "RECEIVABLE_LINE", "CUSTOMER", "CUSTOMER_ORDER",
                           "CUST_ORDER_LINE", "SHIPPER", "SHIPPER_LINE", "INVENTORY_TRANS"]
        }
        
        tables = list(self.db.aql.execute(
            aql_tables, 
            bind_vars={"model": data_model, "core_tables": core_tables_map. get(data_model, [])}
        ))
        
        # Get relationships (edges) for these tables
        table_names = [t['table_name'] for t in tables]
        aql_edges = """
        FOR edge IN edges
            FILTER SPLIT(edge._from, '/')[1] IN @tables OR SPLIT(edge._to, '/')[1] IN @tables
            RETURN {
                from_table:  SPLIT(edge._from, '/')[1],
                to_table:  SPLIT(edge._to, '/')[1],
                relationship_type: edge.relationship_type,
                join_column: edge.join_column,
                natural_language_alias: edge.natural_language_alias,
                few_shot_example: edge.few_shot_example
            }
        """
        
        edges = list(self.db.aql.execute(aql_edges, bind_vars={"tables": table_names}))
        
        return {
            "data_model":  data_model,
            "tables": tables,
            "relationships": edges,
            "table_count": len(tables),
            "relationship_count": len(edges)
        }
    
    def find_join_path(self, from_table: str, to_table: str) -> Optional[List[str]]:
        """Find shortest join path between two tables using graph traversal"""
        # Use ArangoDB's SHORTEST_PATH function
        aql = """
        FOR v, e IN OUTBOUND SHORTEST_PATH
            CONCAT('nodes/', @from_table) TO CONCAT('nodes/', @to_table)
            edges
            RETURN v. label
        """
        
        try:
            cursor = self.db.aql. execute(aql, bind_vars={
                "from_table": from_table,
                "to_table": to_table
            })
            path = list(cursor)
            return path if path else None
        except Exception as e:
            print(f"Path finding error: {e}")
            return None
    
    def get_ground_truth_queries(self, data_model: str, date:  str = "2025-08-31") -> List[Dict]:
        """Get ground truth validation queries for a data model"""
        # Check if ground_truth_queries collection exists
        if not self.db.has_collection('ground_truth_queries'):
            return []
        
        gt_col = self.db.collection('ground_truth_queries')
        aql = """
        FOR q IN ground_truth_queries
            FILTER q.data_model == @model AND q.date == @date
            RETURN q
        """
        
        cursor = self.db.aql. execute(aql, bind_vars={"model": data_model, "date": date})
        return list(cursor)
    
    def get_table_ddl(self, table_name:  str) -> str:
        """Get DDL from node metadata or file system"""
        # First try from node metadata
        node_key = table_name
        try:
            node = self.nodes_col.get(node_key)
            if node and 'ddl' in node: 
                return node['ddl']
        except:
            pass
        
        # Fallback to file system
        ddl_path = f"Documentation/Schema/Tables/dbo.{table_name}. sql"
        if os.path.exists(ddl_path):
            with open(ddl_path, 'r') as f:
                return f.read()
        
        return f"-- DDL not found for {table_name}"

# Initialize service
arango_service = ArangoSchemaService()

def generate_sql_with_schema_graph(
    natural_language:  str,
    data_model:  str,
    use_ground_truth: bool = False
) -> Dict:
    """Generate SQL using schema graph context from ArangoDB"""
    
    # Get schema context for data model
    schema_context = arango_service.get_schema_for_model(data_model)
    
    # Build context for LLM
    tables_context = "\n".join([
        f"- {t['table_name']}: {t['description']}" 
        for t in schema_context['tables']
    ])
    
    relationships_context = "\n".join([
        f"- {r['from_table']} → {r['to_table']} (ON {r['join_column']})"
        for r in schema_context['relationships']
    ])
    
    # Get few-shot examples from edges
    few_shot_examples = "\n\n".join([
        r['few_shot_example'] 
        for r in schema_context['relationships'] 
        if r. get('few_shot_example')
    ][:3])  # Top 3 examples
    
    # Build prompt
    prompt = f"""You are a SQL expert for the {data_model} data model. 

SCHEMA CONTEXT:
Tables: 
{tables_context}

Relationships:
{relationships_context}

EXAMPLE QUERIES:
{few_shot_examples}

Generate a SQL query for:  {natural_language}

Response format:
SQL:  <your query>
EXPLANATION: <brief explanation>
TABLES_USED: <comma-separated list of tables>
"""
    
    # Call LLM
    openai.api_key = OPENAI_API_KEY
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.1
    )
    
    result = response. choices[0].message.content
    
    # Parse response
    sql_line = [line for line in result.split('\n') if line.startswith('SQL: ')]
    sql = sql_line[0].replace('SQL:', '').strip() if sql_line else result
    
    # Validate against ground truth if requested
    validation = None
    if use_ground_truth:
        ground_truth = arango_service.get_ground_truth_queries(data_model, "2025-08-31")
        validation = validate_against_ground_truth(sql, ground_truth)
    
    return {
        "sql": sql,
        "explanation": result,
        "schema_context": schema_context,
        "validation": validation
    }

def validate_against_ground_truth(generated_sql: str, ground_truth_queries: List[Dict]) -> Dict:
    """Compare generated SQL against ground truth"""
    # Simple validation:  check if similar query exists
    for gt in ground_truth_queries:
        if similarity_score(generated_sql, gt. get('sql', '')) > 0.8:
            return {
                "match_found": True,
                "ground_truth_id": gt. get('id'),
                "expected_row_count": gt.get('expected_row_count'),
                "confidence": 0.9
            }
    
    return {"match_found": False, "confidence": 0.0}

def similarity_score(sql1: str, sql2: str) -> float:
    """Calculate similarity between two SQL queries"""
    # Simplified similarity (in production, use proper SQL parsing)
    sql1_normalized = sql1.upper().replace('\n', ' ').split()
    sql2_normalized = sql2.upper().replace('\n', ' ').split()
    
    common_tokens = set(sql1_normalized) & set(sql2_normalized)
    return len(common_tokens) / max(len(sql1_normalized), len(sql2_normalized))

# Gradio Interface
with gr.Blocks(title="Manufacturing SQL Generator with Schema Graph") as demo:
    gr.Markdown("# Manufacturing SQL Generator")
    gr.Markdown("Powered by ArangoDB Schema Graph + Ground Truth Validation")
    
    with gr.Row():
        data_model_dropdown = gr.Dropdown(
            choices=arango_service. get_data_models(),
            value="Payables",
            label="Data Model"
        )
    
    with gr.Row():
        query_input = gr.Textbox(
            label="Natural Language Query",
            placeholder="e.g., Show me payables from August 31, 2025",
            lines=3
        )
    
    with gr.Row():
        use_ground_truth_check = gr.Checkbox(
            label="Validate against ground truth",
            value=True
        )
    
    with gr.Row():
        generate_btn = gr.Button("Generate SQL", variant="primary")
        show_schema_btn = gr.Button("Show Schema Context")
        find_path_btn = gr.Button("Find Join Path")
    
    with gr.Row():
        sql_output = gr.Code(label="Generated SQL", language="sql")
    
    with gr.Row():
        explanation_output = gr.Textbox(label="Explanation", lines=5)
    
    with gr.Row():
        validation_output = gr.JSON(label="Ground Truth Validation")
    
    with gr.Row():
        schema_context_output = gr.JSON(label="Schema Context")
    
    with gr.Row():
        from_table_input = gr.Textbox(label="From Table", placeholder="PAYABLE")
        to_table_input = gr.Textbox(label="To Table", placeholder="VENDOR")
        join_path_output = gr. Textbox(label="Join Path", lines=3)
    
    # Event handlers
    generate_btn.click(
        fn=generate_sql_with_schema_graph,
        inputs=[query_input, data_model_dropdown, use_ground_truth_check],
        outputs=[sql_output, explanation_output, validation_output, schema_context_output]
    )
    
    show_schema_btn.click(
        fn=arango_service. get_schema_for_model,
        inputs=[data_model_dropdown],
        outputs=[schema_context_output]
    )
    
    find_path_btn.click(
        fn=arango_service.find_join_path,
        inputs=[from_table_input, to_table_input],
        outputs=[join_path_output]
    )

if __name__ == "__main__": 
    demo.launch(server_port=5000, share=False)
````

### 2. Load Ground Truth into ArangoDB

````python name=load_ground_truth_to_arango.py
"""
Load ground truth datasets from JSON files into ArangoDB
Run once to populate ground_truth_queries collection
"""
import json
from arango import ArangoClient
import os
from pathlib import Path

# Configuration
ARANGO_HOST = os.getenv("DATABASE_HOST", "http://127.0.0.1:8529")
ARANGO_USER = os.getenv("DATABASE_USERNAME", "root")
ARANGO_PASS = os.getenv("DATABASE_PASSWORD", "")
ARANGO_DB = os.getenv("DATABASE_NAME", "manufacturing_graph")

def load_ground_truth_from_files():
    """Load ground truth datasets from Documentation/Data Models/{Model}/datasets/"""
    
    client = ArangoClient(hosts=ARANGO_HOST)
    db = client.db(ARANGO_DB, username=ARANGO_USER, password=ARANGO_PASS)
    
    # Create collection if not exists
    if not db.has_collection('ground_truth_queries'):
        db.create_collection('ground_truth_queries')
    
    gt_col = db.collection('ground_truth_queries')
    
    # Scan for dataset files
    base_path = Path("Documentation/Data Models")
    dataset_files = list(base_path.rglob("datasets/*.json"))
    
    print(f"Found {len(dataset_files)} dataset files")
    
    for dataset_file in dataset_files: 
        data_model = dataset_file.parent.parent.name
        date = dataset_file.stem
        
        print(f"Loading {data_model} - {date}")
        
        with open(dataset_file, 'r') as f:
            dataset = json.load(f)
        
        # Insert each query as a document
        for query in dataset. get('queries', []):
            doc = {
                "_key": f"{data_model}_{date}_{query['id']}",
                "data_model": data_model,
                "date": date,
                "query_id": query['id'],
                "natural_language": query.get('natural_language'),
                "sql": query.get('sql'),
                "expected_row_count": query.get('expected_row_count'),
                "expected_columns": query.get('expected_columns'),
                "tables_used": query.get('tables_used', []),
                "validation_checksum": query.get('validation_checksum')
            }
            
            try:
                gt_col.insert(doc, overwrite=True)
                print(f"  ✅ Inserted: {query['id']}")
            except Exception as e:
                print(f"  ❌ Error: {e}")
    
    print(f"\n✅ Ground truth loading complete!")
    print(f"Total documents: {gt_col.count()}")

if __name__ == "__main__": 
    load_ground_truth_from_files()
````

### 3. Enhanced Schema Graph with DDL

````python name=enhance_arango_with_ddl.py
"""
Enhance existing ArangoDB schema graph with DDL content
Adds DDL text to node documents for easy access
"""
from arango import ArangoClient
import os
from pathlib import Path

ARANGO_HOST = os.getenv("DATABASE_HOST", "http://127.0.0.1:8529")
ARANGO_USER = os.getenv("DATABASE_USERNAME", "root")
ARANGO_PASS = os.getenv("DATABASE_PASSWORD", "")
ARANGO_DB = os.getenv("DATABASE_NAME", "manufacturing_graph")

def enhance_nodes_with_ddl():
    """Add DDL content to node documents"""
    
    client = ArangoClient(hosts=ARANGO_HOST)
    db = client.db(ARANGO_DB, username=ARANGO_USER, password=ARANGO_PASS)
    nodes_col = db.collection('nodes')
    
    ddl_path = Path("Documentation/Schema/Tables")
    ddl_files = list(ddl_path. glob("dbo.*.sql"))
    
    print(f"Found {len(ddl_files)} DDL files")
    
    for ddl_file in ddl_files:
        table_name = ddl_file.stem. replace('dbo.', '')
        
        # Read DDL content
        with open(ddl_file, 'r') as f:
            ddl_content = f.read()
        
        # Update node if exists
        try:
            node = nodes_col.get(table_name)
            if node: 
                node['ddl'] = ddl_content
                node['ddl_source'] = str(ddl_file)
                nodes_col.update(node)
                print(f"✅ Updated: {table_name}")
        except:
            print(f"⚠️  Node not found: {table_name}")
    
    print("\n✅ DDL enhancement complete!")

if __name__ == "__main__":
    enhance_nodes_with_ddl()
````

---

## Deployment Steps

### Step 1: Enhance ArangoDB Graph (One-time setup)
```bash
# Load DDL into nodes
python enhance_arango_with_ddl.py

# Load ground truth queries
python load_ground_truth_to_arango.py
```

### Step 2: Run Gradio App
```bash
export DATABASE_HOST=http://127.0.0.1:8529
export DATABASE_USERNAME=root
export DATABASE_PASSWORD=your_password
export DATABASE_NAME=manufacturing_graph
export OPENAI_API_KEY=your_openai_key

python gradio_app_with_arango.py
```

### Step 3: Access UI
Navigate to `http://localhost:5000`

---

## Benefits of This Architecture

1. **✅ Unified Graph Store**: ArangoDB centralizes schema, relationships, DDL, and ground truth
2. **✅ Fast Graph Traversal**: Native graph queries for join path finding
3. **✅ Dynamic Context**: Schema context loaded on-demand per data model
4. **✅ Ground Truth Integration**: Validation datasets stored alongside schema
5. **✅ Scalable**: NetworkX → ArangoDB persistence handles large graphs efficiently
6. **✅ Version Control**: Ground truth JSON files remain in git, loaded to Arango
7. **✅ Metadata-Rich**: Edges contain `few_shot_example`, `natural_language_alias` for semantic layer

---

## Would you like me to: 

1. **Create an issue (#10)** for this Arango-Gradio integration?
2. **Generate sample ground truth datasets** for Payables (August 31, 2025)?
3. **Create a PR** implementing this architecture?
4. **Extend the schema graph** with additional metadata from Documentation/Schema/? 

The key insight:  **ArangoDB is already your bridge**—we just need to enhance it with DDL and ground truth, then connect the Gradio app via the Arango Python client!  🚀