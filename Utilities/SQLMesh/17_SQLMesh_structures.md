Perfect! Now I understand your architecture completely. Let me create the **GitHub Actions workflows** to build and maintain your **ground-truth semantic layer** using SQLMesh + SQLGlot + ArangoDB graph database.

## Your Actual Architecture

```
SQL_Reports/*.sql (production reports)
         ↓
   GitHub Action: Extract Lineage (SQLMesh + SQLGlot)
         ↓
   ArangoDB Graph Database (ground truth semantic layer)
         ↓
   ├─→ Query validation endpoints
   ├─→ Lineage visualization (Gradio dashboard)
   └─→ Natural language → SQL generation (MCP endpoints)
```

## GitHub Actions Workflows

### 1. Extract SQL Report Lineage on Push

````yaml
name: Extract SQL Report Lineage

on:
  push:
    branches: [main]
    paths:
      - 'SQL_Reports/**/*.sql'
      - 'Documentation/Data Models/**/*.sql'
      - 'schema/queries/**/*.sql'
  workflow_dispatch:  # Allow manual trigger

jobs:
  extract-lineage:
    runs-on: windows-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Full history for change detection
      
      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'
          cache: 'pip'
      
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install sqlglot networkx duckdb
          # SQLMesh not needed for parsing - SQLGlot alone is sufficient
      
      - name: Extract table lineage from SQL Reports
        run: |
          python scripts/extract_report_lineage.py
        env:
          PYTHONIOENCODING: utf-8
      
      - name: Build NetworkX graph
        run: |
          python scripts/build_lineage_graph.py
      
      - name: Upload graph artifact
        uses: actions/upload-artifact@v4
        with:
          name: lineage-graph
          path: |
            schema/sql_reports_lineage.json
            scripts/lineage_graph.gpickle
          retention-days: 90
      
      - name: Commit updated lineage catalog
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add schema/sql_reports_lineage.json
          git diff --staged --quiet || git commit -m "🤖 Update SQL lineage catalog [skip ci]"
          git push
````

### 2. Sync NetworkX Graph to ArangoDB

````yaml
name: Sync Lineage Graph to ArangoDB

on:
  workflow_run:
    workflows: ["Extract SQL Report Lineage"]
    types: [completed]
    branches: [main]
  workflow_dispatch:

jobs:
  sync-graph:
    runs-on: windows-latest
    # Only run if lineage extraction succeeded
    if: ${{ github.event.workflow_run.conclusion == 'success' || github.event_name == 'workflow_dispatch' }}
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      
      - name: Install ArangoDB dependencies
        run: |
          pip install python-arango networkx
      
      - name: Download lineage graph artifact
        uses: actions/download-artifact@v4
        with:
          name: lineage-graph
          path: scripts/
      
      - name: Sync graph to ArangoDB
        run: |
          python scripts/nx_to_arango.py `
            --graph-file scripts/lineage_graph.gpickle `
            --update-ground-truth
        env:
          ARANGO_HOST: ${{ secrets.ARANGO_HOST }}
          ARANGO_USER: ${{ secrets.ARANGO_USER }}
          ARANGO_PASSWORD: ${{ secrets.ARANGO_PASSWORD }}
          ARANGO_DB: ${{ secrets.ARANGO_DB || 'sql_lineage' }}
      
      - name: Validate graph integrity
        run: |
          python scripts/validate_graph_integrity.py
````

### 3. Validate SQL Against Ground Truth

````yaml
name: Validate SQL Queries

on:
  pull_request:
    paths:
      - 'SQL_Reports/**/*.sql'
      - 'schema/queries/**/*.sql'
  workflow_dispatch:

jobs:
  validate-queries:
    runs-on: windows-latest
    
    steps:
      - name: Checkout PR branch
        uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      
      - name: Install validation tools
        run: |
          pip install sqlglot python-arango
      
      - name: Parse and validate SQL syntax
        run: |
          python scripts/validate_sql_syntax.py --path SQL_Reports/
        continue-on-error: true
        id: syntax_check
      
      - name: Check against ArangoDB ground truth
        run: |
          python scripts/validate_against_ground_truth.py
        env:
          ARANGO_HOST: ${{ secrets.ARANGO_HOST }}
          ARANGO_USER: ${{ secrets.ARANGO_USER }}
          ARANGO_PASSWORD: ${{ secrets.ARANGO_PASSWORD }}
      
      - name: Comment validation results on PR
        uses: actions/github-script@v7
        if: always()
        with:
          script: |
            const fs = require('fs');
            const results = JSON.parse(fs.readFileSync('validation_results.json', 'utf8'));
            
            const body = `## SQL Validation Results
            
            ✅ **Syntax Valid:** ${results.syntax_valid} queries
            ⚠️  **Warnings:** ${results.warnings} queries
            ❌ **Errors:** ${results.errors} queries
            
            ### Schema Coverage
            - **Documented Tables:** ${results.documented_tables}
            - **Undocumented References:** ${results.undocumented_tables}
            
            ${results.undocumented_tables > 0 ? '⚠️ Some queries reference undocumented tables. See lineage report.' : ''}
            
            <details>
            <summary>View detailed report</summary>
            
            \`\`\`
            ${results.details}
            \`\`\`
            </details>`;
            
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: body
            });
````

## Python Scripts for GitHub Actions

### Script 1: Extract Report Lineage

````python
"""Extract table dependencies from SQL Reports using SQLGlot"""
from pathlib import Path
import json
from typing import Dict, Set, List
from sqlglot import parse_one, exp
from sqlglot.optimizer.scope import build_scope

def extract_tables_from_sql(sql_content: str, dialect: str = 'tsql') -> Set[str]:
    """Parse SQL and extract table references"""
    try:
        parsed = parse_one(sql_content, dialect=dialect)
        scope = build_scope(parsed)
        
        tables = set()
        for table in scope.sources.values():
            if table.name:
                # Normalize table names: LIVE.dbo.TABLE → Live.dbo.TABLE
                db = table.db or ""
                schema = table.schema or "dbo"
                name = table.name
                
                if db:
                    full_name = f"{db}.{schema}.{name}"
                else:
                    full_name = f"{schema}.{name}"
                
                tables.add(full_name)
        
        return tables
    
    except Exception as e:
        print(f"⚠️  Parse error: {e}")
        return set()

def extract_lineage_from_reports() -> Dict:
    """Parse all SQL Reports and extract dependencies"""
    
    reports_dir = Path("SQL_Reports")
    lineage_data = {}
    
    print(f"📊 Scanning {reports_dir}...")
    
    sql_files = list(reports_dir.rglob("*.sql"))
    print(f"   Found {len(sql_files)} SQL files")
    
    for sql_file in sql_files:
        relative_path = sql_file.relative_to(reports_dir)
        
        try:
            with open(sql_file, 'r', encoding='utf-8') as f:
                sql_content = f.read()
            
            # Extract table references
            tables = extract_tables_from_sql(sql_content, dialect='tsql')
            
            lineage_data[str(relative_path)] = {
                "tables": sorted(list(tables)),
                "category": relative_path.parts[0] if len(relative_path.parts) > 1 else "Uncategorized",
                "file_size": sql_file.stat().st_size,
                "line_count": len(sql_content.splitlines())
            }
            
            print(f"   ✅ {relative_path}: {len(tables)} tables")
            
        except Exception as e:
            print(f"   ❌ {relative_path}: {e}")
            lineage_data[str(relative_path)] = {
                "error": str(e),
                "category": "Error"
            }
    
    # Save lineage catalog
    output_file = Path("schema/sql_reports_lineage.json")
    output_file.parent.mkdir(exist_ok=True)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(lineage_data, f, indent=2)
    
    print(f"\n✅ Extracted lineage for {len(lineage_data)} reports")
    print(f"   Saved to: {output_file}")
    
    return lineage_data

if __name__ == "__main__":
    extract_lineage_from_reports()
````

### Script 2: Build NetworkX Graph

````python
"""Build NetworkX graph from SQL lineage data"""
import json
import pickle
from pathlib import Path
import networkx as nx

