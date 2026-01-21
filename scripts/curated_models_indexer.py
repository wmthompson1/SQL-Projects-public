"""
Generate JSON index of tables referenced in Documentation/Schema/Data_Models/ SQL files.

Purpose: Create curated subset of manufacturing schema for ground truth graph building.
Output: hf-space-inventory-sqlgen/data_models_table_index.json

Workflow (Human-in-the-loop):
  1. Scan Data_Models SQL files (curated by humans)
  2. Extract table references using SQLGlot (CTEs and virtual tables excluded)
  3. Validate DDL coverage against Documentation/Schema/Tables/
  4. Report missing DDLs for manual review (no live DB integration)

Per .github/copilot-instructions.md: Data_Models contain authoritative domain flow
documentation with real SQL patterns from production ERP system.
"""

import json
import sqlglot
from pathlib import Path
from typing import Set, Dict
from collections import defaultdict
from datetime import datetime


def extract_tables_from_sql_with_sqlglot(sql_content: str) -> Set[str]:
    """
    Extract physical table references using SQLGlot parser.
    CTEs and virtual tables are automatically excluded.
    Returns table names normalized to UPPERCASE for consistency.
    """
    tables = set()
    
    try:
        # Parse with T-SQL dialect (SQL Server)
        parsed = sqlglot.parse(sql_content, dialect='tsql')
        
        for statement in parsed:
            if statement is None:
                continue
            
            # Only physical tables, CTEs are excluded by SQLGlot
            for table in statement.find_all(sqlglot.exp.Table):
                table_name = table.name
                
                if table_name:
                    # Strip schema/database qualifiers: Live.dbo.TABLE -> TABLE
                    parts = table_name.split('.')
                    actual_table = parts[-1].strip('[]"\'')
                    
                    # Skip temp tables, variables, and anything starting with CTE_
                    if not actual_table.startswith('#') and not actual_table.startswith('@') and not actual_table.upper().startswith("CTE_"):
                        tables.add(actual_table.upper())
    
    except sqlglot.errors.ParseError:
        # Fallback to regex if SQLGlot can't parse
        import re
        pattern = r'\b(?:FROM|JOIN)\s+dbo\.(\w+)\b'
        tables.update(m.upper() for m in re.findall(pattern, sql_content, re.IGNORECASE))
    
    return tables


def find_ddl_file_case_insensitive(table_name: str, schema_tables_dir: Path) -> Path:
    """
    Find DDL file with case-insensitive matching.
    Returns Path to DDL file or None if not found.
    """
    # Try exact match first (fastest)
    exact_path = schema_tables_dir / f"dbo.{table_name}.sql"
    if exact_path.exists():
        return exact_path
    
    # Case-insensitive glob search
    for ddl_file in schema_tables_dir.glob("dbo.*.sql"):
        file_table_name = ddl_file.stem.replace('dbo.', '')
        if file_table_name.upper() == table_name.upper():
            return ddl_file
    
    return None


