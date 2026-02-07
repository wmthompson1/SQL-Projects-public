<#
.SYNOPSIS
    Run Python scripts from the repository's virtual environment with correct PowerShell syntax.

.DESCRIPTION
    This helper script simplifies running Python scripts by:
    - Automatically using the correct call operator syntax
    - Finding the virtual environment Python executable
    - Handling paths with or without spaces correctly
    - Providing clear error messages

.PARAMETER ScriptPath
    Path to the Python script to run (relative to repository root)

.PARAMETER ScriptArgs
    Additional arguments to pass to the Python script

.PARAMETER UseSystemPython
    Use system Python instead of virtual environment Python

.PARAMETER VenvPath
    Custom path to virtual environment (default: .venv)

.EXAMPLE
    .\scripts\run_python_script.ps1 -ScriptPath "scripts\modules\manufacturing_semantics\020_Entry_Point_Persist_SQLite_to_Arango.py"

.EXAMPLE
    .\scripts\run_python_script.ps1 -ScriptPath "scripts\test_script.py" -ScriptArgs "--verbose --debug"

.EXAMPLE
    .\scripts\run_python_script.ps1 -ScriptPath "scripts\test.py" -UseSystemPython

.NOTES
    File Name      : run_python_script.ps1
    Prerequisite   : Python virtual environment should be created (.venv)
    Created to fix : PowerShell parser errors when running Python scripts with quoted paths
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0, HelpMessage="Path to Python script relative to repo root")]
    [string]$ScriptPath,
    
    [Parameter(Mandatory=$false, Position=1, HelpMessage="Additional arguments for the script")]
    [string]$ScriptArgs = "",
    
    [Parameter(Mandatory=$false)]
    [switch]$UseSystemPython,
    
    [Parameter(Mandatory=$false)]
    [string]$VenvPath = ".venv"
)

# Get repository root (assuming this script is in scripts/ directory)
$RepoRoot = Split-Path -Parent $PSScriptRoot
if (-not $RepoRoot) {
    $RepoRoot = Get-Location
}

Write-Host "Repository Root: $RepoRoot" -ForegroundColor Cyan

# Resolve script path
$FullScriptPath = Join-Path $RepoRoot $ScriptPath
if (-not (Test-Path $FullScriptPath)) {
    Write-Host "❌ Error: Python script not found at: $FullScriptPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 Tips:" -ForegroundColor Yellow
    Write-Host "   - Check the script path is correct"
    Write-Host "   - Use tab completion to verify the path"
    Write-Host "   - If the script is from PR #27, see Documentation/PowerShell_Python_Scripts.md"
    exit 1
}

# Determine which Python to use
if ($UseSystemPython) {
    $PythonExe = "python"
    Write-Host "Using system Python" -ForegroundColor Cyan
} else {
    # Check for virtual environment
    $VenvPythonExe = Join-Path $RepoRoot "$VenvPath\Scripts\python.exe"
    
    if (-not (Test-Path $VenvPythonExe)) {
        Write-Host "⚠️  Warning: Virtual environment not found at: $VenvPythonExe" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Creating virtual environment..." -ForegroundColor Cyan
        
        try {
            & python -m venv (Join-Path $RepoRoot $VenvPath)
            Write-Host "✅ Virtual environment created successfully" -ForegroundColor Green
        } catch {
            Write-Host "❌ Error creating virtual environment: $_" -ForegroundColor Red
            Write-Host "Falling back to system Python" -ForegroundColor Yellow
            $UseSystemPython = $true
            $PythonExe = "python"
        }
    }
    
    if (-not $UseSystemPython) {
        $PythonExe = $VenvPythonExe
        Write-Host "Using virtual environment Python: $VenvPath" -ForegroundColor Cyan
    }
}

# Verify Python is available
if ($UseSystemPython) {
    try {
        $null = & python --version 2>&1
    } catch {
        Write-Host "❌ Error: Python not found in system PATH" -ForegroundColor Red
        Write-Host "Please install Python or create a virtual environment" -ForegroundColor Yellow
        exit 1
    }
}

# Display what we're about to run
Write-Host ""
Write-Host "▶️  Running Python Script" -ForegroundColor Green
Write-Host "   Script: $ScriptPath" -ForegroundColor White
if ($ScriptArgs) {
    Write-Host "   Args:   $ScriptArgs" -ForegroundColor White
}
Write-Host ""

# Run the script using the call operator (&) to handle quoted paths correctly
try {
    if ($ScriptArgs) {
        # Split args and pass them correctly
        $ArgArray = $ScriptArgs -split ' '
        & $PythonExe $FullScriptPath @ArgArray
    } else {
        & $PythonExe $FullScriptPath
    }
    
    $ExitCode = $LASTEXITCODE
    Write-Host ""
    if ($ExitCode -eq 0) {
        Write-Host "✅ Script completed successfully" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Script exited with code: $ExitCode" -ForegroundColor Yellow
    }
    exit $ExitCode
    
} catch {
    Write-Host ""
    Write-Host "❌ Error running script: $_" -ForegroundColor Red
    exit 1
}
