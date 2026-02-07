#!/usr/bin/env python3
"""
backup_arango_graph.py

ArangoDB Graph Backup Utility
==============================

Exports ArangoDB graphs to JSON format with full metadata preservation.
Creates timestamped backups for disaster recovery and audit trails.

Features:
- Exports all nodes and edges with complete metadata
- Includes timestamp in backup filename
- Preserves graph structure and attributes
- Provides summary statistics
- Supports command-line usage
- Can be integrated into automated workflows

Usage:
    # Backup default manufacturing schema
    python backup_arango_graph.py --graph-name manufacturing_schema
    
    # Backup to specific path
    python backup_arango_graph.py --graph-name manufacturing_schema --output backups/schema.json
    
    # List available graphs
    python backup_arango_graph.py --list-graphs
"""

import sys
import os
import json
import argparse
from datetime import datetime
from typing import Optional, Dict, Any, List

# Ensure local module path is importable
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.insert(0, SCRIPT_DIR)

# NOTE: Arango imports are deferred to `main()` to avoid requiring Arango libraries
# when this module is imported by tooling (e.g., tests or static analysis).


def list_graphs(persistence) -> List[str]:
    """
    List all graphs available in ArangoDB.
    
    Args:
        persistence: ArangoDBGraphPersistence instance
    
    Returns:
        List of graph names
    """
    try:
        from arango import ArangoClient
        
        client = ArangoClient(hosts=persistence.config.host)
        db = client.db(
            persistence.config.database_name,
            username=persistence.config.username,
            password=persistence.config.password
        )
        
        # Get all collections
        collections = db.collections()
        
        # Extract graph names from node collections (ending with _N)
        graph_names = set()
        for col in collections:
            name = col['name']
            if name.endswith('_N') and not name.startswith('_'):
                graph_name = name[:-2]  # Remove _N suffix
                graph_names.add(graph_name)
        
        return sorted(list(graph_names))
        
    except Exception as e:
        print(f"❌ Failed to list graphs: {e}")
        return []


def backup_graph(
    persistence,
    graph_name: str,
    output_path: Optional[str] = None
) -> Optional[str]:
    """
    Backup an ArangoDB graph to JSON format.
    
    Args:
        persistence: ArangoDBGraphPersistence instance
        graph_name: Name of the graph to backup
        output_path: Optional output file path. If None, generates timestamped filename
    
    Returns:
        Path to backup file if successful, None otherwise
    """
    print(f"📥 Loading graph '{graph_name}' from ArangoDB...")
    
    try:
        # Load graph from ArangoDB
        adb_graph = persistence.load_graph(
            name=graph_name,
            directed=True
        )
        
        # Convert to NetworkX for serialization
        import networkx as nx
        nx_graph = nx.DiGraph(adb_graph)
        
        print(f"✅ Graph loaded: {nx_graph.number_of_nodes()} nodes, {nx_graph.number_of_edges()} edges")
        
    except Exception as e:
        print(f"❌ Failed to load graph: {e}")
        return None
    
    # Generate output path if not provided
    if output_path is None:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        output_path = f"{graph_name}_backup_{timestamp}.json"
    
    # Ensure output directory exists
    output_dir = os.path.dirname(output_path)
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    print(f"\n💾 Creating backup...")
    print(f"   Output: {output_path}")
    
    try:
        # Prepare backup data
        backup_data = {
            "metadata": {
                "graph_name": graph_name,
                "backup_timestamp": datetime.now().isoformat(),
                "node_count": nx_graph.number_of_nodes(),
                "edge_count": nx_graph.number_of_edges(),
                "graph_type": "directed",
                "source": "ArangoDB",
                "database": persistence.config.database_name,
                "host": persistence.config.host
            },
            "nodes": [],
            "edges": []
        }
        
        # Export nodes with all attributes
        for node, attrs in nx_graph.nodes(data=True):
            node_data = {
                "id": node,
                "attributes": dict(attrs)
            }
            backup_data["nodes"].append(node_data)
        
        # Export edges with all attributes
        for source, target, attrs in nx_graph.edges(data=True):
            edge_data = {
                "source": source,
                "target": target,
                "attributes": dict(attrs)
            }
            backup_data["edges"].append(edge_data)
        
        # Write to JSON file
        with open(output_path, 'w') as f:
            json.dump(backup_data, f, indent=2, default=str)
        
        # Get file size
        file_size = os.path.getsize(output_path)
        file_size_mb = file_size / (1024 * 1024)
        
        print(f"\n✅ Backup created successfully!")
        print(f"\n📊 Backup Summary:")
        print(f"   File: {output_path}")
        print(f"   Size: {file_size_mb:.2f} MB ({file_size:,} bytes)")
        print(f"   Nodes: {backup_data['metadata']['node_count']}")
        print(f"   Edges: {backup_data['metadata']['edge_count']}")
        print(f"   Timestamp: {backup_data['metadata']['backup_timestamp']}")
        
        return output_path
        
    except Exception as e:
        print(f"❌ Failed to create backup: {e}")
        return None


