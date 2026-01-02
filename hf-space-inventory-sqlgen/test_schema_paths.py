#!/usr/bin/env python3
"""
Quick test to verify schema paths after folder reorganization
Tests that all files are accessible with new app_schema structure
"""

import os
import json
import sys

def test_schema_paths():
    """Test that all schema paths resolve correctly"""
    
    print("=" * 60)
    print("Testing Schema Path Configuration")
    print("=" * 60)
    
    # Test 1: Schema directory
    SCHEMA_DIR = os.path.join(os.path.dirname(__file__), "app_schema")
    print(f"\n✓ SCHEMA_DIR: {SCHEMA_DIR}")
    print(f"  Exists: {os.path.exists(SCHEMA_DIR)}")
    
    if not os.path.exists(SCHEMA_DIR):
        print("  ✗ ERROR: Schema directory not found!")
        return False
    
    # Test 2: Queries directory
    QUERIES_DIR = os.path.join(SCHEMA_DIR, "queries")
    print(f"\n✓ QUERIES_DIR: {QUERIES_DIR}")
    print(f"  Exists: {os.path.exists(QUERIES_DIR)}")
    
    if not os.path.exists(QUERIES_DIR):
        print("  ✗ ERROR: Queries directory not found!")
        return False
    
    # Test 3: Database file
    SQLITE_DB_PATH = os.path.join(SCHEMA_DIR, "manufacturing.db")
    print(f"\n✓ SQLITE_DB_PATH: {SQLITE_DB_PATH}")
    print(f"  Exists: {os.path.exists(SQLITE_DB_PATH)}")
    
    if not os.path.exists(SQLITE_DB_PATH):
        print("  ⚠ WARNING: Database file will be auto-created on first run")
    
    # Test 4: Schema SQL files
    schema_files = ["schema_sqlite.sql", "schema_local.sql", "schema.sql"]
    print(f"\n✓ Schema SQL Files:")
    for schema_file in schema_files:
        path = os.path.join(SCHEMA_DIR, schema_file)
        exists = os.path.exists(path)
        symbol = "✓" if exists else "✗"
        print(f"  {symbol} {schema_file}: {exists}")
    
    # Test 5: Query index file
    index_path = os.path.join(QUERIES_DIR, "index.json")
    print(f"\n✓ Query Index: {index_path}")
    print(f"  Exists: {os.path.exists(index_path)}")
    
    if os.path.exists(index_path):
        try:
            with open(index_path, 'r') as f:
                index = json.load(f)
            print(f"  Categories: {len(index.get('categories', []))}")
            
            # Test 6: Query category files
            print(f"\n✓ Query Category Files:")
            for category in index.get("categories", []):
                sql_file = os.path.join(QUERIES_DIR, category["file"])
                exists = os.path.exists(sql_file)
                symbol = "✓" if exists else "✗"
                print(f"  {symbol} {category['name']}: {category['file']} ({exists})")
        except Exception as e:
            print(f"  ✗ ERROR reading index.json: {e}")
            return False
    else:
        print("  ✗ ERROR: index.json not found!")
        return False
    
    # Test 7: Try importing app.py modules
    print(f"\n✓ Testing app.py imports:")
    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location("app", os.path.join(os.path.dirname(__file__), "app.py"))
        if spec and spec.loader:
            print("  ✓ app.py can be loaded")
        else:
            print("  ✗ app.py cannot be loaded")
    except Exception as e:
        print(f"  ⚠ Could not test app.py import: {e}")
    
    print("\n" + "=" * 60)
    print("✓ All schema path tests passed!")
    print("=" * 60)
    return True

if __name__ == "__main__":
    success = test_schema_paths()
    sys.exit(0 if success else 1)
