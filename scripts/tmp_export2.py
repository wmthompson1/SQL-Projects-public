import networkx as nx
import pickle
from pathlib import Path

root = Path('.').resolve()
merged = root / 'scripts' / 'merged_graph_temp2.gpickle'
out_graphml = root / 'scripts' / 'merged_graph_temp2.graphml'
out_dot = root / 'scripts' / 'merged_graph_temp2.dot'

with open(merged,'rb') as f:
    G = pickle.load(f)
print('Loaded merged:', merged, 'nodes=', G.number_of_nodes(), 'edges=', G.number_of_edges())

# simple conversion
S = nx.Graph()
for n,d in G.nodes(data=True):
    S.add_node(n, **(d or {}))
for u,v,d in G.edges(data=True):
    S.add_edge(u,v, **(d or {}))

try:
    nx.write_graphml(S, str(out_graphml))
    print('Wrote', out_graphml)
except Exception as e:
    print('GraphML write failed:', e)

try:
    def q(s):
        return '"' + str(s).replace('"','\\"') + '"'
    with open(out_dot,'w',encoding='utf-8') as f:
        f.write('graph G {\n')
        for n,d in S.nodes(data=True):
            f.write(f'  {q(n)};\n')
        for u,v,d in S.edges(data=True):
            label = ''
            if 'label' in d:
                label = f'[label={q(d.get("label"))}]'
            f.write(f'  {q(u)} -- {q(v)} {label};\n')
        f.write('}\n')
    print('Wrote', out_dot)
except Exception as e:
    print('DOT write failed:', e)

print('Export complete')
