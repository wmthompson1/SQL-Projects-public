<#
 BOE_ImportExcel_Confirm.ps1
 Purpose: COM-free confirmation run using ImportExcel (EPPlus).
          - Validates AR-saved .xlsx on the file server
          - Applies JSON column rules
          - Exports working XLSX + CSV and daily CSV
          - Archives daily CSV and header CSV
          - Extracts header fields (B4, D10, D11, B6, B7, B8) directly from .xlsx
 Usage (manual or SQL Agent):
   powershell.exe -NoProfile -ExecutionPolicy Bypass `
     -File "E:\ITDA\Operations\BOEReceivables\BOE_ImportExcel_Confirm.ps1" `
     -Root "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable"
#>

[CmdletBinding()]
param(
    [string]$Root         = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable",
    [string]$InputRel     = "Input\BOE.xlsx",          # AR saves portal as this
    [string]$ProcessRel   = "Process",                 # working/output folder
    [string]$CompleteRel  = "ProcessComplete",         # archive
    [string]$RulesFile    = "BOE_Column_Rules.json",   # must sit beside this script
    [string]$WorksheetName = $null,                    # force a sheet name; else first sheet
    [int]$HeaderScanRows  = 20,                        # scan first N rows for "Boeing Invoice #"
    [int]$StabilitySeconds = 10,                       # wait for input file to stop changing
    [int]$StabilityTimeout = 300                       # total wait up to N seconds
)

$ErrorActionPreference = 'Stop'

# ---------------------------
# Logging
# ---------------------------
$LogDir1 = Join-Path $Root "Logs"
$LogDir2 = Join-Path $Root "Process\logs"
foreach($d in @($LogDir1,$LogDir2)){ if(-not (Test-Path $d)){ New-Item -ItemType Directory -Path $d -Force | Out-Null } }
$LogFile = Join-Path $LogDir1 "BOE_Excel_Diag.log"

function Write-Log {
  param([string]$Message,[ConsoleColor]$Color='Gray')
  $ts = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
  $line = "[$ts] $Message"
  Write-Host $line -ForegroundColor $Color
  $line | Out-File -FilePath $LogFile -Append -Encoding UTF8
  $line | Out-File -FilePath (Join-Path $LogDir2 "BOE_Excel_Diag.log") -Append -Encoding UTF8
}

# ---------------------------
# Helpers
# ---------------------------
function Wait-FileStable {
  param([string]$Path,[int]$StableSeconds=10,[int]$TimeoutSeconds=300,[int]$PollMs=1000)
  $deadline=(Get-Date).AddSeconds($TimeoutSeconds)
  $last=-1;$stable=0
  while((Get-Date) -lt $deadline){
    if(-not (Test-Path $Path)){ Start-Sleep -Milliseconds $PollMs; continue }
    try { $len=(Get-Item $Path -ErrorAction Stop).Length } catch { Start-Sleep -Milliseconds $PollMs; continue }
    if($len -eq $last){ $stable += $PollMs/1000; if($stable -ge $StableSeconds){ return $true } }
    else { $stable=0; $last=$len }
    Start-Sleep -Milliseconds $PollMs
  }
  return $false
}

function Apply-Rules {
  param([string[]]$Headers, [object[]]$Row, [object]$RuleMap)

  for($c=0; $c -lt $Headers.Count; $c++){
    $colName = $Headers[$c]; if([string]::IsNullOrWhiteSpace($colName)){ continue }
    $rule = $RuleMap | Where-Object { $colName -match $_.columnPattern } | Select-Object -First 1
    if(-not $rule){ continue }
    $val = $Row[$c]
    if ($null -eq $val){ continue }

    $s = $val.ToString()

    if ($rule.stripFormulas -and $s -match '^="(.+)"$'){ $s = $matches[1] }

    if ($rule.dataType -eq 'String'){
      if ($rule.trim){ $s = $s.Trim() }
      $Row[$c] = $s
    }
    elseif ($rule.dataType -match 'Decimal|Number|Currency'){
      if ($rule.PSObject.Properties.Name -contains 'stripCommas' -and $rule.stripCommas){
        $s = $s -replace ',',''
      }
      [double]$n = 0
      if ([double]::TryParse($s, [ref]$n)){ $Row[$c] = $n } else { $Row[$c] = $s }
    }
    elseif ($rule.dataType -match 'Date'){
      # Convert numeric OADate to ISO; otherwise leave as-is
      if ($s -match '^\d+(\.\d+)?$'){
        try { $Row[$c] = [DateTime]::FromOADate([double]$s).ToString('yyyy-MM-dd HH:mm:ss') }
        catch { $Row[$c] = $s }
      } else {
        $Row[$c] = $s
      }
    }
  }
}

function As-Iso {
  param($v)
  if ($null -eq $v) { return "" }
  $s = $v.ToString()
  if ($s -match '^\d+(\.\d+)?$'){
    try { return [DateTime]::FromOADate([double]$s).ToString('yyyy-MM-dd HH:mm:ss') } catch { return $s }
  }
  return $s
}

