## BOEReceivableProcessFilesV4.ps1
# Uses ImportExcel (no COM) and works with .xlsx files

Write-Output "BOE Receivable - Version 4 (ImportExcel)"
$ErrorActionPreference = 'Stop'

# determine project root (same logic as v1)
if ($env:COMPUTERNAME -eq 'WILLIAM-ADMINPC') {
  $project = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities"
} else {
  $project = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable"
}

$InputDir = Join-Path -Path $project -ChildPath 'Input'
$ProcessDir = Join-Path -Path $project -ChildPath 'Process'
$LogDir = Join-Path -Path $project -ChildPath 'Logs'
if (-not (Test-Path $LogDir)) { New-Item -Path $LogDir -ItemType Directory -Force | Out-Null }
$LogFile = Join-Path -Path $LogDir -ChildPath 'BOE_Excel_Diag_v4.log'

function Write-Log { param([string]$m) $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'; "$ts - $m" | Out-File -FilePath $LogFile -Append -Encoding UTF8; Write-Output $m }

function Wait-FileStable { param([string]$Path,[int]$StableSeconds=5,[int]$TimeoutSeconds=120,[int]$PollMs=500) $deadline=(Get-Date).AddSeconds($TimeoutSeconds); $last=-1; $stable=0; while((Get-Date)-lt $deadline){ if(-not (Test-Path $Path)){ Start-Sleep -Milliseconds $PollMs; continue }; try{ $len=(Get-Item $Path -ErrorAction Stop).Length } catch { Start-Sleep -Milliseconds $PollMs; continue }; if($len -eq $last){ $stable += $PollMs/1000; if($stable -ge $StableSeconds){ return $true } } else { $stable=0; $last=$len }; Start-Sleep -Milliseconds $PollMs }; return $false }

# ensure ImportExcel is present
if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
  Write-Log 'ERROR: ImportExcel module not installed. Install from PSGallery: Install-Module -Name ImportExcel'
  throw 'Missing ImportExcel module'
}

Write-Log 'ImportExcel module present. Beginning V4 run.'

# find .xlsx files in Input
$files = Get-ChildItem -Path $InputDir -Filter '*.xlsx' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime

# Development-mode: if running on the developer workstation, allow an easy test input copy
if ($env:COMPUTERNAME -eq 'WILLIAM-ADMINPC') {
  $testInputFile = Join-Path -Path $project -ChildPath 'Input\xlDetailExport 20260119.xlsx'
  $testOutputFile = Join-Path -Path $project -ChildPath 'Input\BOE.xlsx'
  if (Test-Path $testInputFile) {
    Write-Log 'DEVELOPMENT MODE: copying test input to Input\BOE.xlsx'
    try {
      Copy-Item -Path $testInputFile -Destination $testOutputFile -Force -ErrorAction Stop
      Write-Log "SUCCESS: Test file copied to $testOutputFile"
    }
    catch { Write-Log "WARN: Failed to copy test input: $($_.Exception.Message)" }
  }
  else {
    Write-Log "DEV: test input not found: $testInputFile"
    # Fallback: try to find the newest .xlsx in Process or Input to use as a test source
    try {
      $procDir = Join-Path -Path $project -ChildPath 'Process'
      $cand = Get-ChildItem -Path $procDir -Filter '*.xlsx' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
      if (-not $cand) {
        $inputDir = Join-Path -Path $project -ChildPath 'Input'
        $cand = Get-ChildItem -Path $inputDir -Filter '*.xlsx' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
      }
      if ($cand) {
        $candPath = $cand.FullName
        Write-Log "DEV: Found candidate test file: $candPath - copying to Input\\BOE.xlsx"
        Copy-Item -Path $candPath -Destination $testOutputFile -Force -ErrorAction Stop
        Write-Log "SUCCESS: Copied candidate to $testOutputFile"
      }
      else {
        Write-Log "DEV: No candidate .xlsx found in Process or Input to copy for testing."
      }
    }
    catch {
      Write-Log "DEV: Fallback copy failed: $($_.Exception.Message)"
    }
  }
  # refresh file list after potential copy
  $files = Get-ChildItem -Path $InputDir -Filter '*.xlsx' -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime
}
if (-not $files -or $files.Count -eq 0) { Write-Log 'No .xlsx files found in Input. Exiting.'; return }

