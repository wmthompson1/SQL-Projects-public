# Entry Point 020 — ArangoDB Docker Unit (Companion)

This companion documents how to run and verify the ArangoDB-backed unit used by
`020_Entry_Point_ArangoDB_Graph_Persistence.py` locally using the project's
`docker-compose.test.yml` and the test runner.

## Purpose
- Provide a reproducible local ArangoDB instance for integration/unit tests.
- Demonstrate persistence with `nx-arangodb` by persisting a small sample graph.

## Files
- `docker-compose.test.yml` — compose project for the test ArangoDB service.
- `scripts/test_runner/run_arango_integration.ps1` — PowerShell runner that
  brings up the compose stack, creates a test user/db, runs pytest, and tears down.
- `scripts/modules/manufacturing_semantics/020_Entry_Point_ArangoDB_Graph_Persistence.py` —
  demo script that persists/loads a sample NetworkX graph.

## Prerequisites
- Docker Desktop (WSL2 backend on Windows recommended)
- Python 3.10+/`.venv` created at repo root (optional but recommended)
- Repo `.env` containing testable values OR use runner which creates test user/db

## Quick run (recommended)
From the repository root (PowerShell):

```powershell
# Start the integration runner (creates test user/db, runs pytest, tears down)
& .\scripts\test_runner\run_arango_integration.ps1 -TimeoutSec 180
```

This script will:
- Launch `arangodb` service from `docker-compose.test.yml` (container name `arangodb-test`).
- Wait for readiness (host check → in-container check → log fallback).
- Create a test user and database using the container root password.
- Install minimal test deps into `.venv` and run the pytest integration test.
- Tear down the compose stack (use `-PreserveOnFailure` to keep containers when failing).

## Manually run the demo script
If you prefer to run the persistence demo directly:

```powershell
# Ensure UTF-8 for emoji-safe prints and set connection vars
$env:PYTHONUTF8 = '1'
$env:DATABASE_HOST = 'http://127.0.0.1:8529'
$env:DATABASE_USERNAME = 'root'            # or test user created by runner
$env:DATABASE_PASSWORD = 'localtestpass'  # container root password (from compose env)
$env:DATABASE_NAME = 'manufacturing_graph' # target DB
python .\scripts\modules\manufacturing_semantics\020_Entry_Point_ArangoDB_Graph_Persistence.py
```

Logs for each run are written into `logs/` by the helper commands used in this
repo (examples: `logs/entrypoint020_run_persisted.log`).

## Healthcheck note and compose tweak
Some Arango images do not contain `curl`. The compose healthcheck was updated
to try `curl`, then `wget`, and to avoid false `unhealthy` states if neither
binary exists. If you still see `unhealthy`:
- Inspect logs: `docker logs arangodb-test --tail 200`
- Check compose status: `docker compose -f docker-compose.test.yml ps`

If the healthcheck returns HTTP 401, the server is reachable but requires
authentication for that endpoint. In that case the runner already detects
readiness via container logs as a fallback.

## Common troubleshooting
- Unicode/emoji errors on Windows console: set `PYTHONUTF8=1` before running.
- Permission/auth errors: ensure you're using the correct credentials; the
  runner creates `test_user`/`test_pass` and `ncm_test_db` by default.
- VM kernel setting (Arango warns about `vm.max_map_count`): update WSL
  kernel settings if you see mapping warnings (Docker Desktop WSL kernel).

## Persisted data
- The compose volume used for Arango data is `arango_data` (persistent). If
  you want a clean start, bring down compose with volumes:

```powershell
docker compose -f docker-compose.test.yml down --volumes
```

## CI suggestions
- Pin the Arango image in CI (avoid `latest`) for reproducible builds.
- Use the test runner in CI (or adapt steps) to create the test DB/user, run
  pytest, and tear down the test resources.

## Next changes you may want
- Add a CLI flag to the demo script to explicitly force `--run-persist-demo`.
- Provide a small helper Docker image that includes `curl` for a strict
  healthcheck if you prefer container-level HTTP checks.

# Keeping manufacturing persistence in Arango
Let's be defensive and deterimine 1) how to get the manufacturing graph and container back (with ddocumentation) an=d 2) how to set up docker so as to not have to revive manufacturing 
## Keeping manufacturing persistence in Arango
Let's be defensive and determine 1) how to get the manufacturing graph and
container back (with documentation) and 2) how to set up Docker so we don't
have to manually revive manufacturing data.

---

## Backup created (current run)

I created a logical backup of the `manufacturing_graph` database and copied
it into the repository backups folder during the current session.

- Backup path (example): `data/backups/arangodump_manufacturing_graph_20260122_123446`

If you run `ls -la` in PowerShell you may see an error — PowerShell does not
support the `-la` flag the same way Bash does. Use one of these instead:

```powershell
# Pretty list (PowerShell native)
Get-ChildItem .\data\backups\arangodump_manufacturing_graph_20260122_123446 -Recurse

# Or shorter alias (shows hidden files)
ls -Force .\data\backups\arangodump_manufacturing_graph_20260122_123446
```

## How the backup was created (commands executed)

The steps run were (copy/paste ready):

```powershell
# create backups folder (if missing)
mkdir -Force .\data\backups

# run arangodump inside the running container (creates /tmp/arangodump_<ts>)
docker exec arangodb-test arangodump --output-directory /tmp/arangodump_20260122_123446 --server.database=manufacturing_graph --server.username=root --server.password=localtestpass

# copy the dump out of the container into the repo
docker cp "arangodb-test:/tmp/arangodump_20260122_123446" "./data/backups/arangodump_manufacturing_graph_20260122_123446"
```

Note: the root password used in these commands was the container test root
password (`localtestpass`) configured by `docker-compose.test.yml`. If your
compose uses a different root password, substitute it accordingly.

## Restore from backup

Preferred (logical restore via `arangorestore`):

```powershell
# copy dump back into a running container (if needed)
docker cp ./data/backups/arangodump_manufacturing_graph_20260122_123446 arangodb-test:/tmp/arangodump

# restore the database
docker exec arangodb-test arangorestore --input-directory /tmp/arangodump --server.database=manufacturing_graph --server.username=root --server.password=localtestpass
```

Alternate (raw volume reuse) — if you prefer to preserve the exact running
data store, re-create the compose project and it will reuse the named
volumes already attached to the container:

```powershell
# bring compose up (compose will reattach existing volumes)
docker compose -f docker-compose.test.yml up -d
```

## Recommended long-term protections

- Use periodic logical backups (`arangodump`) and store them under
  `data/backups/` (rotate & retain as policy dictates).
- Prefer host bind-mounts for dev persistence when you need direct file
  visibility (e.g., `./data/arango/lib:/var/lib/arangodb3`).
- Pin the Arango image (avoid `latest`) and add `restart: unless-stopped` in
  `docker-compose.test.yml` for resilience.
- Add a small `Makefile` or PowerShell helper with `backup` and `restore`
  targets to make these operations repeatable.

If you want, I can commit this companion update and the new backup file to a branch, or
I can add a `Makefile` / PowerShell helper now. Which would you prefer?
