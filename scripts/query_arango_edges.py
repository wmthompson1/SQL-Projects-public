from arango import ArangoClient
from collections import Counter, defaultdict
client=ArangoClient(hosts='http://127.0.0.1:8529')
db=client.db('manufacturing_graph', username='root', password='Se206attle_rocks')
col=db.collection('edges')
cur=col.all()
ctr=Counter()
docs=defaultdict(list)
for d in cur:
    fr=d.get('_from')
    to=d.get('_to')
    key=d.get('_key')
    ctr[(fr,to)]+=1
    docs[(fr,to)].append((key,d))
print('total edges in collection:', col.count())
print('\nDuplicate _from/_to pairs and counts:')
for k,c in ctr.items():
    if c>1:
        print(k,'count=',c)
        for key,d in docs[k]:
            print('  key=',key,'attrs=',{kk:v for kk,v in d.items() if kk.startswith('_')==False})
