import importlib

for mod in ('networkx','arango'):
    try:
        importlib.import_module(mod)
        print(f'OK: {mod}')
    except Exception as e:
        print(f'ERR: {mod} -> {e}')
