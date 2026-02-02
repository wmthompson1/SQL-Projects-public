param(
  [int[]]$Pids,
  [string]$File,
  [switch]$Force,
  [int]$OlderThanHours = 0
)

function Get-Owner {
  param($procId)
  try {
    $proc = Get-CimInstance -ClassName Win32_Process -Filter ("ProcessId={0}" -f $procId) -ErrorAction Stop
    $ownerInfo = $proc | Invoke-CimMethod -MethodName GetOwner -ErrorAction Stop
    return if ($ownerInfo) { "$($ownerInfo.Domain)\$($ownerInfo.User)" } else { 'N/A' }
  } catch { return "Owner lookup failed: $_" }
}

# collect PIDs
## If no -File supplied, prefer a pids.txt located next to this script (deployed location)
try {
  $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
} catch {
  $scriptDir = $PWD.Path
}

if (-not $File) {
  $defaultPidsFile = Join-Path -Path $scriptDir -ChildPath 'pids.txt'
  if (Test-Path $defaultPidsFile) {
    Write-Host "Using default PIDs file found next to script: $defaultPidsFile" -ForegroundColor Cyan
    $File = $defaultPidsFile
  }
}

if ($File) {
  if (-Not (Test-Path $File)) { Write-Error "File not found: $File"; exit 2 }
  $lines = Get-Content $File | ForEach-Object { ($_ -split '\s+')[0] }  # first token per line
  $filePids = $lines | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ }
  $Pids = @($Pids + $filePids) | Select-Object -Unique
}

if (-not $Pids -or $Pids.Count -eq 0) {
  # No explicit PIDs or file provided — auto-detect running Excel processes
  try {
    $excelProcs = Get-CimInstance -ClassName Win32_Process -Filter "Name='EXCEL.EXE'" -ErrorAction Stop
    if (-not $excelProcs) {
      Write-Error "No EXCEL.EXE processes found. Use -Pids or -File if you expected specific PIDs."
      exit 3
    }
    $Pids = $excelProcs | Select-Object -ExpandProperty ProcessId
  } catch {
    Write-Error "Failed to enumerate EXCEL.EXE processes: $_"
    exit 4
  }
}

$now = Get-Date
$previewList = foreach ($procId in $Pids) {
  try {
    $p = Get-CimInstance -ClassName Win32_Process -Filter ("ProcessId={0}" -f $procId) -ErrorAction Stop
    $created = [Management.ManagementDateTimeConverter]::ToDateTime($p.CreationDate)
    [pscustomobject]@{
      ProcessId = $procId
      CommandLine = $p.CommandLine
      CreationDate = $created
      AgeHours = ([math]::Round(($now - $created).TotalHours,1))
      Owner = Get-Owner -procId $procId
      Exists = $true
    }
  } catch {
    [pscustomobject]@{
      ProcessId = $procId
      CommandLine = $null
      CreationDate = $null
      AgeHours = $null
      Owner = 'NotFound'
      Exists = $false
    }
  }
}

# filter by OlderThanHours if provided
if ($OlderThanHours -gt 0) {
  $previewList = $previewList | Where-Object { $_.Exists -and $_.AgeHours -ge $OlderThanHours }
}

# show preview
Write-Host "Preview of matched processes:" -ForegroundColor Cyan
$previewList | Format-Table ProcessId,Owner,CreationDate,AgeHours,CommandLine -AutoSize

if (-not $Force) {
  Write-Host ""
  Write-Host "Run again with -Force to actually stop the listed processes." -ForegroundColor Yellow
  exit 0
}

# perform stop
foreach ($item in $previewList) {
  if (-not $item.Exists) {
    Write-Warning "PID $($item.ProcessId) not found; skipping."
    continue
  }
  try {
    Stop-Process -Id $item.ProcessId -Force -ErrorAction Stop
    Write-Host "Stopped PID $($item.ProcessId) (Owner: $($item.Owner))" -ForegroundColor Green
  } catch {
    Write-Error "Failed to stop PID $($item.ProcessId): $_"
  }
}