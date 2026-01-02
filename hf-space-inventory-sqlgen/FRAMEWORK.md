# HF Space Inventory SQL Generator - Framework & Requirements

## Purpose

This application serves as a **Ground Truth SQL Template Library** with MCP (Model Context Protocol) integration. It is **NOT a natural language to SQL converter** - instead, it provides curated, validated SQL queries organized by business domain.

## Core Concept: Ground Truth SQL

**Ground Truth SQL** = Pre-written, validated, production-ready SQL queries that serve as:
- Reference examples for similar query patterns
- Templates that can be adapted with parameter substitution
- Training data for AI agents learning SQL query patterns
- Standardized queries for common business questions

### What This App Does

✅ **Store** categorized SQL templates in `app_schema/queries/*.sql`  
✅ **Serve** queries via MCP-compliant REST endpoints  
✅ **Catalog** queries with metadata (category, description, complexity)  
✅ **Provide** schema introspection for connected database  
✅ **Enable** query discovery through category browsing  

### What This App Does NOT Do

❌ Generate arbitrary SQL from natural language prompts  
❌ Execute SQL against production databases  
❌ Modify or create new database objects  
❌ Provide AI-powered query optimization  

## Architecture

### Directory Structure

```
hf-space-inventory-sqlgen/
├── app_schema/                    # Schema and query storage
│   ├── manufacturing.db           # SQLite database (auto-initialized)
│   ├── schema_sqlite.sql          # DDL definitions
│   ├── schema_local.sql           # Local development schema
│   ├── schema.sql                 # Production schema
│   └── queries/                   # Ground truth SQL library
│       ├── index.json             # Category registry
│       ├── quality_control.sql    # Category-specific queries
│       ├── supplier_performance.sql
│       ├── equipment_reliability.sql
│       └── production_analytics.sql
├── app.py                         # FastAPI + Gradio application
├── test_client.py                 # MCP endpoint tests
├── test_schema_paths.py           # File structure verification
└── schema_graph.py                # NetworkX graph builder

# Graph Database Integration (optional)
scripts/
├── nx_to_arango.py                # Persist NetworkX → ArangoDB
├── export_arango_to_networkx.py   # Export ArangoDB → NetworkX
├── query_arango_edges.py          # Query relationship paths
├── *.gpickle                      # NetworkX binary graph files
└── *.graphml                      # NetworkX XML graph exports
```

### Graph Database Layer

The application supports **optional** graph database integration for advanced schema relationship queries. This is useful for:
- Multi-hop join path discovery (e.g., "How do I join PAYABLE to RECEIVER?")
- Ambiguous field name resolution (e.g., multiple `ID` columns across tables)
- Query optimization through relationship weighting
- Visual schema exploration

#### Graph Components

**Nodes** = Database Tables
- **Key**: Table name (e.g., `PART`, `WORK_ORDER`, `PAYABLE`)
- **Attributes**:
  - `table_name`: Canonical table name
  - `schema_name`: Schema/database name (e.g., `Live`, `LIVEAccounting`)
  - `row_count`: Approximate row count (for query planning)
  - `primary_key`: Primary key column(s)
  - `description`: Business purpose of table
  - `aliases`: Common alternate names (e.g., `WO` for `WORK_ORDER`)

**Edges** = Relationships (Foreign Keys, Joins)
- **From**: Source table
- **To**: Target table
- **Attributes**:
  - `relationship_type`: `REFERENCES` (FK), `LINKS` (logical), `DERIVED` (view)
  - `join_column`: Column name used in join (e.g., `PART_ID`)
  - `from_column`: Source column name (if different)
  - `to_column`: Target column name (if different)
  - `cardinality`: `1:1`, `1:N`, `N:M`
  - `weight`: Join cost (lower = preferred path)
  - `natural_language_alias`: Human-readable description (e.g., "part used in work order")
  - `context`: When to use this join (e.g., "For inventory queries")
  - `ambiguity_score`: 0-1 indicating field name clarity (lower = more ambiguous)

