import importlib.util
spec = importlib.util.spec_from_file_location('ep20','scripts/modules/manufacturing_semantics/020_Entry_Point_ArangoDB_Graph_Persistence.py')
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
mod.demo_arangodb_persistence_local()
