import pickle
from pathlib import Path
import networkx as nx

p = Path('scripts/merged_graph_temp2.gpickle')
out = Path('scripts/merged_graph_temp2_clean.gpickle')

with open(p,'rb') as f:
    G = pickle.load(f)

# normalize node attributes to dicts
for n, data in list(G.nodes(data=True)):
    if data is None:
        G.nodes[n].clear()
    elif not isinstance(data, dict):
        G.nodes[n].clear()
        G.nodes[n]['label'] = str(data)
    else:
        # ensure keys are strings and values are basic types
        for k,v in list(data.items()):
            if not isinstance(k, str):
                G.nodes[n][str(k)] = v
                del G.nodes[n][k]

# normalize edge attributes
# for MultiGraph handle keys
if isinstance(G, nx.MultiGraph):
    edges = list(G.edges(keys=True, data=True))
    for u,v,k,data in edges:
        if data is None:
            G[u][v][k].clear()
        elif not isinstance(data, dict):
            G[u][v][k].clear()
            G[u][v][k]['label'] = str(data)
        else:
            for kk,vv in list(data.items()):
                if not isinstance(kk, str):
                    G[u][v][k][str(kk)] = vv
                    del G[u][v][k][kk]
else:
    for u,v,data in list(G.edges(data=True)):
        if data is None:
            G[u][v].clear()
        elif not isinstance(data, dict):
            G[u][v].clear()
            G[u][v]['label'] = str(data)
        else:
            for kk,vv in list(data.items()):
                if not isinstance(kk, str):
                    G[u][v][str(kk)] = vv
                    del G[u][v][kk]

with open(out,'wb') as f:
    pickle.dump(G,f)

print('Wrote cleaned gpickle:', out)
