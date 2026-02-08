def print_graph_stats(G):
    """Print statistics about the loaded graph."""
    stats = G.stats()
    
    print(f"\n{'='*60}")
    print("GRAPH STATISTICS")
    print(f"{'='*60}")
    print(f"Total nodes: {stats['nodes']}")
    print(f"Total edges: {stats['edges']}")
    print(f"Node types: {stats['node_types']}")
    print(f"Edge types: {stats['edge_types']}")
    
    # Count nodes by type
    node_types = {}
    for node in G.nodes:
        node_type = node.get('type', 'Unknown')
        node_types[node_type] = node_types.get(node_type, 0) + 1
    
    print(f"\nNode breakdown:")
    for ntype, count in sorted(node_types.items()):
        print(f"  {ntype}: {count}")
    
    # Count edges by type
    edge_types = {}
    for edge in G.edges:
        etype = edge.get('edge_type', 'Unknown')
        edge_types[etype] = edge_types.get(etype, 0) + 1
    
    print(f"\nEdge breakdown:")
    for etype, count in sorted(edge_types.items()):
        print(f"  {etype}: {count}")
    print(f"{'='*60}\n")
