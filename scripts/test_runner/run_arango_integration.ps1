<#
.SYNOPSIS
  Run the ArangoDB integration test with docker-compose and pytest.

.DESCRIPTION
  Brings up `docker-compose.test.yml`, waits for ArangoDB to become ready,
  sets environment variables, runs the pytest test file, then tears down.

  Usage: run from repository root or execute this script directly. Requires Docker
  and PowerShell. Will use the repository `.venv` python by default.
#>

param(
    [string]$ComposeFile = "docker-compose.test.yml",
    [string]$TestPath = "scripts/modules/manufacturing_semantics/026_Entry_Point_NCM_Arango_Unit.py",
    [int]$TimeoutSec = 120,
    [int]$WaitDelaySec = 2,
    [switch]$PreserveOnFailure = $false,
    [switch]$VerboseMode = $false,
    [string]$LogDir = "logs"
)

# Determine repo root
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$repoRoot = Resolve-Path (Join-Path $scriptDir "..\..")
Set-Location $repoRoot

# Ensure log directory exists
if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir | Out-Null }

# Remove any existing disposable test container to avoid name conflicts
$existingContainer = docker ps -a --filter "name=arangodb-test" --format "{{.ID}}"
if ($existingContainer) {
    Write-Host "Found existing arangodb-test container(s); removing..."
    docker rm -f arangodb-test | Out-Null
}

# Start docker compose
Write-Host "Starting ArangoDB via docker compose ($ComposeFile)..."
& docker compose -f $ComposeFile up -d

# Wait for Arango to be ready (timeboxed by $TimeoutSec)
$startTime = Get-Date
$ready = $false
while (((Get-Date) - $startTime).TotalSeconds -lt $TimeoutSec) {
    # First try to reach Arango from the host
    try {
        $resp = Invoke-RestMethod -Uri 'http://127.0.0.1:8529/_api/version' -TimeoutSec 3
        Write-Host "ArangoDB ready (host): $($resp.version)"
        $ready = $true
        break
    } catch {
        if ($VerboseMode) { Write-Host "Host check failed, attempting in-container check... Elapsed: $([int]((Get-Date) - $startTime).TotalSeconds)s" }
        # Fallback: try checking from inside the container
        try {
            # Prefer curl if available inside the container; otherwise mark and fall back to log inspection
            $inner = & docker exec arangodb-test sh -c "if command -v curl >/dev/null 2>&1; then curl -sS http://127.0.0.1:8529/_api/version || true; else echo 'NO_CURL'; fi" 2>$null
            if ($inner -and $inner -ne 'NO_CURL') {
                try {
                    $j = $inner | ConvertFrom-Json -ErrorAction Stop
                    Write-Host "ArangoDB ready (container): $($j.version)"
                    $ready = $true
                    break
                } catch {
                    if ($VerboseMode) { Write-Host "Container returned non-json response: $inner" }
                }
            } elseif ($inner -eq 'NO_CURL') {
                if ($VerboseMode) { Write-Host "Container has no curl; inspecting recent logs for readiness..." }
                try {
                    $logs = & docker logs arangodb-test --since 1m --tail 500 2>$null
                    if ($logs -and ($logs -match 'is ready for business')) {
                        Write-Host "ArangoDB ready (detected in container logs)."
                        $ready = $true
                        break
                    } else {
                        if ($VerboseMode) { Write-Host "Readiness not found in logs yet." }
                    }
                } catch {
                    if ($VerboseMode) { Write-Host "Could not read container logs: $_" }
                }
            }
        } catch {
            if ($VerboseMode) { Write-Host "In-container check failed: $_" }
        }
        Start-Sleep -Seconds $WaitDelaySec
    }
}

if (-not $ready) {
    $elapsed = [int]((Get-Date) - $startTime).TotalSeconds
    Write-Error "ArangoDB did not become ready after $elapsed seconds."
    $timestamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
    $logFile = Join-Path $LogDir "arangodb-test_$timestamp.log"
    Write-Host "Collecting container logs to: $logFile"
    try {
        & docker logs arangodb-test --since 10m --tail 1000 > $logFile 2>&1
    } catch {
        Write-Host "Could not collect docker logs: $_"
    }

    if ($PreserveOnFailure) {
        Write-Host "PreserveOnFailure set — leaving containers running for inspection."
        Write-Host "To view logs: docker logs arangodb-test --since 10m"
        exit 2
    } else {
        Write-Host "Tearing down docker compose containers..."
        & docker compose -f $ComposeFile down --volumes
        exit 1
    }
}

# Set environment variables for test
$env:ARANGO_HOST = '127.0.0.1'
$env:ARANGO_PORT = '8529'
$env:ARANGO_USER = 'test_user'
$env:ARANGO_PASSWORD = 'test_pass'
$env:ARANGO_DB = 'ncm_test_db'

# Ensure test user and database exist (use root credentials)
$rootUser = 'root'
$rootPass = 'localtestpass'
    try {
        # Build Basic Auth header (root:localtestpass)
        $pair = "${rootUser}:${rootPass}"
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($pair)
        $b64 = [Convert]::ToBase64String($bytes)
        $headers = @{ Authorization = "Basic $b64" }

        # create test user (ignore 409 conflict if already exists)
        $userBody = @{ user = $env:ARANGO_USER; passwd = $env:ARANGO_PASSWORD } | ConvertTo-Json
        try {
            Invoke-RestMethod -Uri 'http://127.0.0.1:8529/_api/user' -Method Post -Body $userBody -ContentType 'application/json' -Headers $headers -ErrorAction Stop
            Write-Host "Created Arango user $($env:ARANGO_USER)"
        } catch {
            # Inspect response status if available
            if ($_.Exception.Response -and $_.Exception.Response.StatusCode.Value__ -eq 409) {
                Write-Host "Arango user already exists, continuing."
            } else {
                Write-Host "Warning creating user: $_"
            }
        }

        # create database with user (ignore 409 if exists)
        $dbBody = @{ name = $env:ARANGO_DB; users = @(@{ username = $env:ARANGO_USER; passwd = $env:ARANGO_PASSWORD; active = $true }) } | ConvertTo-Json
        try {
            Invoke-RestMethod -Uri 'http://127.0.0.1:8529/_api/database' -Method Post -Body $dbBody -ContentType 'application/json' -Headers $headers -ErrorAction Stop
            Write-Host "Created Arango database $($env:ARANGO_DB)"
        } catch {
            if ($_.Exception.Response -and $_.Exception.Response.StatusCode.Value__ -eq 409) {
                Write-Host "Arango database already exists, continuing."
            } else {
                Write-Host "Warning creating database: $_"
            }
        }
    } catch {
        Write-Host "Could not create Arango user/db automatically: $_"
    }

# Use repo venv python if available
$venvPython = Join-Path $repoRoot '.venv\Scripts\python.exe'
if (-not (Test-Path $venvPython)) {
    Write-Host "Warning: venv python not found at $venvPython. Falling back to system python."
    $venvPython = "python"
}

Write-Host "Installing minimal test deps into venv (python-arango, pytest, requests)"
& $venvPython -m pip install --upgrade pip
& $venvPython -m pip install python-arango pytest requests | Out-Null

Write-Host "Running pytest on $TestPath"
& $venvPython -m pytest -q $TestPath
$exitCode = $LASTEXITCODE

Write-Host "Tearing down docker compose containers..."
& docker compose -f $ComposeFile down --volumes

exit $exitCode
