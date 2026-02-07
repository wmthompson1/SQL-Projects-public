#!/usr/bin/env python3
"""
Importable module version of Entry Point 020: ArangoDB Graph Persistence

Based on NVIDIA Developer Blog:
"Accelerated, Production-Ready Graph Analytics for NetworkX Users"
https://developer.nvidia.com/blog/accelerated-production-ready-graph-analytics-for-networkx-users/
"""

import os
import networkx as nx
from typing import Optional, Dict, Any, Union, TYPE_CHECKING
import json

if TYPE_CHECKING:
    import nx_arangodb as nxadb

try:
    import nx_arangodb as nxadb
    NXADB_AVAILABLE = True
except ImportError:
    NXADB_AVAILABLE = False
    nxadb = None  # type: ignore

# Detect python-arango availability at module import time
ARANGO_PY_AVAILABLE = False
try:
    from arango import ArangoClient  # type: ignore
    ARANGO_PY_AVAILABLE = True
except Exception:
    ARANGO_PY_AVAILABLE = False

class ArangoDBConfig:
    """Configuration manager for ArangoDB connection"""
    
    def __init__(
        self,
        host: Optional[str] = None,
        username: Optional[str] = None,
        password: Optional[str] = None,
        database_name: Optional[str] = None
    ):
        self.host = host or os.getenv("DATABASE_HOST", "http://localhost:8529")
        self.username = username or os.getenv("DATABASE_USERNAME", "root")
        self.password = password or os.getenv("DATABASE_PASSWORD", "")
        self.database_name = database_name or os.getenv("DATABASE_NAME", "networkx_graphs")
    
        os.environ["DATABASE_NAME"] = self.database_name
    
    def get_connection_info(self) -> Dict[str, str]:
        """Get connection information (safe for logging)"""
        return {
            "host": self.host,
            "username": self.username,
            "database_name": self.database_name,
            "password": "***" if self.password else "Not set"
        }

    def set_environment_variables(self) -> None:
        """Set environment variables used by other persistence helpers."""
        os.environ["DATABASE_HOST"] = self.host
        os.environ["DATABASE_USERNAME"] = self.username
        os.environ["DATABASE_PASSWORD"] = self.password
        os.environ["DATABASE_NAME"] = self.database_name


