# Missing Script: 020_Entry_Point_Persist_SQLite_to_Arango.py

## Status

❌ **This script is NOT in the current branch**

This script was part of **PR #27** (ArangoDB Safety Improvements) which was closed without merging due to CI failures.

## What This Script Does

The `020_Entry_Point_Persist_SQLite_to_Arango.py` script provides:
- Safe SQLite-to-ArangoDB schema graph persistence
- Interactive safety checks before overwriting existing graphs
- Ability to infer nodes from edges when `schema_nodes` table is empty
- Protection against accidental deletion of production graphs

## Your Options

### Option 1: Get the Script from PR #27 (Recommended for Safety Features)

If you need this specific script with its safety features:

```powershell
# Fetch the PR #27 branch
git fetch origin copilot/add-safety-improvements-arangodb

# Option A: Check out the entire branch to review all files
git checkout copilot/add-safety-improvements-arangodb

# Option B: Cherry-pick just this file into your current branch
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/020_Entry_Point_Persist_SQLite_to_Arango.py
```

PR #27 also includes:
- `backup_arango_graph.py` - Graph backup utility
- `safe_persist.ps1` - PowerShell wrapper with automated backup
- `README_GRAPH_PERSISTENCE.md` - Comprehensive documentation
- `test_safety_features.py` - Test suite
- `arangodb_persistence.py` - Shared persistence module

### Option 2: Use Existing Alternative Scripts

The repository has similar scripts that are already available:

#### 1. `020_Entry_Point_Persist_NetworkX_Arango.py`
- Basic NetworkX to ArangoDB persistence
- No special safety features
- Use for test/development graphs

#### 2. `020_Entry_Point_Persist_2nd_NetworkX_Arango.py`
- Alternative persistence implementation
- Check file for specific features

#### 3. `020_Entry_Point_Persist_3rd_NetworkX_Arango.py`
- Another persistence variant
- Review file for details

#### 4. `026_Entry_Point_NCM_Elevation_ArangoDB.py`
- Semantic layer graph persistence
- Used in CI/CD workflows

### Option 3: Reopen PR #27

If the safety features are needed by the team:

1. **PR #28 is now merged** - This fixed the CI blocker that caused PR #27 to fail
2. **PR #27 can now be reopened** - The solder validation skip is in place
3. **Steps**:
   - Reopen PR #27 on GitHub
   - Rebase on current main (which has PR #28)
   - CI should pass this time

## How to Run (Once You Have the Script)

### Method 1: Using the Helper Script (Easiest)

```powershell
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

### Method 2: Activate Virtual Environment First

```powershell
# Activate venv
.\.venv\Scripts\Activate.ps1

# Run the script
python .\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py
```

### Method 3: Direct Execution with Call Operator

```powershell
# Use the & operator for quoted paths
& ".\.venv\Scripts\python.exe" ".\scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"
```

## Prerequisites

Before running any ArangoDB persistence script:

1. **ArangoDB running**: Ensure ArangoDB is running locally or accessible
   ```powershell
   # Check if ArangoDB is accessible
   curl http://localhost:8529/_api/version
   ```

2. **Environment variables set** (create `.env` file in repo root):
   ```bash
   DATABASE_HOST=http://localhost:8529
   DATABASE_NAME=networkx_graphs
   DATABASE_USERNAME=root
   DATABASE_PASSWORD=your_password
   SQLITE_PATH=hf-space-inventory-sqlgen/app_schema/manufacturing.db
   ```

3. **Dependencies installed**:
   ```powershell
   .\.venv\Scripts\Activate.ps1
   pip install -r requirements.txt
   pip install python-arango networkx python-dotenv
   ```

4. **SQLite database exists**:
   ```powershell
   # Verify SQLite database
   Test-Path hf-space-inventory-sqlgen/app_schema/manufacturing.db
   ```

## Related Documentation

- [PowerShell_Python_Scripts.md](../Documentation/PowerShell_Python_Scripts.md) - How to fix PowerShell parser errors
- [PR_STATUS_SUMMARY.md](../.github/PR_STATUS_SUMMARY.md) - Status of PR #27 and PR #28
- Repository README sections on ArangoDB setup

## Quick Decision Guide

**Choose PR #27 script if:**
- ✅ You need safety checks before overwriting graphs
- ✅ You want interactive prompts for destructive operations
- ✅ You need automatic backup capabilities
- ✅ You're working with production graphs

**Choose existing alternatives if:**
- ✅ You're working with test/dev graphs
- ✅ You don't need safety features
- ✅ You want something that's already in main branch
- ✅ You're doing automated/CI operations

## Need Help?

If you're unsure which option to choose or need assistance:

1. Review the existing scripts in `scripts/modules/manufacturing_semantics/`
2. Check the documentation in the script files themselves (docstrings)
3. Refer to PR #27 discussion for context on the safety features

## Commands Summary

```powershell
# Get the missing script from PR #27
git fetch origin copilot/add-safety-improvements-arangodb
git checkout copilot/add-safety-improvements-arangodb -- scripts/modules/manufacturing_semantics/020_Entry_Point_Persist_SQLite_to_Arango.py

# Run it (easiest method)
.\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"

# List alternative scripts
Get-ChildItem scripts\modules\manufacturing_semantics\*Arango*.py
```
