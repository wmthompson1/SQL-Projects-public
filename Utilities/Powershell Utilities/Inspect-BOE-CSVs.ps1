<#
Inspect-BOE-CSVs.ps1
Show the first N lines of Boeing_Export_YYYYMMDDV1.csv and BOEReceivableHeader_YYYYMMDD.csv

Usage:
  pwsh -NoProfile -File "Inspect-BOE-CSVs.ps1" -ProcessPath "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process" -Date 20260129 -Lines 10
#>

param(
  [string]$ProcessPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process",
  [string]$Date = (Get-Date -Format 'yyyyMMdd'),
  [int]$Lines = 10
)

function Show-Head {
  param(
    [string]$Path,
    [int]$Count = 10
  )
  if (-not (Test-Path $Path)) {
    Write-Output "MISSING: $Path"
    return
  }
  Write-Output "=== $Path ==="
  try {
    # Prefer UTF8NoBOM read, fall back to default
    Get-Content -Path $Path -Encoding UTF8NoBOM -TotalCount $Count | ForEach-Object { Write-Output $_ }
  }
  catch {
    Get-Content -Path $Path -TotalCount $Count | ForEach-Object { Write-Output $_ }
  }
  Write-Output ""
}

$export = Join-Path -Path $ProcessPath -ChildPath ("Boeing_Export_${Date}V1.csv")
$hdr    = Join-Path -Path $ProcessPath -ChildPath ("BOEReceivableHeader_${Date}.csv")

Show-Head -Path $export -Count $Lines
Show-Head -Path $hdr -Count $Lines
