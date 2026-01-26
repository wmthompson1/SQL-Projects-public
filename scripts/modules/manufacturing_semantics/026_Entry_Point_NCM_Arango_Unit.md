## NCM ArangoDB Unit Test Setup

Purpose
- Quick reference to start an ArangoDB test instance and run unit tests for the NCM Arango integration (scripts/modules/manufacturing_semantics/026_Entry_Point_NCM_Arango_Unit.py).

Prerequisites
- Docker Desktop running locally (Windows/Mac) or a Docker engine on Linux.
- Python 3.8+ and a virtual environment for project dependencies.
- `gh` / `git` if you need to fetch branches.

Recommended Docker (single-command)

Start a disposable ArangoDB container for local testing:

```bash
docker run -d \
  --name arangodb-test \
  -e ARANGO_ROOT_PASSWORD=localtestpass \
  -p 8529:8529 \
  arangodb:latest
```

Or use docker-compose (example):

```yaml
version: '3.7'
services:
  arangodb:
    image: arangodb:latest
    container_name: arangodb-test
    environment:
      - ARANGO_ROOT_PASSWORD=localtestpass
    ports:
      - "8529:8529"
    volumes:
      - arango-data:/var/lib/arangodb3

volumes:
  arango-data:
```

Create a test database and user (optional)

Use `arangosh` or the HTTP API to create a dedicated test database and user:

```bash
# using curl (replace password and names as needed)
curl -X POST "http://localhost:8529/_api/user" \
  -H 'Content-Type: application/json' \
  -d '{"user":"test_user","passwd":"test_pass"}' --user root:localtestpass

curl -X POST "http://localhost:8529/_api/database" \
  -H 'Content-Type: application/json' \
  -d '{"name":"ncm_test_db","users":[{"username":"test_user","passwd":"test_pass","active":true}]}' --user root:localtestpass
```

Environment variables (example)

Export these before running tests (PowerShell or Bash):

```powershell
$env:ARANGO_HOST = '127.0.0.1'
$env:ARANGO_PORT = '8529'
$env:ARANGO_USER = 'test_user'   # or 'root'
$env:ARANGO_PASSWORD = 'test_pass' # or localtestpass
$env:ARANGO_DB = 'ncm_test_db'
```

Python environment & dependencies

Run from the repository root.

Windows PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt  # or: pip install python-arango pytest requests
```

Windows Command Prompt (cmd.exe):

```cmd
python -m venv .venv
\.venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
```

macOS / Linux (bash):

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Quick PowerShell one-liner (repo root):

```powershell
python -m venv .venv; .\.venv\Scripts\Activate.ps1; python -m pip install --upgrade pip; pip install python-arango pytest requests
```

Run the unit test script

If `026_Entry_Point_NCM_Arango_Unit.py` is a pytest-compatible test file or contains a `main()` runner, run it with:

```bash
pytest -q scripts/modules/manufacturing_semantics/026_Entry_Point_NCM_Arango_Unit.py
# or, if the file is an executable script:
python scripts/modules/manufacturing_semantics/026_Entry_Point_NCM_Arango_Unit.py
```

Tips & debugging
- Use `docker logs arangodb-test` to inspect the ArangoDB container logs.
- If the test fails with connection errors, verify `ARANGO_HOST`/`ARANGO_PORT` and that Docker Desktop exposed port 8529.
- To run tests in CI, mirror these steps with a reproducible password and teardown the container after tests complete.

Teardown

```bash
docker rm -f arangodb-test
docker volume rm arango-data  # if you created a named volume and want to remove it
```

If you want, I can also add a `docker-compose.test.yml` and a small `pytest` wrapper to this repo. Ask me to scaffold it and I'll add it.
