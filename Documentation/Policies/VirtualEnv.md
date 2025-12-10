# Developer Virtual Environment Policy

Purpose
- Provide a simple, developer-focused virtual environment setup for local Python-based utilities and scripts.
- Clarify roles: developers will use the virtual environment; supervisors/managers do not need to use it and can run scripts using the system Python when required.

Roles
- Development (you): Create and use a local virtual environment for working with repository Python utilities, conversions, and one-off scripts. Use the `venv_setup.ps1` helper in `Utilities/Powershell Utilities/` to create and populate a `.venv` in the repository root.
- Supervisory (managers): You do not need to create or use a virtual environment. When running maintenance or viewing outputs, managers may rely on system-installed Python or run packaged scripts. If a script requires packages not available system-wide, coordinate with a developer to run it or provide a prepared environment.

Developer Quickstart (PowerShell / Windows)
1. Ensure Python 3.8+ is installed and available on PATH.
2. From the repository root in PowerShell (pwsh):

```powershell
# create and activate a local venv
python -m venv .venv
# activate (PowerShell)
.\.venv\Scripts\Activate.ps1
# upgrade pip and install requirements
python -m pip install --upgrade pip
python -m pip install -r "Utilities\Powershell Utilities\requirements.txt"
```

3. To deactivate:

```powershell
deactivate
```

Developer notes and hygiene
- The `.venv` folder is local to your clone and should be ignored by Git. The repository's `.gitignore` already ignores common virtualenv names (if not, add `.venv/`).
- Use the virtual environment for development tasks that require Python packages. Do not commit local environment artifacts.

Manager / Supervisory Guidance (no venv required)
- Managers may run simple viewer or report scripts using system Python. If a script requires extra packages, request the developer to run it or provide an export/packaged output.
- When asked to run a script, managers can run it with the system interpreter, e.g.: `python script.py`.
 - Managers are typically non-technical (finance/supervisory): when they need updated reports or data extracts, ask a developer to run SQL scripts based on the repository's preset data models and reporting queries and deliver the exported outputs (CSV/Excel/PDF). Managers do not need to create or manage virtual environments.

Security and secrets
- Never store secrets in source files. Use environment variables for local development and follow `Documentation/Policies/ENV-Handling.md`.

Files provided
- `Utilities\Powershell Utilities\venv_setup.ps1` — PowerShell helper to create/activate/install `.venv`.
- `Utilities\Powershell Utilities\requirements.txt` — repository development requirements.

Questions or customizations
- Want a different venv location (e.g., `.venv-dev`) or to add `pipx` guidance for managers? Tell me and I'll add it.
