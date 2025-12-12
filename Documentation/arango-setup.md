-- For local development, you can keep auth enabled and create a dedicated dev user.
# Local ArangoDB (no Docker) — quick setup notes and VS Code tips

Overview
- Goal: Run ArangoDB locally (no Docker) and persist NetworkX graphs from Python / VS Code.
- Tools: ArangoDB server (arangod), ArangoDB web UI (http://127.0.0.1:8529), python-arango client, NetworkX.


- Ubuntu / Debian
  - Use the official ArangoDB apt repo and follow the install instructions on ArangoDB docs:
    https://www.arangodb.com/docs/stable/installation.html
  - Start/enable via systemd (e.g., sudo systemctl start arangod)
  - UI: http://127.0.0.1:8529
- Windows
  - Download the MSI installer from ArangoDB downloads and run it.
  - Start the ArangoDB service from Services or the installer.
  - UI: http://127.0.0.1:8529

Notes on persistence & config
- By default arangod persists to its data directory (varies by OS). Check arangod.conf to change data directory.
- Run ArangoDB as a system service so it persists across restarts (brew services, systemd, or Windows service).
- Use arangod backup/export tools (arangoexport/arangoimp) for backups or to seed data.
- For production-like persistence, configure WAL and fsync policies in arangod.conf. For development defaults are usually fine.

Security / credentials
- On first run you will be asked to set the root password (or set it in config).
- For local development, you can keep auth enabled and create a dedicated dev user.

Python tooling (for persisting NetworkX)
- Recommended libraries:
  - python-arango (pip install python-arango)
  - networkx (pip install networkx)
- Typical workflow:
  1. Convert nodes => a vertex collection (e.g., "nodes")
  2. Convert edges => an edge collection (e.g., "edges") with _from/_to pointing at nodes/<_key>
  3. Use a small script (example provided in scripts/nx_to_arango.py)

VS Code development tips
- Install the Python extension for debugging and linting.
- Keep arangod running locally; use the Arango web UI to inspect collections.
- Use environment variables for DATABASE_HOST, DATABASE_USERNAME, DATABASE_PASSWORD in your launch.json / .env.
- Use the REST Client extension or write short scripts for quick queries.
- Consider the Arango HTTP+JS drivers (arangojs) if you also develop JS tooling.

Where to go next
- Add the provided script to your repo and run it against a saved NetworkX graph (gpickle, edgelist, etc.).
- Tweak collection names, data fields, and key generation to match your app schema.
