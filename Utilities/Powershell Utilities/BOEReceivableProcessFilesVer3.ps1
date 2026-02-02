<#
 BOE_ImportExcel_V4.ps1
 Purpose: Production V4 pipeline (COM-free) using ImportExcel with JSON rules.
          - Reads AR-saved .xlsx from UNC
          - Detects header row ("Boeing Invoice #")
          - Applies BOE_Column_Rules.json transforms
          - Exports working XLSX + 2.csv + Boeing_Export_YYYYMMDD.csv
          - Extracts header cells (B4, D10, D11, B6, B7, B8) to BOEReceivableHeader.csv
          - Archives daily files to ProcessComplete
          - Optional .ready marker on success

 Usage (SQL Agent / manual):
   powershell.exe -NoProfile -ExecutionPolicy Bypass `
     -File "E:\ITDA\Operations\BOEReceivables\BOE_ImportExcel_V4.ps1" `
     -Root "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable"

 Prereqs:
   - Windows PowerShell 5.1 x64 (Agent default: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe)
   - ImportExcel module installed (AllUsers recommended)
   - AR saves Input\BOE.xlsx (.xlsx)
#>

[CmdletBinding()]
param(
    [string]$Root           = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable",
    [string]$InputRel       = "Input\BOE.xlsx",          # adjust if AR uses a different fixed name
    [string]$ProcessRel     = "Process",
    [string]$CompleteRel    = "ProcessComplete",
    [string]$RulesFile      = "BOE_Column_Rules.json",   # located next to this script
    [string]$WorksheetName  = $null,                     # if you want to pin a sheet; else first sheet
    [int]$HeaderScanRows    = 20,                        # scan first N rows for header string
    [int]$StabilitySeconds  = 10,                        # window of no size change
    [int]$StabilityTimeout  = 300,                       # max wait sec
    [switch]$EmitReadyMarker = $true,                    # create BOE.ready on success
    [switch]$SanitizeText    = $true,                    # normalize non-printables
    [switch]$PickLatestIfMissing = $false                # fallback to newest .xlsx if BOE.xlsx missing
)

$ErrorActionPreference = 'Stop'

# If running on the developer workstation, override Root to local workspace for testing
if ($env:COMPUTERNAME -eq 'WILLIAM-ADMINPC') {
  $Root = 'C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\'
  Write-Log "DEV MODE: overriding Root to local path: $Root" "Yellow"
}

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

# Non-printable normalizer (toggle with -SanitizeText:$false)
function Clean-Text {
    param([Parameter(Mandatory)][string]$Text,[switch]$KeepSmartQuotes)
    if ($null -eq $Text) { return $null }
    $map = @{
        ([char]0x00A0) = ' '     # NBSP
        ([char]0xFEFF) = ''      # ZWNBSP/BOM
        ([char]0x200B) = ''      # zero-width
        ([char]0x200C) = ''
        ([char]0x2013) = '-'     # en dash
        ([char]0x2014) = '-'     # em dash
    }
    if (-not $KeepSmartQuotes) {
        $map[[char]0x2018] = "'"
        $map[[char]0x2019] = "'"
        $map[[char]0x201C] = '"'
        $map[[char]0x201D] = '"'
    }
    $sb = New-Object System.Text.StringBuilder
    foreach ($ch in $Text.ToCharArray()) {
        $c=$ch; $code=[int][char]$c
        if (($code -lt 0x20) -and $code -notin 9,10,13) { continue } # strip ctrl except TAB/CR/LF
        if ($map.ContainsKey($c)) { [void]$sb.Append($map[$c]); continue }
        [void]$sb.Append($c)
    }
    $sb.ToString()
}

