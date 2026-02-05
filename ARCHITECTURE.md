# Architecture Overview

## System Components

```
┌──────────────────────────────────────────────────────────────┐
│                     SQL-Projects Repository                  │
└──────────────────────────────────────────────────────────────┘
                              │
            ┌─────────────────┼─────────────────┐
            │                 │                 │
            ▼                 ▼                 ▼
┌────────────────┐  ┌──────────────┐  ┌──────────────────┐
│ Cache Clearing │  │   ArangoDB   │  │ Twin Table Gen   │
│    Scripts     │  │ Integration  │  │                  │
└────────────────┘  └──────────────┘  └──────────────────┘
```

## Data Flow

### 1. Cache Management Flow

```
Schema Update → clear_cache.sh → Remove .cache/ → Remove db.db
                     ↓
              sqlmesh plan --auto-apply
                     ↓
           Rebuild from scratch
                     ↓
           Clean state restored
```

### 2. ArangoDB Query Flow

```
User Query → ArangoLineageStore → Connect to ArangoDB
                                         ↓
                                    Execute AQL
                                         ↓
                                   Parse Results
                                         ↓
                                  Return to User
```

### 3. Twin Table Generation Flow

```
User Request → generate_twin_tables.py → Query ArangoDB for metadata
                                                ↓
                                         Get table info
                                                ↓
                                         Get dependencies
                                                ↓
                                         Get reports usage
                                                ↓
                                    Generate SQLMesh model
                                                ↓
                                         Write to file
```

## Component Details

### Cache Clearing Scripts

**Files:**
- `clear_cache.ps1` (PowerShell)
- `clear_cache.sh` (Bash)

**Responsibilities:**
- Remove stale cache files
- Trigger SQLMesh rebuild
- Verify SQLMesh project structure
- Provide user feedback

**Interactions:**
- SQLMesh CLI (`sqlmesh plan`)
- File system (cache removal)
- User (prompts/confirmations)

### ArangoDB Integration

**File:**
- `analysis/graph/arango_integration.py`

**Responsibilities:**
- Connect to ArangoDB
- Execute AQL queries
- Parse and return results
- Handle connection errors

**Key Classes:**
- `ArangoLineageStore` - Main API

**Key Methods:**
- `connect()` - Establish connection
- `query_table_dependencies()` - Find reports using a table
- `query_file_dependencies()` - Find tables used by a report
- `search_tables()` - Pattern-based search
- `get_downstream_tables()` - Traverse dependencies

**Interactions:**
- ArangoDB server (arangodb-test container)
- Environment variables (.env file)
- Python-arango library

### Twin Table Generator

**File:**
- `generate_twin_tables.py`

**Responsibilities:**
- Query ArangoDB for table metadata
- Generate SQLMesh model definitions
- Include rich documentation
- Write model files

**Key Classes:**
- `TwinTableGenerator` - Main generator

**Key Methods:**
- `generate_model_from_arango()` - Generate single model
- `generate_models_from_pattern()` - Batch generation
- `_generate_model_content()` - Create model SQL

**Interactions:**
- ArangoDB (via ArangoLineageStore)
- File system (write models)
- Command line (arguments)

## Database Schema (ArangoDB)

### Collections

```
┌─────────────┐       ┌──────────────┐
│   tables    │       │   reports    │
│ (vertices)  │       │  (vertices)  │
└─────────────┘       └──────────────┘
       │                      │
       │    ┌─────────────────┘
       │    │
       ▼    ▼
┌──────────────────┐
│  dependencies    │
│     (edges)      │
└──────────────────┘
```

**tables** - Schema table nodes
- `_key`: Normalized table key
- `original_id`: Full table name
- `type`: "table"

**reports** - SQL report/file nodes
- `_key`: Normalized report key
- `original_id`: File path
- `type`: "report"

**dependencies** - Report→Table edges
- `_from`: Report node
- `_to`: Table node

## Configuration

### Environment Variables

```
.env
├── DATABASE_HOST=http://127.0.0.1:8529
├── DATABASE_USERNAME=root
├── DATABASE_PASSWORD=***
└── DATABASE_NAME=manufacturing_graph
```

**Precedence:**
1. Command line arguments
2. Environment variables
3. .env file
4. Defaults

## Security Model