def main():
    """Generate Data_Models table index with DDL coverage validation."""
    repo_root = Path(__file__).parent.parent
    data_models_dir = repo_root / "Documentation" / "Schema" / "Data_Models"
    schema_tables_dir = repo_root / "Documentation" / "Schema" / "Tables"
    output_json = repo_root / "hf-space-inventory-sqlgen" / "data_models_table_index.json"
    
    if not data_models_dir.exists():
        print(f"❌ Data_Models directory not found: {data_models_dir}")
        return
    
    print("🔍 Generating Data_Models table index using SQLGlot parser...")
    print("   (CTEs, virtual tables, and temp tables automatically excluded)\n")
    
    # Collect tables from all SQL files
    all_tables = set()
    tables_by_domain = defaultdict(set)
    tables_by_file = {}
    
    sql_files = list(data_models_dir.rglob("*.sql"))
    
    if not sql_files:
        print(f"❌ No .sql files found in {data_models_dir}")
        return
    
    print(f"Found {len(sql_files)} SQL files to process\n")
    
    for sql_file in sql_files:
        domain = sql_file.parent.name
        
        try:
            with open(sql_file, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception as e:
            print(f"⚠️  Could not read {sql_file.name}: {e}")
            continue
        
        tables = extract_tables_from_sql_with_sqlglot(content)
        
        if tables:
            rel_path = str(sql_file.relative_to(data_models_dir))
            print(f"📄 {rel_path}")
            print(f"   Domain: {domain}")
            print(f"   Tables: {', '.join(sorted(tables))}")
            print()
            
            all_tables.update(tables)
            tables_by_domain[domain].update(tables)
            tables_by_file[rel_path] = sorted(list(tables))
    
    if not all_tables:
        print("❌ No tables extracted from SQL files!")
        return
    
    # Verify DDL coverage
    print("=" * 70)
    print("📊 DDL Coverage Analysis")
    print("=" * 70)
    print()
    
    ddl_file_map = {}
    tables_without_ddl = set()
    
    for table in sorted(all_tables):
        ddl_file = find_ddl_file_case_insensitive(table, schema_tables_dir)
        if ddl_file:
            ddl_file_map[table] = str(ddl_file.relative_to(repo_root))
        else:
            tables_without_ddl.add(table)
            print(f"⚠️  Missing DDL: {table}")
    
    # Generate index
    index_data = {
        "generated_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "source": "Documentation/Schema/Data_Models/ SQL files (human-curated)",
        "parser": "SQLGlot (T-SQL dialect)",
        "cte_handling": "CTEs and virtual tables excluded by SQLGlot AST parser",
        "total_sql_files": len(sql_files),
        "total_tables": len(all_tables),
        "tables_with_ddl": len(ddl_file_map),
        "tables_missing_ddl": len(tables_without_ddl),
        "tables": sorted(list(all_tables)),
        "tables_by_domain": {k: sorted(list(v)) for k, v in sorted(tables_by_domain.items())},
        "tables_by_file": tables_by_file,
        "ddl_file_map": ddl_file_map,
        "missing_ddl": sorted(list(tables_without_ddl))
    }
    
    # Save JSON
    with open(output_json, 'w', encoding='utf-8') as f:
        json.dump(index_data, f, indent=2)
    
    # Summary
    print("\n" + "=" * 70)
    print("✅ Data_Models Table Index Generated")
    print("=" * 70)
    print(f"\n📊 Summary:")
    print(f"   SQL files processed: {len(sql_files)}")
    print(f"   Total unique tables: {len(all_tables)}")
    print(f"   Tables with DDL: {len(ddl_file_map)} ({len(ddl_file_map)/len(all_tables)*100:.1f}%)")
    print(f"   Tables missing DDL: {len(tables_without_ddl)} ({len(tables_without_ddl)/len(all_tables)*100:.1f}%)")
    
    print(f"\n📁 Tables by Domain:")
    for domain, tables in sorted(tables_by_domain.items()):
        print(f"   - {domain}: {len(tables)} tables")
    
    print(f"\n💾 Index saved to: {output_json.relative_to(repo_root)}")
    
    if tables_without_ddl:
        print(f"\n⚠️  Missing DDL Files:")
        print(f"   The following tables are referenced in Data_Models SQL but have no DDL:")
        for table in sorted(tables_without_ddl):
            print(f"   - {table}")
        print(f"\n   📋 Next Steps (Human-in-the-loop):")
        print(f"   1. Review missing tables - are they typos, aliases, or real tables?")
        print(f"   2. If real tables, manually add DDL to Documentation\\Schema\\Tables\\dbo.<TABLE_NAME>.sql")
        print(f"   3. Re-run this script to validate coverage")
    else:
        print(f"\n✅ All tables have DDL files!")
    
    print(f"\n📋 Next Step: Build Filtered Graph")
    print(f"   cd hf-space-inventory-sqlgen")
    print(f"   python combined_graph_builder.py")
    print(f"   # Ensure line 565 uses: main_data_models() instead of main()")
    print()


if __name__ == '__main__':
    main()