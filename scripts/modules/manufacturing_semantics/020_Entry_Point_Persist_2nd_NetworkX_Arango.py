"""
020_Entry_Point_Persist_2nd_NetworkX_Arango.py

Second Pass: Load Manufacturing Schema from PostgreSQL → NetworkX → ArangoDB
Simple, focused pattern for persisting schema graphs.

Workflow:
1. Load schema_nodes and schema_edges from PostgreSQL database
2. Create NetworkX graph with proper node metadata
3. Persist to ArangoDB with metadata preservation
"""

import sys
import os
import networkx as nx
import sqlite3

# Ensure local module path is importable when executed from repo root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.insert(0, SCRIPT_DIR)

import os

print("=" * 75)
print("NetworkX over ArangoDB - Second Pass")
print("Load Schema from PostgreSQL → Persist to ArangoDB")
print("=" * 75)

# Step 1: Connect to PostgreSQL database
print("\n📊 Step 1: Load schema from PostgreSQL database")
print("-" * 75)

TEST_MODE = os.getenv("TEST_MODE", "0").lower() in ("1", "true", "yes")
SQLITE_PATH = os.getenv("SQLITE_PATH", "hf-space-inventory-sqlgen/app_schema/manufacturing.db")

nodes = []
edges = []

if TEST_MODE:
    print(f"⚠️  TEST_MODE enabled — loading schema from SQLite at {SQLITE_PATH} (dry-run)")
    if not os.path.exists(SQLITE_PATH):
        print("❌ SQLite DB not found at", SQLITE_PATH)
        exit(1)
    conn = sqlite3.connect(SQLITE_PATH)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='schema_nodes'")
    if cursor.fetchone():
        cursor.execute('SELECT * FROM schema_nodes ORDER BY table_name')
        nodes = [dict(r) for r in cursor.fetchall()]
        print(f"✅ Loaded {len(nodes)} nodes from schema_nodes table:")
        for node in nodes:
            print(f"   • {node.get('table_name')} ({node.get('table_type')}): {node.get('description')}")
    else:
        print("⚠️  schema_nodes not found; will infer nodes from edges")

    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='schema_edges'")
    if cursor.fetchone():
        cursor.execute('SELECT * FROM schema_edges ORDER BY edge_id')
        edges = [dict(r) for r in cursor.fetchall()]
        print(f"\n✅ Loaded {len(edges)} edges from schema_edges table:")
        for edge in edges:
            print(f"   • {edge.get('from_table')} → {edge.get('to_table')} ({edge.get('relationship_type','N/A')})")
    else:
        print('❌ schema_edges table not found in SQLite')
        exit(1)

    cursor.close()
    conn.close()
else:
    DATABASE_URL = os.getenv("DATABASE_URL")
    if not DATABASE_URL:
        print("❌ DATABASE_URL not found and TEST_MODE not enabled")
        exit(1)

    conn = psycopg2.connect(DATABASE_URL)
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    # Load nodes
    cursor.execute("SELECT * FROM schema_nodes ORDER BY table_name")
    nodes = cursor.fetchall()
    print(f"✅ Loaded {len(nodes)} nodes from schema_nodes table:")
    for node in nodes:
        print(f"   • {node['table_name']} ({node['table_type']}): {node['description']}")

    # Load edges
    cursor.execute("SELECT * FROM schema_edges ORDER BY edge_id")
    edges = cursor.fetchall()
    print(f"\n✅ Loaded {len(edges)} edges from schema_edges table:")
    for edge in edges:
        print(f"   • {edge['from_table']} → {edge['to_table']} ({edge['relationship_type']})")

    cursor.close()
    conn.close()

# Step 2: Build NetworkX graph with metadata
print("\n📊 Step 2: Build NetworkX graph with metadata")
print("-" * 75)

G = nx.DiGraph()

# Add nodes with metadata preservation
for node in nodes:
    G.add_node(
        node['table_name'],
        label=node['table_name'],  # Preserve original name as label
        table_type=node['table_type'],
        description=node['description'],
        node_type='schema_table'
    )

# Add edges with enhanced metadata preservation
for edge in edges:
    G.add_edge(
        edge['from_table'],
        edge['to_table'],
        relationship_type=edge['relationship_type'],
        join_column=edge['join_column'],
        weight=edge['weight'],
        # Enhanced metadata for semantic layer
        join_column_description=edge.get('join_column_description'),
        natural_language_alias=edge.get('natural_language_alias'),
        few_shot_example=edge.get('few_shot_example'),
        context=edge.get('context')
    )

print(f"✅ NetworkX graph created:")
print(f"   Nodes: {G.number_of_nodes()}")
print(f"   Edges: {G.number_of_edges()}")
print(f"\n   Node details:")
for node, data in G.nodes(data=True):
    label = data.get('label', node)
    table_type = data.get('table_type', 'inferred')
    print(f"   • {node}: label={label}, type={table_type}")

# Step 3: Persist to ArangoDB
print("\n📊 Step 3: Persist to ArangoDB")
print("-" * 75)

graph_name = "manufacturing_schema"
print(f"\n📤 Persisting graph '{graph_name}' to ArangoDB...")

# Respect SKIP_PERSIST env var to allow safe dry-runs without contacting Arango
skip_persist = os.getenv("SKIP_PERSIST", "0").lower() in ("1", "true", "yes")
# If TEST_MODE is enabled, force skip_persist to avoid any ArangoDB activity
if TEST_MODE and not skip_persist:
    print("⚠️  TEST_MODE enabled — forcing SKIP_PERSIST to avoid contacting ArangoDB")
    skip_persist = True

if skip_persist:
    print("⚠️  SKIP_PERSIST enabled — skipping ArangoDB persistence (dry-run)")
    # Print a concise dry-run summary and exit gracefully before attempting imports
    print("\nDry-run summary:")
    print(f"  • Nodes built: {G.number_of_nodes()}")
    print(f"  • Edges built: {G.number_of_edges()}")
    print("\nNo changes were made to ArangoDB. Exiting (dry-run).")
    sys.exit(0)
else:
    # Import the Arango persistence helper only when we're actually persisting
    from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence

    config = ArangoDBConfig()
    persistence = ArangoDBGraphPersistence(config)

    print(f"   Database: {config.database_name}")
    print(f"   Host: {config.host}")

    adb_graph = persistence.persist_graph(
        graph=G,
        name=graph_name,
        overwrite=True
    )

    print(f"✅ Graph '{graph_name}' persisted successfully!")
    print(f"   All node metadata preserved (labels, types, descriptions)")
    print(f"   All edge metadata preserved (relationships, join columns, weights)")
    print(f"   Enhanced metadata preserved (aliases, descriptions, few-shot examples, context)")

print("\n" + "=" * 75)
print("✅ Complete: PostgreSQL → NetworkX → ArangoDB")
print("=" * 75)
print(f"""
Summary:
• Loaded {len(nodes)} schema nodes from PostgreSQL
• Loaded {len(edges)} schema edges from PostgreSQL
• Created NetworkX graph with full metadata
• Persisted to ArangoDB as '{graph_name}'

Next: Run 020_Entry_Point_Persist_3rd_NetworkX_Arango.py to restore
""")
print("=" * 75)
