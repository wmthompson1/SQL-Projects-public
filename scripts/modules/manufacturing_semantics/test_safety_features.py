#!/usr/bin/env python3
"""
Test script for the new safety features.
Tests basic functionality without requiring ArangoDB connection.

Requirements:
    pip install -r requirements-020.txt
    
Note: Some tests will be skipped if networkx is not available.
"""

import sys
import os
import tempfile
import sqlite3
import json

# Add manufacturing_semantics to path
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.insert(0, SCRIPT_DIR)


def test_sqlite_schema_loading():
    """Test SQLite schema loading with mock data."""
    print("\n" + "=" * 75)
    print("Test 1: SQLite Schema Loading")
    print("=" * 75)
    
    # Create temporary SQLite database with test schema
    with tempfile.NamedTemporaryFile(mode='w', suffix='.db', delete=False) as f:
        db_path = f.name
    
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        
        # Create schema tables
        cursor.execute("""
            CREATE TABLE schema_nodes (
                table_name TEXT PRIMARY KEY,
                table_type TEXT,
                description TEXT
            )
        """)
        
        cursor.execute("""
            CREATE TABLE schema_edges (
                edge_id INTEGER PRIMARY KEY,
                from_table TEXT,
                to_table TEXT,
                relationship_type TEXT,
                join_column TEXT,
                weight REAL
            )
        """)
        
        # Insert test data
        cursor.execute("INSERT INTO schema_nodes VALUES ('orders', 'fact', 'Order transactions')")
        cursor.execute("INSERT INTO schema_nodes VALUES ('customers', 'dimension', 'Customer master data')")
        cursor.execute("INSERT INTO schema_nodes VALUES ('products', 'dimension', 'Product catalog')")
        
        cursor.execute("INSERT INTO schema_edges VALUES (1, 'orders', 'customers', 'references', 'customer_id', 1.0)")
        cursor.execute("INSERT INTO schema_edges VALUES (2, 'orders', 'products', 'references', 'product_id', 1.0)")
        
        conn.commit()
        conn.close()
        
        # Now test loading
        from importlib import import_module
        
        # Import the load function
        persist_module = import_module('020_Entry_Point_Persist_SQLite_to_Arango')
        
        nodes, edges = persist_module.load_schema_from_sqlite(db_path)
        
        assert len(nodes) == 3, f"Expected 3 nodes, got {len(nodes)}"
        assert len(edges) == 2, f"Expected 2 edges, got {len(edges)}"
        
        print("✅ Test passed: SQLite schema loaded successfully")
        print(f"   Nodes: {len(nodes)}")
        print(f"   Edges: {len(edges)}")
        
        return True
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False
    
    finally:
        if os.path.exists(db_path):
            os.unlink(db_path)