def build_lineage_graph() -> nx.DiGraph:
    """Create directed graph: Report → Table dependencies"""
    
    # Load lineage data
    with open("schema/sql_reports_lineage.json") as f:
        lineage = json.load(f)
    
    G = nx.DiGraph()
    
    print("📊 Building lineage graph...")
    
    # Add nodes and edges
    for report_path, data in lineage.items():
        if "error" in data:
            continue
        
        report_node = f"report:{report_path}"
        
        # Add report node
        G.add_node(report_node, 
                   type="report",
                   category=data.get("category"),
                   line_count=data.get("line_count"))
        
        # Add table nodes and edges
        for table in data.get("tables", []):
            table_node = f"table:{table}"
            
            if not G.has_node(table_node):
                G.add_node(table_node, type="table")
            
            # Report depends on table
            G.add_edge(report_node, table_node, type="depends_on")
    
    print(f"   Nodes: {G.number_of_nodes()}")
    print(f"   Edges: {G.number_of_edges()}")
    
    # Save graph
    output_file = Path("scripts/lineage_graph.gpickle")
    with open(output_file, 'wb') as f:
        pickle.dump(G, f)
    
    print(f"✅ Graph saved to: {output_file}")
    
    return G

if __name__ == "__main__":
    build_lineage_graph()
````

### Script 3: Enhanced ArangoDB Sync (Updated)

````python
"""
Enhanced: Sync NetworkX lineage graph to ArangoDB with ground-truth metadata
Usage: python nx_to_arango.py --graph-file lineage_graph.gpickle --update-ground-truth
"""
import argparse
import pickle
import os
from pathlib import Path
from arango import ArangoClient
import networkx as nx

def sync_graph_to_arango(graph_file: Path, update_ground_truth: bool = False):
    """Sync NetworkX graph to ArangoDB"""
    
    # Load graph
    with open(graph_file, 'rb') as f:
        G = pickle.load(f)
    
    print(f"📊 Loaded graph: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")
    
    # Connect to ArangoDB
    client = ArangoClient(hosts=os.getenv('ARANGO_HOST', 'http://127.0.0.1:8529'))
    db = client.db(
        os.getenv('ARANGO_DB', 'sql_lineage'),
        username=os.getenv('ARANGO_USER', 'root'),
        password=os.getenv('ARANGO_PASSWORD')
    )
    
    # Create collections
    if not db.has_collection('reports'):
        db.create_collection('reports')
    if not db.has_collection('tables'):
        db.create_collection('tables')
    if not db.has_collection('dependencies'):
        db.create_collection('dependencies', edge=True)
    
    reports_col = db.collection('reports')
    tables_col = db.collection('tables')
    deps_col = db.collection('dependencies')
    
    # Sync nodes
    print("📥 Syncing nodes...")
    for node_id, attrs in G.nodes(data=True):
        node_type = attrs.get('type')
        
        # Normalize node key for ArangoDB
        key = node_id.replace(':', '_').replace('/', '_').replace('\\', '_')
        
        doc = {
            '_key': key,
            'original_id': node_id,
            **attrs
        }
        
        if update_ground_truth:
            doc['ground_truth'] = True
            doc['last_validated'] = str(Path(graph_file).stat().st_mtime)
        
        if node_type == 'report':
            reports_col.insert(doc, overwrite=True)
        elif node_type == 'table':
            tables_col.insert(doc, overwrite=True)
    
    # Sync edges
    print("📥 Syncing edges...")
    for source, target, attrs in G.edges(data=True):
        source_key = source.replace(':', '_').replace('/', '_').replace('\\', '_')
        target_key = target.replace(':', '_').replace('/', '_').replace('\\', '_')
        
        edge_doc = {
            '_from': f"reports/{source_key}" if source.startswith('report:') else f"tables/{source_key}",
            '_to': f"tables/{target_key}" if target.startswith('table:') else f"reports/{target_key}",
            **attrs
        }
        
        if update_ground_truth:
            edge_doc['ground_truth'] = True
        
        deps_col.insert(edge_doc, overwrite=True)
    
    print("✅ Graph synced to ArangoDB successfully")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--graph-file', required=True, type=Path)
    parser.add_argument('--update-ground-truth', action='store_true')
    args = parser.parse_args()
    
    sync_graph_to_arango(args.graph_file, args.update_ground_truth)
````

### Script 4: Validate Against Ground Truth

````python
"""Validate SQL queries against ArangoDB ground-truth schema"""
import json
import os
from pathlib import Path
from arango import ArangoClient