#### Schema Edge Table Format

Stored in SQLite `schema_edges` table:

```sql
CREATE TABLE schema_edges (
    id INTEGER PRIMARY KEY,
    from_table TEXT NOT NULL,
    to_table TEXT NOT NULL,
    relationship_type TEXT NOT NULL,  -- REFERENCES, LINKS, DERIVED
    join_column TEXT,                 -- Column name used in join
    from_column TEXT,                 -- Override source column
    to_column TEXT,                   -- Override target column
    cardinality TEXT,                 -- 1:1, 1:N, N:M
    weight REAL DEFAULT 1.0,          -- Lower = preferred path
    join_column_description TEXT,     -- Human description
    natural_language_alias TEXT,      -- "ordered product", "invoice line"
    context TEXT,                     -- Usage context
    ambiguity_score REAL DEFAULT 0.0  -- 0=clear, 1=ambiguous
);
```

#### Example Edges

```sql
-- Simple FK relationship
INSERT INTO schema_edges 
(from_table, to_table, relationship_type, join_column, cardinality, weight, 
 natural_language_alias, context, ambiguity_score)
VALUES 
('WORK_ORDER', 'PART', 'REFERENCES', 'PART_ID', '1:N', 1.0,
 'part being manufactured', 'Production queries', 0.1);

-- Ambiguous field name (multiple ID columns)
INSERT INTO schema_edges 
(from_table, to_table, relationship_type, join_column, from_column, to_column, 
 cardinality, weight, natural_language_alias, ambiguity_score)
VALUES 
('PAYABLE_LINE', 'RECEIVER_LINE', 'REFERENCES', 
 'RECEIVER_ID', 'RECEIVER_ID', 'RECEIVER_ID',  -- Same name but specify both
 'N:1', 2.0, 'receiver that generated payable', 0.7);

-- Complex multi-column join
INSERT INTO schema_edges 
(from_table, to_table, relationship_type, from_column, to_column, 
 cardinality, weight, context, ambiguity_score)
VALUES 
('PAYABLE_LINE', 'RECEIVER_LINE', 'REFERENCES',
 'RECEIVER_ID,RECEIVER_LINE_NO', 'RECEIVER_ID,LINE_NO',  -- Composite key
 'N:1', 1.0, 'PO-based invoice matching (preferred over invoice number)', 0.2);
```

#### Ambiguity Resolution Attributes

**Problem**: Many ERP tables have columns like `ID`, `STATUS`, `DATE` that could mean different things.

**Solution**: Edge attributes provide disambiguation:

```sql
-- Ambiguous: Which "ID" to join on?
-- PART.ID vs WORK_ORDER.PART_ID vs INVENTORY_TRANS.PART_ID

-- Solution: Explicit from_column/to_column
INSERT INTO schema_edges 
(from_table, to_table, from_column, to_column, natural_language_alias, ambiguity_score)
VALUES 
('INVENTORY_TRANS', 'PART', 'PART_ID', 'ID', 'part being transacted', 0.5);

-- Additional context for query generation
UPDATE schema_edges 
SET context = 'Use for inventory movement queries; includes issues, receipts, adjustments'
WHERE from_table = 'INVENTORY_TRANS' AND to_table = 'PART';
```

#### Scaling with Attributes

**Scenario 1: Alternative Join Paths**

Multiple ways to join PAYABLE to RECEIVER:

