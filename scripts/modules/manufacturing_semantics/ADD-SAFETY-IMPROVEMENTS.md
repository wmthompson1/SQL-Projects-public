# Add Safety Improvements (placeholder)

This branch collects optional safety improvements related to ArangoDB persistence.

Included suggestions:

- Move ArangoDB imports to runtime (lazy import) to avoid requiring Arango client libraries on import.
- Add a CI workflow to run `test_safety_features.py` in dry-run mode (`TEST_MODE=1 SKIP_PERSIST=1`).
- Update `README_GRAPH_PERSISTENCE.md` to document the `TEST_MODE` and `SKIP_PERSIST` environment variables.

Note: These improvements were already merged into `main` as part of the earlier safety PRs; this branch provides a dedicated review PR to track and discuss the optional changes.

Files touched in prior merge:

- `scripts/modules/manufacturing_semantics/backup_arango_graph.py`
- `.github/workflows/test-arango-safety.yml`
- `scripts/modules/manufacturing_semantics/README_GRAPH_PERSISTENCE.md`

Use this branch to discuss additional refinements or to submit follow-up changes.
