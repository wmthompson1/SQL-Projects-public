**.env Handling Policy**

**Purpose**

Provide clear, auditable guidance for handling local environment variable files (`.env`) used by developers and test systems. The default policy for now is local-only and policy-driven. This document describes safe local usage patterns and migration guidance for future scaling to managed secret stores.

**Scope**

Applies to all engineers, contractors, and automation that interact with this repository or its CI/CD pipelines. Covers repository-level `.env` files, environment variable naming conventions, and recommendations for moving secrets into secret managers as the project scales.

**Policy (Local-only, default)**

- `.env` is permitted for local development only.
- `.env` must be listed in the repository `.gitignore`. Do not commit secrets to git.
- Example allowed values for local testing may be synthetic (faux) tokens such as `FAUX_API_KEY=hf_Faux`.
- Real secrets must never be placed in the repository or in repo-attached configuration files.

**Naming & format recommendations**

- Use UPPER_SNAKE_CASE for keys: `SERVICE_API_KEY`, `DB_CONN`, `HF_API_KEY`.
- Keep values simple tokens/strings. If a value requires structured data use a separate local config file excluded by `.gitignore`.
- Example `.env` contents for local testing (safe/faux keys):

```text
# Local-only env file for development/testing
FAUX_API_KEY=hf_Faux
ENV=development
```

**Developer workflow**

- On first clone: copy the example template if provided (`.env.example` → `.env`) and populate only local/testing values.
- Never `git add` or `git commit` your `.env` file. If a `.env` file is accidentally staged, run `git rm --cached .env` and commit the removal.
- To share non-sensitive configuration, check in `.env.example` (no secret values) rather than the real `.env`.

**CI/CD & production**

- CI systems must not read `.env` from the repository. Instead, inject secrets through the pipeline/platform secret store (GitHub Actions Secrets, Azure DevOps variable groups, Jenkins credentials, etc.).
- Production systems must use a managed secret store appropriate to the environment (see "Future scaling" below).

**Onboarding / Offboarding**

- When a developer is added, provide instructions to create a local `.env` from `.env.example` and how to obtain non-secret test tokens where needed.
- When offboarding, revoke any real credentials tied to that user and rotate secrets if necessary.

**Incident handling / accidental commits**

If a secret is committed accidentally:

1. Immediately rotate the secret at the provider.
2. Remove the secret from the repository history (use `git filter-repo` or `git filter-branch`) and coordinate with your security/ops team before rewriting shared branches.

**Future scaling / migration plan**

As the project grows, move from `.env` files to a secrets manager (examples: Azure Key Vault, AWS Secrets Manager, HashiCorp Vault, GitHub Secrets) and use platform-native integrations for CI/CD and runtime injection.

High-level migration steps:

1. Inventory current `.env.example` and any discovered secrets in repo history.
2. Create secret entries in chosen secrets manager and restrict access by role.
3. Modify CI/CD pipelines to fetch secrets from the secrets manager rather than reading `.env` files.
4. Remove any lingering `.env` from build artifacts and remove from git history if necessary.

**Contacts / Responsibility**

Owners: Dev Lead, DevOps / Platform team, InfoSec (for secret policy enforcement).

**Revision history**

- 2025-12-08: Initial local-only policy created. Future updates will include concrete migration steps and examples for specific secret managers.

**Simple copy workflow (recommended)**

- To create your local file from the committed template, run:

	- PowerShell:
		```powershell
		Copy-Item -Path .env.example -Destination .env
		notepad .env  # edit and add your local values
		```

	- Bash (Git Bash / macOS / Linux):
		```bash
		cp .env.example .env
		vi .env
		```

- After you finish a local session or when a secret should be removed, delete the local `.env` file:

	- PowerShell: `Remove-Item .env`
	- Bash: `rm .env`

- If you must share an environment file temporarily, prefer secure channels (password manager, encrypted file transfer, or a ticketing system with secure attachments). If a real secret is ever committed, rotate the secret immediately and follow the incident handling steps above.
