 **sqlglot** is a dependency of SQLMesh (SQLMesh uses it internally),  dedicated folder for lineage and analysis scripts.

## Recommended Structure

I'd suggest making it a **subfolder within SQLMesh** since it's directly related to analyzing your SQLMesh models and SQL files:

```
└───SQLMesh
    ├───.cache
    ├───audits
    ├───logs
    ├───macros
    ├───models
    │   ├───intermediate
    │   ├───marts
    │   └───staging
    ├───seeds
    ├───tests
    └───analysis          # NEW: Your lineage & analysis scripts
        ├───lineage       # Table lineage and dependency tracking
        ├───impact        # Impact analysis tools
        ├───reports       # Generated reports and outputs
        └───utils         # Shared utilities
```

**Why this structure?**
- Keeps analysis tools with the data they analyze
- Can reference SQLMesh models directly
- Easier to maintain as a cohesive project
- Can use SQLMesh's config and context

## Initial Project Setup

Let me create a full project structure for you:

````markdown name=README.md
# SQL Analysis & Lineage Project

This project provides lineage tracking, impact analysis, and query documentation for SQL-Projects repository.

## Structure

```
└───SQLMesh
    analysis/
    ├── lineage/           # Table lineage extraction
    │   ├── extract_tables.py
    │   ├── build_lineage.py
    │   └── lineage_graph.py
    ├── impact/            # Impact analysis
    │   ├── find_dependencies.py
    │   └── table_usage.py
    ├── reports/           # Output directory
    │   ├── lineage/
    │   ├── impact/
    │   └── metadata/
    └── utils/             # Shared utilities
        ├── sql_parser.py
        └── report_generator.py
```

## Installation

```bash
cd .\Utilities\SQLMesh
pip install sqlglot sqlmesh graphviz pandas
```

## Usage

### 1. Extract Table Lineage
```bash
python analysis/lineage/extract_tables.py
```

### 2. Build Lineage Graph
```bash
python analysis/lineage/build_lineage.py
```

### 3. Find Table Dependencies
```bash
python analysis/impact/find_dependencies.py --table PART
```
````

Now let's create the actual implementation:

```python name=analysis/utils/sql_parser.py
"""
Utility functions for parsing SQL files and extracting metadata
"""
import sqlglot
from sqlglot import exp
from pathlib import Path
from typing import List, Dict, Set, Optional
import logging

logging.basicConfig(level=logging. INFO)
logger = logging.getLogger(__name__)


class SQLParser:
    """Parse SQL files and extract table information"""
    
    def __init__(self, dialect='tsql'):
        self.dialect = dialect
    
    def extract_tables_from_query(self, sql:  str) -> List[Dict]:
        """
        Extract all table references from a SQL query
        
        Returns:
            List of dicts with table info:  {database, schema, table, alias, full_name}
        """
        try:
            parsed = sqlglot.parse_one(sql, read=self.dialect)
            
            tables = []
            for table in parsed.find_all(exp.Table):
                info = {
                    'database': table.catalog if table.catalog else None,
                    'schema': table.db if table.db else None,
                    'table': table.name,
                    'alias': table. alias if hasattr(table, 'alias') else None,
                    'full_name': self._build_full_name(table)
                }
                tables. append(info)
            
            return tables
        except Exception as e:
            logger.error(f"Error parsing query: {e}")
            return []
    
    def extract_tables_from_file(self, file_path: Path) -> Dict:
        """
        Extract all tables from a SQL file
        
        Returns:
            Dict with file info and tables found
        """
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                sql_content = f.read()
            
            # Parse all statements in the file
            statements = sqlglot.parse(sql_content, read=self. dialect)
            
            all_tables = set()
            for stmt in statements:
                if stmt: 
                    for table in stmt.find_all(exp.Table):
                        full_name = self._build_full_name(table)
                        all_tables.add(full_name)
            
            return {
                'file_path': str(file_path),
                'file_name': file_path.name,
                'relative_path': self._get_relative_path(file_path),
                'tables':  sorted(list(all_tables)),
                'table_count': len(all_tables)
            }
        except Exception as e:
            logger.error(f"Error parsing file {file_path}: {e}")
            return {
                'file_path': str(file_path),
                'file_name': file_path. name,
                'tables': [],
                'table_count': 0,
                'error': str(e)
            }
    
    def extract_joins_from_query(self, sql: str) -> List[Dict]:
        """
        Extract JOIN information from SQL query
        
        Returns:
            List of dicts with join info: {type, left_table, right_table, condition}
        """
        try: 
            parsed = sqlglot. parse_one(sql, read=self.dialect)
            
            joins = []
            for join in parsed.find_all(exp. Join):
                join_info = {
                    'type':  join.side if hasattr(join, 'side') else 'INNER',
                    'table': self._extract_table_from_node(join. this),
                    'condition': str(join.args.get('on', '')) if 'on' in join.args else None
                }
                joins.append(join_info)
            
            return joins
        except Exception as e:
            logger.error(f"Error extracting joins: {e}")
            return []
    
    def extract_columns_from_query(self, sql: str) -> List[str]:
        """Extract all column references from a query"""
        try:
            parsed = sqlglot.parse_one(sql, read=self. dialect)
            
            columns = set()
            for col in parsed.find_all(exp.Column):
                columns.add(col.sql())
            
            return sorted(list(columns))
        except Exception as e:
            logger.error(f"Error extracting columns: {e}")
            return []
    
    @staticmethod
    def _build_full_name(table: exp. Table) -> str:
        """Build fully qualified table name"""
        parts = []
        if table.catalog:
            parts.append(table. catalog)
        if table.db:
            parts.append(table.db)
        parts.append(table.name)
        return '.'.join(parts)
    
    @staticmethod
    def _extract_table_from_node(node) -> Optional[str]:
        """Extract table name from a node"""
        if isinstance(node, exp.Table):
            return SQLParser._build_full_name(node)
        return None
    
    @staticmethod
    def _get_relative_path(file_path: Path) -> str:
        """Get relative path from SQL_Reports directory"""
        try:
            # Find SQL_Reports in the path
            parts = file_path.parts
            if 'SQL_Reports' in parts: 
                idx = parts.index('SQL_Reports')
                return str(Path(*parts[idx: ]))
            return str(file_path)
        except:
            return str(file_path)


def scan_sql_files(directory: Path, pattern: str = '*.sql') -> List[Path]:
    """Recursively find all SQL files in directory"""
    return list(directory.rglob(pattern))
```

