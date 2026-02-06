# How to Run Python Scripts from PowerShell

## The Problem

When running Python scripts with quoted paths in PowerShell, you may encounter this error:

```powershell
"C:/path/to/python.exe" ".\script.py"
# ParserError: Unexpected token
```

This happens because PowerShell treats the quoted path as a string expression rather than a command to execute.

## The Solution

### Option 1: Use the Call Operator (`&`)

The `&` operator tells PowerShell to execute the quoted command:

```powershell
& "C:/Users/williamt/source/skillsinc/skills-inc-org/SQL-Projects/.venv/Scripts/python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

### Option 2: Use Relative Path Without Quotes (if no spaces)

```powershell
.\.venv\Scripts\python.exe .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py
```

### Option 3: Use the Helper Script (Recommended)

Use the provided helper script that handles the syntax automatically:

```powershell
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

## Common Commands

### Activate Virtual Environment and Run Script

```powershell
# Navigate to repository root
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Activate virtual environment
.\.venv\Scripts\Activate.ps1

# Run script (now python is in PATH)
python .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py
```

### Run Script Without Activating venv

```powershell
# Use call operator
& ".\.venv\Scripts\python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"

# Or use the helper script
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

## About `020_Entry_Point_Persist_SQLite_to_Arango.py`

⚠️ **Note**: This script was part of PR #27 (closed, not merged). It is not currently in the main branch.

If you need this script, you have two options:

### Option A: Get it from PR #27 Branch

```powershell
# Fetch the PR #27 branch
git fetch origin copilot/add-safety-improvements-arangodb

# Check out the branch
git checkout copilot/add-safety-improvements-arangodb

# Or cherry-pick just the file you need
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/020_Entry_Point_Persist_SQLite_to_Arango.py
```

### Option B: Use Alternative Scripts

The repository contains similar scripts:
- `020_Entry_Point_Persist_NetworkX_Arango.py`
- `020_Entry_Point_Persist_2nd_NetworkX_Arango.py`
- `020_Entry_Point_Persist_3rd_NetworkX_Arango.py`

Check which one fits your needs.

## PowerShell Syntax Reference

| What You Want | PowerShell Command |
|---------------|-------------------|
| Run quoted exe | `& "C:\path\with spaces\program.exe"` |
| Run exe + args | `& "C:\path\program.exe" "arg1" "arg2"` |
| Run from venv | `.\.venv\Scripts\python.exe script.py` |
| After activation | `python script.py` (python is in PATH) |

## Troubleshooting

### Error: "Cannot find path"
- Check the script exists: `Test-Path .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py`
- Use tab completion to verify paths

### Error: "Python not found"
- Verify venv exists: `Test-Path .\.venv\Scripts\python.exe`
- Create venv if needed: `python -m venv .venv`

### Error: "Module not found" when running script
- Activate venv first: `.\.venv\Scripts\Activate.ps1`
- Install dependencies: `pip install -r requirements.txt`

## Quick Reference Card

```powershell
# Most reliable method - activate first, then run
.\.venv\Scripts\Activate.ps1
python .\scripts\modules\manufacturing_semantics\YOUR_SCRIPT.py

# One-liner without activation
& ".\.venv\Scripts\python.exe" ".\scripts\modules\manufacturing_semantics\YOUR_SCRIPT.py"

# Using helper script (if available)
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\YOUR_SCRIPT.py"
```
