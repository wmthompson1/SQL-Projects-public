# Graph Persistence (SQLite → NetworkX → ArangoDB)

This project persists NetworkX graphs to ArangoDB. Implementation prefers `nx-arangodb` when available, but falls back to the official `python-arango` client for environments where the Rust-backed `nx-arangodb` cannot be installed.

Key points:
- `nx-arangodb` (optional): used when installed; provides direct NetworkX ↔ ArangoDB utilities.
- `python-arango` (required): used as a fallback for universal compatibility.
- Environment variables:
  - `ARANGO_HOST` (default `http://localhost:8529`)
  - `ARANGO_NO_AUTH` (set to `1` for no-auth Arango instances)
  - `DATABASE_NAME` (target ArangoDB database for persistence)

If you encounter installation issues for `nx-arangodb` (Rust toolchain required), installing `python-arango` is sufficient to persist/load graphs.
