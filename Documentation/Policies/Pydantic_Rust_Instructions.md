# pydantic-core (Rust) dependency notes

Problem
-------
`pydantic` v2 depends on `pydantic-core`, which ships a native Rust-based extension `_pydantic_core`.
On some Python versions (especially very new ones) a prebuilt binary wheel may not be available and `pip` will attempt to build `pydantic-core` from source. Building requires the Rust toolchain (cargo).

Common symptom
--------------
- Import errors like: `ModuleNotFoundError: No module named 'pydantic_core._pydantic_core'` or
- Tracebacks showing `from pydantic_core import ...` failing.

Why this matters
-----------------
- Requiring Rust on developer machines or CI increases setup complexity.
- New Python releases (e.g. 3.14) sometimes lack prebuilt wheels for third-party native extensions, forcing local builds.

Quick detection
---------------
Run (inside your activated virtualenv):

```powershell
python -c "import pydantic_core; print(getattr(pydantic_core, '__file__', 'no file'))"
python -m pip show pydantic pydantic-core
```a

If the first command fails, `pydantic_core` binary is missing.

Fix options (choose one)
------------------------
1) Use a supported Python version (recommended)

- Create / use a virtualenv with Python 3.11 (or the project's pinned supported version). Many packages publish prebuilt wheels for 3.11/3.12 sooner than for 3.14.
- Example (Windows PowerShell):

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

2) Install the Rust toolchain (if you must build from source)

- Windows (interactive):

```powershell
Invoke-WebRequest -Uri https://win.rustup.rs -OutFile rustup-init.exe
.\rustup-init.exe -y
# then ensure cargo is on PATH (restart shell) and retry pip install
python -m pip install --upgrade --force-reinstall pydantic-core pydantic
```

- Linux/macOS:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
python -m pip install --upgrade --force-reinstall pydantic-core pydantic
```

3) Pin or replace dependency

- If Rust toolchain installation is unacceptable for your environment, consider pinning `pydantic`/`pydantic-core` to versions that provide wheels for your Python (or using an alternative library). Document this tradeoff in the repo.

CI recommendations
------------------
- Pin the runner's Python version in GitHub Actions to a supported release (example `3.11`) to avoid unexpected builds:

```yaml
uses: actions/setup-python@v5
with:
  python-version: '3.11'
```

- If you need to support CI running on a newer Python, install the Rust toolchain in CI before `pip install`.

Documentation suggestion
-----------------------
Add this file to `Documentation/Policies/` and reference it from the developer onboarding `README.md` so contributors know how to fix import/build failures related to `pydantic-core`.

If you'd like, I can:
- Add this file to the repo (done)
- Create a follow-up PR that pins CI Python to `3.11` or removes the `services:` block from the workflow (you decide)
