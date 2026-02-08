def main():
    """Main entry point."""
    import os
    from arangodb_helpers.graph_builder import ArangoGraphPersistence
    
    # Environment variables
    arango_host = os.getenv("ARANGO_HOST", "localhost")
    arango_port = int(os.getenv("ARANGO_PORT", "8529"))
    arango_db = os.getenv("ARANGO_DB", "manufacturing_schema")
    sqlite_path = os.getenv("SQLITE_PATH", "hf-space-inventory-sqlgen/app_schema/manufacturing.db")
    
    print(f"Connecting to SQLite: {sqlite_path}")
    conn = sqlite3.connect(sqlite_path)
    conn.row_factory = sqlite3.Row
    
    print(f"Loading semantic graph from SQLite...")
    G = load_semantic_graph_with_elevations(conn)
    conn.close()
    
    print_graph_stats(G)
    
    print(f"\nPersisting graph to ArangoDB at {arango_host}:{arango_port}...")
    persistence = ArangoGraphPersistence(arango_host, arango_port, arango_db)
    persistence.persist_graph(G, "manufacturing_graph")
    
    print("\n✅ Graph successfully persisted to ArangoDB")
    print(f"   Database: {arango_db}")
    print(f"   Web UI: http://{arango_host}:{arango_port}")
    print(f"   Collections: manufacturing_semantic_layer_node, manufacturing_graph_edges")

if __name__ == "__main__":
    main()