def validate_against_ground_truth():
    """Check if all referenced tables exist in ground-truth graph"""
    
    # Load lineage data
    with open("schema/sql_reports_lineage.json") as f:
        lineage = json.load(f)
    
    # Connect to ArangoDB
    client = ArangoClient(hosts=os.getenv('ARANGO_HOST', 'http://127.0.0.1:8529'))
    db = client.db(
        os.getenv('ARANGO_DB', 'sql_lineage'),
        username=os.getenv('ARANGO_USER'),
        password=os.getenv('ARANGO_PASSWORD')
    )
    
    tables_col = db.collection('tables')
    
    # Get documented tables from ArangoDB
    documented_tables = set()
    for doc in tables_col.all():
        if doc.get('ground_truth'):
            documented_tables.add(doc['original_id'].replace('table:', ''))
    
    print(f"📚 Ground-truth tables: {len(documented_tables)}")
    
    # Find undocumented tables
    referenced_tables = set()
    for report_data in lineage.values():
        if "tables" in report_data:
            referenced_tables.update(report_data["tables"])
    
    undocumented = referenced_tables - documented_tables
    
    results = {
        "syntax_valid": len([r for r in lineage.values() if "error" not in r]),
        "warnings": 0,
        "errors": len([r for r in lineage.values() if "error" in r]),
        "documented_tables": len(documented_tables),
        "undocumented_tables": len(undocumented),
        "details": ""
    }
    
    if undocumented:
        print("\n⚠️  Undocumented tables found:")
        details = "Undocumented tables:\n"
        for table in sorted(undocumented):
            print(f"   - {table}")
            details += f"- {table}\n"
        results["details"] = details
    else:
        print("✅ All referenced tables are documented!")
        results["details"] = "All tables validated against ground truth."
    
    # Save results for GitHub Action
    with open("validation_results.json", 'w') as f:
        json.dump(results, f)

if __name__ == "__main__":
    validate_against_ground_truth()
````

## Repository Secrets Setup

Add these to **Settings → Secrets and variables → Actions**:

```
ARANGO_HOST=http://your-arango-server:8529
ARANGO_USER=ci_user
ARANGO_PASSWORD=<secure-password>
ARANGO_DB=sql_lineage
```

## settings.json - Final Configuration

````json
{
  // Disable SQLMesh LSP (not needed - using CLI tools only)
  "sqlmesh.enabled": false,
  
  // Python environment for scripts
  "python.defaultInterpreterPath": "${workspaceFolder}\\.venv\\Scripts\\python.exe",
  
  // SQL editing (use MSSQL extension)
  "mssql.connections": [
    {
      "server": "sql-lab-1",
      "database": "LIVE",
      "authenticationType": "Integrated",
      "trustServerCertificate": true
    }
  ],
  
  "files.associations": {
    "**/SQL_Reports/**/*.sql": "sql",
    "**/schema/queries/**/*.sql": "sql",
    "**/.github/workflows/*.yml": "yaml"
  },
  
  // Reduce file watching for performance
  "files.watcherExclude": {
    "**/.git/**": true,
    "**/.venv/**": true,
    "**/scripts/*.gpickle": true
  }
}
````

## Summary

Your **ground-truth semantic layer workflow**:

1. ✅ **SQL Reports → SQLGlot Parser** (GitHub Action extracts lineage)
2. ✅ **NetworkX Graph** (intermediate representation)
3. ✅ **ArangoDB** (persistent ground-truth graph database)
4. ✅ **Validation** (PR checks validate against ground truth)
5. ✅ **MCP Endpoints** (hf-space queries ground truth for SQL generation)

**Next steps:**
1. Commit workflows to workflows
2. Add repository secrets (ArangoDB credentials)
3. Push changes → GitHub Actions will auto-extract lineage
4. Graph syncs to ArangoDB as ground truth
5. Future PRs validated against this ground truth

Resources
[https://github.com/Skills-Inc-Org/SQL-Projects/blob/main/Utilities/SQLMesh/17_SQLMesh_structures.md](https://github.com/Skills-Inc-Org/SQL-Projects/blob/main/Utilities/SQLMesh/17_SQLMesh_structures.md)

Should I also create the **validation_results.json** schema and PR comment template for better CI feedback?