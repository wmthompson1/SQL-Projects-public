"""
nx_to_arango.py

Utility to push a NetworkX graph into ArangoDB.

Usage:
  - Populate environment variables (see .env.example)
  - Run: python scripts\nx_to_arango.py --graph-file path\to\graph.gpickle

Behavior:
  - Connects to ArangoDB using root creds, creates database if missing.
  - Creates a dev user and grants access to the DB (if provided).
  - Creates vertex collections (tables, reports, nodes) and edge collections (dependencies, edges).
  - Writes nodes and edges from a NetworkX graph into Arango.

Note: this script requires `python-arango` and `networkx` (already installed in workspace).
"""

import os
import argparse
import json
from getpass import getpass
from pathlib import Path
import re
from typing import Dict, Any

import networkx as nx
from arango import ArangoClient
import pickle


def env(name, default=None):
    return os.environ.get(name, default)


def load_dotenv_locations():
    """Load environment variables from common .env locations (if present).

    Search order (first match wins):
      1. CWD/.env
      2. repo-root /.env (parent of this script)
      3. scripts/.env
    Values are set into os.environ only if not already present.
    """
    candidate_paths = [
        os.path.join(os.getcwd(), '.env'),
        os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '.env')),
        os.path.join(os.path.dirname(os.path.abspath(__file__)), '.env'),
    ]

    for p in candidate_paths:
        if os.path.isfile(p):
            with open(p, 'r', encoding='utf-8') as fh:
                for ln in fh:
                    ln = ln.strip()
                    if not ln or ln.startswith('#'):
                        continue
                    if '=' in ln:
                        k, v = ln.split('=', 1)
                        v = v.strip().strip('"').strip("'")
                        os.environ.setdefault(k.strip(), v)
            print(f'✅ Loaded environment variables from: {p}')
            return


def ensure_db_and_user(client, root_user, root_pass, db_name, dev_user=None, dev_pass=None):
    """Create database and dev user if they don't exist"""
    sys_db = client.db('_system', username=root_user, password=root_pass)

    # Create database if missing
    if not sys_db.has_database(db_name):
        print(f"📦 Creating database '{db_name}'")
        sys_db.create_database(db_name)
    else:
        print(f"✅ Database '{db_name}' exists")

    # Create dev user if requested
    if dev_user and dev_pass:
        if not sys_db.has_user(dev_user):
            print(f"👤 Creating user '{dev_user}'")
            sys_db.create_user(dev_user, dev_pass, active=True)
        else:
            print(f"✅ User '{dev_user}' exists; updating password")
            sys_db.update_user(dev_user, password=dev_pass)
        
        # Grant access to the database
        try:
            sys_db.update_permission(
                username=dev_user,
                permission='rw',
                database=db_name
            )
            print(f"✅ Granted {dev_user} access to {db_name}")
        except Exception as e:
            print(f"⚠️  Could not set permissions: {e}")


def create_collections(db):
    """Create required collections if they don't exist"""
    collections = {
        'tables': False,      # Document collection for schema tables
        'reports': False,     # Document collection for SQL reports
        'dependencies': True, # Edge collection for report→table relationships
        'nodes': False,       # Legacy vertex collection (backward compatibility)
        'edges': True,        # Legacy edge collection (backward compatibility)
    }
    
    print("\n📊 Creating collections...")
    for col_name, is_edge in collections.items():
        if not db.has_collection(col_name):
            col_type = 'edge' if is_edge else 'document'
            db.create_collection(col_name, edge=is_edge)
            print(f"   ✅ Created {col_name} ({col_type})")
        else:
            print(f"   ✓ {col_name} exists")