function Apply-Rules {
  param([string[]]$Headers, [object[]]$Row, [object]$RuleMap)
  for($c=0; $c -lt $Headers.Count; $c++){
    $colName = $Headers[$c]; if([string]::IsNullOrWhiteSpace($colName)){ continue }
    $rule = $RuleMap | Where-Object { $colName -match $_.columnPattern } | Select-Object -First 1
    if(-not $rule){ continue }
    $val = $Row[$c]; if ($null -eq $val){ continue }
    $s = $val.ToString()
    if ($rule.stripFormulas -and $s -match '^="(.+)"$'){ $s = $matches[1] }
    switch -Regex ($rule.dataType) {
      '^String$' {
        if ($rule.trim){ $s = $s.Trim() }
        $Row[$c] = $s
      }
      '^(Decimal|Number|Currency)$' {
        if ($rule.PSObject.Properties.Name -contains 'stripCommas' -and $rule.stripCommas){ $s = $s -replace ',','' }
        [double]$n = 0
        if ([double]::TryParse($s, [ref]$n)){ $Row[$c] = $n } else { $Row[$c] = $s }
      }
      '^Date' {
        if ($s -match '^\d+(\.\d+)?$'){
          try { $Row[$c] = [DateTime]::FromOADate([double]$s).ToString('yyyy-MM-dd HH:mm:ss') }
          catch { $Row[$c] = $s }
        } else { $Row[$c] = $s }
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

$DailyCsvName     = "Boeing_Export_{0}.csv" -f $DateStamp
$DailyCsv         = Join-Path $Process $DailyCsvName
$DailyCsvArchive  = Join-Path $Complete $DailyCsvName

$HeaderName       = "BOEReceivableHeader.csv"
$HeaderPath       = Join-Path $Process $HeaderName
$HeaderArchive    = Join-Path $Complete ("BOEReceivableHeader_{0}.csv" -f $DateStamp)

$WorkXlsx         = Join-Path $Process ("2_{0}.xlsx" -f $SecStamp)
$WorkCsv          = Join-Path $Process "2.csv"

# ---------------------------
# Start
# ---------------------------
Import-Module ImportExcel -ErrorAction Stop
Write-Log "=== BOE ImportExcel V4 Run ===" "Cyan"
Write-Log "Input: $InputXlsx"
Write-Log "Process: $Process"
Write-Log "ProcessComplete: $Complete"

# Input presence (with optional "pick latest" fallback)
if (-not (Test-Path $InputXlsx)) {
  if ($PickLatestIfMissing) {
    $inputFolder = Join-Path $Root 'Input'
    $cand = Get-ChildItem -LiteralPath $inputFolder -Filter *.xlsx -ErrorAction SilentlyContinue |
            Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($cand) {
      Write-Log ("INFO: BOE.xlsx not found; using latest drop: {0}" -f $cand.FullName) "Yellow"
      $InputXlsx = $cand.FullName
    } else { throw "No .xlsx files found in Input folder: $inputFolder" }
  } else {
    throw "Expected input .xlsx not found: $InputXlsx"
  }
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
$rules    = $rulesObj.rules
Write-Log ("Loaded {0} rules from {1}" -f $rules.Count, $RulesPath)

# Worksheet selection
$sheetNames = (Get-ExcelSheetInfo -Path $InputXlsx).Name
if ($WorksheetName -and ($sheetNames -contains $WorksheetName)) { $ws = $WorksheetName } else { $ws = $sheetNames | Select-Object -First 1 }
Write-Log "Using worksheet: $ws"

# Read sheet
$rows = Import-Excel -Path $InputXlsx -WorksheetName $ws -ErrorAction Stop
if(-not $rows){ throw "Worksheet appears empty: $ws" }

# Materialize to array of cell-value arrays for scanning
$rawRows = @()
foreach($r in $rows){
  # ensure each row entry is an object[] (even single-column rows)
  $vals = @($r.PSObject.Properties.Value)
  $rawRows += ,$vals
}

# Find header row ("Boeing Invoice #")
$headerRowIndex = $null
for($i=0; $i -lt [Math]::Min($HeaderScanRows, $rawRows.Count); $i++){
  $line = (($rawRows[$i] | ForEach-Object { $_ -as [string] }) -join ' ') -replace [char]160,' '
  if ($line -match 'Boeing Invoice \#'){ $headerRowIndex = $i; break }
}
if($null -eq $headerRowIndex){ throw "Boeing Invoice # header not found in the first $HeaderScanRows rows of '$ws'" }
Write-Log "Header located at zero-based row index: $headerRowIndex"

# Build headers + data rows
$headers = @()
foreach($h in $rawRows[$headerRowIndex]){
  if ($null -ne $h -and $h.ToString().Trim() -ne ''){
    $headers += ($h.ToString().Replace([char]160,' ').Trim() -replace '\s+',' ')
  } else { $headers += '' }
}

# Optional: sanitize headers
if ($SanitizeText) {
  $headers = $headers | ForEach-Object { if ($_ -ne '') { Clean-Text -Text $_ } else { '' } }
}

# Data rows aligned to headers count
$dataRows = @()
for($r=$headerRowIndex+1; $r -lt $rawRows.Count; $r++){
  $cells = $rawRows[$r]
  if ($cells.Count -gt $headers.Count){ $cells = $cells[0..($headers.Count-1)] }
  elseif ($cells.Count -lt $headers.Count){ $cells = $cells + ('' * ($headers.Count - $cells.Count)) }
  $dataRows += ,$cells
}

# Apply JSON rules row-by-row (works on raw cell arrays)
Write-Log ("Applying rules across {0} columns and {1} rows" -f $headers.Count, $dataRows.Count)
for($r=0; $r -lt $dataRows.Count; $r++){ Apply-Rules -Headers $headers -Row $dataRows[$r] -RuleMap $rules }

# Optional: sanitize cell text after rule application
if ($SanitizeText) {
  for($r=0; $r -lt $dataRows.Count; $r++){
    for($c=0; $c -lt $headers.Count; $c++){
      $v = $dataRows[$r][$c]
      if ($null -ne $v -and $v.ToString() -ne '') {
        $dataRows[$r][$c] = Clean-Text -Text $v.ToString()
      }
    }
  }
}

# Materialize PSCustomObjects for export
$excelRows = foreach($row in $dataRows){
  $obj = [ordered]@{}
  for($i=0; $i -lt $headers.Count; $i++){ $obj[$headers[$i]] = $row[$i] }
  [pscustomobject]$obj
}

# Export working XLSX and CSVs
$excelRows | Export-Excel -Path $WorkXlsx -WorksheetName 'Data' -TableName 'BOE_Data' -TableStyle Medium2 -AutoSize -ClearSheet
$excelRows | Export-Csv  -Path $WorkCsv  -NoTypeInformation -Encoding UTF8

if (Test-Path $DailyCsv) { Remove-Item $DailyCsv -Force -ErrorAction SilentlyContinue }
Copy-Item $WorkCsv -Destination $DailyCsv -Force

# Header extraction (B4, D10, D11, B6, B7, B8)
try {
  $topRaw = Import-Excel -Path $InputXlsx -WorksheetName $ws -StartRow 1 -EndRow 20 -NoHeader
  function Get-RC { param([int]$Row,[int]$Col) if($Row-1 -lt $topRaw.Count){ $topRaw[$Row-1]."Column$Col" } else { $null } }

  $check_trace_num         = Get-RC -Row 4  -Col 2   # B4
  $best_code               = Get-RC -Row 10 -Col 4   # D10
  $site_supplier_code      = Get-RC -Row 11 -Col 4   # D11
  $payment                 = Get-RC -Row 6  -Col 2   # B6
  $payment_check_oadate    = Get-RC -Row 7  -Col 2   # B7
  $payment_settlement_oada = Get-RC -Row 8  -Col 2   # B8

  $hdrObj = [pscustomobject]@{
    check_trace_num         = [string]$check_trace_num
    site_supplier_code      = [string]$site_supplier_code
    best_code               = [string]$best_code
    payment_check_date      = As-Iso $payment_check_oadate
    payment_settlement_date = As-Iso $payment_settlement_oada
    payment                 = $payment
    invoices_paid_str       = ""
    payment_status          = ""
  }

  # Optional: sanitize header fields
  if ($SanitizeText) {
    foreach ($p in $hdrObj.PSObject.Properties.Name) {
      $v = $hdrObj.$p; if ($null -ne $v -and $v.ToString() -ne '') { $hdrObj.$p = Clean-Text -Text $v.ToString() }
    }
  }

  $hdrObj | Export-Csv -Path $HeaderPath -NoTypeInformation -Force -Encoding UTF8
  Copy-Item -Path $HeaderPath -Destination $HeaderArchive -Force
  Write-Log "Extracted header fields to: $HeaderPath" "Green"
}
catch {
  Write-Log ("WARN: Header extraction failed: {0}" -f $_.Exception.Message) "Yellow"
  if (-not (Test-Path $HeaderPath)) { @() | Export-Csv -Path $HeaderPath -NoTypeInformation -Force -Encoding UTF8 }
}

# Archive the daily CSV
Copy-Item $DailyCsv -Destination $DailyCsvArchive -Force

# Optional ready marker
if ($EmitReadyMarker) {
  $ready = Join-Path $Process "BOE.ready"
  "ok $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath $ready -Encoding UTF8 -Force
  Write-Log "Ready marker created: $ready" "Green"
}

# Metrics (light telemetry)
try {
  $metrics = Join-Path $LogDir1 "BOE_RunMetrics.csv"
  ("{0},{1},{2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $excelRows.Count, $ws) |
    Out-File -FilePath $metrics -Append -Encoding UTF8
} catch { }

Write-Log "Wrote working XLSX: $WorkXlsx" "Green"
Write-Log "Wrote working CSV : $WorkCsv"   "Green"
Write-Log "Wrote daily CSV   : $DailyCsv"  "Green"
Write-Log "Archived to       : $DailyCsvArchive" "Green"
Write-Log "Header archive    : $HeaderArchive" "Green"
Write-Log "=== V4 run complete ===" "Cyan"