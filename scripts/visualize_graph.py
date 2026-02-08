#!/usr/bin/env python3
"""
Simple graph visualization tool for NetworkX gpickle files.
Usage:
  python scripts/visualize_graph.py <input_gpickle> <output_png> [--max-nodes N]

If the graph is large, the script will render a subgraph containing the top-N nodes by degree.
"""
import argparse
import os
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Path to input .gpickle file")
    parser.add_argument("output", help="Path to output PNG file")
    parser.add_argument("--max-nodes", type=int, default=200, help="Max nodes to render (use 0 for all)")
    args = parser.parse_args()

    try:
        import networkx as nx
    except Exception:
        print("Missing required package: networkx. Install with: pip install networkx", file=sys.stderr)
        raise

    if not os.path.exists(args.input):
        print(f"Input file not found: {args.input}", file=sys.stderr)
        sys.exit(2)

    print(f"Loading graph from: {args.input}")
    try:
        if hasattr(nx, 'read_gpickle'):
            G = nx.read_gpickle(args.input)
        else:
            import pickle
            with open(args.input, 'rb') as fh:
                G = pickle.load(fh)
    except Exception as e:
        print(f"Failed to load gpickle: {e}", file=sys.stderr)
        raise
    n = G.number_of_nodes()
    m = G.number_of_edges()
    print(f"Graph loaded: {n} nodes, {m} edges")

    render_g = G
    if args.max_nodes and args.max_nodes > 0 and n > args.max_nodes:
        # select top nodes by degree
        deg = sorted(G.degree(), key=lambda x: x[1], reverse=True)
        top_nodes = [node for node, _ in deg[: args.max_nodes]]
        render_g = G.subgraph(top_nodes).copy()
        print(f"Rendering subgraph with {render_g.number_of_nodes()} nodes (top {args.max_nodes} by degree)")
    else:
        print("Rendering full graph")

    # attempt to import matplotlib only when needed; otherwise fallback to GraphML export
    try:
        import matplotlib
        matplotlib.use('Agg')
        import matplotlib.pyplot as plt
        have_matplotlib = True
    except Exception:
        have_matplotlib = False

    out_dir = os.path.dirname(args.output)
    if out_dir and not os.path.exists(out_dir):
        os.makedirs(out_dir, exist_ok=True)

    if not have_matplotlib:
        # fallback: export GraphML so it can be opened in Gephi or other tools
        graphml_path = args.output if args.output.endswith('.graphml') else os.path.splitext(args.output)[0] + '.graphml'
        nx.write_graphml(render_g, graphml_path)
        print(f"matplotlib not available; exported GraphML to: {graphml_path}")
        sys.exit(0)

    # compute layout (spring layout is good for medium-sized graphs)
    print("Computing layout (may take a while for larger graphs)")
    pos = nx.spring_layout(render_g, seed=42)

    figsize = (12, 12)
    plt.figure(figsize=figsize)

    # draw nodes and edges
    nx.draw_networkx_edges(render_g, pos, alpha=0.3, edge_color="#888888", width=0.6)
    nx.draw_networkx_nodes(render_g, pos, node_size=50, node_color="#1f78b4")

    # draw labels only when small
    if render_g.number_of_nodes() <= 50:
        nx.draw_networkx_labels(render_g, pos, font_size=8)

    plt.axis('off')
    plt.tight_layout()
    plt.savefig(args.output, dpi=150)
    print(f"Saved visualization to: {args.output}")


if __name__ == '__main__':
    main()
