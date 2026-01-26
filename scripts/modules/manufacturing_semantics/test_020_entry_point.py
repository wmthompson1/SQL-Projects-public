import os
import importlib.util
import pathlib
import networkx as nx
import pytest


def load_entry_point_module():
    path = pathlib.Path(__file__).parent / "020_Entry_Point_ArangoDB_Graph_Persistence.py"
    spec = importlib.util.spec_from_file_location("ep20", str(path))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def test_persist_and_load_sample_graph():
    """Persist a tiny graph to Arango and load it back (integration).

    Runs against the Arango instance configured by environment variables.
    Requires a reachable Arango DB and `nx-arangodb` installed in the test
    environment. The test uses non-root `test_user` and `ncm_test_db` by default.
    """
    mod = load_entry_point_module()

    if not getattr(mod, "NXADB_AVAILABLE", False):
        pytest.skip("nx-arangodb not installed in test environment")

    # Prepare connection info (use env vars if present)
    host = os.getenv("DATABASE_HOST", "http://127.0.0.1:8529")
    user = os.getenv("DATABASE_USERNAME", os.getenv("ARANGO_USER", "test_user"))
    password = os.getenv("DATABASE_PASSWORD", os.getenv("ARANGO_PASSWORD", "test_pass"))
    db_name = os.getenv("DATABASE_NAME", os.getenv("ARANGO_DB", "ncm_test_db"))

    config = mod.ArangoDBConfig(host=host, username=user, password=password, database_name=db_name)

    # Create persistence helper and run persist/load
    persistence = mod.ArangoDBGraphPersistence(config)

    G = nx.DiGraph()
    G.add_node("A", label="alpha")
    G.add_node("B", label="beta")
    G.add_edge("A", "B", relation="connects")

    name = "pytest_ep20_test"

    # Ensure clean state: drop existing collections for this graph if present
    try:
        from arango import ArangoClient
        client = ArangoClient(hosts=[host])
        db = client.db(db_name, username=user, password=password)
        node_col = f"{name}_node"
        edge_col = f"{name}_node_to_{name}_node"
        if db.has_collection(edge_col):
            db.delete_collection(edge_col)
        if db.has_collection(node_col):
            db.delete_collection(node_col)
    except Exception:
        # If cleanup fails, continue — persistence may still use overwrite
        pass

    # Persist with overwrite to ensure idempotency
    adb_graph = persistence.persist_graph(G, name=name, write_batch_size=1000, overwrite=True)

    loaded = persistence.load_graph(name=name, directed=True)

    assert loaded.number_of_nodes() == 2
    assert loaded.number_of_edges() == 1
