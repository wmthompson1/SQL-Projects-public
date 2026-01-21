"""
Build complete ground truth graph combining:
1. Schema graph (DDL-based table→table foreign key relationships from Documentation/Schema/Tables)
2. Perspective-Intent graph (SQL query templates from hf-space ground truth)

Integrates with existing ground_truth_integration.py for query parsing.
"""

import os
import re
import pickle
import json
from pathlib import Path
from typing import Set, Dict, List, Tuple
import networkx as nx

# Import existing query manager
from ground_truth_integration import GroundTruthQueryManager


# ============================================================================
# Part 1: Schema Graph from DDL (Documentation/Schema/Tables/)
# ============================================================================

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
    
    # Extract foreign keys - FINAL FIX
    foreign_keys = []
    fk_pattern = r'FOREIGN\s+KEY\s*\(([^\)]+)\)\s+REFERENCES\s+\[?(\w+)\]?\.\[?(\w+)\]?\s*\(([^\)]+)\)'
    
    for match in re.finditer(fk_pattern, ddl_content, re.IGNORECASE):
        fk_cols_raw, ref_schema, ref_table, ref_cols_raw = match.groups()
        
        # Clean up - extract words only (no brackets)
        fk_cols = [c for c in re.findall(r'\w+', fk_cols_raw) if c]
        ref_cols = [c for c in re.findall(r'\w+', ref_cols_raw) if c]  # ✅ FIXED
        
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


