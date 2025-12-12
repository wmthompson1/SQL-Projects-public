import networkx as nx
from pathlib import Path

def main():
    G = nx.DiGraph()
    G.add_node('A', label='Start', type='process')
    G.add_node('B', label='Middle', type='process')
    G.add_node('C', label='End', type='process')
    G.add_edge('A', 'B', relation='to')
    G.add_edge('B', 'C', relation='to')

    out = Path(__file__).parent / 'sample_graph.gpickle'
    nx.write_gpickle(G, out)
    print('Wrote sample graph to', out)

if __name__ == '__main__':
    main()
