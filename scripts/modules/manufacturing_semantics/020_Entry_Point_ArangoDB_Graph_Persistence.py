"""
020_Entry_Point_ArangoDB_Graph_Persistence.py
ArangoDB Graph Persistence for NetworkX

Based on NVIDIA Developer Blog:
"Accelerated, Production-Ready Graph Analytics for NetworkX Users"
https://developer.nvidia.com/blog/accelerated-production-ready-graph-analytics-for-networkx-users/

Demonstrates production-ready graph persistence using nx-arangodb:
- Persist NetworkX graphs to ArangoDB
- Load graphs from ArangoDB in new sessions
- Collaborative graph analytics with shared persistence layer
- Integration with Entry Point 018 (Structured RAG) and 019 (NetworkX patterns)
"""

import os
from typing import Optional, Dict, Any
import json

try:
    from arango import ArangoClient
    ARANGO_AVAILABLE = True
except Exception:
    ArangoClient = None  # type: ignore
    ARANGO_AVAILABLE = False
    print("⚠️  python-arango not available. Install with: pip install python-arango")


class ArangoDBConfig:
    """
    Configuration manager for ArangoDB connection
    
    Best practices from NVIDIA blog:
    - Use environment variables for credentials
    - Support both cloud and self-hosted ArangoDB
    - Configurable batch sizes for optimal performance
    """
    
    def __init__(
        self,
        host: Optional[str] = None,
        username: Optional[str] = None,
        password: Optional[str] = None,
        database_name: Optional[str] = None
    ):
        """
        Initialize ArangoDB configuration
        
        Args:
            host: ArangoDB host URL (default: env DATABASE_HOST)
            username: Database username (default: env DATABASE_USERNAME)
            password: Database password (default: env DATABASE_PASSWORD)
            database_name: Database name (default: env DATABASE_NAME or 'networkx_graphs')
        """
        self.host = host or os.getenv("DATABASE_HOST", "http://localhost:8529")
        self.username = username or os.getenv("DATABASE_USERNAME", "root")
        self.password = password or os.getenv("DATABASE_PASSWORD", "")
        self.database_name = database_name or os.getenv("DATABASE_NAME", "networkx_graphs")
    
    def set_environment_variables(self):
        """Set environment variables for nx-arangodb"""
        os.environ["DATABASE_HOST"] = self.host
        os.environ["DATABASE_USERNAME"] = self.username
        os.environ["DATABASE_PASSWORD"] = self.password
        os.environ["DATABASE_NAME"] = self.database_name
    
    def get_connection_info(self) -> Dict[str, str]:
        """Get connection information (safe for logging)"""
        return {
            "host": self.host,
            "username": self.username,
            "database_name": self.database_name,
            "password": "***" if self.password else "Not set"
        }


