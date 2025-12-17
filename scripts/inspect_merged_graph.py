import pickle, collections, os
HERE = os.path.dirname(os.path.abspath(__file__))
p = os.path.join(HERE, 'merged_graph_temp2_clean.gpickle')
with open(p,'rb') as fh:
    g=pickle.load(fh)
print('graph type:', type(g))
try:
    print('is multigraph:', g.is_multigraph())
except Exception as e:
    print('is_multigraph check failed:', e)
print('nodes:', g.number_of_nodes(), 'edges_total:', g.number_of_edges())
# count directed/undirected pairs consistently
pair_counts=collections.Counter()
if getattr(g,'is_multigraph') and g.is_multigraph():
    for u,v,key,data in g.edges(keys=True,data=True):
        pair=(u,v)
        pair_counts[pair]+=1
else:
    for u,v,data in g.edges(data=True):
        pair=(u,v)
        pair_counts[pair]+=1
# show pairs with count>1
dups=[(pair,c) for pair,c in pair_counts.items() if c>1]
print('duplicate edge pairs (count>1):')
if not dups:
    print(' none')
else:
    for pair,c in sorted(dups,key=lambda x:-x[1]):
        print(pair, 'count=', c)

print('\nAll edges (showing attrs):')
if getattr(g,'is_multigraph') and g.is_multigraph():
    for u,v,k,d in g.edges(keys=True,data=True):
        print(u,'->',v,' key=',k,' attrs=',d)
else:
    for u,v,d in g.edges(data=True):
        print(u,'->',v,' attrs=',d)
