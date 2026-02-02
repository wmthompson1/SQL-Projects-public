<#
.SYNOPSIS
  Wrapper: auto-detect .xls files in the Input folder and convert them to .xlsx using Convert-XlsToXlsx.ps1

.NOTES
  - Expects the repository layout used by the BOE utilities (Input, Process, ProcessComplete, Logs)
  - Moves originals to ProcessComplete after successful conversion.
#>

$ErrorActionPreference = 'Stop'

# locate project folder (reuse logic in V4)
if ($env:COMPUTERNAME -eq 'WILLIAM-ADMINPC') {
  $project = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\"
} else {
  $project = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
}

$InputDir = Join-Path -Path $project -ChildPath 'Input'
$ProcessDir = Join-Path -Path $project -ChildPath 'Process'
$CompleteDir = Join-Path -Path $project -ChildPath 'ProcessComplete'
$LogDir = Join-Path -Path $project -ChildPath 'Logs'
if (-not (Test-Path $LogDir)) { New-Item -Path $LogDir -ItemType Directory -Force | Out-Null }
if (-not (Test-Path $ProcessDir)) { New-Item -Path $ProcessDir -ItemType Directory -Force | Out-Null }
if (-not (Test-Path $CompleteDir)) { New-Item -Path $CompleteDir -ItemType Directory -Force | Out-Null }

$LogFile = Join-Path -Path $LogDir -ChildPath 'BOE_Excel_Convert.log'
function Log { param([string]$m) $t=(Get-Date).ToString('yyyy-MM-dd HH:mm:ss'); "$t - $m" | Out-File -FilePath $LogFile -Append -Encoding UTF8; Write-Output $m }

if (-not (Test-Path $InputDir)) { throw "Input directory not found: $InputDir" }

$converter = Join-Path -Path $project -ChildPath 'Convert-XlsToXlsx.ps1'
if (-not (Test-Path $converter)) { throw "Converter script missing: $converter" }

$files = Get-ChildItem -Path $InputDir -Filter '*.xls' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime
if (-not $files -or $files.Count -eq 0) { Log 'No .xls files to convert.'; return }

foreach ($f in $files) {
  try {
    Log "Found .xls: $($f.FullName)"
    $ts = Get-Date -Format 'yyyy-MM-dd-HH-mm-ss'
    $destBase = "$($f.BaseName)_$ts.xlsx"
    $dest = Join-Path -Path $ProcessDir -ChildPath $destBase
    # copy original into Process for conversion
    Copy-Item -Path $f.FullName -Destination (Join-Path $ProcessDir $f.Name) -Force

    # call converter
    & pwsh -NoProfile -File $converter -InXls (Join-Path $ProcessDir $f.Name) -OutXlsx $dest
    if ($LASTEXITCODE -ne 0) { throw "Converter returned non-zero exitcode: $LASTEXITCODE" }

    Log "Converted to: $dest"

    # move original into ProcessComplete
    $moved = Join-Path -Path $CompleteDir -ChildPath $f.Name
    Move-Item -Path $f.FullName -Destination $moved -Force
    Log "Moved original to: $moved"
  }
  catch {
    Log "ERROR converting $($f.FullName): $($_.Exception.Message)"
  }
}

Log 'Batch conversion complete.'
