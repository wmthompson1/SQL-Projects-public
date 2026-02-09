import os
import sys
from arango import ArangoClient


def get_connection():
    endpoint = os.environ.get('ARANGO_ENDPOINT') or os.environ.get('ARANGO_HOST', 'http://127.0.0.1:8529')
    if not endpoint.startswith('http'):
        endpoint = f'http://{endpoint}'
    db_name = os.environ.get('ARANGO_DB', 'manufacturing_graph')
    user = os.environ.get('ARANGO_USER')
    pw = os.environ.get('ARANGO_PASSWORD')
    client = ArangoClient(hosts=endpoint)
    try:
        if user and pw:
            db = client.db(db_name, username=user, password=pw)
        else:
            db = client.db(db_name)
        return db
    except Exception as e:
        print('ERROR connecting to ArangoDB:', e)
        sys.exit(2)


def main():
    db = get_connection()
    vcoll = os.environ.get('ARANGO_VERTEX_COLLECTION', 'manufacturing_semantic_layer_node')
    edge_coll = os.environ.get('ARANGO_EDGE_COLLECTION', 'manufacturing_semantic_layer_edges')

    print('Vertex collection exists:', db.has_collection(vcoll))
    print('Vertex count:', db.collection(vcoll).count() if db.has_collection(vcoll) else 0)
    print('Edge collection exists:', db.has_collection(edge_coll))
    print('Edge count:', db.collection(edge_coll).count() if db.has_collection(edge_coll) else 0)

    if db.has_collection(edge_coll):
        print('\nSample CAN_MEAN edges (up to 5):')
        try:
            cursor = db.aql.execute(
                f"FOR e IN {edge_coll} FILTER e.edge_type == 'CAN_MEAN' LIMIT 5 RETURN {{_from: e._from, _to: e._to}}"
            )
            found = False
            for e in cursor:
                print(e)
                found = True
            if not found:
                print('  (no CAN_MEAN edges found in', edge_coll + ')')
        except Exception as e:
            print('Could not fetch sample edges:', e)


if __name__ == '__main__':
    main()
