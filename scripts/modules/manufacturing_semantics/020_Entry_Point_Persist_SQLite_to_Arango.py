#!/usr/bin/env python3
"""
020_Entry_Point_Persist_SQLite_to_Arango.py

Safe SQLite-to-ArangoDB Schema Graph Persistence
=================================================

Loads manufacturing schema from SQLite database and safely persists to ArangoDB
with comprehensive safety checks to prevent accidental data loss.

Safety Features:
- Detects existing graphs before overwriting
- Requires explicit confirmation to delete existing graphs
- Allows alternative graph names to avoid conflicts
- Sets overwrite=False by default unless explicitly confirmed
- Handles empty schema_nodes table by inferring from edges

Workflow:
1. Load schema_nodes and schema_edges from SQLite database
2. Build NetworkX graph with proper node metadata
3. Check for existing graph in ArangoDB
4. Prompt user with safety options if graph exists
5. Persist to ArangoDB with metadata preservation

Usage:
    python 020_Entry_Point_Persist_SQLite_to_Arango.py
    python 020_Entry_Point_Persist_SQLite_to_Arango.py --graph-name my_schema
    python 020_Entry_Point_Persist_SQLite_to_Arango.py --force-overwrite
"""

import sys
import os
import sqlite3
import networkx as nx
import argparse
import argparse
from typing import Optional, Tuple, Dict, List

# Ensure local module path is importable when executed from repo root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.insert(0, SCRIPT_DIR)

# Arango persistence helper will be imported only when needed (avoid requiring Arango libs for dry-runs)

# Default paths
DEFAULT_SQLITE_PATH = os.getenv(
    "SQLITE_PATH",
    "hf-space-inventory-sqlgen/app_schema/manufacturing.db"
)

# Test mode flags (use environment variables)
TEST_MODE = os.getenv('TEST_MODE', '0').lower() in ('1', 'true', 'yes')
SKIP_PERSIST = os.getenv('SKIP_PERSIST', '0').lower() in ('1', 'true', 'yes')

if TEST_MODE:
    print("🧪 TEST MODE ENABLED - Using SQLite data only")
if SKIP_PERSIST:
    print("⏭️  SKIP_PERSIST ENABLED - Will not contact ArangoDB (dry-run)")


def check_graph_exists(persistence, graph_name: str) -> bool:
    """
    Check if a graph already exists in ArangoDB.
    
    Args:
        persistence: ArangoDBGraphPersistence instance
        graph_name: Name of the graph to check
    
    Returns:
        True if graph exists, False otherwise
    """
    try:
        from arango import ArangoClient
        
        client = ArangoClient(hosts=persistence.config.host)
        db = client.db(
            persistence.config.database_name,
            username=persistence.config.username,
            password=persistence.config.password
        )
        
        # Check if the graph collections exist
        collections = db.collections()
        node_collection = f"{graph_name}_N"
        edge_collection = f"{graph_name}_E"
        
        collection_names = [col['name'] for col in collections]
        return node_collection in collection_names or edge_collection in collection_names
        
    except Exception as e:
        print(f"⚠️  Could not check for existing graph: {e}")
        return False


def prompt_user_for_action(graph_name: str) -> Tuple[str, Optional[str]]:
    """
    Prompt user for action when graph already exists.
    
    Returns:
        Tuple of (action, new_graph_name)
        action can be: 'overwrite', 'rename', 'cancel'
    """
    print(f"\n{'=' * 75}")
    print(f"⚠️  WARNING: Graph '{graph_name}' already exists in ArangoDB!")
    print(f"{'=' * 75}")
    print("\nWhat would you like to do?")
    print("  1. Overwrite the existing graph (requires typing 'DELETE {}')")
    print("  2. Create with a different name")
    print("  3. Cancel operation")
    print()
    
    while True:
        choice = input("Enter your choice (1/2/3): ").strip()
        
        if choice == '1':
            print(f"\n⚠️  You are about to DELETE the existing graph '{graph_name}'")
            print("This action cannot be undone!")
            confirmation = input(f"Type 'DELETE {graph_name}' to confirm: ").strip()
            
            if confirmation == f"DELETE {graph_name}":
                print("✅ Overwrite confirmed")
                return ('overwrite', None)
            else:
                print("❌ Confirmation failed. Operation cancelled.")
                return ('cancel', None)
        
        elif choice == '2':
            new_name = input(f"Enter new graph name (current: {graph_name}): ").strip()
            if new_name and new_name != graph_name:
                print(f"✅ Will create new graph: {new_name}")
                return ('rename', new_name)
            else:
                print("❌ Invalid name. Please try again.")
        
        elif choice == '3':
            print("❌ Operation cancelled by user")
            return ('cancel', None)
        
        else:
            print("❌ Invalid choice. Please enter 1, 2, or 3.")


