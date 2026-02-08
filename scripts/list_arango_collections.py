from arango import ArangoClient
c = ArangoClient(hosts='http://127.0.0.1:8529')
db = c.db('manufacturing_graph', username='root', password='')
print('Collections in manufacturing_graph:')
for coll in db.collections():
    try:
        print('-', coll.name)
    except Exception:
        pass
