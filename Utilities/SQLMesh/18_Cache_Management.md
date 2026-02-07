# SQLMesh Cache Management

## Overview

This guide explains how to manage SQLMesh's cached state when making schema changes or pulling updates that modify table structures.

## Problem

SQLMesh caches its understanding of data models in:
- `.cache/` folder - Compiled model artifacts
- `db.db` file - State database (older versions)
- `local.db` file - SQLMesh state database (current versions)

When you pull updated models with schema changes (renamed columns, new tables, etc.), the cached state may reference old column names or structures, causing errors.

## Solution

Use the provided cache clearing scripts to force a clean rebuild.

## Automated Cache Clearing

### PowerShell (Windows)

```powershell
# Clear cache and rebuild automatically
.\clear_cache.ps1

# Clear cache only (skip rebuild)
.\clear_cache.ps1 -SkipRebuild

# Clear cache in specific directory
.\clear_cache.ps1 -TargetPath "C:\Projects\SQL-Projects\Utilities\SQLMesh"
```

### Bash (Linux/macOS)

```bash
# Clear cache and rebuild automatically
./clear_cache.sh

# Clear cache only (skip rebuild)
./clear_cache.sh --skip-rebuild

# Clear cache in specific directory
./clear_cache.sh --target-path "/opt/projects/SQL-Projects/Utilities/SQLMesh"

# Show help
./clear_cache.sh --help
```

## Manual Cache Clearing

If you prefer to clear the cache manually:

```bash
# Remove cache directory
rm -rf .cache/

# Remove state database (if present)
rm -f db.db

# Rebuild from scratch
sqlmesh plan --auto-apply
```

## When to Clear Cache

Clear the SQLMesh cache when:

1. **After pulling schema changes**: Column renames, type changes, or table restructuring
2. **Model compilation errors**: If SQLMesh complains about missing columns that should exist
3. **Inconsistent state**: Models appear out of sync with actual database schema
4. **After major refactoring**: Significant changes to model dependencies

## What Gets Cleared

The scripts clear:
- ✅ `.cache/` directory - Compiled model cache
- ✅ `db.db` file - Legacy state database (if present)
- ⚠️  `local.db` is **NOT** cleared by default (it's the main SQLMesh state DB)

To clear `local.db`, delete it manually if you want a completely fresh start.

## Safety Features

Both scripts include safety checks:
- Verify you're in a SQLMesh project directory (checks for `config.yaml`)
- Prompt for confirmation if config not found
- Won't run rebuild if `sqlmesh` command is not available
- Color-coded output for easy reading

## CI/CD Integration

You can integrate cache clearing into CI/CD workflows:

```yaml
# GitHub Actions example
- name: Clear SQLMesh cache
  run: |
    cd Utilities/SQLMesh
    ./clear_cache.sh --skip-rebuild
  
- name: Run SQLMesh tests
  run: |
    cd Utilities/SQLMesh
    sqlmesh test
    
- name: Apply changes
  run: |
    cd Utilities/SQLMesh
    sqlmesh plan --auto-apply
```

## Troubleshooting

### "sqlmesh command not found"
Install SQLMesh:
```bash
pip install sqlmesh
```

### Permission denied (Bash)
Make the script executable:
```bash
chmod +x clear_cache.sh
```

### Cache still causing issues
If problems persist after clearing cache:
1. Delete `local.db` manually
2. Check for uncommitted changes in models/
3. Verify database connection in `config.yaml`

## Best Practices

1. **Before major updates**: Clear cache before pulling large updates
2. **Team coordination**: Notify team when clearing cache on shared environments
3. **Backup**: Consider backing up `local.db` before clearing if you have important state
4. **Automation**: Add cache clearing to your pre-commit hooks for schema changes

## Related Commands

```bash
# Check SQLMesh version
sqlmesh --version

# Validate models without applying
sqlmesh plan --dry-run

# Show current state
sqlmesh info

# Reset to specific environment
sqlmesh plan prod --no-prompts
```

## See Also

- [SQLMesh Documentation](https://sqlmesh.readthedocs.io/)
- [02_Project_Setup.md](02_Project_Setup.md) - SQLMesh project setup
- [16_SQLMesh_structures.md](16_SQLMesh_structures.md) - Understanding SQLMesh structure