def restore_graph(
    persistence,
    backup_path: str,
    graph_name: Optional[str] = None,
    overwrite: bool = False
) -> bool:
    """
    Restore a graph from a JSON backup file.
    
    Args:
        persistence: ArangoDBGraphPersistence instance
        backup_path: Path to backup JSON file
        graph_name: Optional new name for restored graph. Uses original if None
        overwrite: Whether to overwrite existing graph
    
    Returns:
        True if successful, False otherwise
    """
    print(f"📂 Loading backup from: {backup_path}")
    
    try:
        with open(backup_path, 'r') as f:
            backup_data = json.load(f)
        
        metadata = backup_data.get("metadata", {})
        nodes_data = backup_data.get("nodes", [])
        edges_data = backup_data.get("edges", [])
        
        print(f"✅ Backup loaded:")
        print(f"   Original graph: {metadata.get('graph_name', 'unknown')}")
        print(f"   Backup date: {metadata.get('backup_timestamp', 'unknown')}")
        print(f"   Nodes: {len(nodes_data)}")
        print(f"   Edges: {len(edges_data)}")
        
    except Exception as e:
        print(f"❌ Failed to load backup: {e}")
        return False
    
    # Use original graph name if not specified
    if graph_name is None:
        graph_name = metadata.get('graph_name', 'restored_graph')
    
    print(f"\n🔄 Restoring as '{graph_name}'...")
    
    try:
        import networkx as nx
        
        # Rebuild NetworkX graph
        G = nx.DiGraph()
        
        # Add nodes
        for node_data in nodes_data:
            G.add_node(node_data['id'], **node_data['attributes'])
        
        # Add edges
        for edge_data in edges_data:
            G.add_edge(
                edge_data['source'],
                edge_data['target'],
                **edge_data['attributes']
            )
        
        print(f"✅ Graph reconstructed: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")
        
        # Persist to ArangoDB
        adb_graph = persistence.persist_graph(
            graph=G,
            name=graph_name,
            overwrite=overwrite
        )
        
        print(f"\n✅ Graph '{graph_name}' restored successfully!")
        return True
        
    except Exception as e:
        print(f"❌ Failed to restore graph: {e}")
        return False


def main():
    """Main execution function."""
    parser = argparse.ArgumentParser(
        description='Backup and restore ArangoDB graphs'
    )
    parser.add_argument(
        '--graph-name',
        help='Name of the graph to backup'
    )
    parser.add_argument(
        '--output',
        help='Output path for backup file'
    )
    parser.add_argument(
        '--list-graphs',
        action='store_true',
        help='List all available graphs'
    )
    parser.add_argument(
        '--restore',
        help='Path to backup file to restore'
    )
    parser.add_argument(
        '--restore-as',
        help='Name for restored graph (uses original if not specified)'
    )
    parser.add_argument(
        '--overwrite',
        action='store_true',
        help='Overwrite existing graph when restoring'
    )
    
    args = parser.parse_args()
    
    print("=" * 75)
    print("ArangoDB Graph Backup Utility")
    print("=" * 75)
    # Connect to ArangoDB (import lazily to avoid requiring Arango packages at import time)
    try:
        from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence

        config = ArangoDBConfig()
        persistence = ArangoDBGraphPersistence(config)
        print(f"\n✅ Connected to ArangoDB:")
        print(f"   Database: {config.database_name}")
        print(f"   Host: {config.host}")
    except Exception as e:
        print(f"\nFailed to connect to ArangoDB: {e}")
        sys.exit(1)
    
    # List graphs mode
    if args.list_graphs:
        print(f"\n📊 Available graphs:")
        print("-" * 75)
        graphs = list_graphs(persistence)
        if graphs:
            for graph in graphs:
                print(f"   • {graph}")
        else:
            print("   No graphs found")
        sys.exit(0)
    
    # Restore mode
    if args.restore:
        print(f"\n🔄 Restore Mode")
        print("-" * 75)
        success = restore_graph(
            persistence,
            args.restore,
            args.restore_as,
            args.overwrite
        )
        sys.exit(0 if success else 1)
    
    # Backup mode
    if not args.graph_name:
        print("\n❌ Error: --graph-name is required for backup")
        print("Use --list-graphs to see available graphs")
        sys.exit(1)
    
    print(f"\n💾 Backup Mode")
    print("-" * 75)
    
    backup_path = backup_graph(
        persistence,
        args.graph_name,
        args.output
    )
    
    if backup_path:
        print(f"\n{'=' * 75}")
        print("✅ Backup Complete")
        print("=" * 75)
        print(f"\nBackup file: {backup_path}")
        print(f"\nTo restore this backup:")
        print(f"  python backup_arango_graph.py --restore {backup_path}")
        print(f"  python backup_arango_graph.py --restore {backup_path} --restore-as new_name")
        print("=" * 75)
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