def normalize_key(node_id: str) -> str:
    """Normalize node ID to valid ArangoDB _key format
    
    ArangoDB keys must be alphanumeric + underscore/hyphen only
    Examples:
        'table:Live.dbo.PAYABLE' → 'table_Live_dbo_PAYABLE'
        'report:BOE Billing\\BOE_Billing_MFG.sql' → 'report_BOE_Billing_BOE_Billing_MFG_sql'
    """
    normalized = str(node_id)
    # Replace special characters with underscores
    for char in [':', '/', '\\', '.', ' ', '-']:
        normalized = normalized.replace(char, '_')
    return normalized


def normalize_node_id_for_arango(node_id: str) -> str:
    """
    Normalize NetworkX node ID to valid ArangoDB _key format.
    
    ArangoDB _key constraints:
    - Pattern: ^[a-zA-Z0-9_:-]+$
    - No spaces, periods (except in specific positions), or special chars
    - Max length: 254 bytes
    
    Examples:
        'table:dbo.PAYABLE' → 'table_dbo_PAYABLE'
        'intent:Find overdue invoices' → 'intent_Find_overdue_invoices'
        'perspective:Finance' → 'perspective_Finance' (no change)
    
    Args:
        node_id: Original NetworkX node identifier
    
    Returns:
        Sanitized key valid for ArangoDB _key field
    """
    # Replace invalid characters with underscores
    # Keep alphanumeric, underscore, hyphen, colon (first char only)
    sanitized = re.sub(r'[^a-zA-Z0-9_:-]', '_', node_id)
    
    # Remove consecutive underscores
    sanitized = re.sub(r'__+', '_', sanitized)
    
    # Ensure it starts with letter or underscore (ArangoDB requirement)
    if sanitized and not sanitized[0].isalpha() and sanitized[0] != '_':
        sanitized = f"node_{sanitized}"
    
    # Truncate to 254 bytes if needed
    if len(sanitized.encode('utf-8')) > 254:
        sanitized = sanitized[:250]  # Leave room for potential suffix
    
    return sanitized


def graph_to_arango(db, graph, update_ground_truth=False):
    """Write NetworkX graph nodes and edges to ArangoDB collections"""
    
    # Get collection handles
    tables_col = db.collection('tables')
    reports_col = db.collection('reports')
    dependencies_col = db.collection('dependencies')
    nodes_col = db.collection('nodes')  # Legacy
    edges_col = db.collection('edges')  # Legacy

    print(f"\n📥 Writing graph to ArangoDB...")
    print(f"   Nodes: {graph.number_of_nodes()}")
    print(f"   Edges: {graph.number_of_edges()}")

    # Write nodes with type-based routing
    node_count = 0
    table_count = 0
    report_count = 0
    
    for node_id, attrs in graph.nodes(data=True):
        key = normalize_key(node_id)
        node_type = attrs.get('type', 'unknown')
        
        doc = {
            '_key': key,
            'original_id': node_id,
            **attrs
        }
        
        if update_ground_truth:
            doc['ground_truth'] = True
        
        # Route to appropriate collection based on node type
        if node_type == 'table':
            tables_col.insert(doc, overwrite=True)
            table_count += 1
        elif node_type == 'report':
            reports_col.insert(doc, overwrite=True)
            report_count += 1
        else:
            # Legacy fallback - nodes without type attribute
            nodes_col.insert(doc, overwrite=True)
        
        node_count += 1
        if node_count % 100 == 0:
            print(f"   Processed {node_count} nodes...")

    print(f"✅ Wrote {node_count} nodes:")
    print(f"   - {table_count} tables")
    print(f"   - {report_count} reports")
    print(f"   - {node_count - table_count - report_count} other nodes")

    # Write edges
    edge_count = 0
    for u, v, data in graph.edges(data=True):
        from_key = normalize_key(u)
        to_key = normalize_key(v)
        
        # Determine source/target collection based on node types
        u_type = graph.nodes[u].get('type', 'unknown')
        v_type = graph.nodes[v].get('type', 'unknown')
        
        from_col = 'reports' if u_type == 'report' else ('tables' if u_type == 'table' else 'nodes')
        to_col = 'tables' if v_type == 'table' else ('reports' if v_type == 'report' else 'nodes')
        
        edge_doc = {
            '_from': f'{from_col}/{from_key}',
            '_to': f'{to_col}/{to_key}'
        }
        
        # Add edge attributes
        if isinstance(data, dict):
            edge_doc.update({k: v for k, v in data.items()})
        else:
            edge_doc['label'] = str(data)
        
        if update_ground_truth:
            edge_doc['ground_truth'] = True
        
        # Insert into appropriate edge collection
        if u_type == 'report' and v_type == 'table':
            dependencies_col.insert(edge_doc, overwrite_mode='replace')
        else:
            edges_col.insert(edge_doc)  # Legacy
        
        edge_count += 1

    print(f"✅ Wrote {edge_count} edges")
    print('\n🎉 Graph successfully persisted to ArangoDB!')