```
Developer → .env (local) → ArangoLineageStore → ArangoDB
                                                     ↑
                                                     │
                                             Credentials
                                             (never in git)
```

**Protection Layers:**
1. `.env` in `.gitignore`
2. `.env.example` template (no secrets)
3. Graceful degradation if credentials missing
4. Read-only database user recommended

## Error Handling

### Connection Errors

```
ArangoLineageStore.connect()
    ↓
Try to connect
    ↓
  [Success] → enabled = True
    ↓
  [Failure] → enabled = False
             → Log error
             → Return False (graceful)
```

### Missing Dependencies

```
Import python-arango
    ↓
  [Success] → ARANGO_AVAILABLE = True
    ↓
  [Failure] → ARANGO_AVAILABLE = False
             → Log warning
             → Graceful degradation
```

## Usage Patterns

### Pattern 1: Quick Query

```python
from analysis.graph.arango_integration import quick_query_table_deps

# One-liner query
reports = quick_query_table_deps("PAYABLE")
```

### Pattern 2: Managed Connection

```python
from analysis.graph.arango_integration import ArangoLineageStore

store = ArangoLineageStore()
if store.connect():
    # Multiple queries with same connection
    reports = store.query_table_dependencies("PAYABLE")
    tables = store.query_file_dependencies("report.sql")
```

### Pattern 3: Batch Processing

```bash
# Generate multiple twin tables
python generate_twin_tables.py \
  --from-arango \
  --pattern "PAY*,RECV*" \
  --limit 50
```

## Integration Points

### SQLMesh Integration

```
Twin Generator → SQLMesh Models → SQLMesh CLI
                      ↓
                Test/Plan/Apply
                      ↓
                  DuckDB/DB
```

### CI/CD Integration

```
GitHub Actions
    ↓
Clear Cache → Test → Plan → Deploy
    ↓           ↓      ↓       ↓
Scripts    SQLMesh SQLMesh  Production
```

## Performance Considerations

### Connection Pooling

- Create one `ArangoLineageStore` instance
- Reuse for multiple queries
- Avoid repeated connections

### Query Optimization

- Use limits in `search_tables()`
- Cache frequently-accessed metadata
- Batch queries when possible

### File I/O

- Twin generator writes files sequentially
- Consider parallel processing for large batches
- Use SSD for better performance

## Maintenance

### Regular Tasks

1. **Update Graph Data**
   ```bash
   python scripts/nx_to_arango.py --graph-file schema.gpickle
   ```

2. **Clear Cache After Schema Changes**
   ```bash
   ./clear_cache.sh
   ```

3. **Regenerate Twin Tables**
   ```bash
   python generate_twin_tables.py --from-arango --pattern "*"
   ```

### Monitoring

- Check ArangoDB health: `curl http://127.0.0.1:8529/_api/version`
- Verify collections: Check ArangoDB web UI
- Test queries: `python -m analysis.graph.arango_integration`

## Troubleshooting Guide

### Problem: Can't connect to ArangoDB

**Check:**
1. Is ArangoDB running? `curl http://127.0.0.1:8529`
2. Is `.env` configured correctly?
3. Are credentials correct?

**Solution:**
```bash
# Start ArangoDB
docker-compose -f docker-compose.test.yml up -d arangodb

# Test connection
python -m analysis.graph.arango_integration
```

### Problem: Empty query results

**Check:**
1. Is graph data loaded?
2. Is table name correct?
3. Are collections populated?

**Solution:**
```bash
# Load graph data
python scripts/nx_to_arango.py --graph-file your_graph.gpickle

# Verify in ArangoDB UI
# http://127.0.0.1:8529
```

### Problem: Cache issues persist

**Check:**
1. Did cache clear completely?
2. Is `local.db` causing issues?

**Solution:**
```bash
# Complete cache clear including local.db
./clear_cache.sh
rm -f local.db
sqlmesh plan --auto-apply
```

## See Also

- [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) - Implementation details
- [18_Cache_Management.md](Utilities/SQLMesh/18_Cache_Management.md) - Cache guide
- [19_ArangoDB_Integration.md](Utilities/SQLMesh/19_ArangoDB_Integration.md) - ArangoDB guide
- [20_Twin_Tables.md](Utilities/SQLMesh/20_Twin_Tables.md) - Twin tables guide
