# file: Verify_Excel_SheetNames.ps1
# Excel Sheet Name Verification Script
# This script checks the worksheet names in Excel files to verify SSIS compatibility

param(
    [Parameter(Mandatory=$false)]
    [string]$FilePath
)

Write-Host "=== Excel Sheet Name Verification Tool ===" -ForegroundColor Green
Write-Host "Date: $(Get-Date)" -ForegroundColor Green
Write-Host ""

# If no file path provided, check the latest BOE file
if (-not $FilePath) {
    $dateStamp = Get-Date -Format "yyyyMMdd"
    $processPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"
    $defaultFile = "Boeing_Export_$dateStamp.xlsx"
    $FilePath = Join-Path $processPath $defaultFile
    Write-Host "No file specified, checking today's BOE file: $defaultFile" -ForegroundColor Yellow
}

# Check if file exists
if (-not (Test-Path $FilePath)) {
    Write-Host "❌ File not found: $FilePath" -ForegroundColor Red
    
    # Look for alternative files
    $directory = Split-Path $FilePath
    $fileName = Split-Path $FilePath -Leaf
    Write-Host "`nSearching for similar files in: $directory" -ForegroundColor Yellow
    
    if (Test-Path $directory) {
        $similarFiles = Get-ChildItem $directory -Filter "*.xlsx" | 
            Where-Object { $_.Name -like "*Boeing*" -or $_.Name -like "*BOE*" } |
            Sort-Object LastWriteTime -Descending
        
        if ($similarFiles) {
            Write-Host "Found similar Excel files:" -ForegroundColor Green
            for ($i = 0; $i -lt [Math]::Min(5, $similarFiles.Count); $i++) {
                $file = $similarFiles[$i]
                $size = [math]::Round($file.Length / 1KB, 2)
                Write-Host "  [$($i+1)] $($file.Name) (${size} KB, Modified: $($file.LastWriteTime))" -ForegroundColor White
            }
            
            Write-Host "`nEnter the number to check that file, or press Enter to exit:" -ForegroundColor Yellow
            $selection = Read-Host
            
            if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $similarFiles.Count) {
                $selectedFile = $similarFiles[[int]$selection - 1]
                $FilePath = $selectedFile.FullName
                Write-Host "Selected: $($selectedFile.Name)" -ForegroundColor Green
            } else {
                Write-Host "Exiting..." -ForegroundColor Gray
                exit
            }
        } else {
            Write-Host "No Excel files found in directory" -ForegroundColor Red
            exit
        }
    } else {
        Write-Host "Directory not accessible: $directory" -ForegroundColor Red
        exit
    }
}

Write-Host "`n🔍 Analyzing Excel file: $(Split-Path $FilePath -Leaf)" -ForegroundColor Cyan