# ---------------------------
# Paths & filenames
# ---------------------------
$InputXlsx = Join-Path $Root $InputRel
$Process   = Join-Path $Root $ProcessRel
$Complete  = Join-Path $Root $CompleteRel
foreach($p in @($Process,$Complete)){ if(-not (Test-Path $p)){ New-Item -ItemType Directory -Path $p -Force | Out-Null } }

$DateStamp = Get-Date -Format "yyyyMMdd"
$SecStamp  = Get-Date -Format "yyyyMMdd-HHmmss"

$DailyCsvName = "Boeing_Export_{0}.csv" -f $DateStamp
$DailyCsv     = Join-Path $Process $DailyCsvName
$DailyCsvArchive = Join-Path $Complete $DailyCsvName

$HeaderName   = "BOEReceivableHeader.csv"
$HeaderPath   = Join-Path $Process $HeaderName
$HeaderArchive= Join-Path $Complete ("BOEReceivableHeader_{0}.csv" -f $DateStamp)

$WorkXlsx     = Join-Path $Process ("2_{0}.xlsx" -f $SecStamp)
$WorkCsv      = Join-Path $Process "2.csv"

# ---------------------------
# Start
# ---------------------------
Import-Module ImportExcel -ErrorAction Stop
Write-Log "=== BOE ImportExcel Confirmation Run ===" "Cyan"
Write-Log "Input: $InputXlsx"
Write-Log "Process: $Process"
Write-Log "ProcessComplete: $Complete"

# Validate input file + stability
if(-not (Test-Path $InputXlsx)){
  throw "Expected input .xlsx not found: $InputXlsx"
}
$fi = Get-Item $InputXlsx
if($fi.Extension.ToLower() -ne '.xlsx'){ Write-Log ("WARN: Input is not .xlsx ({0})" -f $fi.Extension) "Yellow" }
if($fi.Length -le 0){ throw "Input file is empty: $InputXlsx" }

Write-Log ("Waiting for input file stability ({0}s timeout; {1}s window) ..." -f $StabilityTimeout,$StabilitySeconds)
if(-not (Wait-FileStable -Path $InputXlsx -StableSeconds $StabilitySeconds -TimeoutSeconds $StabilityTimeout)){
  Write-Log "WARN: Input did not become stable within timeout; proceeding anyway." "Yellow"
}

# Load JSON rules
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RulesPath = Join-Path $ScriptDir $RulesFile
if(-not (Test-Path $RulesPath)){ throw "Rules file missing: $RulesPath" }
$rulesObj = Get-Content $RulesPath -Raw | ConvertFrom-Json
$rules = $rulesObj.rules
Write-Log ("Loaded {0} rules from {1}" -f $rules.Count, $RulesPath)

# Determine worksheet
$sheetNames = (Get-ExcelSheetInfo -Path $InputXlsx).Name
if ($WorksheetName -and ($sheetNames -contains $WorksheetName)) { $ws = $WorksheetName } else { $ws = $sheetNames | Select-Object -First 1 }
Write-Log "Using worksheet: $ws"

# Read the sheet
$rows = Import-Excel -Path $InputXlsx -WorksheetName $ws -ErrorAction Stop
if(-not $rows){ throw "Worksheet appears empty: $ws" }

# Materialize rows as array of string[] for robust scanning/reshaping
$rawRows = @()
foreach($r in $rows){ $rawRows += ,($r.PSObject.Properties.Value) }

# Find header row containing 'Boeing Invoice #' within first N rows
$headerRowIndex = $null
for($i=0; $i -lt [Math]::Min($HeaderScanRows, $rawRows.Count); $i++){
  $line = (($rawRows[$i] | ForEach-Object { $_ -as [string] }) -join ' ') -replace [char]160,' '
  if ($line -match 'Boeing Invoice \#'){ $headerRowIndex = $i; break }
}
if($null -eq $headerRowIndex){ throw "Boeing Invoice # header not found in the first $HeaderScanRows rows of worksheet '$ws'" }
Write-Log "Header located at zero-based row index: $headerRowIndex"

# Build headers (clean spaces/NBSP) and data rows from headerRowIndex downward
$headers = @()
foreach($h in $rawRows[$headerRowIndex]){
  if ($null -ne $h -and $h.ToString().Trim() -ne ''){
    $headers += ($h.ToString().Replace([char]160,' ').Trim() -replace '\s+',' ')
  } else {
    $headers += ''
  }
}
# truncate trailing empty headers
while($headers.Count -gt 0 -and [string]::IsNullOrWhiteSpace($headers[-1])){ $headers = $headers[0..($headers.Count-2)] }

$dataRows = @()
for($r=$headerRowIndex+1; $r -lt $rawRows.Count; $r++){
  $cells = $rawRows[$r]
  if ($cells.Count -gt $headers.Count){ $cells = $cells[0..($headers.Count-1)] }
  elseif ($cells.Count -lt $headers.Count){ $cells = $cells + ('' * ($headers.Count - $cells.Count)) }
  $dataRows += ,$cells
}

# Apply JSON rules
Write-Log ("Applying rules across {0} columns and {1} rows" -f $headers.Count, $dataRows.Count)
