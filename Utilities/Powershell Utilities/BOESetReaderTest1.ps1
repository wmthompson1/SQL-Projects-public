# Utilities\Powershell Utilities\BOESetReaderTest1.ps1

Headers (include NBSPs and special chars as in original Excel):
 Boeing Invoice #				
,Boeing Purchase Order #
,Supplier Invoice #
,Invoice Received Date
,Invoice Gross Amt
,Applied Disc Amt
,Invoice Net Amt
,Conversion Rate

# Load column formatting rules
$rulesPath = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\BOE_Column_Rules.json"
$columnRules = Get-Content $rulesPath | ConvertFrom-Json

Write-Output "Loaded $($columnRules.rules.Count) column formatting rules from configuration"
Write-Output ""

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false # Set to $true if you want to see Excel open

$fullpath = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\Process\2.xlsx" 

    $workbook = $excel.Workbooks.Open($fullpath)
    $worksheet = $workbook.Worksheets.Item(1) # Or by name: $workbook.Worksheets.Item("Sheet1")


## Read data and create PSCustomObjects: Iterate through rows and cells to build your objects. 
    $data = @()
    $usedRange = $worksheet.UsedRange
    $rows = $usedRange.Rows.Count
    $cols = $usedRange.Columns.Count
    $headerRow = 1 # Assuming the first row is the header

    # Read header names from first row
    $headers = @()
    for ($col = 1; $col -le $cols; $col++) {
        $headerName = $usedRange.Cells($headerRow, $col).Text
        if ($headerName -ne "") {
            # Clean header for internal use only (don't modify Excel file)
            $cleanHeader = $headerName -replace [char]160, ' '  # Replace NBSP with regular space
            $cleanHeader = $cleanHeader.Trim() -replace '\s+', ' '  # Normalize multiple spaces
            $headers += $cleanHeader
            # Note: Original header with NBSP remains intact in Excel
        }
    }

    Write-Output "Found $($headers.Count) columns in Excel file:"
    $headers | ForEach-Object { Write-Output "  - $_" }
    Write-Output ""

    # Apply formatting rules to columns
    Write-Output "=== APPLYING COLUMN FORMATTING RULES ==="
    foreach ($header in $headers) {
        $colIndex = $headers.IndexOf($header) + 1
        
        # Find matching rule
        $matchedRule = $null
        foreach ($rule in $columnRules.rules) {
            if ($header -match $rule.columnPattern) {
                $matchedRule = $rule
                break
            }
        }
        
        if ($matchedRule) {
            Write-Output "Column '$header' -> $($matchedRule.dataType) ($($matchedRule.excelFormat))"
            
            $lastRow = $usedRange.Rows.Count
            $columnRange = $worksheet.Range($worksheet.Cells.Item(2, $colIndex), $worksheet.Cells.Item($lastRow, $colIndex))
            
            # Strip formulas if required
            if ($matchedRule.stripFormulas) {
                Write-Output "  - Stripping formulas from column..."
                $columnRange.Copy() | Out-Null
                $columnRange.PasteSpecial(-4163) | Out-Null  # xlPasteValues
                $excel.CutCopyMode = $false
            }
            
            # Apply Excel format
            $columnRange.NumberFormat = $matchedRule.excelFormat
            
            # Trim if required
            if ($matchedRule.trim) {
                for ($row = 2; $row -le $lastRow; $row++) {
                    $cell = $worksheet.Cells.Item($row, $colIndex)
                    if ($null -ne $cell.Value2) {
                        $trimmed = $cell.Value2.ToString().Trim()
                        # Also strip ="..." literal text if present
                        if ($trimmed -match '^="(.+)"$') {
                            $trimmed = $matches[1]
                        }
                        $cell.Value2 = $trimmed
                    }
                }
            }
        } else {
            Write-Output "Column '$header' -> No rule matched (default)"
        }
    }
    
    Write-Output ""
    Write-Output "Formatting rules applied successfully"
    Write-Output ""

    # Read data rows and create objects with dynamic properties
    for ($row = $headerRow + 1; $row -le $rows; $row++) {
        $obj = [PSCustomObject]@{}
        
        for ($col = 1; $col -le $headers.Count; $col++) {
            $propertyName = $headers[$col - 1]
            $cellValue = $usedRange.Cells($row, $col).Text
            $obj | Add-Member -MemberType NoteProperty -Name $propertyName -Value $cellValue
        }
        
        $data += $obj
    }

    Write-Output "Loaded $($data.Count) rows of data"
    Write-Output ""

    # Export full dataset to test output files for inspection
    $testOutputPath = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\Process"
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    
    # Export as CSV for easy viewing
    $csvTestFile = Join-Path $testOutputPath "TEST_Data_$timestamp.csv"
    $data | Export-Csv -Path $csvTestFile -NoTypeInformation -Force
    Write-Output "Exported full dataset to CSV: $csvTestFile"
    
    # Export as formatted Excel for visual inspection
    $xlsxTestFile = Join-Path $testOutputPath "TEST_Data_$timestamp.xlsx"
    $data | Export-Csv -Path "$testOutputPath\temp.csv" -NoTypeInformation -Force
    
    # Convert CSV to formatted Excel
    $tempCsv = "$testOutputPath\temp.csv"
    $testWb = $excel.Workbooks.Open($tempCsv)
    $testWb.SaveAs($xlsxTestFile, 51)  # 51 = xlWorkbookDefault
    $testWb.Close($false)
    Remove-Item $tempCsv -Force
    
    Write-Output "Exported full dataset to Excel: $xlsxTestFile"
    Write-Output ""

    # Display first 5 rows as a sample
    Write-Output "=== SAMPLE DATA (First 5 rows) ==="
    $data | Select-Object -First 5 | Format-Table -AutoSize

    # Test: Find rows where Supplier Invoice # contains formulas or special chars
    Write-Output ""
    Write-Output "=== TESTING: Supplier Invoice # Column ==="
    
    # Find column that matches "Supplier Invoice" (case-insensitive, partial match)
    $supplierInvCol = $headers | Where-Object { $_ -match "Supplier.*Invoice" } | Select-Object -First 1
    
    if ($supplierInvCol) {
        Write-Output "Found column: '$supplierInvCol'"
        $supplierInvoices = $data | ForEach-Object { $_.$supplierInvCol } | Where-Object { $_ -ne "" }
        Write-Output "Total non-empty values: $($supplierInvoices.Count)"
        
        $withEquals = $supplierInvoices | Where-Object { $_ -match '^=' }
        if ($withEquals.Count -gt 0) {
            Write-Output "WARNING: Found $($withEquals.Count) values starting with '=' (formula syntax)"
            $withEquals | Select-Object -First 10 | ForEach-Object { Write-Output "  - $_" }
        } else {
            Write-Output "SUCCESS: No formula syntax detected"
            Write-Output "Sample values:"
            $supplierInvoices | Select-Object -First 10 | ForEach-Object { Write-Output "  - $_" }
        }
    } else {
        Write-Output "Column matching 'Supplier Invoice' not found in headers"
        Write-Output "Available headers: $($headers -join ', ')"
    }

    # Additional validation: Show column data types and sample values
    Write-Output ""
    Write-Output "=== COLUMN ANALYSIS ==="
    foreach ($header in $headers) {
        $sampleValues = $data | Select-Object -First 3 -ExpandProperty $header | Where-Object { $_ -ne "" }
            if ($sampleValues.Count -gt 0) {
            $sample = $sampleValues -join ", "
            if ($sample.Length -gt 50) { $sample = $sample.Substring(0, 50) + "..." }
            Write-Output "${header} : ${sample}"
        }
    }
    
    Write-Output ""
    Write-Output "=== TEST FILES CREATED ==="
    Write-Output "CSV file: $csvTestFile"
    Write-Output "Excel file: $xlsxTestFile"
    Write-Output ""
    Write-Output "Open these files to inspect the full dataset and verify formula stripping"

# Close the workbook and Excel
$workbook.Close($false)  # $false = don't save changes
$excel.Quit()

# Release COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null

# Force garbage collection
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Kill any remaining Excel processes
Stop-Process -Name excel -Force -ErrorAction SilentlyContinue

Write-Output ""
Write-Output "Excel closed successfully"