foreach ($f in $files) {
  try {
    Write-Log "Processing input file: $($f.FullName)"
    $secondsStamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $ts = Get-Date -Format 'yyyy-MM-dd-HH-mm-ss'
    $dateStamp = Get-Date -Format 'yyyyMMdd'
    $dailyStamp = $dateStamp + 'V1'
    $dest = Join-Path -Path $ProcessDir -ChildPath ("1 $ts.xlsx")
    Copy-Item -Path $f.FullName -Destination $dest -Force
    if (-not (Wait-FileStable -Path $dest -StableSeconds 3 -TimeoutSeconds 60)) { Write-Log "WARN: $dest not stable; proceeding anyway" }

    # get sheet info
    try {
      $sheets = Get-ExcelSheetInfo -Path $dest
    }
    catch {
      Write-Log "ERROR: Get-ExcelSheetInfo failed: $($_.Exception.Message)"
      continue
    }
    if (-not $sheets -or $sheets.Count -eq 0) { Write-Log "ERROR: No worksheets found in $dest"; continue }
    $firstSheet = $sheets[0].Name
    Write-Log "INFO: Found sheet: $firstSheet (Rows=$($sheets[0].RowCount))"

    # read sheet and apply JSON rules, then export to CSV (legacy pipeline expects a CSV)
    try {
      # Read raw rows without header to locate the tabular header row (legacy reports have preamble)
      $rowsRaw = Import-Excel -Path $dest -WorksheetName $firstSheet -NoHeader -ErrorAction Stop

      # materialize as array-of-arrays
      $rawRows = @()
      foreach ($rRaw in $rowsRaw) { $vals = @($rRaw.PSObject.Properties.Value); $rawRows += ,$vals }

      # locate header row containing 'Boeing Invoice #' within first 20 rows
      $headerRowIndex = $null
      $scanMax = [Math]::Min(20, $rawRows.Count)
      for ($i=0; $i -lt $scanMax; $i++) {
        $line = (($rawRows[$i] | ForEach-Object { $_ -as [string] }) -join ' ') -replace [char]160,' '
        if ($line -match 'Boeing Invoice \#') { $headerRowIndex = $i; break }
      }

      if ($null -eq $headerRowIndex) {
        # fallback to simple import if header not found
        $data = Import-Excel -Path $dest -WorksheetName $firstSheet
      }
      else {
        # build headers and rows starting at headerRowIndex
        $headers = @()
        foreach ($h in $rawRows[$headerRowIndex]) {
          if ($null -ne $h -and $h.ToString().Trim() -ne '') { $headers += ($h.ToString().Replace([char]160,' ').Trim() -replace '\s+',' ') } else { $headers += '' }
        }

        # assemble data rows aligned to headers
        $dataRows = @()
        for ($r = $headerRowIndex + 1; $r -lt $rawRows.Count; $r++) {
          $cells = $rawRows[$r]
          if ($cells.Count -gt $headers.Count) { $cells = $cells[0..($headers.Count - 1)] }
          elseif ($cells.Count -lt $headers.Count) { $cells = $cells + ('' * ($headers.Count - $cells.Count)) }
          $dataRows += ,$cells
        }

        # materialize PSCustomObjects in original column order
        $data = foreach ($rowVals in $dataRows) {
          $obj = [ordered]@{}
          for ($i = 0; $i -lt $headers.Count; $i++) { $obj[$headers[$i]] = $rowVals[$i] }
          [pscustomobject]$obj
        }
      }

      # Load column rules JSON if present
      $rulesPath = Join-Path -Path $project -ChildPath 'BOE_Column_Rules.json'
      if (Test-Path $rulesPath) {
        try {
          $rulesJson = Get-Content -Path $rulesPath -Raw | ConvertFrom-Json
          $rules = $rulesJson.rules
          Write-Log "INFO: Loaded $($rules.Count) formatting rules from $rulesPath"
        }
        catch {
          Write-Log "WARN: Failed to read/parse rules JSON: $($_.Exception.Message)"
          $rules = @()
        }
      }
      else { Write-Log "WARN: Rules file not found: $rulesPath"; $rules = @() }

      if ($rules -and $data -and $data.Count -gt 0) {
        # get column/property names
        $columns = $data[0].PSObject.Properties | Select-Object -ExpandProperty Name
        foreach ($rule in $rules) {
          if (-not $rule.columnPattern) { continue }
          $pattern = $rule.columnPattern
          $matching = $columns | Where-Object { $_ -match $pattern }
          if (-not $matching) { continue }
          foreach ($col in $matching) {
            foreach ($row in $data) {
              $prop = $row.PSObject.Properties[$col]
              if (-not $prop) { continue }
              $val = $prop.Value
              if ($null -eq $val) { continue }

              # strip formulas like ="value" or =VALUE
              if ($rule.PSObject.Properties.Match('stripFormulas') -and $rule.stripFormulas -eq $true) {
                if ($val -is [string]) {
                  if ($val -match '^="(.+)"$') { $val = $Matches[1] }
                  elseif ($val -match '^=(.+)$') { $val = $Matches[1] }
                }
              }

              # trim
              if ($rule.PSObject.Properties.Match('trim') -and $rule.trim -eq $true) {
                if ($val -is [string]) { $val = $val.Trim() }
              }

              # strip commas
              if ($rule.PSObject.Properties.Match('stripCommas') -and $rule.stripCommas -eq $true) {
                if ($val -is [string]) { $val = $val.Replace(',', '') }
              }

              # numeric/currency parsing
              if ($rule.PSObject.Properties.Match('dataType')) {
                $dt = ($rule.dataType -as [string])
                if ($dt) {
                  switch ($dt.ToLower()) {
                    'date' {
                      try {
                        if ($val -is [double] -or $val -is [decimal] -or $val -is [int]) { $val = [DateTime]::FromOADate([double]$val) }
                        else { $val = [datetime]::Parse($val) }
                      } catch { }
                    }
                    'datetime' {
                      try {
                        if ($val -is [double] -or $val -is [decimal] -or $val -is [int]) { $val = [DateTime]::FromOADate([double]$val) }
                        else { $val = [datetime]::Parse($val) }
                      } catch { }
                    }
                    'currency' {
                      try {
                        if ($val -is [string]) { $vtemp = $val -replace '[$]', '' -replace '[,]', '' } else { $vtemp = $val }
                        $num = [decimal]::Parse($vtemp, [System.Globalization.CultureInfo]::InvariantCulture)
                        # apply decimal places from excelFormat if present
                        $dec = 2
                        if ($rule.PSObject.Properties.Match('excelFormat') -and $rule.excelFormat) {
                          if ($rule.excelFormat -match '\.(0+)') { $dec = $Matches[1].Length }
                        }
                        $val = [Math]::Round($num, $dec)
                      } catch { }
                    }
                    default { }
                  }
                }
              }

              # assign back to property
              try {
                $row.PSObject.Properties[$col].Value = $val
              }
              catch {
                # fallback: replace property
                $row | Add-Member -NotePropertyName $col -NotePropertyValue $val -Force
              }
            }
          }
        }
      }

      # Export processed data to working XLSX (2_{timestamp}.xlsx)
      try {
        $workXlsx = Join-Path -Path $ProcessDir -ChildPath ("2_$secondsStamp.xlsx")
        $data | Export-Excel -Path $workXlsx -WorksheetName 'Data' -TableName 'BOE_Data' -TableStyle Medium2 -AutoSize -ClearSheet
        Write-Log "INFO: Exported processed workbook: $workXlsx"
      }
      catch {
        Write-Log "WARN: Export-Excel failed for $($workXlsx): $($_.Exception.Message)"
      }

      # Export working CSV 2.csv (legacy consumer expects this)
      try {
        $workCsv = Join-Path -Path $ProcessDir -ChildPath '2.csv'

        # Preserve header order and format values similar to the legacy Ver3 pipeline
        $headers = $data[0].PSObject.Properties | Select-Object -ExpandProperty Name

        $excelRows = foreach ($row in $data) {
          $obj = [ordered]@{}
          foreach ($h in $headers) {
            $val = $null
            try { $val = $row.PSObject.Properties[$h].Value } catch { $val = $null }
            if ($null -eq $val) { $out = '' }
            elseif ($val -is [datetime]) { $out = $val.ToString('MM/dd/yyyy') }
            elseif ($val -is [double] -or $val -is [decimal] -or $val -is [int]) { $out = ('{0:N2}' -f [decimal]$val).Replace(',','') }
            else { $out = $val.ToString().Trim() }
            $obj[$h] = $out
          }
          [pscustomobject]$obj
        }

        $excelRows | Export-Csv -Path $workCsv -NoTypeInformation -Encoding UTF8NoBOM
        Write-Log "INFO: Exported working CSV: $($workCsv)"
      }
      catch {
        Write-Log "WARN: Export-Csv failed for $($workCsv): $($_.Exception.Message)"
      }



      # Final daily CSV copy with SSIS-friendly name (Boeing_Export_YYYYMMDDV1.csv)
      try {
        $dailyCsvName = "Boeing_Export_${dailyStamp}.csv"
        $dailyCsvPath = Join-Path -Path $ProcessDir -ChildPath $dailyCsvName
        Copy-Item -Path $workCsv -Destination $dailyCsvPath -Force
        Write-Log "INFO: Copied working CSV to daily export: $dailyCsvPath"
      }
      catch { Write-Log "WARN: Could not copy working CSV to daily export: $($_.Exception.Message)" }
      
      # Generate BOEReceivableHeader_YYYYMMDD.csv from template or data
      try {
        $hdrTemplate = Join-Path -Path $ProcessDir -ChildPath 'TEMPLATE_BOE_Header.csv'
        $hdrName = "BOEReceivableHeader_$((Get-Date).ToString('yyyyMMdd')).csv"
        $hdrPath = Join-Path -Path $ProcessDir -ChildPath $hdrName

        if (Test-Path $hdrTemplate) {
          Copy-Item -Path $hdrTemplate -Destination $hdrPath -Force
          Write-Log "INFO: Copied header template to $hdrPath"
        }
        else {
          # create header file based on template header inferred from data columns
          $cols = @('payment_settlement_date','invoices_paid_str','site_supplier_code','payment_status','best_code','payment','check_trace_num','payment_check_date')
          $headerLine = '"' + ($cols -join '","') + '"'
          # Write header file without BOM for SSIS
          $headerLine | Out-File -FilePath $hdrPath -Encoding UTF8NoBOM
          Write-Log "INFO: Created header template file $hdrPath"
        }

        # Attempt to populate a data row with summary values where possible
        $rowValues = @{}
        $rowValues.payment_settlement_date = ''
        $rowValues.invoices_paid_str = "$($data.Count) Invoices Paid"
        $rowValues.site_supplier_code = ''
        $rowValues.payment_status = ''
        $rowValues.best_code = ''
        $rowValues.payment = ''
        $rowValues.check_trace_num = ''
        $rowValues.payment_check_date = (Get-Date).ToString('yyyy-MM-dd 00:00:00')

        # helper to find column case-insensitively
        $dataCols = $data[0].PSObject.Properties | Select-Object -ExpandProperty Name
        function Find-Col([string]$pattern) { return ($dataCols | Where-Object { $_ -match $pattern }) | Select-Object -First 1 }

        $c = Find-Col 'payment_settlement_date|Settlement.*Date|Check.*Date'
        if ($c) {
          $dates = $data | Where-Object { $_.$c } | ForEach-Object { [datetime]($_.$c) }  -ErrorAction SilentlyContinue
          if ($dates) { $rowValues.payment_settlement_date = ($dates | Sort-Object -Descending | Select-Object -First 1).ToString('yyyy-MM-dd 00:00:00') }
        }

        $c = Find-Col 'site_supplier_code|Supplier.*Code|site.*code'
        if ($c) { $rowValues.site_supplier_code = ($data | Where-Object { $_.$c -and ($_. $c -ne '') } | Select-Object -First 1).$c }

        $c = Find-Col '^Payment$|.*Amt$|.*Amount$'
        if ($c) { $sum = ($data | Measure-Object -Property $c -Sum -ErrorAction SilentlyContinue).Sum; if ($sum -ne $null) { $rowValues.payment = [Math]::Round([decimal]$sum,2).ToString('F2') } }

        $c = Find-Col 'Best.*Code|best_code|best code'
        if ($c) { $rowValues.best_code = ($data | Where-Object { $_.$c -and ($_. $c -ne '') } | Select-Object -First 1).$c }

        $c = Find-Col 'check_trace_num|Check.*Trace|trace_num'
        if ($c) { $rowValues.check_trace_num = ($data | Where-Object { $_.$c -and ($_. $c -ne '') } | Select-Object -First 1).$c }

        # write a single data row following header column order
        $vals = @(
          $rowValues.payment_settlement_date,
          $rowValues.invoices_paid_str,
          $rowValues.site_supplier_code,
          $rowValues.payment_status,
          $rowValues.best_code,
          $rowValues.payment,
          $rowValues.check_trace_num,
          $rowValues.payment_check_date
        )
        '"' + ($vals -join '","') + '"' | Out-File -FilePath $hdrPath -Append -Encoding UTF8NoBOM
        Write-Log "INFO: Wrote header data row to $hdrPath"
      }
      catch {
        Write-Log "WARN: Failed to generate header CSV: $($_.Exception.Message)"
      }

      # Archive header and daily CSV into ProcessComplete (archive folder)
      try {
        $processCompleteDir = Join-Path -Path $project -ChildPath 'ProcessComplete'
        if (-not (Test-Path $processCompleteDir)) { New-Item -ItemType Directory -Path $processCompleteDir -Force | Out-Null }
        if ($dailyCsvPath -and (Test-Path $dailyCsvPath)) {
          $archiveDaily = Join-Path -Path $processCompleteDir -ChildPath (Split-Path -Path $dailyCsvPath -Leaf)
          Copy-Item -Path $dailyCsvPath -Destination $archiveDaily -Force
          Write-Log "INFO: Archived daily CSV to ProcessComplete: $archiveDaily"
        }
        if ($hdrPath -and (Test-Path $hdrPath)) {
          $archiveHdr = Join-Path -Path $processCompleteDir -ChildPath (Split-Path -Path $hdrPath -Leaf)
          Copy-Item -Path $hdrPath -Destination $archiveHdr -Force
          Write-Log "INFO: Archived header CSV to ProcessComplete: $archiveHdr"
        }
      }
      catch {
        Write-Log "WARN: Failed to archive header/daily CSV to ProcessComplete: $($_.Exception.Message)"
      }
    }
    catch {
      Write-Log "ERROR: Import-Excel/Export-Csv failed: $($_.Exception.Message)"
      continue
    }

    # mark processed (move original to ProcessComplete)
    try {
      $completeDir = Join-Path -Path $project -ChildPath 'ProcessComplete'
      if (-not (Test-Path $completeDir)) { New-Item -Path $completeDir -ItemType Directory -Force | Out-Null }
      Move-Item -Path $f.FullName -Destination (Join-Path $completeDir $f.Name) -Force
      Write-Log "Moved original input to ProcessComplete: $($f.Name)"
    }
    catch { Write-Log "WARN: Could not move original: $($_.Exception.Message)" }

  }
  catch {
    Write-Log "ERROR: Processing failed for $($f.FullName): $($_.Exception.Message)"
  }
}

Write-Log 'V4 run complete.'
