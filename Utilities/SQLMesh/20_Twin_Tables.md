# Twin Tables in SQLMesh

## Overview

Twin tables are SQLMesh models that create "digital twins" of production database tables. They enable you to:
- Mirror production schema in your data warehouse
- Track lineage from source to analytics
- Document table relationships and dependencies
- Generate models automatically from schema metadata

## What are Twin Tables?

A **twin table** is a SQLMesh staging model (`stg_*`) that:
1. Mirrors a production table's structure
2. Includes metadata about its source and dependencies
3. Tracks which reports/queries use it
4. Can be incrementally refreshed or fully replaced

## Architecture

```
Production Database (Live.dbo.PAYABLE)
         ↓
    [ArangoDB Graph] ← Schema metadata & relationships
         ↓
  Twin Table Generator
         ↓
SQLMesh Model (staging.stg_payable)
         ↓
    Analytics Layer
```

## Generating Twin Tables

### From ArangoDB (Recommended)

Query ArangoDB for schema metadata and generate models:

```bash
cd Utilities/SQLMesh

# Generate models for tables matching a pattern
python generate_twin_tables.py \
  --from-arango \
  --pattern "PAYABLE*" \
  --output models/staging

# Generate models for specific tables
python generate_twin_tables.py \
  --from-arango \
  --pattern "RECEIVER" \
  --output models/staging \
  --limit 5
```

### From Explicit Table List

Generate models for specific tables (requires ArangoDB):

```bash
python generate_twin_tables.py \
  --tables PAYABLE RECEIVER VENDOR \
  --output models/staging
```

### Custom ArangoDB Connection

Override connection settings:

```bash
python generate_twin_tables.py \
  --from-arango \
  --pattern "INV*" \
  --arango-host http://localhost:8529 \
  --arango-db manufacturing_graph \
  --output models/staging
```

## Generated Model Structure

The generator creates SQLMesh models with rich metadata:

```sql
/*
 * Twin Table Model: PAYABLE
 * Source: Live.dbo.PAYABLE
 * Generated from ArangoDB graph metadata
 *
 * Used by 12 report(s):
 *   - SQL_Reports/Finance/AP_Aging.sql
 *   - SQL_Reports/Finance/Payable_Detail.sql
 *   - SQL_Reports/Finance/Vendor_Analysis.sql
 *   ... and 9 more
 *
 * Downstream dependencies (3):
 *   - INVOICE (depth: 1)
 *   - PAYMENT (depth: 1)
 *   - VENDOR_SUMMARY (depth: 2)
 */

MODEL (
  name staging.stg_payable,
  kind FULL,
  grain (payable_id),
  description 'Twin model for PAYABLE',
  tags (twin, production_source),
  meta (
    source_table='Live.dbo.PAYABLE',
    generated_from='arango_graph',
    downstream_count=3,
    used_by_count=12
  )
);

SELECT
  *
FROM raw.payable;
```

## Model Features

### Metadata Tracking

Each twin model includes:
- **source_table**: Original production table reference
- **generated_from**: How it was generated (arango_graph)
- **downstream_count**: Number of dependent tables
- **used_by_count**: Number of reports using this table

### Tags

- `twin`: Identifies this as a twin table
- `production_source`: Indicates it mirrors production data

### Documentation

- Header comments show relationships
- Lists dependent tables (with depth)
- Lists reports that use the table

## Use Cases

### 1. Schema Documentation

Generate twin models to document your schema:

```bash
# Generate twins for all finance tables
python generate_twin_tables.py \
  --from-arango \
  --pattern "PAY*,RECEIV*,INVOICE*" \
  --output models/staging
```

### 2. Impact Analysis

When modifying a table, see what's affected:

```python
from analysis.graph.arango_integration import ArangoLineageStore

store = ArangoLineageStore()
store.connect()

# What reports use this table?
reports = store.query_table_dependencies("PAYABLE")

# What tables depend on this one?
downstream = store.get_downstream_tables("PAYABLE", max_depth=3)
```

### 3. Incremental Refresh

For time-series tables, generate incremental models:

```python
# In your generator customization
INCREMENTAL_TABLES = {
    'INVENTORY_TRANSACTIONS': 'transaction_date',
    'SALES_ORDERS': 'order_date',
}
```

### 4. Data Quality

Add audits to twin models:

```sql
MODEL (
  name staging.stg_payable,
  kind FULL,
  audits (
    UNIQUE_VALUES(columns = (payable_id)),
    NOT_NULL(columns = (payable_id, vendor_id)),
    ACCEPTED_VALUES(columns = (status), values = ('OPEN', 'CLOSED', 'VOID'))
  )
);
```

## Configuration

### Environment Setup

Ensure ArangoDB connection is configured:

```env
# .env file
DATABASE_HOST=http://127.0.0.1:8529
DATABASE_USERNAME=root
DATABASE_PASSWORD=your_password
DATABASE_NAME=manufacturing_graph
```

### Generator Options

```bash
python generate_twin_tables.py --help

Options:
  --tables, -t          List of table names
  --from-arango        Query from ArangoDB
  --pattern, -p        Search pattern (e.g., "PAYABLE*")
  --output, -o         Output directory (default: models/staging)
  --limit, -l          Max tables to process (default: 20)
  --arango-host        ArangoDB host override
  --arango-db          ArangoDB database override
```

## Best Practices

### 1. Naming Convention

- Staging models: `stg_<table_name>`
- Keep table names lowercase in model names
- Use descriptive grain (primary key column)

### 2. Incremental vs Full

- **Full refresh**: Static reference tables (VENDOR, PRODUCT)
- **Incremental**: Time-series data (TRANSACTIONS, ORDERS)

### 3. Documentation

- Include source table reference in meta
- Document relationships in comments
- Tag appropriately (twin, production_source)

### 4. Maintenance

- Regenerate models when schema changes
- Keep ArangoDB graph updated
- Review generated models before committing

### 5. Testing

Always test generated models:

```bash
cd Utilities/SQLMesh

# Validate models
sqlmesh test

# Plan without applying
sqlmesh plan dev --dry-run

# Apply to dev environment
sqlmesh plan dev --auto-apply
```

## Customization

### Custom Model Template

Modify `generate_twin_tables.py` to customize the model template:

```python
def _generate_model_content(self, table_name, table_info, ...):
    # Your custom logic here
    return model_content
```

### Adding Columns

Extend the generator to include column-level metadata:

```python
# Query column metadata from ArangoDB
columns = self.arango.get_table_columns(table_name)

# Generate column descriptions
for col in columns:
    model += f"  {col['name']} AS {col['alias']},  -- {col['description']}\n"
```

### Custom Audits

Add domain-specific audits:

```python
def _generate_audits(self, table_name):
    audits = [
        "UNIQUE_VALUES(columns = (id))",
        "NOT_NULL(columns = (id, created_date))",
    ]
    
    # Add custom audits based on table type
    if "financial" in table_name.lower():
        audits.append("ACCEPTED_VALUES(columns = (currency), values = ('USD', 'EUR'))")
    
    return audits
```

## Troubleshooting

### "ArangoDB not available"
```bash
pip install python-arango
```

### "Table not found in ArangoDB"
1. Check if graph data is loaded
2. Verify table name format
3. Try searching: `store.search_tables("PARTIAL_NAME")`

### "Failed to connect"
1. Check `.env` file configuration
2. Verify ArangoDB is running
3. Test connection: `python -m analysis.graph.arango_integration`

### Empty output
1. Verify pattern matches tables: `--pattern "PAY*"`
2. Increase limit: `--limit 50`
3. Check ArangoDB collections have data

## Integration with SQLMesh Workflow

```bash
# 1. Generate twin tables
python generate_twin_tables.py --from-arango --pattern "INV*" --output models/staging

# 2. Review generated models
ls models/staging/stg_*.sql

# 3. Test models
sqlmesh test

# 4. Plan deployment
sqlmesh plan dev --dry-run

# 5. Apply to environment
sqlmesh plan dev --auto-apply

# 6. Query the models
sqlmesh fetchdf "SELECT * FROM staging.stg_payable LIMIT 10"
```

## See Also

- [19_ArangoDB_Integration.md](19_ArangoDB_Integration.md) - ArangoDB setup and usage
- [18_Cache_Management.md](18_Cache_Management.md) - Cache management
- [024_Entry_Point_DDL_to_SQLMesh.py](seeds/twinning_export/twinning_export/024_Entry_Point_DDL_to_SQLMesh.py) - Original DDL parser
- [scripts/nx_to_arango.py](../../scripts/nx_to_arango.py) - Graph persistence
