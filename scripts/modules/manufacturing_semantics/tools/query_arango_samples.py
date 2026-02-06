#!/usr/bin/env python3
import requests, json, os

HOST = os.getenv('ARANGO_HOST', 'http://localhost:8529')
DB = os.getenv('DATABASE_NAME', 'networkx_graphs')

def list_collections():
    r = requests.get(f"{HOST}/_api/collection")
    print(json.dumps(r.json(), indent=2))

def sample_collection(col, limit=5):
    # Use AQL cursor to fetch documents (works reliably across Arango versions)
    payload = {"query": f"FOR d IN {col} LIMIT {limit} RETURN d"}
    r = requests.post(f"{HOST}/_db/{DB}/_api/cursor", json=payload)
    print(f"\nSample documents from {col}:")
    try:
        data = r.json()
    except Exception:
        print('Failed to parse JSON:', r.text)
        return
    print(json.dumps(data, indent=2)[:8000])

if __name__ == '__main__':
    print('ARANGO HOST:', HOST)
    print('DATABASE:', DB)
    list_collections()
    sample_collection('manufacturing_schema_nodes')
    sample_collection('manufacturing_schema_edges')
