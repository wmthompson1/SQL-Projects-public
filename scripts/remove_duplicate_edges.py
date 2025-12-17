from arango import ArangoClient
from collections import defaultdict

client = ArangoClient(hosts='http://127.0.0.1:8529')
db = client.db('manufacturing_graph', username='root', password='Se206attle_rocks')
col = db.collection('edges')

pairs = defaultdict(list)
for doc in col.all():
    pairs[(doc['_from'], doc['_to'])].append(doc)

deleted = 0
for (fr,to), docs in pairs.items():
    if len(docs) > 1:
        # keep the first, delete the rest
        keep = docs[0]
        for d in docs[1:]:
            key = d.get('_key')
            try:
                col.delete(key)
                deleted += 1
                print('deleted', key, 'for pair', fr, '->', to)
            except Exception as e:
                print('failed to delete', key, e)

print('total deleted:', deleted)
