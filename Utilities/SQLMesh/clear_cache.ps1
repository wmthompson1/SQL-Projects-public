<#
.SYNOPSIS
    Clears SQLMesh cache and state, then optionally rebuilds.

.DESCRIPTION
    This script automates clearing SQLMesh's cached state (.cache folder and db.db file)
    and optionally triggers a clean rebuild with `sqlmesh plan --auto-apply`.
    
    Use this when pulling updated models that have schema changes (renamed columns, etc.)
    to force SQLMesh to rebuild from scratch with the correct column definitions.

.PARAMETER SkipRebuild
    If specified, only clears cache without running sqlmesh plan.

.PARAMETER TargetPath
    Path to SQLMesh project directory (defaults to script directory).

.EXAMPLE
    .\clear_cache.ps1
    # Clears cache and rebuilds automatically

.EXAMPLE
    .\clear_cache.ps1 -SkipRebuild
    # Only clears cache without rebuilding

.EXAMPLE
    .\clear_cache.ps1 -TargetPath "C:\Projects\SQL-Projects\Utilities\SQLMesh"
    # Clears cache in specified directory and rebuilds

.NOTES
    Author: GitHub Copilot
    Version: 1.0
    Created: 2026-02-05
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [switch]$SkipRebuild,
    
    [Parameter(Mandatory=$false)]
    [string]$TargetPath = $PSScriptRoot
)

# Set error action preference
$ErrorActionPreference = "Stop"

Write-Host "🧹 SQLMesh Cache Cleaner" -ForegroundColor Cyan
Write-Host "=" * 60

# Validate target path
if (-not (Test-Path $TargetPath)) {
    Write-Error "Target path does not exist: $TargetPath"
    exit 1
}

# Change to target directory
Push-Location $TargetPath
try {
    Write-Host "📂 Working directory: $TargetPath" -ForegroundColor Yellow
    
    # Check for config.yaml to confirm this is a SQLMesh project
    if (-not (Test-Path "config.yaml")) {
        Write-Warning "No config.yaml found - this may not be a SQLMesh project directory"
        $continue = Read-Host "Continue anyway? (y/N)"
        if ($continue -ne 'y') {
            Write-Host "Aborted by user" -ForegroundColor Yellow
            exit 0
        }
    }
    
    # Clear .cache directory
    $cacheDir = Join-Path $TargetPath ".cache"
    if (Test-Path $cacheDir) {
        Write-Host "🗑️  Removing .cache directory..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $cacheDir -ErrorAction SilentlyContinue
        Write-Host "   ✅ Removed .cache" -ForegroundColor Green
    } else {
        Write-Host "   ℹ️  .cache directory not found (already clean)" -ForegroundColor Gray
    }
    
    # Clear db.db file
    $dbFile = Join-Path $TargetPath "db.db"
    if (Test-Path $dbFile) {
        Write-Host "🗑️  Removing db.db file..." -ForegroundColor Yellow
        Remove-Item -Force $dbFile -ErrorAction SilentlyContinue
        Write-Host "   ✅ Removed db.db" -ForegroundColor Green
    } else {
        Write-Host "   ℹ️  db.db file not found (already clean)" -ForegroundColor Gray
    }
    
    # Clear local.db if it's not in .gitignore exception
    $localDb = Join-Path $TargetPath "local.db"
    if (Test-Path $localDb) {
        Write-Host "   ℹ️  local.db found (this is the SQLMesh state DB, keeping it)" -ForegroundColor Gray
        Write-Host "      If you want to clear local.db too, delete it manually" -ForegroundColor Gray
    }
    
    Write-Host ""
    Write-Host "✅ Cache cleared successfully!" -ForegroundColor Green
    
    # Rebuild if not skipped
    if (-not $SkipRebuild) {
        Write-Host ""
        Write-Host "🔨 Rebuilding SQLMesh models..." -ForegroundColor Cyan
        Write-Host "   Running: sqlmesh plan --auto-apply" -ForegroundColor Gray
        Write-Host ""
        
        # Check if sqlmesh is available
        $sqlmeshAvailable = Get-Command sqlmesh -ErrorAction SilentlyContinue
        if (-not $sqlmeshAvailable) {
            Write-Warning "sqlmesh command not found. Please install SQLMesh or run manually:"
            Write-Host "   pip install sqlmesh" -ForegroundColor Yellow
            Write-Host "   sqlmesh plan --auto-apply" -ForegroundColor Yellow
            exit 0
        }
        
        # Run sqlmesh plan
        & sqlmesh plan --auto-apply
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "✅ SQLMesh rebuild completed successfully!" -ForegroundColor Green
        } else {
            Write-Warning "SQLMesh plan returned exit code: $LASTEXITCODE"
            Write-Host "You may need to review the output above for errors." -ForegroundColor Yellow
        }
    } else {
        Write-Host ""
        Write-Host "ℹ️  Rebuild skipped (use -SkipRebuild:$false to rebuild)" -ForegroundColor Gray
        Write-Host "   To rebuild manually, run:" -ForegroundColor Gray
        Write-Host "   sqlmesh plan --auto-apply" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "=" * 60
    Write-Host "✨ Done!" -ForegroundColor Green
    
} finally {
    Pop-Location
}