```python name=analysis/lineage/extract_tables.py
"""
Extract table lineage from all SQL files in the repository
"""
import json
from pathlib import Path
from datetime import datetime
import sys

# Add parent directory to path
sys.path. append(str(Path(__file__).parent. parent))

from utils.sql_parser import SQLParser, scan_sql_files


def extract_lineage(sql_reports_path: Path, output_path: Path):
    """
    Extract table lineage from all SQL files
    
    Args:
        sql_reports_path: Path to SQL_Reports directory
        output_path: Path to save lineage report
    """
    parser = SQLParser(dialect='tsql')
    
    print(f"Scanning SQL files in:  {sql_reports_path}")
    sql_files = scan_sql_files(sql_reports_path)
    print(f"Found {len(sql_files)} SQL files")
    
    # Extract tables from each file
    lineage_data = []
    all_tables = set()
    
    for idx, sql_file in enumerate(sql_files, 1):
        print(f"Processing [{idx}/{len(sql_files)}]:  {sql_file.name}")
        
        file_info = parser.extract_tables_from_file(sql_file)
        lineage_data.append(file_info)
        all_tables. update(file_info['tables'])
    
    # Create summary
    summary = {
        'generated_at': datetime.now().isoformat(),
        'total_sql_files': len(sql_files),
        'total_unique_tables': len(all_tables),
        'unique_tables':  sorted(list(all_tables)),
        'files':  lineage_data
    }
    
    # Save to JSON
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2)
    
    print(f"\n✅ Lineage extraction complete!")
    print(f"   Total SQL files: {len(sql_files)}")
    print(f"   Unique tables: {len(all_tables)}")
    print(f"   Report saved to: {output_path}")
    
    # Print top 10 most used tables
    table_usage = {}
    for file_info in lineage_data: 
        for table in file_info['tables']: 
            table_usage[table] = table_usage.get(table, 0) + 1
    
    print("\n📊 Top 10 Most Referenced Tables:")
    for table, count in sorted(table_usage.items(), key=lambda x: x[1], reverse=True)[:10]:
        print(f"   {count: 3d} references:  {table}")
    
    return summary


def main():
    # Define paths (adjust these for your setup)
    repo_root = Path(__file__).parent.parent. parent. parent
    sql_reports_path = repo_root / "SQL_Reports"
    output_path = repo_root / "SQLMesh" / "analysis" / "reports" / "lineage" / "table_lineage.json"
    
    if not sql_reports_path.exists():
        print(f"❌ Error: SQL_Reports directory not found at {sql_reports_path}")
        print("   Please adjust the path in the script")
        return
    
    extract_lineage(sql_reports_path, output_path)


if __name__ == "__main__": 
    main()
```

