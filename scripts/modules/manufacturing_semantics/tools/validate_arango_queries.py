import os
import json
import requests


def pretty(obj):
    try:
        return json.dumps(obj, indent=2)
    except Exception:
        return str(obj)


def get(h, path):
    url = f"{h}{path}"
    r = requests.get(url)
    return r.json()


def post(h, path, payload):
    url = f"{h}{path}"
    r = requests.post(url, json=payload)
    return r.json()


def main():
    h = os.getenv('ARANGO_HOST', 'http://localhost:8529')
    db = os.getenv('DATABASE_NAME')
    prefix = f"/_db/{db}" if db else ""
    print('ARANGO HOST:', h)
    if db:
        print('DATABASE:', db)

    print('\n=== DB INFO ===')
    print(pretty(get(h, f'{prefix}/_api/database/current')))

    print('\n=== COLLECTIONS ===')
    print(pretty(get(h, f'{prefix}/_api/collection?excludeSystem=false')))

    print('\n=== NODES: TARGET KEYS ===')
    q = 'FOR d IN manufacturing_schema_nodes FILTER LOWER(d.label) IN ["material_non_conformance","financial_liability_ncm","production_defect"] RETURN d'
    print(pretty(post(h, f'{prefix}/_api/cursor', {'query': q})))

    print('\n=== NODES: STAGING REFS ===')
    q2 = 'FOR d IN manufacturing_schema_nodes FILTER CONTAINS(d.description, "stg_non_conformant_materials") OR CONTAINS(d.description, "stg_product_defects") RETURN d'
    print(pretty(post(h, f'{prefix}/_api/cursor', {'query': q2})))

    print('\n=== EDGES: CAN_MEAN ===')
    q3 = 'FOR e IN manufacturing_schema_edges FILTER e.relationship_type == "CAN_MEAN" RETURN e'
    print(pretty(post(h, f'{prefix}/_api/cursor', {'query': q3})))


if __name__ == '__main__':
    main()
