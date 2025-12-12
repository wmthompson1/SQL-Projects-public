#!/usr/bin/env python3
"""
nx_to_arango.py

Utility to push a NetworkX graph into ArangoDB.

Usage:
  - Populate environment variables (see .env.example)
  - Run: python scripts/nx_to_arango.py --graph-file path/to/graph.gpickle

Behavior:
  - Connects to ArangoDB using root creds, creates database if missing.
  - Creates a dev user and grants access to the DB (if provided).
  - Creates `nodes` vertex collection and `edges` edge collection.
  - Writes nodes and edges from a NetworkX graph into Arango.

Note: this script requires `python-arango` and `networkx` (already installed in workspace).
"""

import os
import argparse
import json
from getpass import getpass

import networkx as nx
from arango import ArangoClient


def env(name, default=None):
    return os.environ.get(name, default)


def ensure_db_and_user(client, root_user, root_pass, db_name, dev_user=None, dev_pass=None):
    sys_db = client.db('_system', username=root_user, password=root_pass)

    # create database if missing
    if not sys_db.has_database(db_name):
        print(f"Creating database '{db_name}'")
        sys_db.create_database(db_name)
    else:
        print(f"Database '{db_name}' exists")

    # create dev user if requested
    if dev_user and dev_pass:
        if not sys_db.has_user(dev_user):
            print(f"Creating user '{dev_user}'")
            sys_db.create_user(dev_user, dev_pass)
        else:
            print(f"User '{dev_user}' exists; updating password and permissions")
            sys_db.update_user(dev_user, password=dev_pass)

        # grant database access
        sys_db.grant_database(dev_user, db_name)


def ensure_collections(db):
    if not db.has_collection('nodes'):
        print('Creating vertex collection: nodes')
        db.create_collection('nodes')
    else:
        print('Collection nodes exists')

    if not db.has_collection('edges'):
        print('Creating edge collection: edges')
        db.create_collection('edges', edge=True)
    else:
        print('Collection edges exists')


def graph_to_arango(db, graph):
    nodes_col = db.collection('nodes')
    edges_col = db.collection('edges')

    # Write nodes
    for n, data in graph.nodes(data=True):
        key = str(n)
        doc = {'_key': key, **{k: v for k, v in data.items()}}
        if nodes_col.has(key):
            nodes_col.update(key, doc)
        else:
            nodes_col.insert(doc)

    # Write edges
    for u, v, data in graph.edges(data=True):
        from_key = f'nodes/{u}'
        to_key = f'nodes/{v}'
        edge_doc = {'_from': from_key, '_to': to_key, **{k: v for k, v in data.items()}}
        # Insert edge (no direct upsert support for edges with same key)
        edges_col.insert(edge_doc)

    print('Graph persisted to ArangoDB')


def main():
    parser = argparse.ArgumentParser(description='Persist NetworkX graph to ArangoDB')
    parser.add_argument('--graph-file', '-g', required=True, help='Path to NetworkX graph file (gpickle recommended)')
    parser.add_argument('--db', '-d', help='Arango DB name (overrides ARANGO_DB env)')
    parser.add_argument('--create-user', action='store_true', help='Create dev user using ARANGO_DEV_USER/ARANGO_DEV_PASSWORD or prompt')
    args = parser.parse_args()

    arango_url = env('ARANGO_URL', 'http://127.0.0.1:8529')
    root_user = env('ARANGO_ROOT_USER', 'root')
    root_pass = env('ARANGO_ROOT_PASSWORD')
    if not root_pass:
        root_pass = getpass('Arango root password: ')

    db_name = args.db or env('ARANGO_DB', 'nx_graphs')
    dev_user = env('ARANGO_DEV_USER')
    dev_pass = env('ARANGO_DEV_PASSWORD')

    # prompt for dev creds if requested
    if args.create_user and (not dev_user or not dev_pass):
        if not dev_user:
            dev_user = input('Dev username to create: ').strip()
        if not dev_pass:
            dev_pass = getpass('Dev password: ')

    print('Connecting to Arango at', arango_url)
    client = ArangoClient(hosts=arango_url)

    ensure_db_and_user(client, root_user, root_pass, db_name, dev_user, dev_pass)

    # Connect to the target DB as root to create collections
    db = client.db(db_name, username=root_user, password=root_pass)

    ensure_collections(db)

    # Load NetworkX graph
    gf = args.graph_file
    print('Loading graph from', gf)
    g = nx.read_gpickle(gf)

    graph_to_arango(db, g)


if __name__ == '__main__':
    main()