```python name=analysis/lineage/build_lineage_graph.py
"""
Build a visual lineage graph showing table dependencies
"""
import json
from pathlib import Path
from collections import defaultdict
from typing import Dict, Set
import sys

try:
    import graphviz
    HAS_GRAPHVIZ = True
except ImportError:
    HAS_GRAPHVIZ = False
    print("⚠️  Warning: graphviz not installed. Install with: pip install graphviz")


def build_lineage_graph(lineage_json_path: Path, output_path: Path):
    """
    Build a visual graph of table dependencies
    
    Args: 
        lineage_json_path: Path to lineage JSON file
        output_path: Path to save graph (without extension)
    """
    # Load lineage data
    with open(lineage_json_path, 'r') as f:
        data = json.load(f)
    
    # Build file -> tables mapping
    file_to_tables: Dict[str, Set[str]] = {}
    table_to_files: Dict[str, Set[str]] = defaultdict(set)
    
    for file_info in data['files']: 
        file_name = file_info['file_name']
        tables = set(file_info['tables'])
        
        file_to_tables[file_name] = tables
        
        for table in tables:
            table_to_files[table]. add(file_name)
    
    # Create graph
    if HAS_GRAPHVIZ: 
        dot = graphviz.Digraph(comment='Table Lineage', format='png')
        dot.attr(rankdir='LR', size='12,8')
        dot.attr('node', shape='box', style='rounded,filled')
        
        # Add table nodes
        for table in sorted(table_to_files.keys()):
            usage_count = len(table_to_files[table])
            # Color based on usage
            if usage_count > 10:
                color = 'lightcoral'
            elif usage_count > 5:
                color = 'lightyellow'
            else: 
                color = 'lightgreen'
            
            dot.node(table, f"{table}\n({usage_count} refs)", fillcolor=color)
        
        # Add file nodes and edges
        for file_name, tables in file_to_tables. items():
            if tables:  # Only add if file has tables
                dot.node(f"file_{file_name}", file_name, shape='note', fillcolor='lightblue')
                for table in tables:
                    dot.edge(f"file_{file_name}", table)
        
        # Save graph
        output_path.parent. mkdir(parents=True, exist_ok=True)
        dot.render(str(output_path), cleanup=True)
        print(f"✅ Lineage graph saved to: {output_path}. png")
    
    # Also create a text-based report
    text_report_path = output_path.with_suffix('.txt')
    with open(text_report_path, 'w') as f:
        f.write("=" * 80 + "\n")
        f.write("TABLE LINEAGE REPORT\n")
        f.write("=" * 80 + "\n\n")
        
        f.write(f"Generated: {data['generated_at']}\n")
        f.write(f"Total SQL Files: {data['total_sql_files']}\n")
        f.write(f"Total Unique Tables: {data['total_unique_tables']}\n\n")
        
        f. write("=" * 80 + "\n")
        f.write("TABLES BY USAGE COUNT\n")
        f.write("=" * 80 + "\n\n")
        
        for table, files in sorted(table_to_files.items(), key=lambda x: len(x[1]), reverse=True):
            f.write(f"\n{table} ({len(files)} references)\n")
            f.write("-" * 80 + "\n")
            for file_name in sorted(files):
                f.write(f"  - {file_name}\n")
    
    print(f"✅ Text report saved to: {text_report_path}")


def main():
    repo_root = Path(__file__).parent.parent.parent. parent
    lineage_json = repo_root / "SQLMesh" / "analysis" / "reports" / "lineage" / "table_lineage.json"
    output_path = repo_root / "SQLMesh" / "analysis" / "reports" / "lineage" / "lineage_graph"
    
    if not lineage_json.exists():
        print(f"❌ Error:  Lineage JSON not found at {lineage_json}")
        print("   Run extract_tables.py first")
        return
    
    build_lineage_graph(lineage_json, output_path)


if __name__ == "__main__":
    main()
```

