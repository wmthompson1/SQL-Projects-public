This PR stabilizes the validate-solder CI workflow and prevents accidental persistence to production ArangoDB. Changes include:

- Replace fragile heredoc with printf-based SQLite fixture writer to avoid EOF/indentation issues in GitHub Actions.
- Expand SQLite fixture to include minimal `schema_*` metadata tables and seed `Quality`/`Finance`/`Solder` rows so loader tests run in CI.
- Install `nx-arangodb` in CI and set `ENABLE_PERSIST=true` for the seed-loading step to allow persistence to ephemeral ArangoDB started in the job.
- Start ArangoDB in a dedicated Docker network and expose port 8529; use `localhost` for runner<->container connections.
- Add runtime guard checks in persistence code to require `ENABLE_PERSIST=true` before writing to ArangoDB (safety).

Please review and merge when ready.