def load_schema_from_sqlite(db_path: str) -> Tuple[List[Dict], List[Dict]]:
    """
    Load schema nodes and edges from SQLite database.
    
    Args:
        db_path: Path to SQLite database file
    
    Returns:
        Tuple of (nodes, edges) as lists of dictionaries
    """
    if not os.path.exists(db_path):
        raise FileNotFoundError(f"SQLite database not found: {db_path}")
    
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row  # Return rows as dictionaries
    cursor = conn.cursor()
    
    # Load nodes
    try:
        cursor.execute("SELECT * FROM schema_nodes ORDER BY table_name")
        nodes = [dict(row) for row in cursor.fetchall()]
    except sqlite3.OperationalError:
        print("⚠️  schema_nodes table not found, will infer nodes from edges")
        nodes = []
    
    # Load edges
    try:
        cursor.execute("SELECT * FROM schema_edges ORDER BY edge_id")
        edges = [dict(row) for row in cursor.fetchall()]
    except sqlite3.OperationalError:
        print("❌ schema_edges table not found")
        edges = []
    
    conn.close()
    
    return nodes, edges


def infer_nodes_from_edges(edges: List[Dict]) -> List[Dict]:
    """
    Infer node list from edges when schema_nodes table is empty.
    
    Args:
        edges: List of edge dictionaries
    
    Returns:
        List of node dictionaries with inferred metadata
    """
    node_names = set()
    for edge in edges:
        node_names.add(edge['from_table'])
        node_names.add(edge['to_table'])
    
    nodes = []
    for name in sorted(node_names):
        nodes.append({
            'table_name': name,
            'table_type': 'fact',  # Default type
            'description': f'Table {name} (inferred from edges)'
        })
    
    return nodes


def build_networkx_graph(nodes: List[Dict], edges: List[Dict]) -> nx.DiGraph:
    """
    Build NetworkX DiGraph from nodes and edges.
    
    Args:
        nodes: List of node dictionaries
        edges: List of edge dictionaries
    
    Returns:
        NetworkX DiGraph with full metadata
    """
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
        edge_attrs = {
            'relationship_type': edge.get('relationship_type', 'references'),
            'join_column': edge.get('join_column', ''),
            'weight': edge.get('weight', 1.0)
        }
        
        # Enhanced metadata for semantic layer
        if 'join_column_description' in edge:
            edge_attrs['join_column_description'] = edge['join_column_description']
        if 'natural_language_alias' in edge:
            edge_attrs['natural_language_alias'] = edge['natural_language_alias']
        if 'few_shot_example' in edge:
            edge_attrs['few_shot_example'] = edge['few_shot_example']
        if 'context' in edge:
            edge_attrs['context'] = edge['context']
        
        G.add_edge(
            edge['from_table'],
            edge['to_table'],
            **edge_attrs
        )
    
    return G


