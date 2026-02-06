#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Safe ArangoDB Graph Persistence Workflow

.DESCRIPTION
    PowerShell wrapper that safely persists SQLite schema to ArangoDB with
    automatic backup creation before any destructive operations.

    This script provides a safe workflow for updating the manufacturing schema
    graph in ArangoDB by:
    1. Backing up the existing graph (unless --SkipBackup is specified)
    2. Running the persistence script with safety checks
    3. Reporting success/failure clearly
    4. Providing clear instructions for recovery if needed

.PARAMETER GraphName
    Name of the graph in ArangoDB (default: manufacturing_schema)

.PARAMETER SqlitePath
    Path to SQLite database file (default: hf-space-inventory-sqlgen/app_schema/manufacturing.db)

.PARAMETER SkipBackup
    Skip automatic backup before persistence (advanced users only)

.PARAMETER ForceOverwrite
    Skip safety prompts and force overwrite (not recommended)

.PARAMETER BackupDir
    Directory for backup files (default: ./backups)

.EXAMPLE
    .\safe_persist.ps1
    Run with default settings (backs up, then persists with safety checks)

.EXAMPLE
    .\safe_persist.ps1 -SkipBackup
    Skip backup step (advanced users only)

.EXAMPLE
    .\safe_persist.ps1 -GraphName "test_schema"
    Persist to a different graph name

.NOTES
    Author: Manufacturing Semantics Team
    Safety: This script implements best practices for production graph updates
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string]$GraphName = "manufacturing_schema",
    
    [Parameter()]
    [string]$SqlitePath = "hf-space-inventory-sqlgen/app_schema/manufacturing.db",
    
    [Parameter()]
    [switch]$SkipBackup,
    
    [Parameter()]
    [switch]$ForceOverwrite,
    
    [Parameter()]
    [switch]$DryRun,
    
    [Parameter()]
    [string]$BackupDir = "backups"
)

# Script configuration
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$BackupScript = Join-Path $ScriptDir "backup_arango_graph.py"
$PersistScript = Join-Path $ScriptDir "020_Entry_Point_Persist_SQLite_to_Arango.py"

# Color output functions
function Write-Header {
    param([string]$Message)
    Write-Host ""
    Write-Host ("=" * 75) -ForegroundColor Cyan
    Write-Host $Message -ForegroundColor Cyan
    Write-Host ("=" * 75) -ForegroundColor Cyan
}

function Write-Step {
    param([string]$Message)
    Write-Host ""
    Write-Host $Message -ForegroundColor Yellow
    Write-Host ("-" * 75) -ForegroundColor Yellow
}

