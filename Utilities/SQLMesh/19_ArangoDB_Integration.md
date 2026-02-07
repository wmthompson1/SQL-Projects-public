# ArangoDB Integration for GitHub Copilot

## Overview

This guide explains how to use the ArangoDB graph database integration to query schema relationships, table dependencies, and metadata. This enables GitHub Copilot and other tools to understand the relationships between tables, reports, and data flows.

## Prerequisites

1. **ArangoDB Running**: Local or remote ArangoDB instance
2. **Python Dependencies**: `python-arango` package
3. **Graph Data**: Schema graph loaded into ArangoDB

### Installation

```bash
# Install python-arango
pip install python-arango

# Start ArangoDB (if using Docker)
docker-compose -f docker-compose.test.yml up -d arangodb
```

## Configuration

### Environment Variables

Create a `.env` file in the repository root or `Utilities/SQLMesh` directory:

```env
# ArangoDB Connection
DATABASE_HOST=http://127.0.0.1:8529
DATABASE_USERNAME=root
DATABASE_PASSWORD=your_password_here
DATABASE_NAME=manufacturing_graph
```

**Important**: Never commit `.env` files with real credentials. See [ENV-Handling.md](../../Documentation/Policies/ENV-Handling.md).

### Loading Graph Data

Before using the integration, load your schema graph into ArangoDB:

```bash
# From repository root
python scripts/nx_to_arango.py \
  --graph-file path/to/schema_graph.gpickle \
  --db manufacturing_graph
```

## Usage

### Python API

```python
from analysis.graph.arango_integration import ArangoLineageStore

# Initialize connection
store = ArangoLineageStore()

# Connect to database
if store.connect():
    print("✅ Connected to ArangoDB")
    
    # Query reports that use a table
    reports = store.query_table_dependencies("PAYABLE")
    print(f"Reports using PAYABLE: {reports}")
    
    # Query tables used by a report
    tables = store.query_file_dependencies("SQL_Reports/Finance/AP_Aging.sql")
    print(f"Tables used by AP_Aging: {tables}")
    
    # Get table metadata
    info = store.get_table_info("RECEIVER")
    print(f"Table info: {info}")
    
    # Search for tables
    results = store.search_tables("INV", limit=10)
    print(f"Tables matching 'INV': {[r['name'] for r in results]}")
    
    # Get downstream dependencies
    downstream = store.get_downstream_tables("PAYABLE", max_depth=2)
    print(f"Downstream tables: {downstream}")
```

### Quick Helper Functions

For one-off queries without managing connections:

```python
from analysis.graph.arango_integration import (
    quick_query_table_deps,
    quick_query_file_deps
)

# Quick query examples
reports = quick_query_table_deps("PAYABLE")
tables = quick_query_file_deps("SQL_Reports/Finance/AP_Aging.sql")
```

### Command Line Testing

Test the integration directly:

```bash
cd Utilities/SQLMesh
python -m analysis.graph.arango_integration
```

## Available Methods

### `connect() -> bool`
Connect to ArangoDB and verify access.

### `query_table_dependencies(table_name: str) -> List[str]`
Find all reports/files that use a specific table.

**Example:**
```python
reports = store.query_table_dependencies("PAYABLE")
# Returns: ['SQL_Reports/Finance/AP_Aging.sql', 'SQL_Reports/Finance/Payable_Detail.sql', ...]
```

### `query_file_dependencies(file_path: str) -> List[str]`
Find all tables used by a specific report/file.

**Example:**
```python
tables = store.query_file_dependencies("SQL_Reports/Finance/AP_Aging.sql")
# Returns: ['PAYABLE', 'VENDOR', 'INVOICE', ...]
```

### `get_table_info(table_name: str) -> Optional[Dict]`
Get detailed metadata about a table.

**Example:**
```python
info = store.get_table_info("PAYABLE")
# Returns: {'original_id': 'Live.dbo.PAYABLE', 'type': 'table', ...}
```

### `search_tables(pattern: str, limit: int = 20) -> List[Dict]`
Search for tables matching a pattern.

**Example:**
```python
tables = store.search_tables("PAY", limit=10)
# Returns: [{'name': 'PAYABLE', 'key': 'table_PAYABLE', ...}, ...]
```

### `get_downstream_tables(table_name: str, max_depth: int = 3) -> List[Tuple[str, int]]`
Get tables that depend on the given table (downstream).

**Example:**
```python
downstream = store.get_downstream_tables("PAYABLE", max_depth=2)
# Returns: [('INVOICE', 1), ('PAYMENT', 2), ...]
```

## Integration with Twin Tables

The twin table generator uses ArangoDB to fetch metadata:

```bash
# Generate twin tables from ArangoDB
python Utilities/SQLMesh/generate_twin_tables.py \
  --from-arango \
  --pattern "PAYABLE*" \
  --output models/staging
```

See [20_Twin_Tables.md](20_Twin_Tables.md) for details.

## Graph Collections

The integration uses these ArangoDB collections:

- **tables**: Schema table nodes
- **reports**: SQL report/file nodes
- **nodes**: Generic nodes (legacy)
- **dependencies**: Report→Table edges
- **edges**: Generic edges (legacy)

## Querying Directly in ArangoDB

Access the ArangoDB web UI at http://127.0.0.1:8529 to run AQL queries:

```aql
// Find all reports using PAYABLE
FOR edge IN dependencies
  FILTER edge._to LIKE '%PAYABLE%'
  LET report = DOCUMENT(edge._from)
  RETURN report.original_id

// Find all tables used by a report
FOR edge IN dependencies
  FILTER edge._from LIKE '%AP_Aging%'
  LET table = DOCUMENT(edge._to)
  RETURN table.original_id
```

## Troubleshooting

### "python-arango not available"
```bash
pip install python-arango
```

### "Failed to connect to ArangoDB"
1. Check if ArangoDB is running: `curl http://127.0.0.1:8529/_api/version`
2. Verify credentials in `.env` file
3. Check DATABASE_HOST includes `http://` prefix

### "Database not found"
Load the graph data first:
```bash
python scripts/nx_to_arango.py --graph-file your_graph.gpickle
```

### Empty query results
1. Verify graph data is loaded: Check collections in ArangoDB UI
2. Check table name format: Try with/without schema prefix
3. Check collection contents: Ensure nodes have `original_id` field

## Performance Considerations

- **Connection pooling**: Create one `ArangoLineageStore` instance and reuse
- **Query limits**: Use `limit` parameter in `search_tables()` for large datasets
- **Caching**: Consider caching frequently-accessed metadata
- **Batch queries**: Group related queries together to minimize round-trips

## Security

- **Credentials**: Store in `.env` files, never commit
- **Read-only access**: Use read-only database user for queries
- **Network security**: Use HTTPS for remote ArangoDB connections
- **Access control**: Limit database permissions to necessary collections

## See Also

- [scripts/nx_to_arango.py](../../scripts/nx_to_arango.py) - Graph persistence script
- [Documentation/arango-setup.md](../../Documentation/arango-setup.md) - ArangoDB setup guide
- [Documentation/Policies/ENV-Handling.md](../../Documentation/Policies/ENV-Handling.md) - Credential management
- [20_Twin_Tables.md](20_Twin_Tables.md) - Twin table generation
