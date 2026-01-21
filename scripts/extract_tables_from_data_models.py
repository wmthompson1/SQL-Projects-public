"""
Extract unique table references from Documentation/Schema/Data_Models/ SQL files.
Generate a list of tables to include in ground truth graph with their DDL metadata.

Per copilot-instructions.md: Data_Models contain authoritative domain flow documentation
with real SQL patterns. Uses SQLGlot for proper SQL parsing (handles CTEs, subqueries).
"""

import sqlglot
from pathlib import Path
from typing import Set, Dict
from collections import defaultdict


def extract_tables_from_sql(sql_content: str) -> Set[str]:
    """
    Extract table references from SQL using SQLGlot parser.
    Handles CTEs, subqueries, and complex queries properly.
    """
    tables = set()
    
    try:
        # Parse SQL with SQLGlot (T-SQL dialect for SQL Server)
        parsed = sqlglot.parse(sql_content, dialect='tsql')
        
        for statement in parsed:
            if statement is None:
                continue
            
            # Find all table references in the AST
            for table in statement.find_all(sqlglot.exp.Table):
                table_name = table.name
                
                # Skip if it's a CTE reference (CTEs are virtual tables)
                # SQLGlot already handles this - CTEs won't appear in .find_all(Table)
                # unless they're referenced, but we want physical tables only
                
                # Get just the table name (without schema/database)
                if table_name:
                    # Handle qualified names: Live.dbo.TABLE -> TABLE
                    parts = table_name.split('.')
                    actual_table = parts[-1].strip('[]"\'')
                    
                    # Skip system/temp tables
                    if not actual_table.startswith('#') and not actual_table.startswith('@'):
                        tables.add(actual_table)
    
    except sqlglot.errors.ParseError as e:
        # If parsing fails, fall back to simple pattern matching
        # (some SQL might have syntax SQLGlot doesn't recognize)
        import re
        pattern = r'\b(?:FROM|JOIN)\s+(?:Live\.)?dbo\.(\w+)\b'
        tables.update(re.findall(pattern, sql_content, re.IGNORECASE))
    
    return tables


def extract_tables_from_sql_file(file_path: Path) -> Set[str]:
    """Extract table references from SQL file using SQLGlot."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        # Try with different encoding
        try:
            with open(file_path, 'r', encoding='latin-1') as f:
                content = f.read()
        except Exception as e:
            print(f"   ⚠️  Could not read file (encoding issue): {e}")
            return set()
    
    return extract_tables_from_sql(content)


def main():
    """Extract all table references from Data_Models SQL files."""
    repo_root = Path(__file__).parent.parent
    data_models_dir = repo_root / "Documentation" / "Schema" / "Data_Models"
    schema_tables_dir = repo_root / "Documentation" / "Schema" / "Tables"
    
    if not data_models_dir.exists():
        print(f"❌ Data_Models directory not found: {data_models_dir}")
        return
    
    print("🔍 Scanning Documentation/Schema/Data_Models/ for SQL files...")
    print("   Using SQLGlot parser (handles CTEs, subqueries, complex SQL)\n")
    
    # Track tables by domain and file
    tables_by_domain = defaultdict(set)
    tables_by_file = {}
    all_tables = set()
    
    # Process only .sql files
    sql_files = list(data_models_dir.rglob("*.sql"))
    
    if not sql_files:
        print("❌ No .sql files found in Data_Models directory!")
        print(f"   Searched in: {data_models_dir}")
        return
    
    print(f"Found {len(sql_files)} SQL files to process\n")
    
    for file_path in sql_files:
        domain = file_path.parent.name
        
        tables = extract_tables_from_sql_file(file_path)
        
        if tables:
            rel_path = file_path.relative_to(data_models_dir)
            print(f"📄 {rel_path}")
            print(f"   Domain: {domain}")
            print(f"   Tables: {', '.join(sorted(tables))}")
            print()
            
            tables_by_domain[domain].update(tables)
            tables_by_file[str(rel_path)] = tables
            all_tables.update(tables)
        else:
            rel_path = file_path.relative_to(data_models_dir)
            print(f"⚠️  {rel_path}")
            print(f"   No table references found")
            print()
    
    if not all_tables:
        print("❌ No tables extracted from SQL files!")
        return
    
    # Check which tables have DDL files
    print("=" * 70)
    print("📊 Table DDL Coverage Analysis")
    print("=" * 70)
    print()
    
    tables_with_ddl = set()
    tables_without_ddl = set()
    
    for table in sorted(all_tables):
        ddl_file = schema_tables_dir / f"dbo.{table}.sql"
        if ddl_file.exists():
            tables_with_ddl.add(table)
        else:
            tables_without_ddl.add(table)
            print(f"⚠️  Missing DDL: {table}")
    
    # Summary
    print("\n" + "=" * 70)
    print("✅ Table Extraction Summary")
    print("=" * 70)
    print(f"\n📁 Tables by Domain:")
    for domain in sorted(tables_by_domain.keys()):
        count = len(tables_by_domain[domain])
        print(f"   - {domain}: {count} tables")
        if count <= 20:  # Show tables for domains with <= 20 tables
            for table in sorted(tables_by_domain[domain]):
                status = "✅" if table in tables_with_ddl else "⚠️"
                print(f"      {status} {table}")
    
    print(f"\n📊 Overall Statistics:")
    print(f"   Total SQL files processed: {len(sql_files)}")
    print(f"   Total unique tables: {len(all_tables)}")
    print(f"   Tables with DDL: {len(tables_with_ddl)} ({len(tables_with_ddl)/len(all_tables)*100:.1f}%)")
    print(f"   Tables missing DDL: {len(tables_without_ddl)} ({len(tables_without_ddl)/len(all_tables)*100:.1f}%)")
    
    # Export table list
    output_file = repo_root / "hf-space-inventory-sqlgen" / "data_models_tables.txt"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("# Tables referenced in Documentation/Schema/Data_Models/ SQL files\n")
        f.write("# Generated by extract_tables_from_data_models.py (using SQLGlot parser)\n")
        f.write("# Format: TABLE_NAME | Domain | DDL_Available\n\n")
        
        for table in sorted(all_tables):
            domains = [d for d, tables in tables_by_domain.items() if table in tables]
            ddl_status = "YES" if table in tables_with_ddl else "NO"
            f.write(f"{table} | {', '.join(domains)} | {ddl_status}\n")
    
    print(f"\n💾 Table list saved to: {output_file.relative_to(repo_root)}")
    
    # Generate missing table extraction command
    if tables_without_ddl:
        print(f"\n📋 Next Steps:")
        print(f"   1. Review missing DDL files (⚠️ items above)")
        print(f"   2. Extract missing tables from sql-lab-1:")
        missing_list = ','.join(f"'{t}'" for t in sorted(tables_without_ddl)[:10])
        if len(tables_without_ddl) > 10:
            missing_list += ",...'"
        print(f"      .\\Documentation\\Schema\\ddl-extract\\extract-schema.ps1 `")
        print(f"        -ServerInstance 'sql-lab-1' `")
        print(f"        -Databases 'LIVE' `")
        print(f"        -TableFilter {missing_list} `")
        print(f"        -OutputDir '.\\Documentation\\Schema\\Tables' `")
        print(f"        -UseIntegratedAuth -TrustServerCertificate")
    else:
        print(f"\n✅ All tables have DDL files!")
    
    print(f"   3. Update combined_graph_builder.py to use Data_Models table list")
    print(f"   4. Rebuild graph with subset of tables from Data_Models\n")


if __name__ == '__main__':
    main()