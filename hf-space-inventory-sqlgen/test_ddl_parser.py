"""Test the DDL parser with actual table format."""

import re
from pathlib import Path

def sanitize_node_id(node_id: str) -> str:
    """Create ArangoDB-compatible node ID."""
    sanitized = re.sub(r'[^a-zA-Z0-9_:-]', '_', node_id)
    sanitized = re.sub(r'__+', '_', sanitized)
    if sanitized and not sanitized[0].isalpha() and sanitized[0] != '_':
        sanitized = f"node_{sanitized}"
    return sanitized[:254]

def parse_table_ddl(ddl_content: str, file_path: Path) -> dict:
    """Extract table metadata from CREATE TABLE DDL - supports multiple formats."""
    
    # Try multiple CREATE TABLE patterns
    patterns = [
        # Pattern 1: [database].[schema].[table]
        r'CREATE\s+TABLE\s+\[(\w+)\]\.\[(\w+)\]\.\[(\w+)\]',
        # Pattern 2: [schema].[table] (YOUR FORMAT - most common)
        r'CREATE\s+TABLE\s+\[(\w+)\]\.\[(\w+)\]',
        # Pattern 3: database.schema.table (no brackets)
        r'CREATE\s+TABLE\s+(\w+)\.(\w+)\.(\w+)\s*\(',
        # Pattern 4: schema.table (no brackets)
        r'CREATE\s+TABLE\s+(\w+)\.(\w+)\s*\(',
        # Pattern 5: Just table name
        r'CREATE\s+TABLE\s+\[?(\w+)\]?\s*\('
    ]
    
    database = None
    schema = None
    table_name = None
    
    for i, pattern in enumerate(patterns):
        match = re.search(pattern, ddl_content, re.IGNORECASE)
        if match:
            groups = match.groups()
            if len(groups) == 3:
                database, schema, table_name = groups
            elif len(groups) == 2:
                # Pattern 2: [schema].[table] - YOUR FORMAT
                schema, table_name = groups
                database = 'Live'  # Default to Live database
            elif len(groups) == 1:
                table_name = groups[0]
                schema = 'dbo'
                database = 'Live'
            print(f"✓ Matched pattern {i+1}: {pattern[:50]}...")
            break
    
    if not table_name:
        # Fallback: use filename
        table_name = file_path.stem
        schema = 'dbo'
        database = 'Live'
        print(f"⚠️  Could not parse CREATE TABLE, using filename: {table_name}")
    
    # Extract columns
    columns = []
    column_pattern = r'\[(\w+)\]\s+((?:n?(?:var)?char|int|bigint|decimal|numeric|datetime|datetime2|date|time|bit|money|float|real|uniqueidentifier|xml|text|ntext|image|varbinary)(?:\s*\([^)]+\))?)'
    
    for match in re.finditer(column_pattern, ddl_content, re.IGNORECASE):
        col_name, col_type = match.groups()
        if col_name.upper() not in ['CONSTRAINT', 'PRIMARY', 'FOREIGN', 'REFERENCES', 'DEFAULT', 'CHECK', 'INDEX', 'KEY']:
            columns.append({
                'name': col_name,
                'type': col_type.strip()
            })
    
    # Extract primary key - FIXED: Only capture column names inside PRIMARY KEY (...)
    pk_match = re.search(
        r'PRIMARY\s+KEY\s+(?:CLUSTERED|NONCLUSTERED)?\s*\(([^\)]+)\)',
        ddl_content,
        re.IGNORECASE
    )
    
    primary_key = []
    if pk_match:
        # Extract just the columns inside the parentheses
        pk_cols_section = pk_match.group(1)
        # Find all bracketed column names: [COL1], [COL2], etc.
        pk_cols = re.findall(r'\[(\w+)\]', pk_cols_section)
        primary_key = pk_cols
    
    # Extract foreign keys - FINAL FIX: Remove brackets from ref_cols extraction
    foreign_keys = []
    fk_pattern = r'FOREIGN\s+KEY\s*\(([^\)]+)\)\s+REFERENCES\s+\[?(\w+)\]?\.\[?(\w+)\]?\s*\(([^\)]+)\)'
    
    for match in re.finditer(fk_pattern, ddl_content, re.IGNORECASE):
        fk_cols_raw, ref_schema, ref_table, ref_cols_raw = match.groups()
        
        # Clean up brackets and whitespace from column names
        # Extract words (column names) and filter out empty strings
        fk_cols = [c for c in re.findall(r'\w+', fk_cols_raw) if c]
        ref_cols = [c for c in re.findall(r'\w+', ref_cols_raw) if c]  # Changed: use \w+ pattern
        
        ref_table_full = f"{ref_schema}.{ref_table}"
        
        foreign_keys.append({
            'columns': fk_cols,
            'ref_table': ref_table_full,
            'ref_columns': ref_cols
        })
    
    return {
        'table_name': table_name,
        'schema': f"{database}.{schema}",
        'full_name': f"{schema}.{table_name}",
        'columns': columns,
        'primary_key': primary_key,
        'foreign_keys': foreign_keys,
        'ddl_file': str(file_path.name)
    }


# Test with actual DDL content
test_ddl = """
CREATE TABLE [dbo].[ACCOUNT_AT_NATIVE] (
    [ROWID] int IDENTITY(1,1) DEFAULT  NOT NULL,
    [ACCOUNT_ID] NVARCHAR(30) DEFAULT  NOT NULL,
    [SITE_ID] NVARCHAR(15) DEFAULT  NOT NULL,
    [ACCT_YEAR] DECIMAL(4,0) DEFAULT  NOT NULL,
    [ACCT_PERIOD] DECIMAL(2,0) DEFAULT  NOT NULL,
    [DEBIT_AMOUNT] DECIMAL(23,8) DEFAULT ((0)) NOT NULL,
    [CREDIT_AMOUNT] DECIMAL(23,8) DEFAULT ((0)) NOT NULL,
    [CURRENCY_ID] NVARCHAR(15) DEFAULT  NOT NULL
)

ALTER TABLE [dbo].[ACCOUNT_AT_NATIVE] ADD CONSTRAINT [PK_ACCT_NTV] PRIMARY KEY ([ACCOUNT_ID], [SITE_ID], [ACCT_YEAR], [ACCT_PERIOD], [CURRENCY_ID]);

ALTER TABLE [dbo].[ACCOUNT_AT_NATIVE] ADD CONSTRAINT [FKEY9409] FOREIGN KEY ([CURRENCY_ID]) REFERENCES [dbo].[CURRENCY]([ID]);
"""

print("Testing DDL Parser")
print("=" * 70)

result = parse_table_ddl(test_ddl, Path("ACCOUNT_AT_NATIVE.sql"))

print("\n📊 Parsed Result:")
print(f"   Table: {result['full_name']}")
print(f"   Schema: {result['schema']}")
print(f"   Columns: {len(result['columns'])}")
for col in result['columns']:
    print(f"      - {col['name']}: {col['type']}")

print(f"\n   Primary Key: {result['primary_key']}")

print(f"\n   Foreign Keys: {len(result['foreign_keys'])}")
for fk in result['foreign_keys']:
    print(f"      - {fk['columns']} → {fk['ref_table']}.{fk['ref_columns']}")

print("\n" + "=" * 70)
print("✅ Parser test complete!")