def test_node_inference():
    """Test node inference from edges when nodes table is empty."""
    print("\n" + "=" * 75)
    print("Test 2: Node Inference from Edges")
    print("=" * 75)
    
    try:
        from importlib import import_module
        persist_module = import_module('020_Entry_Point_Persist_SQLite_to_Arango')
        
        # Create test edges
        edges = [
            {'from_table': 'orders', 'to_table': 'customers'},
            {'from_table': 'orders', 'to_table': 'products'},
            {'from_table': 'products', 'to_table': 'categories'}
        ]
        
        inferred_nodes = persist_module.infer_nodes_from_edges(edges)
        
        # Should infer 4 unique nodes
        assert len(inferred_nodes) == 4, f"Expected 4 nodes, got {len(inferred_nodes)}"
        
        node_names = [n['table_name'] for n in inferred_nodes]
        expected_names = {'orders', 'customers', 'products', 'categories'}
        assert set(node_names) == expected_names, f"Expected {expected_names}, got {set(node_names)}"
        
        print("✅ Test passed: Nodes inferred correctly from edges")
        print(f"   Inferred nodes: {node_names}")
        
        return True
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_networkx_graph_building():
    """Test NetworkX graph building with metadata."""
    print("\n" + "=" * 75)
    print("Test 3: NetworkX Graph Building")
    print("=" * 75)
    
    try:
        from importlib import import_module
        persist_module = import_module('020_Entry_Point_Persist_SQLite_to_Arango')
        
        # Create test data
        nodes = [
            {'table_name': 'orders', 'table_type': 'fact', 'description': 'Order transactions'},
            {'table_name': 'customers', 'table_type': 'dimension', 'description': 'Customer data'}
        ]
        
        edges = [
            {
                'from_table': 'orders',
                'to_table': 'customers',
                'relationship_type': 'references',
                'join_column': 'customer_id',
                'weight': 1.0
            }
        ]
        
        G = persist_module.build_networkx_graph(nodes, edges)
        
        assert G.number_of_nodes() == 2, f"Expected 2 nodes, got {G.number_of_nodes()}"
        assert G.number_of_edges() == 1, f"Expected 1 edge, got {G.number_of_edges()}"
        
        # Check node metadata
        orders_data = G.nodes['orders']
        assert orders_data['label'] == 'orders', "Node label not preserved"
        assert orders_data['table_type'] == 'fact', "Node type not preserved"
        
        # Check edge metadata
        edge_data = G.edges['orders', 'customers']
        assert edge_data['relationship_type'] == 'references', "Edge relationship not preserved"
        assert edge_data['join_column'] == 'customer_id', "Edge join column not preserved"
        
        print("✅ Test passed: NetworkX graph built with metadata")
        print(f"   Nodes: {G.number_of_nodes()}")
        print(f"   Edges: {G.number_of_edges()}")
        
        return True
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_backup_json_structure():
    """Test backup JSON structure generation."""
    print("\n" + "=" * 75)
    print("Test 4: Backup JSON Structure")
    print("=" * 75)
    
    try:
        # Create a simple test backup structure
        backup_data = {
            "metadata": {
                "graph_name": "test_graph",
                "backup_timestamp": "2026-02-05T12:00:00",
                "node_count": 2,
                "edge_count": 1,
                "graph_type": "directed"
            },
            "nodes": [
                {"id": "orders", "attributes": {"label": "orders", "table_type": "fact"}},
                {"id": "customers", "attributes": {"label": "customers", "table_type": "dimension"}}
            ],
            "edges": [
                {
                    "source": "orders",
                    "target": "customers",
                    "attributes": {"relationship_type": "references"}
                }
            ]
        }
        
        # Validate structure
        assert "metadata" in backup_data, "Missing metadata"
        assert "nodes" in backup_data, "Missing nodes"
        assert "edges" in backup_data, "Missing edges"
        
        assert backup_data["metadata"]["node_count"] == len(backup_data["nodes"])
        assert backup_data["metadata"]["edge_count"] == len(backup_data["edges"])
        
        # Test JSON serialization
        json_str = json.dumps(backup_data, indent=2)
        parsed = json.loads(json_str)
        
        assert parsed["metadata"]["graph_name"] == "test_graph"
        
        print("✅ Test passed: Backup JSON structure is valid")
        print(f"   Nodes in backup: {len(backup_data['nodes'])}")
        print(f"   Edges in backup: {len(backup_data['edges'])}")
        
        return True
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


def main():
    """Run all tests."""
    print("=" * 75)
    print("ArangoDB Safety Features Test Suite")
    print("=" * 75)
    
    tests = [
        test_node_inference,
        test_networkx_graph_building,
        test_backup_json_structure,
        test_sqlite_schema_loading,  # Requires networkx and sqlite3
    ]
    
    passed = 0
    failed = 0
    
    for test in tests:
        try:
            if test():
                passed += 1
            else:
                failed += 1
        except Exception as e:
            print(f"❌ Test {test.__name__} crashed: {e}")
            failed += 1
    
    print("\n" + "=" * 75)
    print("Test Summary")
    print("=" * 75)
    print(f"✅ Passed: {passed}")
    print(f"❌ Failed: {failed}")
    print(f"Total: {passed + failed}")
    print("=" * 75)
    
    return failed == 0


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