try {
    # Create Excel COM object
    $Excel = New-Object -ComObject Excel.Application
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    
    # Open the workbook
    Write-Host "Opening Excel file..." -ForegroundColor Gray
    $Workbook = $Excel.Workbooks.Open($FilePath)
    
    # Get file info
    $fileInfo = Get-Item $FilePath
    $fileSize = [math]::Round($fileInfo.Length / 1KB, 2)
    
    Write-Host "`n📊 FILE INFORMATION:" -ForegroundColor Yellow
    Write-Host "   File: $(Split-Path $FilePath -Leaf)" -ForegroundColor White
    Write-Host "   Size: $fileSize KB" -ForegroundColor White
    Write-Host "   Modified: $($fileInfo.LastWriteTime)" -ForegroundColor White
    Write-Host "   Full Path: $FilePath" -ForegroundColor Gray
    
    # Analyze worksheets
    Write-Host "`n📋 WORKSHEET ANALYSIS:" -ForegroundColor Yellow
    Write-Host "   Total Worksheets: $($Workbook.Worksheets.Count)" -ForegroundColor White
    
    $sheet1Found = $false
    $worksheetDetails = @()
    
    foreach ($sheet in $Workbook.Worksheets) {
        try {
            $usedRange = $sheet.UsedRange
            $rowCount = if ($usedRange) { $usedRange.Rows.Count } else { 0 }
            $colCount = if ($usedRange) { $usedRange.Columns.Count } else { 0 }
            
            $sheetInfo = [PSCustomObject]@{
                Name = $sheet.Name
                Rows = $rowCount
                Columns = $colCount
                IsSheet1 = ($sheet.Name -eq "Sheet1")
            }
            
            $worksheetDetails += $sheetInfo
            
            if ($sheet.Name -eq "Sheet1") {
                $sheet1Found = $true
            }
        }
        catch {
            $worksheetDetails += [PSCustomObject]@{
                Name = $sheet.Name
                Rows = "Error"
                Columns = "Error"
                IsSheet1 = ($sheet.Name -eq "Sheet1")
            }
        }
    }
    
    # Display worksheet details
    foreach ($sheet in $worksheetDetails) {
        $statusIcon = if ($sheet.IsSheet1) { "✅" } else { "⚠️" }
        $nameDisplay = if ($sheet.IsSheet1) { $sheet.Name } else { $sheet.Name }
        
        Write-Host "   $statusIcon Worksheet: '$nameDisplay'" -ForegroundColor $(if ($sheet.IsSheet1) { "Green" } else { "Yellow" })
        if ($sheet.Rows -ne "Error") {
            Write-Host "      Data Size: $($sheet.Rows) rows × $($sheet.Columns) columns" -ForegroundColor Gray
        } else {
            Write-Host "      Status: Error reading worksheet" -ForegroundColor Red
        }
    }
    
    # SSIS Compatibility Assessment
    Write-Host "`n🔧 SSIS COMPATIBILITY:" -ForegroundColor Yellow
    if ($sheet1Found) {
        Write-Host "   ✅ COMPATIBLE - 'Sheet1' worksheet found" -ForegroundColor Green
        Write-Host "   ✅ SSIS Excel Source can connect to this file" -ForegroundColor Green
        Write-Host "   📝 Use table name: 'Sheet1$' in SSIS Excel Source" -ForegroundColor White
    } else {
        Write-Host "   ❌ NOT COMPATIBLE - 'Sheet1' worksheet missing" -ForegroundColor Red
        Write-Host "   ❌ SSIS will fail with 'Sheet1 has to exist' error" -ForegroundColor Red
        
        if ($worksheetDetails.Count -eq 1) {
            $onlySheet = $worksheetDetails[0]
            Write-Host "   🔧 FIX: Rename '$($onlySheet.Name)' to 'Sheet1'" -ForegroundColor Yellow
        } else {
            Write-Host "   🔧 FIX: Ensure one worksheet is named 'Sheet1'" -ForegroundColor Yellow
        }
    }
    
    # Sample data preview
    if ($sheet1Found) {
        try {
            $sheet1 = $Workbook.Worksheets.Item("Sheet1")
            $usedRange = $sheet1.UsedRange
            
            if ($usedRange -and $usedRange.Rows.Count -gt 0) {
                Write-Host "`n📋 SHEET1 DATA PREVIEW (First 3 rows):" -ForegroundColor Yellow
                
                $maxCols = [Math]::Min(5, $usedRange.Columns.Count)
                $maxRows = [Math]::Min(3, $usedRange.Rows.Count)
                
                for ($row = 1; $row -le $maxRows; $row++) {
                    $rowData = @()
                    for ($col = 1; $col -le $maxCols; $col++) {
                        $cellValue = $sheet1.Cells.Item($row, $col).Value2
                        $displayValue = if ($cellValue) { $cellValue.ToString().Substring(0, [Math]::Min(20, $cellValue.ToString().Length)) } else { "[empty]" }
                        $rowData += $displayValue
                    }
                    Write-Host "   Row $row`: $($rowData -join ' | ')" -ForegroundColor White
                }
                
                if ($usedRange.Columns.Count -gt 5) {
                    Write-Host "   ... and $($usedRange.Columns.Count - 5) more columns" -ForegroundColor Gray
                }
            }
        }
        catch {
            Write-Host "`n📋 Could not preview Sheet1 data: $_" -ForegroundColor Red
        }
    }
    
    # Close Excel
    $Workbook.Close($false)
    $Excel.Quit()
    
    # Clean up COM objects
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Workbook) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    
    Write-Host "`n✅ Analysis complete!" -ForegroundColor Green
    
    # Check if file is empty and suggest checking source files
    $emptyFile = $false
    if ($sheet1Found) {
        $sheet1Details = $worksheetDetails | Where-Object { $_.Name -eq "Sheet1" }
        if ($sheet1Details -and ($sheet1Details.Rows -le 1 -or $sheet1Details.Rows -eq 0)) {
            $emptyFile = $true
        }
    }
    
    if ($emptyFile) {
        Write-Host "`n🚨 EMPTY FILE DETECTED:" -ForegroundColor Red
        Write-Host "   Sheet1 exists but contains no meaningful data" -ForegroundColor Yellow
        Write-Host "   This suggests the BOE processing script may not have found the expected data" -ForegroundColor Yellow
        
        # Check for source input files
        $inputPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Input"
        if (Test-Path $inputPath) {
            Write-Host "`n📁 CHECKING SOURCE INPUT FILES:" -ForegroundColor Yellow
            $sourceFiles = Get-ChildItem $inputPath -Filter "*.xlsx" -ErrorAction SilentlyContinue | 
                Sort-Object LastWriteTime -Descending | Select-Object -First 3
            
            if ($sourceFiles) {
                Write-Host "   Recent input files found:" -ForegroundColor Green
                foreach ($file in $sourceFiles) {
                    $size = [math]::Round($file.Length / 1KB, 2)
                    Write-Host "   • $($file.Name) (${size} KB, Modified: $($file.LastWriteTime))" -ForegroundColor White
                }
                Write-Host "`n💡 TROUBLESHOOTING:" -ForegroundColor Cyan
                Write-Host "   1. Check if input file contains 'Boeing Invoice #' text" -ForegroundColor White
                Write-Host "   2. Verify the BOE script can find and process the source data" -ForegroundColor White
                Write-Host "   3. Review BOE script logs for data extraction errors" -ForegroundColor White
            } else {
                Write-Host "   ❌ No input files found - this may be why output is empty" -ForegroundColor Red
            }
        }
        
        # Check process files too
        $processPath = Split-Path $FilePath
        $processFiles = Get-ChildItem $processPath -Filter "*.xlsx" -ErrorAction SilentlyContinue | 
            Where-Object { $_.Name -like "*Boeing*" -and $_.Name -notlike "*_202*" } | 
            Sort-Object LastWriteTime -Descending | Select-Object -First 2
        
        if ($processFiles) {
            Write-Host "`n📁 INTERMEDIATE PROCESS FILES:" -ForegroundColor Yellow
            foreach ($file in $processFiles) {
                $size = [math]::Round($file.Length / 1KB, 2)
                Write-Host "   • $($file.Name) (${size} KB, Modified: $($file.LastWriteTime))" -ForegroundColor White
            }
        }
    }
    
    if (-not $sheet1Found) {
        Write-Host "`n🚨 ACTION REQUIRED:" -ForegroundColor Red
        Write-Host "   The BOE PowerShell script needs to be updated to properly rename worksheets to 'Sheet1'" -ForegroundColor Yellow
        Write-Host "   Run the updated BOEReceivableProcessFiles.ps1 script to fix this issue" -ForegroundColor Yellow
    }

} catch {
    Write-Host "`n❌ Error analyzing Excel file: $_" -ForegroundColor Red
    
    # Try to clean up Excel if it's still running
    try {
        if ($Excel) {
            $Excel.Quit()
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null
        }
    } catch {
        # Ignore cleanup errors
    }
    
    # Kill any remaining Excel processes
    Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
}

Write-Host "`n=== VERIFICATION COMPLETE ===" -ForegroundColor Green