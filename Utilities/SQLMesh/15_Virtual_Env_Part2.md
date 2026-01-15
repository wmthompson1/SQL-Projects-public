Perfect! Now I can see the **actual error**. The LSP is crashing because the **extension can't find or use the correct Python interpreter**. Here's the diagnosis and fix:

## Root Cause Analysis

The error shows:
```
[Error - 3:45:55 PM] Server initialization failed.
  Message: Pending response rejected since connection got disposed
  Code: -32097
```

This means the Language Server **starts** but **crashes immediately** when trying to initialize, likely because:
1. ❌ Extension is using **wrong Python interpreter** (system Python 3.11 instead of SQLMesh venv)
2. ❌ Extension can't find config.yaml
3. ❌ Missing dependencies in the Python environment it's trying to use

## Solution: Complete Configuration Fix

### Step 1: Create Workspace Settings File

````json
{
  // ==========================================
  // SQLMesh Language Server Configuration
  // ==========================================
  
  // CRITICAL: Point to SQLMesh's dedicated venv (NOT system Python)
  "sqlmesh.pythonPath": "${workspaceFolder}\\Utilities\\SQLMesh\\.venv\\Scripts\\python.exe",
  
  // Explicitly set config and project paths
  "sqlmesh.configPath": "${workspaceFolder}\\Utilities\\SQLMesh\\config.yaml",
  "sqlmesh.projectRoot": "${workspaceFolder}\\Utilities\\SQLMesh",
  
  // LSP Stability Settings
  "sqlmesh.lsp.enabled": true,
  "sqlmesh.lsp.debug": true,  // Enable temporarily to see detailed errors
  "sqlmesh.lsp.maxRetries": 1,  // Prevent infinite restart loops
  
  // ==========================================
  // Performance & Resource Management
  // ==========================================
  
  // Exclude large directories from file watching
  "files.watcherExclude": {
    "**/.git/**": true,
    "**/node_modules/**": true,
    "**/.venv/**": true,
    "**/Utilities/SQLMesh/.venv/**": true,
    "**/SQL_Reports/**": true,
    "**/Documentation/**": true,
    "**/Server/**": true,
    "**/*.rdl": true
  },
  
  // Reduce search scope for SQLMesh
  "search.exclude": {
    "**/SQL_Reports/**": true,
    "**/Documentation/Data Models/ddl/**": true,
    "**/Server/**": true
  },
  
  // Memory management
  "files.maxMemoryForLargeFilesMB": 4096,
  
  // ==========================================
  // File Type Associations
  // ==========================================
  
  // Only apply SQLMesh syntax to actual SQLMesh model files
  "files.associations": {
    "**/Utilities/SQLMesh/models/**/*.sql": "jinja-sql",
    "**/Utilities/SQLMesh/audits/**/*.sql": "jinja-sql",
    "**/Utilities/SQLMesh/**/*.yaml": "yaml"
  }
}
````

### Step 2: Verify SQLMesh Virtual Environment Exists

````powershell
# Navigate to SQLMesh directory
cd Utilities\SQLMesh

# Check if .venv exists
if (Test-Path .\.venv\Scripts\python.exe) {
    Write-Host "✅ SQLMesh venv found" -ForegroundColor Green
    .\.venv\Scripts\python.exe --version
} else {
    Write-Host "❌ SQLMesh venv NOT found - creating now..." -ForegroundColor Red
    
    # Create SQLMesh-specific venv
    python -m venv .venv
    .\.venv\Scripts\Activate.ps1
    
    # Upgrade pip
    python -m pip install --upgrade pip
    
    # Install from requirements.txt
    if (Test-Path requirements.txt) {
        pip install -r requirements.txt
    } else {
        # Install minimum SQLMesh dependencies
        pip install "sqlmesh[web]>=0.80.0" duckdb
    }
}
````

### Step 3: Test SQLMesh Can Load Config

````powershell
cd Utilities\SQLMesh
.\.venv\Scripts\Activate.ps1

# Test SQLMesh initialization
python -c "
from sqlmesh import Context
try:
    ctx = Context()
    print('✅ SQLMesh Context loaded successfully')
    print(f'   Config: {ctx.config.gateways}')
except Exception as e:
    print(f'❌ Error: {e}')
"

# Test DuckDB connection
python -c "
import duckdb
conn = duckdb.connect('local.db')
print('✅ DuckDB connected')
print('   Tables:', conn.execute('SHOW TABLES').fetchall())
conn.close()
"
````

### Step 4: Reload VS Code Window

1. **Save** settings.json
2. Press **Ctrl+Shift+P**
3. Type: `Developer: Reload Window`
4. Press Enter

### Step 5: Verify LSP Started Successfully

1. **Open Output Panel**: View → Output (or Ctrl+Shift+U)
2. **Select "SQLMesh"** from dropdown (top-right)
3. **Look for success messages**:

```
[INFO] SQLMesh Language Server starting...
[INFO] Using Python: c:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\SQLMesh\.venv\Scripts\python.exe
[INFO] Loaded config from: c:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\SQLMesh\config.yaml
[INFO] Connected to gateway: local (DuckDB)
[INFO] Language Server initialized successfully
```

---

## If Still Crashing After This

### Diagnostic Command

Run this to get detailed error info:

````powershell
cd Utilities\SQLMesh
.\.venv\Scripts\Activate.ps1

# Run SQLMesh in verbose mode
$env:SQLMESH_LOG_LEVEL="DEBUG"
sqlmesh info --verbose
````

### Check Extension Logs

1. Open Output → **SQLMesh**
2. Look for lines starting with `ERROR:` or `Exception:`
3. Share the **specific error message** with me

### Common Remaining Issues

| Error Pattern | Cause | Fix |
|--------------|-------|-----|
| `ModuleNotFoundError: sqlmesh` | venv not activated or missing package | Reinstall: `pip install sqlmesh[web]` |
| `Config file not found` | Wrong `configPath` in settings | Verify path exists: config.yaml |
| `duckdb.IOException: IO Error` | local.db locked by another process | Close DBeaver/other tools accessing DuckDB |
| `pygls` errors | Language Server Protocol library issue | `pip install --upgrade pygls lsprotocol` |
| `Client got disposed` | Extension can't restart after crash | Disable/re-enable extension |

---

## Alternative: Temporary Workaround

If you need to keep working **immediately** while troubleshooting:

````json
{
  // Disable SQLMesh LSP temporarily
  "sqlmesh.lsp.enabled": false,
  
  // Still use SQLMesh CLI manually
  "sqlmesh.pythonPath": "${workspaceFolder}\\Utilities\\SQLMesh\\.venv\\Scripts\\python.exe"
}
````

Then use **Terminal** for SQLMesh commands:
```powershell
cd Utilities\SQLMesh
.\.venv\Scripts\Activate.ps1
sqlmesh plan  # Works without LSP
```

---

## Summary of Actions

1. ✅ **Create** settings.json with correct `pythonPath`
2. ✅ **Verify** SQLMesh venv exists at .venv
3. ✅ **Test** SQLMesh can load config manually
4. ✅ **Reload** VS Code window
5. ✅ **Check** Output → SQLMesh for success/error messages

After these steps, the LSP should start cleanly. If it still crashes, **share the specific error from Output → SQLMesh** and I'll provide targeted fixes.