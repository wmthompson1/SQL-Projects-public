# SQLMesh Installation Guide

## Overview
SQLMesh is a next-generation data transformation framework for shipping data quickly and efficiently. It supports SQL/Python transformations with SQL transpilation, column-level lineage, unit testing, and virtual environments.

## Prerequisites
- Python 3.8+ installed
- pip package manager

## Basic Installation

```bash
pip install sqlmesh
```

## Database-Specific Extras

SQLMesh uses extras to add optional dependencies:

```bash
pip install "sqlmesh[duckdb]"      # Local dev environment (default)
pip install "sqlmesh[snowflake]"   # Snowflake connector
pip install "sqlmesh[bigquery]"    # BigQuery support
pip install "sqlmesh[postgres]"    # PostgreSQL
pip install "sqlmesh[mysql]"       # MySQL
pip install "sqlmesh[redshift]"    # Amazon Redshift
pip install "sqlmesh[databricks]"  # Databricks
```

## Multiple Extras

```bash
pip install "sqlmesh[snowflake,github,slack]"
```

Common extras:
- `lsp` - VSCode language server support (optional - only needed for VS Code extension features)
- `github` - GitHub CI/CD bot integration
- `slack` - Slack notifications

## VSCode Support (Optional)

> **Note:** LSP is only required if you want to use the SQLMesh VS Code extension for features like column-level lineage, auto-completion, and hover tooltips. It's NOT required for CLI usage (`sqlmesh plan`, `sqlmesh run`, etc.) or web UI (`sqlmesh ui`).

```bash
pip install "sqlmesh[lsp]"
```

After installation, reload your VS Code window (Ctrl+Shift+P → "Developer: Reload Window").

## Verify Installation

```bash
sqlmesh --version
sqlmesh --help
```

## Resources
- Official Docs: https://sqlmesh.readthedocs.io/
- PyPI: https://pypi.org/project/sqlmesh/
- GitHub: https://github.com/TobikoData/sqlmesh