def main():
    """Main execution function with safety checks."""
    parser = argparse.ArgumentParser(
        description='Safely persist SQLite schema to ArangoDB with safety checks'
    )
    parser.add_argument(
        '--sqlite-path',
        default=DEFAULT_SQLITE_PATH,
        help='Path to SQLite database file'
    )
    parser.add_argument(
        '--graph-name',
        default='manufacturing_schema',
        help='Name for the graph in ArangoDB'
    )
    parser.add_argument(
        '--force-overwrite',
        action='store_true',
        help='Skip safety prompts and overwrite existing graph'
    )
    
    args = parser.parse_args()
    
    print("=" * 75)
    print("Safe SQLite-to-ArangoDB Schema Persistence")
    print("=" * 75)
    
    # Step 1: Load schema from SQLite database
    print(f"\n📊 Step 1: Load schema from SQLite database")
    print("-" * 75)
    print(f"   Database: {args.sqlite_path}")
    
    try:
        nodes, edges = load_schema_from_sqlite(args.sqlite_path)
    except FileNotFoundError as e:
        print(f"❌ {e}")
        sys.exit(1)
    
    # Handle empty nodes table
    if not nodes and edges:
        print("⚠️  schema_nodes table is empty, inferring nodes from edges...")
        nodes = infer_nodes_from_edges(edges)
    
    if not nodes:
        print("❌ No schema data found. Cannot create graph.")
        sys.exit(1)
    
    print(f"✅ Loaded {len(nodes)} nodes and {len(edges)} edges")
    print(f"\nNodes:")
    for node in nodes[:5]:  # Show first 5
        print(f"   • {node['table_name']} ({node['table_type']})")
    if len(nodes) > 5:
        print(f"   ... and {len(nodes) - 5} more")
    
    print(f"\nEdges:")
    for edge in edges[:5]:  # Show first 5
        print(f"   • {edge['from_table']} → {edge['to_table']}")
    if len(edges) > 5:
        print(f"   ... and {len(edges) - 5} more")
    
    # Step 2: Build NetworkX graph
    print(f"\n📊 Step 2: Build NetworkX graph")
    print("-" * 75)
    
    G = build_networkx_graph(nodes, edges)
    
    print(f"✅ NetworkX graph created:")
    print(f"   Nodes: {G.number_of_nodes()}")
    print(f"   Edges: {G.number_of_edges()}")
    
    # Step 3: (Optional) Dry-run or connect to ArangoDB
    print(f"\n📊 Step 3: Connect to ArangoDB (or dry-run)")
    print("-" * 75)

    if TEST_MODE or SKIP_PERSIST:
        # Dry-run: report what would be persisted and exit cleanly
        print("⚠️  Dry-run mode active (TEST_MODE or SKIP_PERSIST). Will not contact ArangoDB.")
        print(f"\n[DRY RUN] Graph name: {args.graph_name}")
        print(f"[DRY RUN] Nodes: {len(nodes)}, Edges: {len(edges)}")
        print("[DRY RUN] Sample nodes:")
        for n in nodes[:5]:
            print(f"   • {n.get('table_name')} ({n.get('table_type')}) - {n.get('description')}")
        if len(nodes) > 5:
            print(f"   ... and {len(nodes)-5} more")

        print("[DRY RUN] Sample edges:")
        for e in edges[:10]:
            print(f"   • {e.get('from_table')} -> {e.get('to_table')} ({e.get('relationship_type')})")
        if len(edges) > 10:
            print(f"   ... and {len(edges)-10} more")

        print("\n✅ Dry-run complete. No changes made to ArangoDB.")
        sys.exit(0)

    # Real persist path: import Arango persistence helper and connect
    try:
        from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence
        config = ArangoDBConfig()
        persistence = ArangoDBGraphPersistence(config)
    except Exception as e:
        print(f"❌ Failed to connect to ArangoDB: {e}")
        sys.exit(1)

    print(f"✅ Connected to ArangoDB:")
    print(f"   Database: {config.database_name}")
    print(f"   Host: {config.host}")
    
    # Step 4: Safety check for existing graph
    print(f"\n📊 Step 4: Safety check for existing graph")
    print("-" * 75)
    
    graph_name = args.graph_name
    graph_exists = check_graph_exists(persistence, graph_name)
    overwrite = False
    
    if graph_exists and not args.force_overwrite:
        action, new_name = prompt_user_for_action(graph_name)
        
        if action == 'cancel':
            print("\n❌ Operation cancelled")
            sys.exit(0)
        elif action == 'overwrite':
            overwrite = True
        elif action == 'rename':
            graph_name = new_name
            # Check if new name also exists
            if check_graph_exists(persistence, graph_name):
                print(f"❌ Graph '{graph_name}' also exists. Please try a different name.")
                sys.exit(1)
    elif args.force_overwrite:
        overwrite = True
        print(f"⚠️  Force overwrite enabled")
    
    # Step 5: Persist to ArangoDB
    print(f"\n📊 Step 5: Persist to ArangoDB")
    print("-" * 75)
    print(f"   Graph name: {graph_name}")
    print(f"   Overwrite mode: {overwrite}")
    
    try:
        adb_graph = persistence.persist_graph(
            graph=G,
            name=graph_name,
            overwrite=overwrite
        )
        
        print(f"\n✅ Graph '{graph_name}' persisted successfully!")
        print(f"   All node metadata preserved (labels, types, descriptions)")
        print(f"   All edge metadata preserved (relationships, join columns, weights)")
        
    except Exception as e:
        print(f"\n❌ Failed to persist graph: {e}")
        sys.exit(1)
    
    print("\n" + "=" * 75)
    print("✅ Complete: SQLite → NetworkX → ArangoDB (Safe Mode)")
    print("=" * 75)
    print(f"""
Summary:
• Loaded {len(nodes)} schema nodes from SQLite
• Loaded {len(edges)} schema edges from SQLite
• Created NetworkX graph with full metadata
• Safely persisted to ArangoDB as '{graph_name}'

Next Steps:
• Run 020_Entry_Point_Persist_3rd_NetworkX_Arango.py to verify
• Use backup_arango_graph.py to create backups
• See README_GRAPH_PERSISTENCE.md for best practices
""")
    print("=" * 75)


if __name__ == "__main__":
    main()
