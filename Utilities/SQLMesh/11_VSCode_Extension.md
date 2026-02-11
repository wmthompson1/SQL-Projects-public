# SQLMesh VS Code Extension

## Overview
The SQLMesh VS Code extension provides IDE features for SQLMesh projects including column-level lineage visualization, auto-completion, and model rendering.

## Links

| Resource | URL |
|----------|-----|
| **GitHub Repository** | https://github.com/TobikoData/sqlmesh |
| **VS Code Marketplace** | https://marketplace.visualstudio.com/items?itemName=tobikodata.sqlmesh |
| **Official Documentation** | https://sqlmesh.readthedocs.io/en/stable/guides/vscode/ |
| **Issue Tracker** | https://github.com/TobikoData/sqlmesh/issues |

## Installation

### 1. Install LSP Support
```bash
pip install 'sqlmesh[lsp]'
```

### 2. Install VS Code Extension
1. Open VS Code Extensions (Ctrl+Shift+X)
2. Search for "SQLMesh" by TobikoData
3. Click Install

### 3. Configure Python Interpreter
- Open Command Palette (Ctrl+Shift+P)
- Select "Python: Select Interpreter"
- Choose the environment with sqlmesh[lsp] installed

## Key Features

| Feature | Description |
|---------|-------------|
| **Column-Level Lineage** | Interactive graph showing upstream/downstream dependencies |
| **Model Rendering** | Preview macros resolved to final SQL side-by-side |
| **Auto-Completion** | Intelligent suggestions for model names, SQL keywords |
| **Hover Tooltips** | Model descriptions and metadata on hover |
| **Go to Definition** | Jump to model/column definitions with Ctrl+Click |
| **Command Palette** | Quick access to SQLMesh commands |

## Usage

1. Open a SQLMesh project folder in VS Code
2. Open any `.sql` model file
3. Click the "Lineage" tab at the bottom panel
4. Use Command Palette for SQLMesh commands

## Alternative: SQLMesh UI Extension

Community extension that embeds the full web UI in VS Code:
- https://marketplace.visualstudio.com/items?itemName=WesleyBatista.sqlmeshui

## Troubleshooting

### Do I Need LSP?

> **📋 Project-Specific Requirements**: See [LSP_REQUIREMENTS.md](./LSP_REQUIREMENTS.md) for this project's dual-venv setup and when LSP is required for SQLMesh plan flows.

**LSP is ONLY required if:**
- ✅ You want to use the SQLMesh VSCode extension features (lineage, auto-completion, hover tooltips)
- ✅ You're actively developing models in VS Code and want IDE integration

**LSP is NOT required if:**
- ❌ You only use SQLMesh via CLI (`sqlmesh plan`, `sqlmesh run`, etc.)
- ❌ You edit SQL files without extension features
- ❌ You use the web UI (`sqlmesh ui`)

### Error: "LSP dependencies missing, make sure to install 'sqlmesh[lsp]'"

**Solution 1: Install in Active Virtual Environment**
```powershell
# Activate your virtual environment first
.\.venv\Scripts\Activate.ps1

# Then install LSP support
pip install "sqlmesh[lsp]"

# Reload VS Code window
# Ctrl+Shift+P → "Developer: Reload Window"
```

**Solution 2: Verify Python Interpreter**
1. Check which Python VS Code is using: Ctrl+Shift+P → "Python: Select Interpreter"
2. Ensure it matches the environment where you installed sqlmesh[lsp]
3. Use the fully qualified path if needed: `C:\...\SQL-Projects\.venv\Scripts\python.exe`

**Solution 3: Reinstall Extension**
1. Uninstall the SQLMesh extension from VS Code
2. Verify LSP is installed: `pip show sqlmesh | Select-String version`
3. Reinstall the SQLMesh extension
4. Reload window

### Verify Installation

```powershell
# Check if LSP support is installed
pip show sqlmesh | Select-String extras

# Test SQLMesh is working
sqlmesh --version

# Check installed packages in environment
pip list | Select-String sqlmesh
```

### Common Issues

| Issue | Solution |
|-------|----------|
| Extension shows error after install | Reload VS Code window (Ctrl+Shift+P → Reload Window) |
| Wrong Python interpreter | Match interpreter to environment with sqlmesh[lsp] |
| LSP not found | Ensure virtual environment activated before pip install |
| Features not working | Check if `config.yaml` exists in project root |

## Status
- Open source (Apache 2.0 license)
- Actively maintained by TobikoData
- Community contributions welcome