```sql
-- Path 1: Via PAYABLE_LINE (preferred - most reliable)
INSERT INTO schema_edges VALUES 
(NULL, 'PAYABLE', 'PAYABLE_LINE', 'REFERENCES', 'VOUCHER_ID', NULL, NULL, '1:N', 1.0, 
 'payable header to lines', 'payable line breakdown', NULL, 0.1);

INSERT INTO schema_edges VALUES 
(NULL, 'PAYABLE_LINE', 'RECEIVER_LINE', 'REFERENCES', 'RECEIVER_ID,RECEIVER_LINE_NO', 
 'RECEIVER_ID', 'RECEIVER_ID', 'N:1', 1.0, 'matched receiver line', 
 'PO-based matching (preferred)', 0.2);

-- Path 2: Via invoice number (less reliable - high ambiguity)
INSERT INTO schema_edges VALUES 
(NULL, 'PAYABLE', 'RECEIVER_LINE', 'LINKS', 'INVOICE_ID', NULL, NULL, 'N:M', 5.0, 
 'invoice number match', 
 'Use cautiously - invoice numbers not unique across vendors; add vendor filter', 0.9);
```

Graph query finds Path 1 automatically due to lower weight.

**Scenario 2: Contextual Relationships**

Same tables, different business contexts:

```sql
-- Context: Manufacturing / Work Orders
INSERT INTO schema_edges VALUES 
(NULL, 'WORK_ORDER', 'PART', 'REFERENCES', 'PART_ID', NULL, NULL, '1:N', 1.0,
 'finished good being produced', 'Production planning queries', 0.1);

-- Context: Inventory / Stock Movements
INSERT INTO schema_edges VALUES 
(NULL, 'INVENTORY_TRANS', 'PART', 'REFERENCES', 'PART_ID', NULL, NULL, '1:N', 1.0,
 'part being moved', 'Inventory transaction queries', 0.1);

-- Context: Purchasing / Supplier Parts
INSERT INTO schema_edges VALUES 
(NULL, 'SUPPLIER_PART', 'PART', 'REFERENCES', 'PART_ID', NULL, NULL, '1:N', 1.5,
 'purchasable part', 'Purchasing and vendor queries', 0.2);
```

Query planner can filter by context when generating joins.

### NetworkX Graph Format

Export graph to NetworkX for Python analysis:

```python
import networkx as nx

# Load graph from schema_edges table
G = nx.DiGraph()

# Add nodes
G.add_node("PART", schema="Live", primary_key="ID", aliases=["Part", "Parts"])
G.add_node("WORK_ORDER", schema="Live", primary_key="ID", aliases=["WO", "Job"])

# Add edges with attributes
G.add_edge("WORK_ORDER", "PART", 
    relationship="REFERENCES",
    join_column="PART_ID",
    weight=1.0,
    cardinality="N:1",
    alias="manufactured part",
    context="Production",
    ambiguity=0.1
)

# Save to file
nx.write_gpickle(G, "scripts/schema_graph.gpickle")
nx.write_graphml(G, "scripts/schema_graph.graphml")
```

**Query Example**: Find shortest join path

```python
import networkx as nx

G = nx.read_gpickle("scripts/schema_graph.gpickle")

# Find path from PAYABLE to RECEIVER
path = nx.shortest_path(G, "PAYABLE", "RECEIVER_LINE", weight="weight")
print("Join path:", " → ".join(path))
# Output: PAYABLE → PAYABLE_LINE → RECEIVER_LINE

# Get join details
for i in range(len(path) - 1):
    edge_data = G[path[i]][path[i+1]]
    print(f"JOIN {path[i]}.{edge_data['join_column']} = {path[i+1]}.{edge_data.get('to_column', edge_data['join_column'])}")
```

### ArangoDB Integration

Persist graph to ArangoDB for advanced graph queries:

```powershell
# Export NetworkX → ArangoDB
cd scripts
python nx_to_arango.py --graph-file schema_graph.gpickle --create-user

# Query from ArangoDB
python query_arango_edges.py --from-table PAYABLE --to-table RECEIVER_LINE --max-depth 3
```

**ArangoDB Collections**:
- `schema_nodes` (vertex collection): Database tables
- `schema_edges` (edge collection): Relationships with attributes

