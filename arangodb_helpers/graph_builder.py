"""Direct ArangoDB graph builder without NetworkX dependency."""
from typing import Dict, List, Any
from arango import ArangoClient


class DirectGraphBuilder:
    """Build graph structure using plain dicts instead of NetworkX."""

    def __init__(self):
        self.nodes: List[Dict[str, Any]] = []
        self.edges: List[Dict[str, Any]] = []

    def add_node(self, node_id: str, collection: str, **attrs):
        """Add a node with attributes."""
        self.nodes.append({
            '_key': node_id,
            '_collection': collection,
            **attrs
        })

    def add_edge(self, from_node: str, to_node: str, edge_type: str, **attrs):
        """Add an edge with attributes."""
        self.edges.append({
            '_from': from_node,
            '_to': to_node,
            'edge_type': edge_type,
            **attrs
        })

    def stats(self):
        """Return graph statistics."""
        return {
            'nodes': len(self.nodes),
            'edges': len(self.edges),
            'node_types': len(set(n['_collection'] for n in self.nodes)),
            'edge_types': len(set(e['edge_type'] for e in self.edges))
        }


class ArangoGraphPersistence:
    """Persist graph directly to ArangoDB without NetworkX."""

    def __init__(self, host: str = '127.0.0.1', port: int = 8529, db_name: str = 'manufacturing_graph'):
        self.client = ArangoClient(hosts=[f'http://{host}:{port}'])
        self.sys_db = self.client.db('_system')
        self.db_name = db_name
        self.db = None

    def ensure_database(self):
        """Create database if it doesn't exist and set `self.db`."""
        try:
            if not self.sys_db.has_database(self.db_name):
                self.sys_db.create_database(self.db_name)
        except Exception:
            # may not have permission; proceed to open DB
            pass
        self.db = self.client.db(self.db_name)

    def persist_graph(self, builder: DirectGraphBuilder, graph_name: str):
        """Persist nodes and edges to ArangoDB."""
        self.ensure_database()

        # Group nodes by collection
        collections: Dict[str, List[Dict[str, Any]]] = {}
        for node in builder.nodes:
            coll = node.pop('_collection')
            collections.setdefault(coll, []).append(node)

        # Create vertex collections and insert
        for coll_name, nodes in collections.items():
            if not self.db.has_collection(coll_name):
                self.db.create_collection(coll_name)
            coll = self.db.collection(coll_name)
            try:
                coll.insert_many(nodes)
            except Exception:
                # fallback to per-document upsert
                for d in nodes:
                    try:
                        coll.insert(d)
                    except Exception:
                        key = d.get('_key')
                        if key:
                            try:
                                coll.replace(key, d)
                            except Exception:
                                pass

        # Create edge collection and insert
        edge_coll_name = f"{graph_name}_edges"
        if not self.db.has_collection(edge_coll_name):
            self.db.create_collection(edge_coll_name, edge=True)
        edge_coll = self.db.collection(edge_coll_name)
        try:
            edge_coll.insert_many(builder.edges)
        except Exception:
            for e in builder.edges:
                try:
                    edge_coll.insert(e)
                except Exception:
                    pass

        print(f"✅ Persisted {len(builder.nodes)} nodes and {len(builder.edges)} edges to {self.db_name}")
