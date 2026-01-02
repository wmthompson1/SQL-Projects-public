# Customizable Inputs Reference for HF Space Inventory SQL Generator

This document lists all the faux/placeholder inputs in the application that you can customize for your specific use case.

## 📋 Table of Contents
1. [Sample Schema (SAMPLE_SCHEMA)](#sample-schema)
2. [SQL Templates (SQL_TEMPLATES)](#sql-templates)
3. [Gradio UI Placeholders](#gradio-ui-placeholders)
4. [Query Intent Keywords](#query-intent-keywords)
5. [MCP Discovery Metadata](#mcp-discovery-metadata)

---

## 1. Sample Schema (SAMPLE_SCHEMA)

**Location**: Lines 261-330 in `app.py`

### Current Faux Tables:
- `inventory` - Sample inventory/parts table
- `suppliers` - Sample supplier information
- `transactions` - Sample inventory movements

### What to Change:
Replace with your actual ERP schema. Example from Live database:

```python
SAMPLE_SCHEMA = {
    "tables": {
        "PART": {
            "columns": {
                "ID": {"type": "VARCHAR(30)", "primary_key": True, "description": "Part number"},
                "DESCRIPTION": {"type": "VARCHAR(50)", "description": "Part description"},
                "PART_TYPE": {"type": "CHAR(1)", "description": "Type: M=Manufactured, P=Purchased"},
                "STOCK_UM": {"type": "VARCHAR(4)", "description": "Stock unit of measure"},
                "STD_COST": {"type": "DECIMAL(19,5)", "description": "Standard unit cost"},
                "ON_HAND": {"type": "DECIMAL(19,5)", "description": "Quantity on hand"},
                "AVAILABLE": {"type": "DECIMAL(19,5)", "description": "Available quantity"}
            }
        },
        "INVENTORY_TRANS": {
            "columns": {
                "ID": {"type": "NUMERIC(18,0)", "primary_key": True, "description": "Transaction ID"},
                "PART_ID": {"type": "VARCHAR(30)", "description": "Part number"},
                "CLASS": {"type": "CHAR(1)", "description": "R=Receipt, I=Issue, A=Adjust"},
                "TYPE": {"type": "CHAR(1)", "description": "I=In, O=Out"},
                "QUANTITY": {"type": "DECIMAL(19,5)", "description": "Transaction quantity"},
                "DATE": {"type": "datetime", "description": "Transaction date"},
                "DOCUMENT_ID": {"type": "VARCHAR(17)", "description": "Source document"}
            }
        },
        "WORK_ORDER": {
            "columns": {
                "BASE_ID": {"type": "VARCHAR(17)", "primary_key": True, "description": "Work order number"},
                "TYPE": {"type": "CHAR(1)", "primary_key": True, "description": "W=WO, M=MO"},
                "PART_ID": {"type": "VARCHAR(30)", "description": "Part being manufactured"},
                "STATUS": {"type": "CHAR(1)", "description": "O=Open, C=Closed"},
                "ORDER_QUANTITY": {"type": "DECIMAL(19,5)", "description": "Order quantity"}
            }
        }
    }
}
```

---

## 2. SQL Templates (SQL_TEMPLATES)

**Location**: Search for `SQL_TEMPLATES` dictionary in `app.py`

### Current Faux Templates:

#### Template: `low_stock`
**Current Query**:
```sql
SELECT part_id, part_name, quantity_on_hand, reorder_point,
       (reorder_point - quantity_on_hand) AS shortage
FROM inventory
WHERE quantity_on_hand < reorder_point
ORDER BY shortage DESC;
```

**Suggested Real Query** (Visual Manufacturing):
```sql
SELECT 
    P.ID AS part_id,
    P.DESCRIPTION AS part_name,
    P.ON_HAND AS quantity_on_hand,
    P.REORDER_POINT,
    (P.REORDER_POINT - P.ON_HAND) AS shortage,
    P.LOCATION_ID AS warehouse_location
FROM Live.dbo.PART P
WHERE P.ON_HAND < P.REORDER_POINT
    AND P.INACTIVE = 0
ORDER BY shortage DESC;
```

#### Template: `inventory_value`
**Current Query**:
```sql
SELECT category,
       COUNT(*) AS part_count,
       SUM(quantity_on_hand) AS total_units,
       SUM(quantity_on_hand * unit_cost) AS total_value
FROM inventory
GROUP BY category
ORDER BY total_value DESC;
```

**Suggested Real Query**:
```sql
SELECT 
    P.PART_TYPE,
    COUNT(*) AS part_count,
    SUM(P.ON_HAND) AS total_units,
    SUM(P.ON_HAND * P.STD_COST) AS total_value
FROM Live.dbo.PART P
WHERE P.INACTIVE = 0
GROUP BY P.PART_TYPE
ORDER BY total_value DESC;
```

#### Template: `supplier_performance`
**Current Query**: Uses sample suppliers table

**Suggested Real Query**:
```sql
SELECT 
    V.ID AS supplier_id,
    V.NAME AS supplier_name,
    COUNT(DISTINCT P.ID) AS parts_supplied,
    AVG(DATEDIFF(day, PO.DATE_REQUIRED, R.DATE_RECEIVED)) AS avg_lead_time_variance
FROM Live.dbo.VENDOR V
LEFT JOIN Live.dbo.PART P ON P.VENDOR_ID = V.ID
LEFT JOIN Live.dbo.RECEIVER R ON R.VENDOR_ID = V.ID
LEFT JOIN Live.dbo.PURC_ORDER PO ON PO.VENDOR_ID = V.ID
WHERE V.INACTIVE = 0
GROUP BY V.ID, V.NAME
ORDER BY parts_supplied DESC;
```

#### Template: `transaction_summary`
**Current Query**: Generic transaction summary

**Suggested Real Query**:
```sql
SELECT 
    CAST(IT.DATE AS DATE) AS transaction_date,
    IT.CLASS AS transaction_class,
    IT.TYPE AS transaction_type,
    COUNT(*) AS transaction_count,
    SUM(ABS(IT.QUANTITY)) AS total_quantity
FROM Live.dbo.INVENTORY_TRANS IT
WHERE IT.DATE >= DATEADD(day, -30, GETDATE())
GROUP BY CAST(IT.DATE AS DATE), IT.CLASS, IT.TYPE
ORDER BY transaction_date DESC, IT.CLASS, IT.TYPE;
```

---

## 3. Gradio UI Placeholders

**Location**: Lines 924-927 in `app.py`

### Question Input Placeholder
**Current**:
```python
placeholder="e.g., Show me supplier on-time delivery rates for Q4"
```

**Suggested Alternatives**:
```python
# For inventory focus:
placeholder="e.g., Show me parts below reorder point with lead times over 30 days"

# For work orders:
placeholder="e.g., Show me open work orders with material shortages"

# For financial:
placeholder="e.g., Show me inventory value by cost center for month end"
```

### Category Dropdown Choices
**Location**: `get_category_choices()` function references `app_schema/queries/index.json`

**File to Edit**: `app_schema/queries/index.json`

**Current Categories**:
```json
{
  "categories": [
    {"id": "quality_control", "name": "Quality Control", "file": "quality_control.sql"},
    {"id": "supplier_performance", "name": "Supplier Performance", "file": "supplier_performance.sql"},
    {"id": "equipment_reliability", "name": "Equipment Reliability", "file": "equipment_reliability.sql"},
    {"id": "production_analytics", "name": "Production Analytics", "file": "production_analytics.sql"}
  ]
}
```

**Suggested Visual Manufacturing Categories**:
```json
{
  "categories": [
    {"id": "inventory", "name": "Inventory Management", "file": "inventory.sql"},
    {"id": "work_orders", "name": "Work Orders & Production", "file": "work_orders.sql"},
    {"id": "purchasing", "name": "Purchasing & Receiving", "file": "purchasing.sql"},
    {"id": "payables", "name": "Payables & AP Automation", "file": "payables.sql"},
    {"id": "shipping", "name": "Shipping & Customer Orders", "file": "shipping.sql"}
  ]
}
```

---

## 4. Query Intent Keywords

**Location**: Lines 363-393 in `app.py` - `analyze_query_intent()` function

### Current Keywords to Customize:

#### Aggregation Keywords
**Current**:
```python
["count", "total", "sum", "average", "avg", "how many"]
```

**Add ERP-specific**:
```python
["count", "total", "sum", "average", "avg", "how many", "variance", "outstanding", "balance"]
```

#### Filtering Keywords
**Current**:
```python
["low", "below", "under", "less than", "shortage", "reorder"]
```

**Add ERP-specific**:
```python
["low", "below", "under", "less than", "shortage", "reorder", "overdue", "late", "critical", "shortage", "backorder"]
```

#### Table Detection Keywords
**Current**:
```python
if any(word in query_lower for word in ["inventory", "stock", "part", "quantity", "warehouse"]):
    intent["tables"].append("inventory")
```

**Replace with Visual Manufacturing tables**:
```python
if any(word in query_lower for word in ["part", "inventory", "stock", "on hand", "available"]):
    intent["tables"].append("PART")

if any(word in query_lower for word in ["work order", "wo", "job", "manufacturing order"]):
    intent["tables"].append("WORK_ORDER")

if any(word in query_lower for word in ["transaction", "receipt", "issue", "adjustment", "movement"]):
    intent["tables"].append("INVENTORY_TRANS")

if any(word in query_lower for word in ["payable", "voucher", "invoice", "ap"]):
    intent["tables"].append("PAYABLE")

if any(word in query_lower for word in ["receiver", "po receipt", "receiving"]):
    intent["tables"].append("RECEIVER")
```

---

## 5. MCP Discovery Metadata

**Location**: Lines 512-636 in `app.py` - `mcp_discover()` function

### MCP Server Name & Description
**Current**:
```python
return MCPDiscoveryResponse(
    name="manufacturing-inventory-sqlgen",
    version="1.0.0",
    description="Natural language to SQL generator for manufacturing inventory management"
)
```

**Suggested Change**:
```python
return MCPDiscoveryResponse(
    name="visual-manufacturing-sql-agent",
    version="1.0.0",
    description="Natural language to SQL generator for Visual Manufacturing ERP (Live/LIVEAccounting databases)"
)
```

### Tool Descriptions
**Current tools** have generic inventory descriptions.

**Example Tool to Update**:
```python
MCPToolDefinition(
    name="generate_sql",
    description="Convert natural language query to SQL for Visual Manufacturing ERP (Live database - PART, WORK_ORDER, INVENTORY_TRANS, PAYABLE, RECEIVER tables)",
    input_schema={...}
)
```

### Resource URIs
**Current**:
```python
resources=[
    {
        "uri": "schema://inventory",
        "name": "Inventory Schema",
        "description": "Database schema for inventory management tables",
        "mimeType": "application/json"
    }
]
```

**Suggested**:
```python
resources=[
    {
        "uri": "schema://live",
        "name": "Live Database Schema",
        "description": "Visual Manufacturing ERP database schema (sql-lab-1 server)",
        "mimeType": "application/json"
    }
]
```

---

## 6. Ground Truth SQL Query Files

**Location**: `app_schema/queries/*.sql` files

### Files to Update:
1. `quality_control.sql` → Replace with actual quality queries or delete
2. `supplier_performance.sql` → Update with Visual Manufacturing vendor queries
3. `equipment_reliability.sql` → Replace with work center/machine queries or delete
4. `production_analytics.sql` → Update with work order analytics

### Query File Format:
```sql
-- Query: Parts Below Reorder Point
-- Description: Shows all active parts where current stock is below reorder point, sorted by shortage amount
SELECT 
    P.ID AS part_id,
    P.DESCRIPTION AS part_name,
    P.ON_HAND AS quantity_on_hand,
    P.REORDER_POINT,
    (P.REORDER_POINT - P.ON_HAND) AS shortage
FROM Live.dbo.PART P
WHERE P.ON_HAND < P.REORDER_POINT
    AND P.INACTIVE = 0
ORDER BY shortage DESC;

-- Query: Open Work Orders By Status
-- Description: Lists all open work orders with part info and order quantities
SELECT 
    WO.BASE_ID AS work_order,
    WO.PART_ID,
    P.DESCRIPTION,
    WO.ORDER_QUANTITY,
    WO.STATUS
FROM Live.dbo.WORK_ORDER WO
JOIN Live.dbo.PART P ON WO.PART_ID = P.ID
WHERE WO.STATUS = 'O'
ORDER BY WO.BASE_ID;
```

---

## 🎯 Quick Start Customization Checklist

- [ ] Update `SAMPLE_SCHEMA` with your actual database tables (lines 261-330)
- [ ] Replace SQL templates in `SQL_TEMPLATES` dictionary (search app.py)
- [ ] Update query intent keywords for table detection (lines 380-392)
- [ ] Modify Gradio placeholder text (line 926)
- [ ] Update `app_schema/queries/index.json` with your categories
- [ ] Create/update SQL files in `app_schema/queries/` folder
- [ ] Update MCP discovery metadata (lines 515-520)
- [ ] Test with actual database connection

---

## 💡 Pro Tips

1. **Schema Source**: Extract actual schema using the documented workflow:
   ```powershell
   .\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1 `
     -ServerInstance 'sql-lab-1' `
     -Databases 'LIVE' `
     -TableFilter 'PART','WORK_ORDER','INVENTORY_TRANS'
   ```

2. **SQL Templates**: Use queries from `SQL_Reports/` folder as templates

3. **Testing**: Use the `/mcp/tools/execute_sql` endpoint to test queries before adding them

4. **Gradio Preview**: The Gradio interface auto-updates when you modify the app - just refresh the browser

---

## 📚 Related Documentation

- Main instructions: [.github/copilot-instructions.md](../.github/copilot-instructions.md)
- Database setup: [DATABASE_SETUP.md](DATABASE_SETUP.md)
- Schema extraction: [Documentation/Data Models/ddl/schema-extract/README.md](../Documentation/Data Models/ddl/schema-extract/README.md)
- Payables flow: [Documentation/Data Models/Payables/payables_invoice_voucher_flow.md](../Documentation/Data Models/Payables/payables_invoice_voucher_flow.md)
