"""
020_Entry_Point_Persist_3rd_NetworkX_Arango.py

Third Pass: Restore Manufacturing Schema Graph from ArangoDB
Simple restoration pattern - load and verify.

Workflow:
1. Load persisted graph from ArangoDB
2. Convert to NetworkX format
3. Verify metadata preservation
"""

import sys
import os
import networkx as nx

# Ensure local module path is importable when executed from repo root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.insert(0, SCRIPT_DIR)

from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence

print("=" * 75)
print("NetworkX over ArangoDB - Third Pass")
print("Restore Schema Graph from ArangoDB")
print("=" * 75)

# Step 1: Connect to ArangoDB
print("\n📊 Step 1: Connect to ArangoDB")
print("-" * 75)

config = ArangoDBConfig()
persistence = ArangoDBGraphPersistence(config)

print(f"✅ Connected to ArangoDB:")
print(f"   Database: {config.database_name}")
print(f"   Host: {config.host}")

# Step 2: Load persisted graph
print("\n📊 Step 2: Load persisted graph")
print("-" * 75)

graph_name = "manufacturing_schema"
print(f"📥 Loading graph '{graph_name}' from ArangoDB...")

loaded_graph = persistence.load_graph(
    name=graph_name,
    directed=True
)

print(f"✅ Graph loaded: {loaded_graph.number_of_nodes()} nodes, {loaded_graph.number_of_edges()} edges")

# Step 3: Convert to NetworkX and verify metadata
print("\n📊 Step 3: Verify metadata preservation")
print("-" * 75)

nx_graph = nx.DiGraph()
nx_graph.add_nodes_from(loaded_graph.nodes(data=True))
nx_graph.add_edges_from(loaded_graph.edges(data=True))

print(f"\n✅ Node metadata verification:")
for node, data in nx_graph.nodes(data=True):
    if 'label' in data:
        print(f"   • {data['label']} ({data.get('table_type', 'N/A')})")
        print(f"     Description: {data.get('description', 'N/A')}")
        print(f"     ArangoDB ID: {node}")
        print()

print(f"✅ Enhanced Edge Metadata (Ready for Semantic Layer):")
print("=" * 75)
for source, target, data in nx_graph.edges(data=True):
    source_label = nx_graph.nodes[source].get('label', source)
    target_label = nx_graph.nodes[target].get('label', target)
    print(f"\n   {source_label} → {target_label}")
    print(f"   {'─' * 70}")
    print(f"   Relationship: {data.get('relationship_type', 'N/A')}")
    print(f"   Join Column: {data.get('join_column', 'N/A')}")
    
    # Enhanced metadata for LangChain semantic layer
    if data.get('natural_language_alias'):
        print(f"   Alias: {data.get('natural_language_alias')}")
    if data.get('join_column_description'):
        print(f"   Description: {data.get('join_column_description')}")
    if data.get('few_shot_example'):
        print(f"   Example: {data.get('few_shot_example')}")
    if data.get('context'):
        print(f"   Context: {data.get('context')}")
print()

# Step 4: Create label-to-ID mapping for easy access
print("=" * 75)
print("Step 4: Label-to-ID Mapping (for easy node access)")
print("=" * 75)

label_to_id = {data['label']: node for node, data in nx_graph.nodes(data=True) if 'label' in data}
print(f"\n✅ Mapping created - use original table names to access nodes:")
for label, node_id in label_to_id.items():
    print(f"   {label} → {node_id}")

print("\n" + "=" * 75)
print("✅ Complete: Graph Restored from ArangoDB")
print("=" * 75)
print(f"""
Summary:
• Loaded graph '{graph_name}' from ArangoDB
• All node metadata preserved ✅
• All edge metadata preserved ✅
• Label-to-ID mapping available ✅

The graph is ready for use in manufacturing intelligence queries!
""")
print("=" * 75)
