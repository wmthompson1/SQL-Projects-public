# BOE_Format_And_Export.ps1
# Fast in-memory formatting with direct output to data flow

param(
    [string]$SourceFile = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\Process\2.xlsx",
    [string]$OutputFile = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\Process\Boeing_Export_$(Get-Date -Format 'yyyyMMdd')V1.xlsx",
    [string]$RulesFile = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\BOE_Column_Rules.json"
)

$ErrorActionPreference = "Stop"

Write-Output "=== BOE RECEIVABLE FORMAT & EXPORT ==="
Write-Output "Source: $SourceFile"
Write-Output "Output: $OutputFile"
Write-Output ""

# Load formatting rules
$rules = (Get-Content $RulesFile | ConvertFrom-Json).rules
Write-Output "Loaded $($rules.Count) formatting rules"

# Open Excel (single instance, fast)
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false
$excel.ScreenUpdating = $false  # Performance boost

try {
    # Open source workbook
    $workbook = $excel.Workbooks.Open($SourceFile)
    $worksheet = $workbook.Worksheets.Item(1)
    
    Write-Output "Processing worksheet: $($worksheet.Name)"
    
    # Get data dimensions (small dataset = fast scan)
    $usedRange = $worksheet.UsedRange
    $lastRow = $usedRange.Rows.Count
    $lastCol = $usedRange.Columns.Count
    
    Write-Output "Data size: $lastRow rows x $lastCol columns"
    
    # Read headers (row 1)
    $headers = @()
    for ($col = 1; $col -le $lastCol; $col++) {
        $headers += $worksheet.Cells.Item(1, $col).Text
    }
    
    Write-Output ""
    Write-Output "=== APPLYING FORMATTING RULES ==="
    
    # Apply rules column-by-column (exploit fixed schema)
    $formattedCols = 0
    for ($col = 1; $col -le $headers.Count; $col++) {
        $header = $headers[$col - 1]
        
        # Match rule
        $rule = $rules | Where-Object { $header -match $_.columnPattern } | Select-Object -First 1
        
        if ($rule) {
            Write-Output "[$col] '$header' -> $($rule.dataType)"
            
            # Get column range (exclude header)
            $dataRange = $worksheet.Range(
                $worksheet.Cells.Item(2, $col),
                $worksheet.Cells.Item($lastRow, $col)
            )
            
            # FAST: Strip formulas with single PasteSpecial operation
            if ($rule.stripFormulas) {
                $dataRange.Copy() | Out-Null
                $dataRange.PasteSpecial(-4163) | Out-Null  # xlPasteValues
                $excel.CutCopyMode = $false
                
                # Quick cleanup of ="..." literals (small data = fast loop)
                if ($rule.dataType -eq "String") {
                    for ($row = 2; $row -le $lastRow; $row++) {
                        $cell = $worksheet.Cells.Item($row, $col)
                        if ($null -ne $cell.Value2) {
                            $val = $cell.Value2.ToString()
                            # Strip ="value" to value
                            if ($val -match '^="(.+)"$') {
                                $cell.Value2 = $matches[1]
                            }
                        }
                    }
                }
            }
            
            # FAST: Apply format to entire column at once
            $dataRange.NumberFormat = $rule.excelFormat
            
            # FAST: Trim strings in-place (only if needed)
            if ($rule.trim -and $rule.dataType -eq "String") {
                for ($row = 2; $row -le $lastRow; $row++) {
                    $cell = $worksheet.Cells.Item($row, $col)
                    if ($null -ne $cell.Value2) {
                        $cell.Value2 = $cell.Value2.ToString().Trim()
                    }
                }
            }
            
            $formattedCols++
        }
    }
    
    Write-Output ""
    Write-Output "Formatted $formattedCols columns"
    
    # Save to output (direct to data flow)
    Write-Output ""
    Write-Output "=== SAVING TO DATA FLOW ==="
    
    # Remove existing output if present
    if (Test-Path $OutputFile) {
        Remove-Item $OutputFile -Force
        Write-Output "Removed existing output file"
    }
    
    # Save formatted workbook
    $workbook.SaveAs($OutputFile, 51)  # xlWorkbookDefault = 51 (.xlsx)
    Write-Output "SUCCESS: Saved to $OutputFile"
    
    # File statistics
    $fileSize = [math]::Round((Get-Item $OutputFile).Length / 1KB, 2)
    Write-Output "File size: $fileSize KB"
    
    # Validation check
    Write-Output ""
    Write-Output "=== VALIDATION ==="
    
    # Quick validation: Check Supplier Invoice # has no formulas
    $supplierCol = 1..$headers.Count | Where-Object { $headers[$_ - 1] -match "Supplier.*Invoice" } | Select-Object -First 1
    if ($supplierCol) {
        $testCell = $worksheet.Cells.Item(2, $supplierCol)
        $hasFormula = $null -ne $testCell.Formula -and $testCell.Formula.ToString().StartsWith("=")
        
        if ($hasFormula) {
            Write-Warning "Supplier Invoice # still has formulas - check rules"
        } else {
            Write-Output "✓ Supplier Invoice # formulas stripped successfully"
            $sampleValue = $testCell.Value2
            Write-Output "  Sample value: '$sampleValue'"
        }
    }
    
    Write-Output "✓ Output file ready for SSIS consumption"
    
} finally {
    # Cleanup
    $workbook.Close($false)
    $excel.Quit()
    
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
    
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    
    Stop-Process -Name excel -Force -ErrorAction SilentlyContinue
}

Write-Output ""
Write-Output "=== PROCESSING COMPLETE ==="
Write-Output "Output: $OutputFile"