**Example AQL Query**: Find all paths with ambiguity < 0.5

```aql
FOR v, e, p IN 1..3 OUTBOUND 'schema_nodes/PAYABLE' schema_edges
  FILTER e.ambiguity_score < 0.5
  FILTER v._key == 'RECEIVER_LINE'
  RETURN {
    path: p.vertices[*]._key,
    joins: p.edges[*].join_column,
    total_weight: SUM(p.edges[*].weight),
    avg_ambiguity: AVG(p.edges[*].ambiguity_score)
  }
```

### Graph Output Formats

**NetworkX Binary** (`.gpickle`):
- Fast loading in Python
- Preserves all Python data types
- Location: `scripts/*.gpickle`

**GraphML** (`.graphml`):
- XML-based, human-readable
- Importable by Gephi, Cytoscape, Neo4j
- Location: `scripts/*.graphml`

**ArangoDB Export** (JSON):
```bash
# Export entire graph database
arangodump --server.database schema_graph --output-directory ./exports/arango_backup
```

**DOT Format** (`.dot`):
```python
# Export for Graphviz visualization
nx.drawing.nx_pydot.write_dot(G, "scripts/schema_graph.dot")
# Render: dot -Tpng schema_graph.dot -o schema_graph.png
```

### Query File Format

Each category SQL file contains multiple queries with metadata:

```sql
-- Query: Parts Below Reorder Point
-- Description: Shows all active parts where current stock is below reorder point
-- Category: inventory
-- Complexity: simple
-- Tables: PART
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

-- Query: Work Orders By Status
-- Description: Lists all open work orders with part info
-- Category: production
-- Complexity: simple
-- Tables: WORK_ORDER, PART
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

### Category Index Format (`app_schema/queries/index.json`)

```json
{
  "version": "1.0.0",
  "categories": [
    {
      "id": "quality_control",
      "name": "Quality Control",
      "file": "quality_control.sql",
      "description": "Defect tracking, inspection results, and quality metrics"
    },
    {
      "id": "supplier_performance",
      "name": "Supplier Performance", 
      "file": "supplier_performance.sql",
      "description": "Vendor quality ratings, lead times, and delivery performance"
    }
  ]
}
```

## MCP Endpoints

### Discovery
- **GET** `/mcp/discover` - List all available tools and resources

### Ground Truth Query Retrieval
- **GET** `/mcp/tools/get_saved_categories` - List query categories from index.json
- **GET** `/mcp/tools/get_saved_queries?category_id=<id>` - Get all queries in a category
- **POST** `/mcp/tools/save_query` - Append new query to category file

### Schema Introspection
- **GET** `/mcp/tools/get_schema` - Get database schema JSON
- **GET** `/mcp/tools/get_db_tables` - List all tables
- **GET** `/mcp/tools/get_table_ddl?table=<name>` - Get CREATE TABLE for specific table
- **GET** `/mcp/tools/get_all_ddl` - Get all CREATE TABLE statements

### Query Execution (Read-Only)
- **POST** `/mcp/tools/execute_sql` - Execute SELECT queries against SQLite database

### Utility
- **POST** `/mcp/tools/analyze_csv` - Suggest schema from CSV structure

## Usage Patterns

### Pattern 1: Query Template Retrieval

**User Request**: "Show me how to query parts below reorder point"

**Correct Flow**:
1. Call `/mcp/tools/get_saved_categories` → Get list of categories
2. Identify relevant category (e.g., "inventory")
3. Call `/mcp/tools/get_saved_queries?category_id=inventory`
4. Return matching ground truth SQL template
5. User adapts template with their specific parameters

### Pattern 2: Schema Discovery

**User Request**: "What columns are in the PART table?"

**Correct Flow**:
1. Call `/mcp/tools/get_table_ddl?table=PART`
2. Return CREATE TABLE statement with all columns and types

### Pattern 3: Query Validation

**User Request**: "Test this query against the schema"

**Correct Flow**:
1. Call `/mcp/tools/execute_sql` with query
2. Return results or syntax errors
3. Use for validation before running against production

## Testing Framework

### File Structure Tests (`test_schema_paths.py`)
Verifies:
- ✓ `app_schema/` directory exists
- ✓ `app_schema/queries/` contains all category files
- ✓ `app_schema/manufacturing.db` is accessible
- ✓ `index.json` is valid and parseable

### MCP Endpoint Tests (`test_client.py`)
Verifies:
- ✓ MCP discovery endpoint returns all tools
- ✓ Query category retrieval works
- ✓ Schema introspection returns valid DDL
- ✓ SQL execution returns results or errors
- ✓ CSV analysis suggests correct types

### Running Tests

```powershell
# From repository root
.\.venv\Scripts\Activate.ps1
cd hf-space-inventory-sqlgen

