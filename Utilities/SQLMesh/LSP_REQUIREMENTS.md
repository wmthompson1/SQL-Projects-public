# SQLMesh LSP Requirements for This Project

## Decision: LSP is Required for VS Code Development

**Date**: February 11, 2026  
**Status**: Active  
**Context**: Dual virtual environment setup with LSP-enabled VS Code extension

---

## Why You Keep Getting LSP Installation Prompts

### Root Cause
You have **two separate virtual environments**:
1. **Root `.venv`** - General workspace (auto-activated by VS Code)
2. **`Utilities/SQLMesh/.venv`** - SQLMesh-specific (configured in `.vscode/settings.json`)

The VS Code SQLMesh extension checks **`Utilities/SQLMesh/.venv`** specifically (per your settings), and LSP extras aren't installed there yet.

### Your Current Configuration
```jsonc
// .vscode/settings.json
"sqlmesh.pythonPath": "${workspaceFolder}\\Utilities\\SQLMesh\\.venv\\Scripts\\python.exe",
"sqlmesh.lsp.enabled": true  // ← LSP IS ENABLED
```

```
# Utilities/SQLMesh/requirements.txt
sqlmesh[github,lsp]>=0.228.1  // ← LSP IS SPECIFIED
```

**The extension sees LSP enabled but can't find the dependencies in the SQLMesh venv.**

---

## When LSP is Required in This Project

### ✅ LSP Required For:
| Activity | Why |
|----------|-----|
| **Editing SQLMesh models in VS Code** | Real-time SQL validation and error checking |
| **Using Column-Level Lineage view** | Extension feature that visualizes model dependencies |
| **IntelliSense/autocomplete** | Suggestions for model names, columns, SQL keywords |
| **Hover tooltips** | View model metadata and descriptions in-editor |
| **Go-to-Definition navigation** | Ctrl+Click to jump to model/column definitions |
| **SQLMesh plan flows with IDE integration** | VS Code extension features during interactive planning |

### ❌ LSP NOT Required For:
| Activity | Alternative |
|----------|-------------|
| **Terminal-only workflows** | Use `sqlmesh plan`, `sqlmesh run` directly |
| **Web UI usage** | `sqlmesh ui` in browser (no VS Code extension) |
| **Editing SQL without extension features** | Plain text editing works fine |
| **CI/CD pipelines** | Automated flows don't use VS Code extension |

---

## Installation Fix

### One-Time Setup (Required)
```powershell
# Navigate to SQLMesh directory
cd Utilities\SQLMesh

# Activate the SQLMesh-specific venv
.\.venv\Scripts\Activate.ps1

# Install from requirements.txt (includes LSP)
pip install -r requirements.txt

# Verify installation
pip show sqlmesh | Select-String extras
# Should show: [github, lsp]

# Reload VS Code
# Ctrl+Shift+P → "Developer: Reload Window"
```

---

## Exceptions & Special Cases

### Exception 1: Web UI Only Workflow
If you **only** use `sqlmesh ui` and never want VS Code extension features:

```powershell
# Install without LSP extras
pip install "sqlmesh[github]"  # Omit [lsp]

# Disable LSP in settings
# .vscode/settings.json
"sqlmesh.lsp.enabled": false
```

### Exception 2: CI/CD Environments
GitHub Actions/Azure Pipelines don't need LSP:
```yaml
# .github/workflows/sqlmesh.yml
- name: Install SQLMesh
  run: pip install sqlmesh[github]  # No [lsp] needed
```

### Exception 3: Docker Deployments
Production containers don't need LSP:
```dockerfile
# Dockerfile
RUN pip install sqlmesh==0.228.1  # Base only
```

---

## Recommended Workflow for This Project

**For interactive development** (current setup):
1. Keep LSP installed in `Utilities/SQLMesh/.venv`
2. Keep `"sqlmesh.lsp.enabled": true` in settings
3. Use extension features for model development

**For production/automation**:
1. Use base SQLMesh without LSP extras
2. Run `sqlmesh plan` and `sqlmesh run` via CLI
3. No VS Code extension required

---

## Decision Rationale

✅ **We keep LSP enabled because:**
- Your `requirements.txt` already specifies it
- VS Code settings enable LSP features
- Developer experience benefits outweigh minimal install overhead
- Column-level lineage is valuable for understanding model dependencies

❌ **We don't make it optional because:**
- Dual venv setup already exists and works
- Changing would require updating requirements.txt and settings.json
- No performance impact since LSP only runs when extension is active

---

## References
- [01_Installation_Guide.md](./01_Installation_Guide.md) - Base SQLMesh setup
- [11_VSCode_Extension.md](./11_VSCode_Extension.md) - Extension troubleshooting
- [.vscode/settings.json](../../.vscode/settings.json) - SQLMesh venv configuration
- [SQLMesh LSP Documentation](https://sqlmesh.readthedocs.io/en/stable/integrations/vscode/)
