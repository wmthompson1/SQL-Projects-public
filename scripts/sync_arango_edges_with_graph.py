import pickle
from arango import ArangoClient

# Load current graph expected pairs
with open('merged_graph_temp2_clean.gpickle' if False else 'scripts/merged_graph_temp2_clean.gpickle','rb') as fh:
    g = pickle.load(fh)
expected_pairs = set()
if getattr(g,'is_multigraph') and g.is_multigraph():
    for u,v,k,d in g.edges(keys=True,data=True):
        expected_pairs.add((f'nodes/{u}', f'nodes/{v}'))
else:
    for u,v,d in g.edges(data=True):
        expected_pairs.add((f'nodes/{u}', f'nodes/{v}'))

print('expected edge pairs count:', len(expected_pairs))

# Connect to Arango and remove edges not in expected_pairs
client = ArangoClient(hosts='http://127.0.0.1:8529')
db = client.db('manufacturing_graph', username='root', password='Se206attle_rocks')
col = db.collection('edges')

removed = 0
for doc in list(col.all()):
    pair = (doc.get('_from'), doc.get('_to'))
    if pair not in expected_pairs:
        try:
            col.delete(doc.get('_key'))
            removed += 1
            print('removed extra edge', doc.get('_key'), pair)
        except Exception as e:
            print('failed to remove', doc.get('_key'), e)

print('total removed:', removed)
