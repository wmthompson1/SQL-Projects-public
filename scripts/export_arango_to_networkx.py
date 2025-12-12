#!/usr/bin/env python3
"""Export an ArangoDB graph into a NetworkX graph and save as gpickle.

Usage:
  python scripts/export_arango_to_networkx.py --out ./scripts/inventory_transactions_graph.gpickle
"""
import os
import argparse
import pickle
from arango import ArangoClient
import networkx as nx


def env(name, default=None):
    return os.environ.get(name, default)


def main():
    parser = argparse.ArgumentParser(description='Export Arango graph to NetworkX')
    parser.add_argument('--db', '-d', default=env('DATABASE_NAME', 'manufacturing_graph'))
    parser.add_argument('--out', '-o', default='./scripts/inventory_transactions_graph.gpickle')
    parser.add_argument('--host', default=env('DATABASE_HOST', 'http://127.0.0.1:8529'))
    parser.add_argument('--user', default=env('DATABASE_USERNAME', 'root'))
    parser.add_argument('--password', default=env('DATABASE_PASSWORD'))
    parser.add_argument('--nodes-collection', default='nodes')
    parser.add_argument('--edges-collection', default='edges')
    args = parser.parse_args()

    if not args.password:
        raise RuntimeError('Set DATABASE_PASSWORD env or pass --password')

    client = ArangoClient(hosts=args.host)
    db = client.db(args.db, username=args.user, password=args.password)

    nodes_col = db.collection(args.nodes_collection)
    edges_col = db.collection(args.edges_collection)

    G = nx.DiGraph()

    # Load nodes
    for doc in nodes_col.all():
        key = doc.get('_key')
        attrs = {k: v for k, v in doc.items() if not k.startswith('_')}
        G.add_node(key, **attrs)

    # Load edges
    for ed in edges_col.all():
        frm = ed.get('_from')
        to = ed.get('_to')
        # keys are like 'nodes/INVENTORY_TRANS'
        if frm and '/' in frm:
            frm_key = frm.split('/', 2)[1]
        else:
            frm_key = frm
        if to and '/' in to:
            to_key = to.split('/', 2)[1]
        else:
            to_key = to
        attrs = {k: v for k, v in ed.items() if not k.startswith('_')}
        G.add_edge(frm_key, to_key, **attrs)

    # Save gpickle
    out = args.out
    with open(out, 'wb') as fh:
        pickle.dump(G, fh)

    print(f'Wrote NetworkX graph: {out}')


if __name__ == '__main__':
    main()