def build_schema_graph_from_ddl(ddl_dir: Path, filter_tables: Set[str] = None) -> nx.DiGraph:
    """Build schema graph from DDL files in Documentation/Schema/Tables/."""
    G = nx.DiGraph()
    
    table_count = 0
    fk_count = 0
    
    print("\n📊 Building Schema Graph from DDL...")
    
    if not ddl_dir.exists():
        print(f"⚠️  DDL directory not found: {ddl_dir}")
        print(f"   Expected: Documentation/Schema/Tables/")
        return G
    
    print(f"   Scanning DDL files in: {ddl_dir}")
    
    # Scan all .sql files in Tables directory
    for ddl_file in ddl_dir.glob("*.sql"):
        try:
            with open(ddl_file, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
        except Exception as e:
            print(f"⚠️  Could not read {ddl_file}: {e}")
            continue
        
        table_info = parse_table_ddl(content, ddl_file)
        if not table_info:
            continue
        
        # Filter by table list if provided
        if filter_tables and table_info['table_name'].upper() not in filter_tables:
            print(f"   ➡️  Skipping table not in filter list: {table_info['table_name']}")
            continue
        
        # Create table node with sanitized ID
        table_id = sanitize_node_id(f"table:{table_info['full_name']}")
        
        G.add_node(
            table_id,
            type='table',
            schema=table_info['schema'],
            name=table_info['table_name'],
            full_name=table_info['full_name'],
            columns=table_info['columns'],
            primary_key=table_info['primary_key'],
            column_count=len(table_info['columns']),
            source='ddl',
            original_id=f"table:{table_info['full_name']}"  # Preserve original for queries
        )
        
        # Add foreign key edges
        for fk in table_info['foreign_keys']:
            ref_table_id = sanitize_node_id(f"table:{fk['ref_table']}")
            
            if not G.has_node(ref_table_id):
                ref_schema, ref_name = fk['ref_table'].split('.')
                # Infer database from schema
                database = 'Live' if ref_schema == 'dbo' else 'LIVEAccounting'
                G.add_node(
                    ref_table_id,
                    type='table',
                    schema=f"{database}.{ref_schema}",
                    name=ref_name,
                    full_name=fk['ref_table'],
                    columns=[],
                    primary_key=[],
                    column_count=0,
                    source='reference',
                    original_id=f"table:{fk['ref_table']}"
                )
            
            G.add_edge(
                table_id,
                ref_table_id,
                relationship='foreign_key',
                fk_columns=fk['columns'],
                ref_columns=fk['ref_columns']
            )
            fk_count += 1
        
        table_count += 1
        if table_count % 50 == 0:
            print(f"   Processed {table_count} tables...")
    
    print(f"   ✅ Schema graph: {table_count} tables, {fk_count} foreign keys")
    return G


# ============================================================================
# Part 2: Perspective-Intent Graph from Ground Truth Queries
# ============================================================================

def extract_tables_from_sql(sql_content: str) -> Set[str]:
    """Extract table references from SQL query - supports multiple formats."""
    tables = set()
    
    # Pattern 1: FROM/JOIN Live.dbo.TABLE or LIVE.dbo.TABLE
    pattern1 = r'\b(?:FROM|JOIN)\s+(?:Live|LIVE|LIVEAccounting)\.dbo\.([A-Z_][A-Z0-9_]*)\b'
    tables.update(re.findall(pattern1, sql_content, re.IGNORECASE))
    
    # Pattern 2: FROM/JOIN [Live].[dbo].[TABLE]
    pattern2 = r'\b(?:FROM|JOIN)\s+\[?(?:Live|LIVE|LIVEAccounting)\]?\.\[?dbo\]?\.\[?([A-Z_][A-Z0-9_]*)\]?'
    tables.update(re.findall(pattern2, sql_content, re.IGNORECASE))
    
    # Pattern 3: FROM/JOIN dbo.TABLE (assume Live if unqualified)
    pattern3 = r'\b(?:FROM|JOIN)\s+dbo\.([A-Z_][A-Z0-9_]*)\b'
    tables.update(re.findall(pattern3, sql_content, re.IGNORECASE))
    
    # Pattern 4: FROM/JOIN [dbo].[TABLE]
    pattern4 = r'\b(?:FROM|JOIN)\s+\[dbo\]\.\[([A-Z_][A-Z0-9_]*)\]'
    tables.update(re.findall(pattern4, sql_content, re.IGNORECASE))
    
    # Pattern 5: Inside subqueries/CTEs (scan entire content for table names)
    # Look for dbo.TABLENAME anywhere (not just after FROM/JOIN)
    pattern5 = r'\bdbo\.([A-Z_][A-Z0-9_]{2,})\b'  # Min 3 chars to avoid false positives
    tables.update(re.findall(pattern5, sql_content, re.IGNORECASE))
    
    return {t.upper() for t in tables}


def infer_perspective_from_category(category: str, query_name: str) -> str:
    category_lower = category.lower()
    query_lower = query_name.lower()
    
    # Map categories to perspectives
    if 'finance' in category_lower or 'payable' in category_lower or 'invoice' in query_lower:
        return 'Finance'
    elif 'manufacturing' in category_lower or 'work order' in query_lower or 'operation' in query_lower:
        return 'Manufacturing'
    elif 'inventory' in category_lower or 'stock' in query_lower:
        return 'Inventory'
    elif 'shipping' in category_lower or 'ship' in query_lower:
        return 'Shipping'
    elif 'purchasing' in category_lower or 'receiver' in query_lower or 'po' in query_lower:
        return 'Purchasing'
    elif 'quality' in category_lower or 'inspection' in query_lower:
        return 'Quality'
    elif 'sales' in category_lower or 'customer' in query_lower:
        return 'Sales'
    else:
        return 'General'


def build_perspective_intent_graph(hf_space_dir: Path) -> nx.DiGraph:
    """Build perspective→intent→query graph from ground truth SQL queries."""
    G = nx.DiGraph()
    
    queries_file = hf_space_dir / "ground_truth_queries.sql"
    
    if not queries_file.exists():
        print(f"⚠️  Ground truth queries file not found: {queries_file}")
        print(f"   Trying schema/queries/ directory...")
        
        # Fallback: try schema/queries directory
        queries_dir = hf_space_dir / "schema" / "queries"
        if queries_dir.exists():
            return build_from_query_directory(queries_dir)
        
        return G
    
    print("\n📊 Building Perspective-Intent Graph from Ground Truth Queries...")
    
    # Load queries using existing manager
    try:
        manager = GroundTruthQueryManager(str(queries_file))
        all_queries = manager.get_all_queries()
    except Exception as e:
        print(f"⚠️  Error loading queries: {e}")
        return G
    
    query_count = 0
    perspective_set = set()
    intent_set = set()
    
    for query_name, query_data in all_queries.items():
        # Infer perspective from category
        perspective = infer_perspective_from_category(
            query_data.get('category', ''),
            query_name
        )
        perspective_id = sanitize_node_id(f"perspective:{perspective}")
        
        # Use natural language query as intent
        intent = query_name
        intent_id = sanitize_node_id(f"intent:{intent}")
        
        # Create query ID
        query_id = sanitize_node_id(f"query:{query_name}")
        
        # Extract tables from SQL
        tables = extract_tables_from_sql(query_data['sql'])
        
        # Create perspective node
        if not G.has_node(perspective_id):
            G.add_node(
                perspective_id,
                type='perspective',
                name=perspective,
                role=query_data.get('category', 'General'),
                original_id=f"perspective:{perspective}"
            )
            perspective_set.add(perspective)
        
        # Create intent node
        if not G.has_node(intent_id):
            G.add_node(
                intent_id,
                type='intent',
                name=intent,
                category=query_data.get('category', ''),
                description=intent,
                original_id=f"intent:{intent}"
            )
            intent_set.add(intent)
        
        # Create query node
        G.add_node(
            query_id,
            type='query',
            name=query_name,
            sql=query_data['sql'],
            category=query_data.get('category', ''),
            tables=list(tables),
            source='ground_truth',
            original_id=f"query:{query_name}"
        )
        
        # Create edges: perspective → intent → query
        G.add_edge(perspective_id, intent_id, relationship='has_intent')
        G.add_edge(intent_id, query_id, relationship='implements')
        
        # Link query to tables
        for table_name in tables:
            table_id = sanitize_node_id(f"table:dbo_{table_name}")
            if not G.has_node(table_id):
                # Create stub table node (will be merged with schema graph)
                G.add_node(
                    table_id,
                    type='table',
                    name=table_name,
                    full_name=f"dbo.{table_name}",
                    source='query_inference',
                    original_id=f"table:dbo.{table_name}"
                )
            
            G.add_edge(query_id, table_id, relationship='uses_table')
        
        query_count += 1
    
    print(f"   ✅ Perspective-Intent graph: {len(perspective_set)} perspectives, {len(intent_set)} intents, {query_count} queries")
    return G


def build_from_query_directory(queries_dir: Path) -> nx.DiGraph:
    """Build graph from individual .sql files in schema/queries/ directory."""
    G = nx.DiGraph()
    
    print(f"\n📊 Building graph from query directory: {queries_dir}")
    
    query_count = 0
    perspective_set = set()
    intent_set = set()
    
    for sql_file in queries_dir.glob("*.sql"):
        if sql_file.name in ['schema_sqlite.sql', 'all_queries.sql']:  # Skip meta files
            continue
        
        try:
            with open(sql_file, 'r', encoding='utf-8', errors='ignore') as f:
                sql_content = f.read()
        except Exception as e:
            print(f"⚠️  Could not read {sql_file}: {e}")
            continue
        
        # Parse query metadata from filename and content
        query_name = sql_file.stem.replace('_', ' ').title()
        
        # Try to extract category from directory structure or comments
        category_match = re.search(r'--\s*Category:\s*(.+)', sql_content, re.IGNORECASE)
        category = category_match.group(1).strip() if category_match else 'General'
        
        # Infer perspective
        perspective = infer_perspective_from_category(category, query_name)
        perspective_id = sanitize_node_id(f"perspective:{perspective}")
        
        # Create intent from query name
        intent = query_name
        intent_id = sanitize_node_id(f"intent:{intent}")
        
        # Create query ID
        query_id = sanitize_node_id(f"query:{query_name}")
        
        # Extract tables from SQL
        tables = extract_tables_from_sql(sql_content)
        
        # Create perspective node
        if not G.has_node(perspective_id):
            G.add_node(
                perspective_id,
                type='perspective',
                name=perspective,
                role=category,
                original_id=f"perspective:{perspective}"
            )
            perspective_set.add(perspective)
        
        # Create intent node
        if not G.has_node(intent_id):
            G.add_node(
                intent_id,
                type='intent',
                name=intent,
                category=category,
                description=intent,
                original_id=f"intent:{intent}"
            )
            intent_set.add(intent)
        
        # Create query node
        G.add_node(
            query_id,
            type='query',
            name=query_name,
            sql=sql_content,
            category=category,
            tables=list(tables),
            source='ground_truth',
            file=str(sql_file.name),
            original_id=f"query:{query_name}"
        )
        
        # Create edges
        G.add_edge(perspective_id, intent_id, relationship='has_intent')
        G.add_edge(intent_id, query_id, relationship='implements')
        
        # Link query to tables
        for table_name in tables:
            table_id = sanitize_node_id(f"table:dbo_{table_name}")
            if not G.has_node(table_id):
                G.add_node(
                    table_id,
                    type='table',
                    name=table_name,
                    full_name=f"dbo.{table_name}",
                    source='query_inference',
                    original_id=f"table:dbo.{table_name}"
                )
            
            G.add_edge(query_id, table_id, relationship='uses_table')
        
        query_count += 1
    
    print(f"   ✅ Built graph from {query_count} query files")
    print(f"      - {len(perspective_set)} perspectives")
    print(f"      - {len(intent_set)} intents")
    
    return G


# ============================================================================
# Part 3: Merge Schema + Perspective-Intent Graphs
# ============================================================================

def merge_graphs(schema_graph: nx.DiGraph, perspective_graph: nx.DiGraph) -> nx.DiGraph:
    """Merge schema graph and perspective-intent graph into unified ground truth."""
    print("\n🔗 Merging schema and perspective-intent graphs...")
    
    # Start with schema graph (has authoritative table definitions)
    G = schema_graph.copy()
    
    # Add all nodes from perspective graph
    for node, data in perspective_graph.nodes(data=True):
        if node.startswith('table'):
            # Table node: try to merge with existing schema table
            # Match by table name, not full node ID
            table_name = data.get('name', '')
            matched = False
            
            for existing_node, existing_data in list(G.nodes(data=True)):
                if existing_data.get('type') == 'table' and existing_data.get('name') == table_name:
                    # Update existing table with query usage metadata
                    G.nodes[existing_node]['used_in_queries'] = True
                    G.nodes[existing_node]['query_count'] = G.nodes[existing_node].get('query_count', 0) + 1
                    matched = True
                    break
            
            if not matched:
                # Add new table node from perspective graph
                G.add_node(node, **data)
        else:
            # Non-table node (perspective/intent/query): add directly
            G.add_node(node, **data)
    
    # Add all edges from perspective graph
    for u, v, data in perspective_graph.edges(data=True):
        G.add_edge(u, v, **data)
    
    # Statistics
    tables = [n for n, d in G.nodes(data=True) if d.get('type') == 'table']
    perspectives = [n for n, d in G.nodes(data=True) if d.get('type') == 'perspective']
    intents = [n for n, d in G.nodes(data=True) if d.get('type') == 'intent']
    queries = [n for n, d in G.nodes(data=True) if d.get('type') == 'query']
    
    print(f"   ✅ Combined graph:")
    print(f"      - {len(tables)} tables")
    print(f"      - {len(perspectives)} perspectives")
    print(f"      - {len(intents)} intents")
    print(f"      - {len(queries)} query templates")
    print(f"      - {G.number_of_edges()} total edges")
    
    return G


def print_combined_stats(G: nx.DiGraph):
    """Print detailed statistics about combined graph."""
    print("\n📊 Complete Ground Truth Graph Statistics:")
    
    # Count by node type
    node_types = {}
    for n, d in G.nodes(data=True):
        node_type = d.get('type', 'unknown')
        node_types[node_type] = node_types.get(node_type, 0) + 1
    
    print("\n   Node Types:")
    for node_type, count in sorted(node_types.items()):
        print(f"   - {node_type}: {count}")
    
    # Count by edge type
    edge_types = {}
    for u, v, d in G.edges(data=True):
        edge_type = d.get('relationship', 'unknown')
        edge_types[edge_type] = edge_types.get(edge_type, 0) + 1
    
    print("\n   Edge Types:")
    for edge_type, count in sorted(edge_types.items()):
        print(f"   - {edge_type}: {count}")
    
    # Find most-used tables (by query references)
    table_usage = {}
    for n, d in G.nodes(data=True):
        if d.get('type') == 'table':
            # Count incoming edges from queries
            query_refs = sum(1 for u in G.predecessors(n) 
                           if G.nodes[u].get('type') == 'query')
            if query_refs > 0:
                table_usage[n] = query_refs
    
    if table_usage:
        print("\n   Top 10 Tables by Query Usage:")
        for table_id, count in sorted(table_usage.items(), key=lambda x: x[1], reverse=True)[:10]:
            table_name = G.nodes[table_id].get('name', table_id.split(':')[-1])
            print(f"   - {table_name}: {count} queries")
    
    # Find perspectives with most intents
    perspective_intents = {}
    for n, d in G.nodes(data=True):
        if d.get('type') == 'perspective':
            intent_count = sum(1 for _ in G.successors(n))
            perspective_intents[n] = intent_count
    
    if perspective_intents:
        print("\n   Perspectives by Intent Count:")
        for persp_id, count in sorted(perspective_intents.items(), key=lambda x: x[1], reverse=True):
            persp_name = G.nodes[persp_id].get('name', persp_id.split(':')[-1])
            print(f"   - {persp_name}: {count} intents")


def sanitize_node_id(node_id: str) -> str:
    """Create ArangoDB-compatible node ID.
    
    ArangoDB _key constraints:
    - Pattern: ^[a-zA-Z0-9_:-]+$
    - No spaces, periods (except in specific positions), or special chars
    - Max length: 254 bytes
    """
    # Replace invalid chars with underscores
    sanitized = re.sub(r'[^a-zA-Z0-9_:-]', '_', node_id)
    # Remove consecutive underscores
    sanitized = re.sub(r'__+', '_', sanitized)
    # Ensure starts with letter/underscore
    if sanitized and not sanitized[0].isalpha() and sanitized[0] != '_':
        sanitized = f"node_{sanitized}"
    return sanitized[:254]  # Max length


def load_data_models_table_index(hf_space_dir: Path) -> Set[str]:
    """Load table index from JSON (generated by generate_data_models_table_index.py)."""
    index_file = hf_space_dir / "data_models_table_index.json"
    
    if not index_file.exists():
        print(f"⚠️  Data Models table index not found: {index_file}")
        print(f"   Run: python scripts/generate_data_models_table_index.py")
        return None
    
    with open(index_file, 'r', encoding='utf-8') as f:
        index_data = json.load(f)
    
    tables = set(index_data['tables'])
    print(f"✅ Loaded {len(tables)} tables from Data_Models index")
    return tables


def main():
    """Build and save complete ground truth graph."""
    # Paths
    hf_space_dir = Path(__file__).parent  # This script lives in hf-space-inventory-sqlgen/
    repo_root = hf_space_dir.parent  # Parent directory is SQL-Projects/
    ddl_dir = repo_root / "Documentation" / "Schema" / "Tables"  # ✅ CORRECTED PATH
    output_file = hf_space_dir / "manufacturing_ground_truth_graph.gpickle"
    
    print("=" * 70)
    print("Building Complete Manufacturing Ground Truth Graph")
    print("=" * 70)
    print(f"\n📂 HF Space directory: {hf_space_dir}")
    print(f"\n📂 Repository root: {repo_root}")
    print(f"📂 DDL directory: {ddl_dir}")
    
    # Step 1: Build schema graph from DDL (Documentation/Schema/Tables/)
    schema_graph = build_schema_graph_from_ddl(ddl_dir)
    
    # Step 2: Build perspective-intent graph from HF Space ground truth
    perspective_graph = build_perspective_intent_graph(hf_space_dir)
    
    # Step 3: Merge graphs
    combined_graph = merge_graphs(schema_graph, perspective_graph)
    
    # Step 4: Print statistics
    print_combined_stats(combined_graph)
    
    # Step 5: Save to file
    with open(output_file, 'wb') as f:
        pickle.dump(combined_graph, f)
    
    print(f"\n💾 Saved combined graph to: {output_file}")
    print(f"   File size: {output_file.stat().st_size / 1024:.1f} KB")
    
    print(f"\n📤 To upload to ArangoDB from repo root, run:")
    print(f"   python scripts\\nx_to_arango.py --graph-file hf-space-inventory-sqlgen\\manufacturing_ground_truth_graph.gpickle --update-ground-truth")
    
    print("\n" + "=" * 70)
    print("Ground Truth Graph Build Complete!")
    print("=" * 70)


def main_data_models():
    """Build ground truth graph using Data_Models table subset."""
    hf_space_dir = Path(__file__).parent
    repo_root = hf_space_dir.parent
    
    ddl_dir = repo_root / "Documentation" / "Schema" / "Tables"
    output_file = hf_space_dir / "manufacturing_ground_truth_graph.gpickle"
    
    print("=" * 70)
    print("Building Ground Truth Graph from Data_Models Tables")
    print("=" * 70)
    
    # Load curated table list from Data_Models
    data_models_tables = load_data_models_table_index(hf_space_dir)
    
    if not data_models_tables:
        print("\n⚠️  No Data_Models index found! Falling back to all tables...")
        data_models_tables = None  # Build full schema
    
    # Build schema graph (filtered to Data_Models tables)
    schema_graph = build_schema_graph_from_ddl(ddl_dir, filter_tables=data_models_tables)
    
    # Build perspective-intent graph
    perspective_graph = build_perspective_intent_graph(hf_space_dir)
    
    # Merge and save
    combined_graph = merge_graphs(schema_graph, perspective_graph)
    print_combined_stats(combined_graph)
    
    with open(output_file, 'wb') as f:
        pickle.dump(combined_graph, f)
    print(f"\n💾 Saved graph: {output_file.relative_to(repo_root)}")


if __name__ == '__main__':
    main()
    # main_data_models()  # Uncomment to run data models subset build