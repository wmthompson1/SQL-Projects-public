import networkx as nx
import pickle
import json
from pathlib import Path

root=Path('.').resolve()
inpath=root/'scripts'/'merged_graph_temp2.gpickle'
out=root/'scripts'/'merged_graph_temp2_simple.graphml'

with open(inpath,'rb') as f:
    G=pickle.load(f)

S=nx.Graph()

def norm(v):
    if v is None:
        return ''
    if isinstance(v,(str,int,float,bool)):
        return v
    try:
        return json.dumps(v, default=str, ensure_ascii=False)
    except Exception:
        return str(v)

for n,d in G.nodes(data=True):
    attrs={}
    for k,v in (d or {}).items():
        attrs[str(k)] = str(norm(v))
    S.add_node(n, **attrs)

for u,v,d in G.edges(data=True):
    attrs={}
    for k,val in (d or {}).items():
        attrs[str(k)] = str(norm(val))
    if S.has_edge(u,v):
        S[u][v].update(attrs)
    else:
        S.add_edge(u,v, **attrs)

nx.write_graphml(S, str(out))
print('Wrote', out, 'nodes=', S.number_of_nodes(), 'edges=', S.number_of_edges())