```python name=analysis/impact/find_dependencies.py
"""
Find all SQL files that depend on a specific table
"""
import json
from pathlib import Path
import argparse
import sys


def find_table_dependencies(lineage_json_path: Path, table_name: str):
    """
    Find all files that reference a specific table
    
    Args:
        lineage_json_path: Path to lineage JSON
        table_name: Table name to search for (case-insensitive, partial match)
    """
    with open(lineage_json_path, 'r') as f:
        data = json.load(f)
    
    # Find matching tables
    matching_tables = [
        t for t in data['unique_tables']
        if table_name.upper() in t.upper()
    ]
    
    if not matching_tables:
        print(f"❌ No tables found matching:  {table_name}")
        return
    
    print(f"\n🔍 Found {len(matching_tables)} matching table(s):")
    for table in matching_tables:
        print(f"   - {table}")
    
    # Find files using these tables
    print(f"\n📁 Files using these tables:\n")
    
    for table in matching_tables:
        files_using_table = []
        for file_info in data['files']:
            if table in file_info['tables']:
                files_using_table.append(file_info)
        
        print(f"\n{table} ({len(files_using_table)} files):")
        print("=" * 80)
        
        for file_info in files_using_table: 
            print(f"\n  📄 {file_info['relative_path']}")
            print(f"     Tables used: {len(file_info['tables'])}")
            print(f"     Other tables: {', '.join([t for t in file_info['tables'] if t != table][:5])}")
            if len(file_info['tables']) > 6:
                print(f"     ... and {len(file_info['tables']) - 6} more")


def main():
    parser = argparse.ArgumentParser(description='Find SQL files that depend on a table')
    parser.add_argument('--table', '-t', required=True, help='Table name to search for')
    parser.add_argument('--lineage', '-l', help='Path to lineage JSON file')
    
    args = parser.parse_args()
    
    if args.lineage:
        lineage_path = Path(args.lineage)
    else:
        repo_root = Path(__file__).parent.parent.parent. parent
        lineage_path = repo_root / "SQLMesh" / "analysis" / "reports" / "lineage" / "table_lineage.json"
    
    if not lineage_path.exists():
        print(f"❌ Error: Lineage JSON not found at {lineage_path}")
        print("   Run extract_tables.py first")
        return
    
    find_table_dependencies(lineage_path, args.table)


if __name__ == "__main__": 
    main()
```

```python name=analysis/__init__.py
"""
SQL Analysis and Lineage Tools for SQL-Projects

This package provides tools for:
- Extracting table lineage from SQL files
- Building dependency graphs
- Impact analysis
- Query documentation
"""

__version__ = "0.1.0"
```

```yaml name=analysis/config. yaml
# Configuration for SQL Analysis tools

# SQL dialect (tsql for SQL Server)
dialect: tsql

# Paths (relative to repo root)
paths:
  sql_reports: SQL_Reports
  sqlmesh: SQLMesh
  output: SQLMesh/analysis/reports

# Lineage extraction settings
lineage:
  include_patterns:
    - "*.sql"
  exclude_patterns:
    - "*.backup. sql"
    - "*_old.sql"
  
  # Tables to highlight in reports
  important_tables:
    - PART
    - WORK_ORDER
    - CUSTOMER_ORDER

# Report settings
reports:
  max_table_display:  50
  graph_format: png
  include_columns: false
```

```markdown name=analysis/USAGE.md
# SQL Analysis Tools - Usage Guide

## Quick Start

### 1. Extract Table Lineage

```bash
cd SQLMesh/analysis
python lineage/extract_tables.py
```

This scans all SQL files and extracts table references, creating: 
- `reports/lineage/table_lineage.json` - Full lineage data

### 2. Build Visual Graph

```bash
python lineage/build_lineage_graph.py
```

Creates: 
- `reports/lineage/lineage_graph.png` - Visual dependency graph
- `reports/lineage/lineage_graph.txt` - Text-based report

### 3. Find Table Dependencies

```bash
python impact/find_dependencies.py --table PART
```

Shows all SQL files that reference tables matching "PART"

## Examples

### Find all files using WORK_ORDER table
```bash
python impact/find_dependencies.py -t WORK_ORDER
```

### Find files using any table in LIVESupplemental database
```bash
python impact/find_dependencies.py -t LIVESupplemental
```

### Generate lineage for specific directory
```python
from pathlib import Path
from lineage.extract_tables import extract_lineage

sql_path = Path("../../SQL_Reports/Part Reports")
output_path = Path("reports/lineage/part_reports_lineage.json")
extract_lineage(sql_path, output_path)
```

## Integration with SQLMesh

You can also analyze SQLMesh models: 

```python
from sqlmesh import Context
from utils.sql_parser import SQLParser

context = Context(paths=[".. "])
parser = SQLParser()

# Analyze a specific model
model = context.get_model("staging.parts_catalog")
tables = parser.extract_tables_from_query(model.render_query())
print(f"Tables used: {tables}")
```

## Next Steps

1. Set up automated lineage extraction in CI/CD
2. Create dashboards for table usage metrics
3. Add column-level lineage
4. Build impact analysis for schema changes
```

Now, would you like me to help you: 

1. **Set this up in your repository** - I can create a PR with all these files
2. **Add GitHub Actions integration** - Automatically generate lineage reports
3. **Create a web dashboard** - Build an interactive lineage explorer
4. **Extend with more features** - Column-level lineage, query optimization suggestions, etc.

Which would you like to tackle first? 