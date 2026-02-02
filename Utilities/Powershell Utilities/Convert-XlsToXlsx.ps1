<#
.SYNOPSIS
  Convert legacy .xls workbooks to .xlsx using ACE OLE DB for reading and ImportExcel for writing.

.PARAMETER InXls
  Path to the source .xls file.
.PARAMETER OutXlsx
  Path to the destination .xlsx file. If the file exists it will be overwritten/updated.

.NOTES
  - Requires an ACE OLE DB provider (16.0 or 12.0) installed on the system.
  - Requires the PowerShell module ImportExcel (Install-Module ImportExcel).
  - This script reads all visible worksheets and writes them into the target .xlsx as separate sheets.
#>

param(
  [Parameter(Mandatory = $true)][string]$InXls,
  [Parameter(Mandatory = $true)][string]$OutXlsx
)

$ErrorActionPreference = 'Stop'

function Get-ACEProvider {
  if ([type]::GetTypeFromProgID('Microsoft.ACE.OLEDB.16.0')) { return 'Microsoft.ACE.OLEDB.16.0' }
  if ([type]::GetTypeFromProgID('Microsoft.ACE.OLEDB.12.0')) { return 'Microsoft.ACE.OLEDB.12.0' }
  return $null
}

function Wait-FileStable { param([string]$Path,[int]$StableSeconds=2,[int]$TimeoutSeconds=30) $deadline=(Get-Date).AddSeconds($TimeoutSeconds); $last=-1; $stable=0; while((Get-Date)-lt $deadline){ if(-not (Test-Path $Path)){ Start-Sleep -Milliseconds 200; continue }; $len=(Get-Item $Path).Length; if($len -eq $last){ $stable += 0.2; if($stable -ge $StableSeconds){ return $true } } else { $stable=0; $last=$len }; Start-Sleep -Milliseconds 200 }; return $false }

if (-not (Test-Path $InXls)) { throw "Input file not found: $InXls" }

$prov = Get-ACEProvider
if (-not $prov) { throw 'No ACE OLE DB provider found (install Access Database Engine / ACE).' }

if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
  throw 'ImportExcel module not found. Install with: Install-Module ImportExcel -Scope CurrentUser'
}

if (-not (Wait-FileStable -Path $InXls -StableSeconds 1 -TimeoutSeconds 30)) { Write-Host "Warning: $InXls not stable but continuing." }

$connString = "Provider=$prov;Data Source=$InXls;Extended Properties='Excel 8.0;HDR=YES;IMEX=1';"
$conn = New-Object System.Data.OleDb.OleDbConnection $connString

try {
  $conn.Open()
  $schema = $conn.GetOleDbSchemaTable([System.Data.OleDb.OleDbSchemaGuid]::Tables, $null)
  if (-not $schema -or $schema.Rows.Count -eq 0) { throw "No worksheets found in $InXls" }

  # prepare output: if exists, remove so Export-Excel creates fresh file
  if (Test-Path $OutXlsx) { Remove-Item -Path $OutXlsx -Force }

  $append = $false
  foreach ($r in $schema.Rows) {
    $rawName = $r.TABLE_NAME
    if (-not $rawName) { continue }
    # Normalize sheet name like "Sheet1$" or "'Sheet1$'"
    $sheetName = $rawName -replace "\$","" -replace "'","".Trim()
    if ($sheetName -match "^_\$") { continue }

    $cmdText = "SELECT * FROM [${rawName}]"
    $da = New-Object System.Data.OleDb.OleDbDataAdapter ($cmdText, $conn)
    $dt = New-Object System.Data.DataTable
    [void]$da.Fill($dt)

    if ($dt.Rows.Count -eq 0 -and $dt.Columns.Count -eq 0) {
      Write-Host "Skipping empty sheet: $sheetName"
      continue
    }

    # sanitize worksheet name for Export-Excel (max 31 chars)
    $safeName = if ($sheetName.Length -gt 31) { $sheetName.Substring(0,31) } else { $sheetName }

    try {
      if (-not $append) {
        $dt | Export-Excel -Path $OutXlsx -WorksheetName $safeName -TableName 'Data' -TableStyle Medium2 -AutoSize
        $append = $true
      }
      else {
        $dt | Export-Excel -Path $OutXlsx -WorksheetName $safeName -TableName 'Data' -TableStyle Medium2 -AutoSize -Append
      }
      Write-Host "Wrote sheet: $safeName (Rows=$($dt.Rows.Count),Cols=$($dt.Columns.Count))"
    }
    catch {
      Write-Host "ERROR writing sheet $safeName: $($_.Exception.Message)"
    }
  }
}
finally {
  if ($conn.State -eq 'Open') { $conn.Close() }
  $conn.Dispose()
}

Write-Host "Conversion complete: $OutXlsx"