class ArangoDBGraphPersistence:
    """
    Utility class for persisting NetworkX graphs to ArangoDB
    
    Pattern from NVIDIA blog:
    1. Create NetworkX graph locally
    2. Persist to ArangoDB with nxadb.DiGraph/Graph
    3. Re-instantiate from ArangoDB in new sessions
    4. Run algorithms on persisted graphs
    """
    
    def __init__(self, config: Optional[ArangoDBConfig] = None):
        """
        Initialize with ArangoDB configuration
        
        Args:
            config: ArangoDBConfig instance (creates default if None)
        """
        if not ARANGO_AVAILABLE:
            raise ImportError("python-arango package required. Install: pip install python-arango")

        self.config = config or ArangoDBConfig()
        self.config.set_environment_variables()
        # initialize client lazily
        self._client = None
    
    def persist_graph(
        self,
        graph: Dict[str, Any],
        name: str,
        write_batch_size: int = 50000,
        overwrite: bool = False
    ) -> Dict[str, Any]:
        """
        Persist NetworkX graph to ArangoDB
        
        Pattern from NVIDIA blog (Step 3):
        ```python
        G_nxadb = nxadb.DiGraph(
            name="cit_patents",
            incoming_graph_data=G_nx,
            write_batch_size=50000
        )
        ```
        
        Args:
            graph: NetworkX Graph or DiGraph to persist
            name: Unique name for the graph in ArangoDB
            write_batch_size: Batch size for write operations (default: 50000)
            overwrite: Whether to overwrite existing graph with same name
        
        Returns:
            nx-arangodb Graph or DiGraph instance
        """
        """
        Persist a generic graph to ArangoDB using python-arango.

        The `graph` argument is expected to be a dict with two keys:
          - 'nodes': list of dicts (documents) to upsert into a node collection
          - 'edges': list of dicts with `_from` and `_to` arango document ids to insert into an edge collection

        Example:
          graph = {
              'nodes': [{'key': 'A', 'label': 'alpha'}, ...],
              'edges': [{'_from': 'nodes/A', '_to': 'nodes/B', 'relation': 'connects'}, ...]
          }
        """
        print(f"📤 Persisting graph '{name}' to ArangoDB (python-arango)...")
        print(f"   Nodes: {len(graph.get('nodes', []))}")
        print(f"   Edges: {len(graph.get('edges', []))}")

        # setup client and DB
        client = ArangoClient(hosts=[self.config.host])
        # create DB if missing and user is root (best-effort)
        try:
            if self.config.username == 'root':
                if self.config.database_name not in client.databases():
                    client.create_database(self.config.database_name)
        except Exception:
            # ignore permission issues
            pass

        db = client.db(self.config.database_name, username=self.config.username, password=self.config.password)

        # collections names
        node_coll = f"{name}_nodes"
        edge_coll = f"{name}_edges"

        # ensure collections
        if not db.has_collection(node_coll):
            db.create_collection(node_coll)
        if not db.has_collection(edge_coll):
            db.create_collection(edge_coll, edge=True)

        # create or ensure graph
        graph_name = name
        try:
            if graph_name not in db.graphs():
                db.create_graph(graph_name, edge_definitions=[{
                    'edge_collection': edge_coll,
                    'from_vertex_collections': [node_coll],
                    'to_vertex_collections': [node_coll]
                }])
        except Exception:
            # ignore if graph already exists or cannot be created
            pass

        # insert nodes (upsert by _key if provided)
        nodes = graph.get('nodes', [])
        if nodes:
            # convert node dicts to documents with _key when present
            docs = []
            for n in nodes:
                doc = dict(n)
                if 'key' in doc and '_key' not in doc:
                    doc['_key'] = doc.pop('key')
                docs.append(doc)
            col = db.collection(node_coll)
            # upsert: first try insert_many, on conflict replace via update
            for d in docs:
                try:
                    col.insert(d)
                except Exception:
                    try:
                        # attempt update by _key
                        key = d.get('_key')
                        if key:
                            col.replace(key, d)
                    except Exception:
                        pass

        # insert edges
        edges = graph.get('edges', [])
        if edges:
            ecol = db.collection(edge_coll)
            for e in edges:
                try:
                    ecol.insert(e)
                except Exception:
                    pass

        print(f"✅ Persisted graph '{name}' to ArangoDB (collections: {node_coll}, {edge_coll})")
        return {'node_collection': node_coll, 'edge_collection': edge_coll, 'graph': graph_name}
    
    def load_graph(
        self,
        name: str,
        read_batch_size: int = 50000,
        read_parallelism: int = 4
    ) -> Dict[str, Any]:
        """
        Load persisted graph from ArangoDB
        
        Pattern from NVIDIA blog (Step 4):
        ```python
        G_nxadb = nxadb.DiGraph(
            name="cit_patents",
            read_batch_size=100000,
            read_parallelism=10
        )
        ```
        
        Args:
            name: Name of the graph in ArangoDB
            directed: Whether to load as DiGraph (True) or Graph (False)
            read_batch_size: Batch size for read operations (default: 50000)
            read_parallelism: Parallelism level for reads (default: 4)
        
        Returns:
            nx-arangodb Graph or DiGraph instance
        """
        print(f"📥 Loading graph '{name}' from ArangoDB (python-arango)...")

        client = ArangoClient(hosts=[self.config.host])
        db = client.db(self.config.database_name, username=self.config.username, password=self.config.password)

        node_coll = f"{name}_nodes"
        edge_coll = f"{name}_edges"

        result = {'nodes': [], 'edges': []}
        if db.has_collection(node_coll):
            for doc in db.collection(node_coll).all():
                result['nodes'].append(doc)
        if db.has_collection(edge_coll):
            for doc in db.collection(edge_coll).all():
                result['edges'].append(doc)

        print(f"✅ Loaded: nodes={len(result['nodes'])}, edges={len(result['edges'])}")
        return result
    
    def convert_to_dict(self, persisted: Dict[str, Any]) -> Dict[str, Any]:
        """
        Return the dictionary representation of a persisted graph (nodes+edges).
        """
        return persisted


