**do not cxhange yaml workflow unless policy is checked**

started copy pasting commands for research track:

gh pr create --title "ci: trigger CI" --body "Trivial README update to trigger CI" --base main --head ci/trigger-20260213 --label "ci

please note the branch you are currently on.

'Current branch: ci/trigger-20260213.'

the setup poilicy for ci trigger has been fulfilled because the initial sequence has enough information to retract and get back to normal if something goes wrong.

**How to trigger SQLMesh CI without changing files**

- Run manually from the GitHub Actions UI: open the repository -> Actions -> "SQLMesh CI/CD" -> "Run workflow" -> select branch (`main`) and Run.

- Use the `gh` CLI (requires authenticated `gh`):

	- Run workflow by filename on `main`:

		gh workflow run sqlmesh.yml --ref main

	- Or trigger the dispatch endpoint via `gh api`:

		gh api repos/Skills-Inc-Org/SQL-Projects/actions/workflows/sqlmesh.yml/dispatches -f ref=main

- Use the GitHub REST API with a token that has `repo` and `workflow` scopes:

	curl -X POST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $GITHUB_TOKEN" \
		https://api.github.com/repos/Skills-Inc-Org/SQL-Projects/actions/workflows/sqlmesh.yml/dispatches \
		-d '{"ref":"main"}'

Notes:
- The repository workflow already includes `workflow_dispatch`, so any of the above will run the same workflow without modifying files.
- `gh workflow run` and the REST dispatch both run immediately; use Actions UI to set inputs or inspect recent runs.

**Local test steps (augment documentation / verify behavior locally)**

1. Create and activate a virtual environment (Windows PowerShell):

	 ```powershell
	 python -m venv .venv
	 .\.venv\Scripts\Activate.ps1
	 ```

2. Install dependencies:

	 ```powershell
	 pip install -r Utilities/SQLMesh/requirements.txt
	 ```

3. Run SQLMesh commands from the project path:

	 ```powershell
	 cd Utilities/SQLMesh
	 sqlmesh info
	 sqlmesh test --verbose
	 ```

4. If tests require external connections (DB, S3, etc.), set environment variables as per `Utilities/SQLMesh/README.md` or use `.env` and `python-dotenv`.

Add these steps to CI documentation and use `workflow_dispatch` to validate the same runner image locally via GitHub Actions if desired.