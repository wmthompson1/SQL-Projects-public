# Automated SQLMesh Cache Management & ArangoDB Integration

## Quick Start

This repository now includes automated tools for:
1. **Cache Management**: Clear and rebuild SQLMesh state automatically
2. **ArangoDB Integration**: Query schema relationships and dependencies
3. **Twin Table Generation**: Create digital twins of production tables

## Cache Management

### Problem
SQLMesh caches model state that can become stale when schemas change.

### Solution
Use the provided scripts to clear cache and rebuild:

```bash
# Linux/macOS
./clear_cache.sh

# Windows
.\clear_cache.ps1
```

📖 **[Full Documentation](18_Cache_Management.md)**

## ArangoDB Integration

### What is it?
A Python module that enables querying the ArangoDB graph database for schema metadata and relationships.

### Why use it?
- Query which reports use a specific table
- Find all tables used by a report
- Discover downstream dependencies
- Search tables by pattern
- Get rich metadata about tables

### Quick Example

```python
from analysis.graph.arango_integration import ArangoLineageStore

store = ArangoLineageStore()
store.connect()

# Find reports using PAYABLE table
reports = store.query_table_dependencies("PAYABLE")

# Find tables used by a report
tables = store.query_file_dependencies("SQL_Reports/Finance/AP_Aging.sql")
```

📖 **[Full Documentation](19_ArangoDB_Integration.md)**

## Twin Tables

### What are they?
SQLMesh models that create "digital twins" of production database tables with rich metadata.

### Generate Twin Tables

```bash
# From ArangoDB metadata
python generate_twin_tables.py \
  --from-arango \
  --pattern "PAYABLE*" \
  --output models/staging
```

### Features
- Automatic metadata extraction from ArangoDB
- Rich documentation in generated models
- Lineage tracking (upstream/downstream)
- Reports usage tracking
- Customizable templates

📖 **[Full Documentation](20_Twin_Tables.md)**

## Setup

### Prerequisites

1. **SQLMesh**: `pip install sqlmesh`
2. **ArangoDB**: Running locally or remotely
3. **Python-Arango**: `pip install python-arango`

### Configuration

Create `.env` file:

```env
DATABASE_HOST=http://127.0.0.1:8529
DATABASE_USERNAME=root
DATABASE_PASSWORD=your_password
DATABASE_NAME=manufacturing_graph
```

### Load Graph Data

```bash
python scripts/nx_to_arango.py \
  --graph-file path/to/schema_graph.gpickle \
  --db manufacturing_graph
```

## Workflow Examples

### Example 1: Clear Cache After Schema Update

```bash
cd Utilities/SQLMesh

# Pull latest changes
git pull

# Clear cache and rebuild
./clear_cache.sh

# Test models
sqlmesh test

# Apply changes
sqlmesh plan dev --auto-apply
```

### Example 2: Generate Twin Tables

```bash
# Generate twins for finance tables
python generate_twin_tables.py \
  --from-arango \
  --pattern "PAYABLE*,RECEIV*" \
  --output models/staging

# Review generated models
ls models/staging/stg_*.sql

# Test and deploy
sqlmesh test
sqlmesh plan dev --auto-apply
```

### Example 3: Query Table Dependencies

```python
from analysis.graph.arango_integration import quick_query_table_deps

# Quick query without connection management
reports = quick_query_table_deps("INVENTORY")
print(f"Reports using INVENTORY: {len(reports)}")
for report in reports:
    print(f"  - {report}")
```

### Example 4: Impact Analysis

```python
from analysis.graph.arango_integration import ArangoLineageStore

store = ArangoLineageStore()
store.connect()

# Before modifying PAYABLE table, check impact
print("Reports affected:")
for report in store.query_table_dependencies("PAYABLE"):
    print(f"  - {report}")

print("\nDownstream tables:")
for table, depth in store.get_downstream_tables("PAYABLE", max_depth=3):
    print(f"  - {table} (depth: {depth})")
```

## CI/CD Integration

### GitHub Actions

```yaml
name: SQLMesh CI/CD

on:
  pull_request:
    paths:
      - 'Utilities/SQLMesh/**'

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Clear cache
        run: |
          cd Utilities/SQLMesh
          ./clear_cache.sh --skip-rebuild
      
      - name: Test models
        run: |
          cd Utilities/SQLMesh
          sqlmesh test
      
      - name: Plan changes
        run: |
          cd Utilities/SQLMesh
          sqlmesh plan dev --dry-run
```

## File Structure

```
Utilities/SQLMesh/
├── clear_cache.sh              # Cache clearing (Linux/macOS)
├── clear_cache.ps1             # Cache clearing (Windows)
├── generate_twin_tables.py     # Twin table generator
├── analysis/
│   └── graph/
│       └── arango_integration.py  # ArangoDB integration
├── 18_Cache_Management.md      # Cache docs
├── 19_ArangoDB_Integration.md  # ArangoDB docs
└── 20_Twin_Tables.md           # Twin tables docs
```

## Troubleshooting

### Cache Issues
- Run `./clear_cache.sh` to force rebuild
- Delete `local.db` manually for complete reset

### ArangoDB Connection
```bash
# Test connection
python -m analysis.graph.arango_integration

# Check if ArangoDB is running
curl http://127.0.0.1:8529/_api/version
```

### Twin Table Generation
```bash
# Verify ArangoDB has data
python -c "from analysis.graph.arango_integration import ArangoLineageStore; s = ArangoLineageStore(); s.connect(); print(s.search_tables('PAY', limit=5))"
```

## Contributing

When adding new features:
1. Clear cache after making changes
2. Test with `sqlmesh test`
3. Update relevant documentation
4. Generate twin tables if adding new source tables

## Resources

- **SQLMesh Documentation**: https://sqlmesh.readthedocs.io/
- **ArangoDB Documentation**: https://www.arangodb.com/docs/
- **Repository**: https://github.com/Skills-Inc-Org/SQL-Projects

## Support

For issues or questions:
1. Check documentation files (18-20)
2. Review troubleshooting sections
3. Open an issue on GitHub
4. Check existing SQLMesh guides (01-17)