def ensure_graph(db, graph_name="manufacturing_ground_truth_graph"):
    """
    Ensure a named graph exists in ArangoDB, connecting the right collections.
    """
    if db.has_graph(graph_name):
        print(f"✅ Graph '{graph_name}' exists")
        return
    print(f"📦 Creating graph '{graph_name}'")
    db.create_graph(
        graph_name,
        edge_definitions=[
            {
                "edge_collection": "edges",
                "from_vertex_collections": ["tables", "nodes"],
                "to_vertex_collections": ["tables", "nodes"],
            },
            {
                "edge_collection": "dependencies",
                "from_vertex_collections": ["reports"],
                "to_vertex_collections": ["tables"],
            }
        ]
    )


def main():
    parser = argparse.ArgumentParser(description='Persist NetworkX graph to ArangoDB')
    parser.add_argument('--graph-file', '-g', required=True, help='Path to NetworkX graph file (gpickle recommended)')
    parser.add_argument('--db', '-d', help='Database name (overrides DATABASE_NAME env)')
    parser.add_argument('--create-user', action='store_true', help='Create dev user using DATABASE_DEV_USER/DATABASE_DEV_PASSWORD or prompt')
    parser.add_argument('--update-ground-truth', action='store_true', help='Mark nodes/edges as ground truth')
    args = parser.parse_args()

    # Load .env from repo root or scripts folder if present
    load_dotenv_locations()

    arango_url = env('DATABASE_HOST', 'http://127.0.0.1:8529')
    root_user = env('DATABASE_USERNAME', 'root')
    root_pass = env('DATABASE_PASSWORD')
    
    if not root_pass:
        root_pass = getpass('ArangoDB root password: ')

    # DB name preference: CLI override -> DATABASE_NAME -> default
    db_name = args.db or env('DATABASE_NAME', 'manufacturing_graph')
    dev_user = env('DATABASE_DEV_USER')
    dev_pass = env('DATABASE_DEV_PASSWORD')

    # Prompt for dev creds if requested
    if args.create_user and (not dev_user or not dev_pass):
        if not dev_user:
            dev_user = input('Dev username to create: ').strip()
        if not dev_pass:
            dev_pass = getpass('Dev password: ')

    print(f'🔌 Connecting to ArangoDB at {arango_url}')
    client = ArangoClient(hosts=arango_url)

    # Ensure database and user exist
    ensure_db_and_user(client, root_user, root_pass, db_name, dev_user, dev_pass)

    # Connect to the target DB to create collections
    db = client.db(db_name, username=root_user, password=root_pass)

    # Create required collections
    create_collections(db)

    # Ensure named graph exists
    ensure_graph(db, graph_name="manufacturing_ground_truth_graph")

    # Load NetworkX graph
    gf = args.graph_file
    print(f'\n📊 Loading graph from {gf}')
    with open(gf, 'rb') as fh:
        g = pickle.load(fh)

    # Persist graph to ArangoDB
    graph_to_arango(db, g, update_ground_truth=args.update_ground_truth or args.create_user)


if __name__ == '__main__':
    main()
