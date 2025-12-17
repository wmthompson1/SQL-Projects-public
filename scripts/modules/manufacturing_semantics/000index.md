scripts\modules\manufacturing_semantics\000index.md

scripts\modules\manufacturing_semantics\semantic_schema\semantic_schema..md
.\Utilities\Powershell Utilities\venv_setup.ps1
cd .\Utilities\Powershell Utilities\

Python: Create Environment
choose venv
python.terminal.activateEnvironment

- or -
Preferences: Open User Settings


I'll add a tiny TODO to track the quick setup steps, then give one-line commands to run the script.

Added 1 todo

Quickest (one-shot) — run from repository root in PowerShell (pwsh):

```pwsh
pwsh -NoProfile -ExecutionPolicy Bypass -File ".\Utilities\Powershell Utilities\venv_setup.ps1"
```

Or if you're already in an interactive pwsh session, run:

```pwsh
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
& ".\Utilities\Powershell Utilities\venv_setup.ps1"
& ".\.venv\Scripts\Activate.ps1"
```

Notes:
- Run these from the repo root so `.\Utilities\Powershell Utilities\venv_setup.ps1` resolves correctly.
- Use the first form for a single non-interactive run; use the second if you want to keep the session open.

**Activate the repo virtualenv**

From the repository root (recommended):

```pwsh
& ".\.venv\Scripts\Activate.ps1"
```

If you're running from inside `scripts/modules/manufacturing_semantics` (relative path):

```pwsh
& "..\..\..\.venv\Scripts\Activate.ps1"
```

One-line non-interactive (single-shot) from any folder by specifying repo root explicitly:

```pwsh
pwsh -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\\path\\to\\repo\\.venv\\Scripts\\Activate.ps1'"
```

Replace `C:\path\to\repo` with your repository absolute path, or run the first two examples from the repo root for convenience.