function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-WarningMessage {
    param([string]$Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

function Write-ErrorMessage {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

# Verify Python is available
function Test-Python {
    try {
        $pythonVersion = python --version 2>&1
        Write-Success "Python found: $pythonVersion"
        return $true
    }
    catch {
        Write-ErrorMessage "Python not found. Please install Python 3.7 or later."
        return $false
    }
}

# Verify required scripts exist
function Test-Scripts {
    $missing = @()
    
    if (-not (Test-Path $BackupScript)) {
        $missing += "backup_arango_graph.py"
    }
    
    if (-not (Test-Path $PersistScript)) {
        $missing += "020_Entry_Point_Persist_SQLite_to_Arango.py"
    }
    
    # Optional helper for running dry-run without PowerShell quoting issues
    $DryHelper = Join-Path $ScriptDir "run_dry_persist.py"
    if (-not (Test-Path $DryHelper)) {
        $missing += "run_dry_persist.py"
    }
    
    if ($missing.Count -gt 0) {
        Write-ErrorMessage "Missing required scripts:"
        foreach ($script in $missing) {
            Write-Host "  • $script" -ForegroundColor Red
        }
        return $false
    }
    
    Write-Success "All required scripts found"
    return $true
}

# Create backup of existing graph
function Backup-Graph {
    param([string]$Name, [string]$OutputDir)
    
    Write-Step "Creating backup of graph '$Name'"
    
    # Create backup directory if it doesn't exist
    if (-not (Test-Path $OutputDir)) {
        New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
        Write-Success "Created backup directory: $OutputDir"
    }
    
    # Generate timestamped backup filename
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupFile = Join-Path $OutputDir "${Name}_backup_${timestamp}.json"
    
    try {
        # Run backup script
        $output = python $BackupScript --graph-name $Name --output $backupFile 2>&1
        $output | ForEach-Object { Write-Host $_ }
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Backup created: $backupFile"
            return $backupFile
        }
        else {
            Write-WarningMessage "Backup failed (graph may not exist yet)"
            return $null
        }
    }
    catch {
        Write-WarningMessage "Backup failed: $_"
        return $null
    }
}

# Run persistence script
function Invoke-Persistence {
    param([string]$Name, [string]$DbPath, [bool]$Force)
    
    Write-Step "Running persistence script"
    
    $args = @(
        $PersistScript,
        "--graph-name", $Name,
        "--sqlite-path", $DbPath
    )
    
    if ($Force) {
        $args += "--force-overwrite"
        Write-WarningMessage "Force overwrite enabled - skipping safety prompts"
    }
    
    try {
        # Run persistence script interactively
        python @args
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Persistence completed successfully"
            return $true
        }
        else {
            Write-ErrorMessage "Persistence failed"
            return $false
        }
    }
    catch {
        Write-ErrorMessage "Persistence script error: $_"
        return $false
    }
}

# Main execution
try {
    Write-Header "Safe ArangoDB Graph Persistence"
    
    # Display configuration
    Write-Host ""
    Write-Host "Configuration:" -ForegroundColor Cyan
    Write-Host "  Graph name:     $GraphName"
    Write-Host "  SQLite path:    $SqlitePath"
    Write-Host "  Skip backup:    $SkipBackup"
    Write-Host "  Force overwrite: $ForceOverwrite"
    Write-Host "  Backup dir:     $BackupDir"
    
    # Pre-flight checks
    Write-Step "Pre-flight checks"
    
    if (-not (Test-Python)) {
        exit 1
    }
    
    if (-not (Test-Scripts)) {
        exit 1
    }
    
    if (-not (Test-Path $SqlitePath)) {
        Write-ErrorMessage "SQLite database not found: $SqlitePath"
        exit 1
    }
    
    Write-Success "SQLite database found: $SqlitePath"
    Write-Success "All pre-flight checks passed"
    
    # Backup step (unless skipped)
    $backupFile = $null
    if (-not $SkipBackup) {
        $backupFile = Backup-Graph -Name $GraphName -OutputDir $BackupDir
        
        if ($backupFile) {
            Write-Host ""
            Write-Host "📦 Backup Location:" -ForegroundColor Green
            Write-Host "   $backupFile" -ForegroundColor White
            Write-Host ""
            Write-Host "To restore this backup if needed:" -ForegroundColor Yellow
            Write-Host "   python $BackupScript --restore `"$backupFile`"" -ForegroundColor White
        }
    }
    else {
        Write-WarningMessage "Backup skipped (--SkipBackup flag used)"
        Write-WarningMessage "Proceeding without backup - data loss is possible!"
    }
    
    # Dry-run handling: run helper and exit early
    if ($DryRun) {
        Write-Step "Dry-run requested: running dry-run helper (no ArangoDB contact)"
        $dryHelper = Join-Path $ScriptDir "run_dry_persist.py"
        try {
            python $dryHelper
            if ($LASTEXITCODE -eq 0) {
                Write-Success "Dry-run complete. No changes made to ArangoDB."
                exit 0
            }
            else {
                Write-ErrorMessage "Dry-run helper returned non-zero exit code"
                exit $LASTEXITCODE
            }
        }
        catch {
            Write-ErrorMessage "Failed to execute dry-run helper: $_"
            exit 1
        }
    }
    
    # Persistence step
    $success = Invoke-Persistence -Name $GraphName -DbPath $SqlitePath -Force $ForceOverwrite
    
    # Final summary
    Write-Header "Summary"
    
    if ($success) {
        Write-Success "Graph persistence completed successfully!"
        Write-Host ""
        Write-Host "Graph Details:" -ForegroundColor Cyan
        Write-Host "  Name:   $GraphName"
        Write-Host "  Source: $SqlitePath"
        
        if ($backupFile) {
            Write-Host "  Backup: $backupFile"
        }
        
        Write-Host ""
        Write-Host "Next Steps:" -ForegroundColor Cyan
        Write-Host "  • Verify graph: python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py"
        Write-Host "  • Use graph: python 026_Entry_Point_NCM_Elevation_ArangoDB.py"
        
        exit 0
    }
    else {
        Write-ErrorMessage "Graph persistence failed!"
        
        if ($backupFile) {
            Write-Host ""
            Write-Host "Recovery Options:" -ForegroundColor Yellow
            Write-Host "  1. Restore from backup:"
            Write-Host "     python $BackupScript --restore `"$backupFile`""
            Write-Host ""
            Write-Host "  2. Try again with different options"
            Write-Host "     .\safe_persist.ps1 -GraphName different_name"
        }
        
        exit 1
    }
}
catch {
    Write-ErrorMessage "Unexpected error: $_"
    Write-Host $_.ScriptStackTrace -ForegroundColor Red
    exit 1
}
