<#
 BOE_Preflight.ps1
 Purpose: Validate prerequisites before running ImportExcel pipeline.
  - ImportExcel module is discoverable for this identity
  - ACE OLE DB provider (16.0 or 12.0) present (optional but recommended)
  - UNC paths reachable and writable
  - 64-bit PowerShell host (for consistency with ImportExcel & providers)
 Exit codes: 0 = OK; nonzero = hard fail (Agent step should stop)
#>

[CmdletBinding()]
param(
  [string]$Root = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable",
  [string]$InputRel   = "Input\BOE.xlsx",
  [string]$ProcessRel = "Process",
  [string]$CompleteRel= "ProcessComplete"
)

$ErrorActionPreference = 'Stop'

function Write-Ok    { param($m) Write-Host "[OK]  $m" -ForegroundColor Green }
function Write-Warn  { param($m) Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Write-Err   { param($m) Write-Host "[ERR] $m" -ForegroundColor Red }

# 0) Host bitness
$procArch = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
$is64pwsh = $PSHOME -like "*System32*"
if (-not $is64pwsh) { Write-Err "This is not 64-bit PowerShell (PSHOME=$PSHOME). Use System32 host."; exit 8 }
Write-Ok  "64-bit PowerShell host detected ($procArch)"

# 1) ImportExcel module
try {
  Import-Module ImportExcel -ErrorAction Stop
  $mod = Get-Module -ListAvailable ImportExcel | Select-Object -First 1
  if (-not $mod) { Write-Err "ImportExcel module not found on this run identity."; exit 1 }
  Write-Ok ("ImportExcel loaded: {0} (Path: {1})" -f $mod.Version, $mod.Path)
} catch {
  Write-Err "Failed to load ImportExcel: $($_.Exception.Message)"
  exit 1
}

# 2) ACE OLE DB provider (optional; used for future xls->xlsx, not strictly required for .xlsx path)
$ace16 = [type]::GetTypeFromProgID('Microsoft.ACE.OLEDB.16.0')
$ace12 = [type]::GetTypeFromProgID('Microsoft.ACE.OLEDB.12.0')
if ($ace16 -or $ace12) {
  Write-Ok ("ACE provider present: {0}" -f ($(if($ace16){"16.0"} else {"12.0"})))
} else {
  Write-Warn "ACE OLE DB provider not found. Not required for .xlsx flow, but needed if you later import legacy .xls without Excel."
}

# 3) UNC reachability + permissions
$Input   = Join-Path $Root $InputRel
$Process = Join-Path $Root $ProcessRel
$Complete= Join-Path $Root $CompleteRel

# Read check on Input
if (-not (Test-Path $Input)) { Write-Warn "Input file not found yet: $Input (this may be normal before AR drop)" }
else {
  try { $len = (Get-Item $Input -ErrorAction Stop).Length; Write-Ok ("Input reachable: {0} ({1:N0} bytes)" -f $Input,$len) }
  catch { Write-Err "Cannot access Input file: $($_.Exception.Message)"; exit 2 }
}

# Write check on Process
try {
  if (-not (Test-Path $Process)) { New-Item -ItemType Directory -Path $Process -Force | Out-Null }
  $probe = Join-Path $Process ("_preflight_{0}.tmp" -f ([guid]::NewGuid().ToString("N")))
  "probe" | Out-File -FilePath $probe -Encoding UTF8
  Remove-Item $probe -Force
  Write-Ok "Process folder writable: $Process"
} catch {
  Write-Err "Process folder not writable by this identity: $($_.Exception.Message)"
  exit 3
}

# Write check on ProcessComplete
try {
  if (-not (Test-Path $Complete)) { New-Item -ItemType Directory -Path $Complete -Force | Out-Null }
  $probe2 = Join-Path $Complete ("_preflight_{0}.tmp" -f ([guid]::NewGuid().ToString("N")))
  "probe" | Out-File -FilePath $probe2 -Encoding UTF8
  Remove-Item $probe2 -Force
  Write-Ok "ProcessComplete folder writable: $Complete"
} catch {
  Write-Err "ProcessComplete folder not writable by this identity: $($_.Exception.Message)"
  exit 4
}

# 4) PSModulePath visibility hint (useful if running as SQL Agent account)
Write-Ok ("PSModulePath: {0}" -f $env:PSModulePath)

# All good
Write-Ok "Preflight checks passed."
exit 0