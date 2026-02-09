from arango import ArangoClient

c = ArangoClient(hosts='http://127.0.0.1:8529')
db = c.db('manufacturing_graph', username='root', password='')
edge_coll = 'manufacturing_semantic_layer_edges'

print('Edge collection:', edge_coll)

# Counts by edge_type
query = f"FOR e IN {edge_coll} COLLECT t = e.edge_type WITH COUNT INTO cnt RETURN {{edge_type: t, count: cnt}}"
res = db.aql.execute(query)
print('\nCounts by edge_type:')
for r in res:
    print(' -', r)

# Distinct edge types
query2 = f"FOR e IN {edge_coll} COLLECT t = e.edge_type RETURN t"
print('\nDistinct edge types:')
print(list(db.aql.execute(query2)))

# Sample CAN_MEAN edges
print('\nSample CAN_MEAN edges (up to 10):')
try:
    q = f"FOR e IN {edge_coll} FILTER e.edge_type == 'CAN_MEAN' LIMIT 10 RETURN {{_from: e._from, _to: e._to, attrs: e}}"
    for e in db.aql.execute(q):
        print(' -', e['_from'], '->', e['_to'])
except Exception as ex:
    print('Error fetching CAN_MEAN samples:', ex)