def demo_arangodb_persistence_local():
    """
    Demonstration using local NetworkX graphs (no ArangoDB connection required)
    
    Shows the pattern and code structure for when ArangoDB is available
    """
    print("🧪 ArangoDB Graph Persistence Demo (Local Mode)")
    print("=" * 75)
    
    print("\n📋 SETUP INSTRUCTIONS:")
    print("To use ArangoDB persistence, you need:")
    print("1. ArangoDB instance (ArangoGraph Cloud or self-hosted)")
    print("2. Set environment variables:")
    print("   - DATABASE_HOST (e.g., https://your-instance.arangodb.cloud:8529)")
    print("   - DATABASE_USERNAME (e.g., root)")
    print("   - DATABASE_PASSWORD (your password)")
    print("   - DATABASE_NAME (e.g., manufacturing_graphs)")
    print("3. Install: pip install nx-arangodb")
    
    if not NXADB_AVAILABLE:
        print("\n⚠️  nx-arangodb not installed. Showing code patterns only.")
        print("\n📝 PATTERN 1: Persist Entry Point 018 Schema Graph")
        print("""
# Load schema graph from database (Entry Point 018)
from 018_Entry_Point_Structured_RAG_Graph import SchemaGraphManager

manager = SchemaGraphManager()
schema_graph = manager.build_graph_from_database()

# Persist to ArangoDB
config = ArangoDBConfig(
    host="https://your-instance.arangodb.cloud:8529",
    username="root",
    password="your-password",
    database_name="manufacturing_graphs"
)

persistence = ArangoDBGraphPersistence(config)
adb_graph = persistence.persist_graph(
    graph=schema_graph,
    name="manufacturing_schema_v1",
    write_batch_size=50000
)

# New session - load from ArangoDB
adb_graph = persistence.load_graph(
    name="manufacturing_schema_v1",
    directed=True
)

# Run shortest path on persisted graph
path = nx.shortest_path(adb_graph, "equipment", "supplier")
print(f"Join path: {' → '.join(path)}")
        """)
        
        print("\n📝 PATTERN 2: Persist Entry Point 019 Manufacturing Networks")
        print("""
# Create manufacturing network (Entry Point 019)
from 019_Entry_Point_NetworkX_Graph_Patterns import ManufacturingNetworkBuilder

builder = ManufacturingNetworkBuilder()
supply_chain = builder.create_directed_supply_chain()

# Persist to ArangoDB
persistence = ArangoDBGraphPersistence(config)
adb_graph = persistence.persist_graph(
    graph=supply_chain,
    name="supply_chain_2025_q1",
    write_batch_size=10000
)

# Team member can now load and analyze
adb_graph = persistence.load_graph("supply_chain_2025_q1")
centrality = nx.degree_centrality(adb_graph)
print(f"Most connected: {max(centrality.items(), key=lambda x: x[1])}")
        """)
        
        print("\n📝 PATTERN 3: GPU-Accelerated Analysis with cuGraph")
        print("""
# Load large graph from ArangoDB
adb_graph = persistence.load_graph(
    name="large_manufacturing_network",
    read_batch_size=100000,
    read_parallelism=10
)

# Run GPU-accelerated algorithm (if NVIDIA GPU available)
result = nx.betweenness_centrality(
    adb_graph,
    k=100,
    backend="cugraph"  # Uses GPU acceleration
)

# Save results back to ArangoDB
for node, score in result.items():
    adb_graph.nodes[node]['betweenness'] = score
        """)
        
        print("\n🎯 Key Benefits from NVIDIA Blog:")
        print("   ✓ 3x faster session loading (data persisted in ArangoDB)")
        print("   ✓ 11-600x speedup with GPU acceleration (nx-cugraph)")
        print("   ✓ Collaborative graph analytics (shared persistence layer)")
        print("   ✓ Scalability across multiple nodes (ArangoDB clustering)")
        print("   ✓ Zero code changes for NetworkX users")
    
    else:
        print("\n✅ nx-arangodb is installed!")

        # Prefer explicit DATABASE_* env vars, fall back to ARANGO_* if present
        host = os.getenv("DATABASE_HOST") or os.getenv("ARANGO_HOST")
        username = os.getenv("DATABASE_USERNAME") or os.getenv("ARANGO_USER")
        password = os.getenv("DATABASE_PASSWORD") or os.getenv("ARANGO_PASSWORD")
        database_name = os.getenv("DATABASE_NAME") or os.getenv("ARANGO_DB") or "networkx_graphs"

        if not (host and username and password):
            print("⚠️  No ArangoDB connection configured.")
            print("Set DATABASE_HOST, DATABASE_USERNAME, DATABASE_PASSWORD, DATABASE_NAME")
            print("to enable persistence features.")
        else:
            print("🔌 Attempting ArangoDB connection test...")
            print(f"   Host: {host}")
            print(f"   Username: {username}")
            print(f"   Database: {database_name}")

            # Simple connection test using python-arango if available, else skip test
            try:
                from arango import ArangoClient
                client = ArangoClient(hosts=[host])
                # try to obtain the database handle (will raise on auth failure)
                try:
                    db = client.db(database_name, username=username, password=password)
                    print(f"✅ Connected to ArangoDB database '{database_name}'")
                except Exception:
                    # Database may not exist yet; try to create it (requires root)
                    try:
                        if username == 'root':
                            if not client.databases():
                                # If client.databases() works, proceed normally
                                pass
                        if database_name not in client.databases():
                            client.create_database(database_name)
                            print(f"🔧 Created database '{database_name}'")
                        db = client.db(database_name, username=username, password=password)
                        print(f"✅ Connected to ArangoDB database '{database_name}' after creation")
                    except Exception as e:
                        print(f"❌ ArangoDB connection/create failed: {e}")
                        db = None
            except Exception:
                db = None

            # If we have a reachable DB and nx-arangodb, run a tiny persistence demo
            if db is not None:
                try:
                    config = ArangoDBConfig(host=host, username=username, password=password, database_name=database_name)
                    persistence = ArangoDBGraphPersistence(config)

                    # tiny sample graph
                    G = nx.DiGraph()
                    G.add_node("A", label="alpha")
                    G.add_node("B", label="beta")
                    G.add_edge("A", "B", relation="connects")

                    name = "sample_persistence_test"
                    print(f"📤 Persisting sample graph '{name}' to ArangoDB (overwrite=True)...")
                    adb_graph = persistence.persist_graph(G, name=name, write_batch_size=1000, overwrite=True)

                    print("📥 Loading back the persisted graph to verify...")
                    loaded = persistence.load_graph(name=name, directed=True)
                    print(f"✅ Verification: nodes={loaded.number_of_nodes()}, edges={loaded.number_of_edges()}")
                except Exception as e:
                    print(f"❌ Persistence demo failed: {e}")
            else:
                print("⚠️  Skipping persistence demo due to failed DB connectivity or missing python-arango")
    
    print(f"\n{'=' * 75}")
    print("📖 Reference: NVIDIA Developer Blog")
    print("🔗 https://developer.nvidia.com/blog/accelerated-production-ready-graph-analytics-for-networkx-users/")
    
    return True


