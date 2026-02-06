# Quick Fix for Your PowerShell Error

## Your Error
```
"C:/Users/williamt/source/skillsinc/skills-inc-org/SQL-Projects/.venv/Scripts/python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"

ParserError: Unexpected token
```

## Instant Fix

### Solution 1: Add `&` Before the Command (Recommended)

```powershell
& "C:/Users/williamt/source/skillsinc/skills-inc-org/SQL-Projects/.venv/Scripts/python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

The `&` tells PowerShell to execute the quoted path as a command.

### Solution 2: Use Relative Path (Simpler)

First, navigate to your repository:
```powershell
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects
```

Then run:
```powershell
& ".\.venv\Scripts\python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

### Solution 3: Activate Virtual Environment (Best Practice)

```powershell
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects
.\.venv\Scripts\Activate.ps1
python .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py
```

### Solution 4: Use the Helper Script (Easiest)

```powershell
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

---

## Important: That Script Doesn't Exist Yet!

The script `020_Entry_Point_Persist_SQLite_to_Arango.py` is **not in your current branch**. It was part of PR #27 which was closed.

### Get the Script from PR #27:

```powershell
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Fetch the branch with the script
git fetch origin copilot/add-safety-improvements-arangodb

# Get just the script file
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/020_Entry_Point_Persist_SQLite_to_Arango.py

# Also get the related files (optional but recommended)
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/backup_arango_graph.py
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/safe_persist.ps1
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/README_GRAPH_PERSISTENCE.md
```

### Or Use Alternative Scripts Already Available:

```powershell
# List available ArangoDB scripts
Get-ChildItem scripts\modules\manufacturing_semantics\*Arango*.py

# Common alternatives:
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_NetworkX_Arango.py"
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\026_Entry_Point_NCM_Elevation_ArangoDB.py"
```

---

## Why This Error Happens

In PowerShell:
- ❌ `"C:\path\python.exe" "script.py"` → Treats it as a string, not a command
- ✅ `& "C:\path\python.exe" "script.py"` → Executes it as a command

The `&` is called the "call operator" and tells PowerShell to execute what follows.

---

## More Help

See these files for detailed documentation:
- `Documentation/PowerShell_Python_Scripts.md` - Complete PowerShell guide
- `scripts/modules/manufacturing_semantics/README_MISSING_SCRIPT.md` - About the missing script
- `scripts/run_python_script.ps1` - Helper script you can use

---

## Quick Commands Cheat Sheet

```powershell
# Navigate to repo
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Activate virtual environment
.\.venv\Scripts\Activate.ps1

# Run any Python script (after activation)
python .\path\to\script.py

# Deactivate virtual environment
deactivate

# Check if script exists
Test-Path .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py

# List available scripts
Get-ChildItem scripts\modules\manufacturing_semantics\*.py
```

---

**Need more help?** Check the full documentation in `Documentation/PowerShell_Python_Scripts.md`