# Test file paths
python test_schema_paths.py

# Start app in background
$job = Start-Job -ScriptBlock { 
    Set-Location "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\hf-space-inventory-sqlgen"
    python app.py 
}
Start-Sleep -Seconds 5

# Test MCP endpoints
python test_client.py

# Stop app
Stop-Job $job
Remove-Job $job
```

## Development Workflow

### Adding New Query Categories

1. Create SQL file: `app_schema/queries/new_category.sql`
2. Add queries using standard format (see above)
3. Update `app_schema/queries/index.json`:
   ```json
   {
     "id": "new_category",
     "name": "Display Name",
     "file": "new_category.sql",
     "description": "What queries are in this category"
   }
   ```
4. Restart app to load new queries

### Adding Queries to Existing Categories

1. Open category SQL file (e.g., `app_schema/queries/inventory.sql`)
2. Add new query block with metadata comments
3. No restart needed if using save_query endpoint
4. Manual file edits require app restart

### Updating Schema

1. Edit `app_schema/schema_sqlite.sql` with new DDL
2. Delete `app_schema/manufacturing.db`
3. Restart app (auto-recreates database)

## Integration Patterns

### VS Code Extension Integration

```typescript
// Fetch query categories
const categories = await fetch('http://localhost:5000/mcp/tools/get_saved_categories');

// Get queries for selected category
const queries = await fetch(`http://localhost:5000/mcp/tools/get_saved_queries?category_id=inventory`);

// Insert selected query into editor
editor.insertSnippet(new SnippetString(query.sql));
```

### AI Agent Integration

```python
# Agent discovers ground truth queries
categories = mcp_client.discover_categories()

# Agent retrieves relevant template
template = mcp_client.get_query_template(
    category="inventory",
    query_name="Parts Below Reorder Point"
)

# Agent adapts template with user parameters
adapted_query = template.replace("Live.dbo.PART", f"{user_database}.dbo.PART")
```

## Configuration

### Environment Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `DATABASE_URL` | `sqlite:///app_schema/manufacturing.db` | Database connection string |
| `QUERY_API_KEY` | (none) | API key for write operations (save_query) |

### Ports

- **5000**: FastAPI + MCP endpoints
- **5000/gradio**: Gradio UI interface

## References

- **MCP Specification**: Model Context Protocol for AI agent integration
- **Ground Truth SQL**: Curated queries for Visual Manufacturing ERP
- **Schema Documentation**: See `Documentation/Data Models/` in repository root

## Related Documents

- [README.md](README.md) - Quick start and deployment guide
- [DATABASE_SETUP.md](DATABASE_SETUP.md) - Schema loading and management
- [CUSTOMIZABLE_INPUTS.md](CUSTOMIZABLE_INPUTS.md) - Configuration reference
- [.github/copilot-instructions.md](../.github/copilot-instructions.md) - Repository conventions

---

**Last Updated**: 2026-01-01  
**Version**: 1.0  
**Maintainer**: IT Data Admin Team