def demo_integration_with_entry_points():
    """
    Show how Entry Point 020 integrates with Entry Points 018 and 019
    """
    print("\n\n🔗 Integration with Previous Entry Points")
    print("=" * 75)
    
    print("\n📊 Entry Point 018: Structured RAG Graph → ArangoDB")
    print("   Use case: Persist database schema graph for team collaboration")
    print("   Pattern: Load from PostgreSQL → Persist to ArangoDB → Share with team")
    print("   Benefit: Deterministic join pathfinding available to all team members")
    
    print("\n📊 Entry Point 019: NetworkX Patterns → ArangoDB")
    print("   Use case: Persist manufacturing networks (equipment, supply chain)")
    print("   Pattern: Build network locally → Persist to ArangoDB → Analyze in new sessions")
    print("   Benefit: 3x faster loading, collaborative analytics")
    
    print("\n🎯 Production-Ready Architecture:")
    print("   1. Local development: NetworkX (Entry Points 018, 019)")
    print("   2. Persistence layer: ArangoDB (Entry Point 020)")
    print("   3. Acceleration layer: cuGraph + GPU (NVIDIA pattern)")
    print("   4. Result: Scalable, collaborative, GPU-accelerated graph analytics")
    
    return True


if __name__ == "__main__":
    # Run demonstrations
    demo_arangodb_persistence_local()
    demo_integration_with_entry_points()
