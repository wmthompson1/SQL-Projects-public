nx_to_arango — README

Purpose
- Persist NetworkX graphs into ArangoDB for graph analysis and schema annotation.

Prerequisites
- ArangoDB running locally (http://127.0.0.1:8529). See `Documentation/arango-setup.md` for platform install notes.
- Python environment with `python-arango` and `networkx` installed (already configured in workspace).

Setup
1. Copy `scripts/.env.example` to `scripts/.env` and set the ARANGO_ROOT_PASSWORD (or leave empty to be prompted).
2. Optionally set `ARANGO_DEV_USER` and `ARANGO_DEV_PASSWORD` in the .env file.

Creating a dev user (if Arango already running)
- If you have root credentials you can run the script with `--create-user` and it will create the dev user and grant DB permissions.

Usage
- Persist a graph (gpickle):

```pwsh
# from repo root
python .\scripts\nx_to_arango.py --graph-file path\to\graph.gpickle --create-user
```

- The script will:
  - create the database (if missing)
  - create `nodes` vertex collection and `edges` edge collection
  - create a dev user (if requested) and grant access
  - insert nodes and edges from the NetworkX graph

Notes
- This script uses `_key` values equal to the NetworkX node identifiers (stringified). If your node keys contain characters not allowed by Arango keys, normalize them first.
- Edge docs are inserted with `_from` pointing to `nodes/<_key>` and `_to` pointing to `nodes/<_key>`.
- For production or large graphs consider batching inserts and using arangoimport/arangoimp for bulk loads.

Security
- Keep root credentials secure. Use a dedicated dev user for development queries.
