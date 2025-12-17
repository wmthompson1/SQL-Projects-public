import networkx as nx
import pickle
from pathlib import Path

mermaid = '''erDiagram
    PAYABLE ||--o{ PAYABLE_LINE : "VOUCHER_ID"
    PAYABLE ||--o{ PAYABLE_DIST : "VOUCHER_ID"
    PAYABLE_LINE }o--|| RECEIVER_LINE : "RECEIVER_ID + LINE_NO"
    PAYABLE ||--o{ CASH_DISBURSE_LINE : "VOUCHER_ID"
    CASH_DISBURSE ||--o{ CASH_DISBURSE_LINE : "DISBURSE_ID"
    PAYABLE ||--|| VENDOR : "VENDOR_ID"
    PURCHASE_ORDER ||--o{ PURC_ORDER_LINE : "PO_NUMBER"
    PURC_ORDER_LINE }o--|| RECEIVER_LINE : "PO_NUMBER + LINE_NO"
'''


def parse_mermaid_er(text):
    G = nx.MultiGraph()
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith('%'):
            continue
        if line.lower().startswith('erdiagram'):
            continue
        import re
        m = re.match(r"^\s*(?P<left>\w+)\s*(?P<between>.+?)\s*(?P<right>\w+)\s*(?::\s*\"(?P<label>[^\"]+)\")?\s*$", line)
        if not m:
            t = re.match(r'^\s*(?P<entity>\w+)\s*$', line)
            if t:
                G.add_node(t.group('entity'))
            continue
        left = m.group('left')
        right = m.group('right')
        between = m.group('between').strip()
        label = m.group('label') or ''
        if '--' in between:
            parts = between.split('--')
            left_card = parts[0].strip()
            right_card = parts[1].strip()
        else:
            left_card = right_card = ''
        G.add_node(left)
        G.add_node(right)
        G.add_edge(left, right, left_card=left_card, right_card=right_card, label=label, raw=line)
    return G

root = Path('.').resolve()
payables_gp = root / 'scripts' / 'payables_graph.gpickle'
persisted_gp = root / 'scripts' / 'inventory_transactions_graph.gpickle'
merged_gp = root / 'scripts' / 'merged_graph_temp2.gpickle'

# parse mermaid
Gm = parse_mermaid_er(mermaid)
print('Parsed mermaid: nodes=', len(Gm.nodes()), 'edges=', Gm.number_of_edges())

# load persisted using robust method
Gp = None
if persisted_gp.exists():
    try:
        if hasattr(nx, 'read_gpickle'):
            Gp = nx.read_gpickle(str(persisted_gp))
        else:
            with open(persisted_gp, 'rb') as f:
                Gp = pickle.load(f)
        print('Loaded persisted graph:', persisted_gp, 'nodes=', Gp.number_of_nodes(), 'edges=', Gp.number_of_edges())
    except Exception as e:
        print('Failed to load persisted graph via nx.read_gpickle/pickle:', e)
        Gp = None
else:
    print('Persisted graph not found at', persisted_gp)
    Gp = None

# merge
M = nx.MultiGraph()
if Gp is not None:
    for n,d in Gp.nodes(data=True):
        M.add_node(n, **d)
    if isinstance(Gp, nx.MultiGraph):
        for u,v,k,d in Gp.edges(keys=True, data=True):
            M.add_edge(u,v,**d)
    else:
        for u,v,d in Gp.edges(data=True):
            M.add_edge(u,v,**d)
# add mermaid
for n,d in Gm.nodes(data=True):
    if not M.has_node(n):
        M.add_node(n, **d)
for u,v,d in Gm.edges(data=True):
    M.add_edge(u,v,**d)

print('Merged graph: nodes=', M.number_of_nodes(), 'edges=', M.number_of_edges())

# sample edges
count = 0
for u,v,d in M.edges(data=True):
    print(f'{u} -> {v} : {d}')
    count += 1
    if count >= 20:
        break

# write merged using robust method
try:
    if hasattr(nx, 'write_gpickle'):
        nx.write_gpickle(M, str(merged_gp))
    else:
        with open(merged_gp, 'wb') as f:
            pickle.dump(M, f)
    print('Wrote merged gpickle to', merged_gp)
except Exception as e:
    print('Failed to write merged gpickle:', e)

print('Done')
