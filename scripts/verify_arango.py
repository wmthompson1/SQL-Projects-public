from arango import ArangoClient

c = ArangoClient(hosts='http://127.0.0.1:8529')
# adjust username/password if needed
try:
    db = c.db('manufacturing_graph', username='root', password='')
except Exception as e:
    print('ERROR connecting to ArangoDB:', e)
    raise

vcoll = 'manufacturing_semantic_layer_node'
edge_coll = 'manufacturing_graph_edges'

print('Vertex collection exists:', db.has_collection(vcoll))
print('Vertex count:', db.collection(vcoll).count() if db.has_collection(vcoll) else 0)
print('Edge collection exists:', db.has_collection(edge_coll))
print('Edge count:', db.collection(edge_coll).count() if db.has_collection(edge_coll) else 0)

if db.has_collection(edge_coll):
    print('\nSample edges (up to 5):')
    try:
        cursor = db.aql.execute(f"FOR e IN {edge_coll} LIMIT 5 RETURN e")
        for e in cursor:
            print(e)
    except Exception as e:
        print('Could not fetch sample edges:', e)