class ArangoDBGraphPersistence:
    """Utility class for persisting NetworkX graphs to ArangoDB"""
    
    def __init__(self, config: Optional[ArangoDBConfig] = None):
        if not NXADB_AVAILABLE and not ARANGO_PY_AVAILABLE:
            raise ImportError("No ArangoDB persistence backend available. Install nx-arangodb or python-arango")

        self.config = config or ArangoDBConfig()
        self.config.set_environment_variables()
        # Ensure database exists when python-arango is available
        if ARANGO_PY_AVAILABLE:
            try:
                self._ensure_database_exists()
            except Exception:
                # best-effort; allow other methods to handle creation
                pass
    
    def _ensure_database_exists(self):
        """Create the database if it doesn't exist"""
        from arango import ArangoClient
        
        client = ArangoClient(hosts=self.config.host)
        sys_db = client.db("_system", username=self.config.username, password=self.config.password)
        
        if not sys_db.has_database(self.config.database_name):
            print(f"📦 Creating database '{self.config.database_name}'...")
            sys_db.create_database(self.config.database_name)
            print(f"✅ Database created")
    
    def persist_graph(
        self,
        graph: Union[nx.Graph, nx.DiGraph],
        name: str,
        write_batch_size: int = 50000,
        overwrite: bool = False
    ) -> Any:
        """Persist NetworkX graph to ArangoDB"""
        print(f"📤 Persisting graph '{name}' to ArangoDB...")
        print(f"   Nodes: {graph.number_of_nodes()}, Edges: {graph.number_of_edges()}")
        
        try:
            if NXADB_AVAILABLE and nxadb is not None:
                if isinstance(graph, nx.DiGraph):
                    adb_graph = nxadb.DiGraph(  # type: ignore
                        name=name,
                        incoming_graph_data=graph,
                        write_batch_size=write_batch_size,
                        overwrite_graph=overwrite
                    )
                else:
                    adb_graph = nxadb.Graph(  # type: ignore
                        name=name,
                        incoming_graph_data=graph,
                        write_batch_size=write_batch_size,
                        overwrite_graph=overwrite
                    )

                print(f"✅ Graph '{name}' persisted successfully via nx-arangodb")
                return adb_graph

            if ARANGO_PY_AVAILABLE:
                # Fallback implementation using python-arango
                client = ArangoClient(hosts=self.config.host)
                sys_db = client.db('_system', username=self.config.username, password=self.config.password)
                if not sys_db.has_database(self.config.database_name):
                    sys_db.create_database(self.config.database_name)
                db = client.db(self.config.database_name, username=self.config.username, password=self.config.password)

                node_col = f"{name}_nodes"
                edge_col = f"{name}_edges"

                if not db.has_collection(node_col):
                    db.create_collection(node_col)
                if not db.has_collection(edge_col):
                    db.create_collection(edge_col, edge=True)

                node_collection = db.collection(node_col)
                edge_collection = db.collection(edge_col)

                # Insert nodes
                nodes_bulk = []
                for node, attrs in graph.nodes(data=True):
                    doc = {"_key": str(node)}
                    doc.update({k: v for k, v in attrs.items()})
                    nodes_bulk.append(doc)
                if nodes_bulk:
                    node_collection.insert_many(nodes_bulk)

                # Insert edges
                edges_bulk = []
                for src, tgt, attrs in graph.edges(data=True):
                    doc = {
                        "_from": f"{node_col}/{src}",
                        "_to": f"{node_col}/{tgt}"
                    }
                    doc.update({k: v for k, v in attrs.items()})
                    edges_bulk.append(doc)
                if edges_bulk:
                    edge_collection.insert_many(edges_bulk)

                # Create a graph object if desired (optional)
                try:
                    if not db.has_graph(name):
                        db.create_graph(name, edge_definition={
                            "edge_collection": edge_col,
                            "from_vertex_collections": [node_col],
                            "to_vertex_collections": [node_col]
                        })
                except Exception:
                    # Graph creation is best-effort; ignore if unsupported
                    pass

                print(f"✅ Graph '{name}' persisted successfully via python-arango (collections: {node_col}, {edge_col})")
                return {"node_collection": node_col, "edge_collection": edge_col}

            raise RuntimeError("No ArangoDB persistence backend available (nx-arangodb or python-arango)")

        except Exception as e:
            print(f"❌ Failed to persist graph: {e}")
            raise
    
    def load_graph(
        self,
        name: str,
        directed: bool = True,
        read_batch_size: int = 50000,
        read_parallelism: int = 4
    ) -> Any:
        """Load persisted graph from ArangoDB"""
        print(f"📥 Loading graph '{name}' from ArangoDB...")
        
        try:
            if NXADB_AVAILABLE and nxadb is not None:
                if directed:
                    adb_graph = nxadb.DiGraph(  # type: ignore
                        name=name,
                        read_batch_size=read_batch_size,
                        read_parallelism=read_parallelism
                    )
                else:
                    adb_graph = nxadb.Graph(  # type: ignore
                        name=name,
                        read_batch_size=read_batch_size,
                        read_parallelism=read_parallelism
                    )

                print(f"✅ Graph loaded via nx-arangodb: {adb_graph.number_of_nodes()} nodes, {adb_graph.number_of_edges()} edges")
                return adb_graph

            if ARANGO_PY_AVAILABLE:
                client = ArangoClient(hosts=self.config.host)
                db = client.db(self.config.database_name, username=self.config.username, password=self.config.password)

                node_col = f"{name}_nodes"
                edge_col = f"{name}_edges"

                nx_graph = nx.DiGraph() if directed else nx.Graph()

                if db.has_collection(node_col):
                    for doc in db.collection(node_col).all():
                        key = doc.get("_key")
                        attrs = {k: v for k, v in doc.items() if not k.startswith("_")}
                        nx_graph.add_node(key, **attrs)

                if db.has_collection(edge_col):
                    for doc in db.collection(edge_col).all():
                        src = doc.get("_from").split('/')[-1]
                        tgt = doc.get("_to").split('/')[-1]
                        attrs = {k: v for k, v in doc.items() if not k.startswith("_")}
                        nx_graph.add_edge(src, tgt, **attrs)

                print(f"✅ Graph loaded via python-arango: {nx_graph.number_of_nodes()} nodes, {nx_graph.number_of_edges()} edges")
                return nx_graph

            raise RuntimeError("No ArangoDB backend available for loading graph")

        except Exception as e:
            print(f"❌ Failed to load graph: {e}")
            raise
    
    def convert_to_networkx(self, adb_graph: Any) -> Union[nx.Graph, nx.DiGraph]:
        """Convert ArangoDB graph to in-memory NetworkX graph"""
        print(f"🔄 Converting to NetworkX...")
        
        if hasattr(adb_graph, '__class__') and 'DiGraph' in adb_graph.__class__.__name__:
            nx_graph = nx.DiGraph(adb_graph)
        else:
            nx_graph = nx.Graph(adb_graph)
        
        print(f"✅ Converted: {nx_graph.number_of_nodes()} nodes, {nx_graph.number_of_edges()} edges")
        return nx_graph
