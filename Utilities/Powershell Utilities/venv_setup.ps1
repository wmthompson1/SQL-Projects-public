<#
Simple PowerShell helper to create a local .venv in the repo root,
activate it, and install requirements.
This script is intended for developer use only.
#>

param(
    [string]$VenvName = ".venv",
    [string]$Requirements = "Utilities\Powershell Utilities\requirements.txt"
)

function ExitWithMessage($msg, $code=1) {
    Write-Host $msg -ForegroundColor Red
    exit $code
}

# Verify python is available
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) { ExitWithMessage "Python not found in PATH. Please install Python 3.8+ and retry." }

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$venvPath = Join-Path $repoRoot $VenvName

Write-Host "Repo root: $repoRoot"
Write-Host "Creating virtual environment at: $venvPath"

# Create venv if it doesn't exist
if (-not (Test-Path $venvPath)) {
    python -m venv $venvPath
    if ($LASTEXITCODE -ne 0) { ExitWithMessage "Failed to create virtual environment." }
    Write-Host "Virtual environment created." -ForegroundColor Green
} else {
    Write-Host "Virtual environment already exists; skipping creation." -ForegroundColor Yellow
}

# Activation instructions
Write-Host "To activate the venv run: .\\$VenvName\\Scripts\\Activate.ps1" -ForegroundColor Cyan

# Upgrade pip and install requirements if file exists
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
if (-not (Test-Path $activateScript)) { ExitWithMessage "Activation script not found at $activateScript" }

if (Test-Path (Join-Path $repoRoot $Requirements)) {
    Write-Host "Installing requirements from $Requirements"
    & $activateScript; python -m pip install --upgrade pip; python -m pip install -r (Join-Path $repoRoot $Requirements)
    if ($LASTEXITCODE -ne 0) { ExitWithMessage "Failed to install requirements." }
    Write-Host "Requirements installed." -ForegroundColor Green
} else {
    Write-Host "No requirements file found at $Requirements — skipping package install." -ForegroundColor Yellow
}

Write-Host "Setup complete. Activate the environment and run your development scripts." -ForegroundColor Green
