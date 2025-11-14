# BOE Input File Analyzer
# This script examines the input Excel files to see if they contain the expected "Boeing Invoice #" text

param(
    [Parameter(Mandatory=$false)]
    [string]$InputFilePath
)

Write-Host "=== BOE Input File Analysis Tool ===" -ForegroundColor Green
Write-Host "Date: $(Get-Date)" -ForegroundColor Green
Write-Host ""

# Check input directory if no specific file provided
if (-not $InputFilePath) {
    $inputPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Input"
    Write-Host "Checking BOE input directory: $inputPath" -ForegroundColor Yellow
    
    if (Test-Path $inputPath) {
        $inputFiles = Get-ChildItem $inputPath -Filter "*.xlsx" | Sort-Object LastWriteTime -Descending
        
        if ($inputFiles) {
            Write-Host "Found input files:" -ForegroundColor Green
            for ($i = 0; $i -lt [Math]::Min(5, $inputFiles.Count); $i++) {
                $file = $inputFiles[$i]
                $size = [math]::Round($file.Length / 1KB, 2)
                Write-Host "  [$($i+1)] $($file.Name) (${size} KB, Modified: $($file.LastWriteTime))" -ForegroundColor White
            }
            
            Write-Host "`nEnter the number to analyze that file, or press Enter to check the most recent:" -ForegroundColor Yellow
            $selection = Read-Host
            
            if ([string]::IsNullOrEmpty($selection)) {
                $InputFilePath = $inputFiles[0].FullName
                Write-Host "Analyzing most recent file: $($inputFiles[0].Name)" -ForegroundColor Green
            } elseif ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $inputFiles.Count) {
                $selectedFile = $inputFiles[[int]$selection - 1]
                $InputFilePath = $selectedFile.FullName
                Write-Host "Selected: $($selectedFile.Name)" -ForegroundColor Green
            } else {
                Write-Host "Invalid selection. Exiting..." -ForegroundColor Gray
                exit
            }
        } else {
            Write-Host "❌ No Excel files found in input directory" -ForegroundColor Red
            exit
        }
    } else {
        Write-Host "❌ Input directory not accessible: $inputPath" -ForegroundColor Red
        exit
    }
}

# Verify the input file exists
if (-not (Test-Path $InputFilePath)) {
    Write-Host "❌ Input file not found: $InputFilePath" -ForegroundColor Red
    exit
}

Write-Host "`n🔍 Analyzing input file: $(Split-Path $InputFilePath -Leaf)" -ForegroundColor Cyan

try {
    # Create Excel COM object
    $Excel = New-Object -ComObject Excel.Application
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    
    # Open the workbook
    Write-Host "Opening Excel file..." -ForegroundColor Gray
    $Workbook = $Excel.Workbooks.Open($InputFilePath)
    
    # Get file info
    $fileInfo = Get-Item $InputFilePath
    $fileSize = [math]::Round($fileInfo.Length / 1KB, 2)
    
    Write-Host "`n📊 INPUT FILE INFORMATION:" -ForegroundColor Yellow
    Write-Host "   File: $(Split-Path $InputFilePath -Leaf)" -ForegroundColor White
    Write-Host "   Size: $fileSize KB" -ForegroundColor White
    Write-Host "   Modified: $($fileInfo.LastWriteTime)" -ForegroundColor White
    Write-Host "   Total Worksheets: $($Workbook.Worksheets.Count)" -ForegroundColor White
    
    # Search for "Boeing Invoice #" across all worksheets
    Write-Host "`n🔍 SEARCHING FOR 'Boeing Invoice #' TEXT:" -ForegroundColor Yellow
    $foundBoeingInvoice = $false
    $searchResults = @()
    
    foreach ($sheet in $Workbook.Worksheets) {
        try {
            Write-Host "   Searching in worksheet: '$($sheet.Name)'" -ForegroundColor Gray
            
            # Search for "Boeing Invoice #" using Excel's Find method
            $usedRange = $sheet.UsedRange
            if ($usedRange) {
                $searchCell = $usedRange.Find("Boeing Invoice #")
                
                if ($searchCell) {
                    $foundBoeingInvoice = $true
                    $searchResults += [PSCustomObject]@{
                        Sheet = $sheet.Name
                        Address = $searchCell.Address
                        Row = $searchCell.Row
                        Column = $searchCell.Column
                        Value = $searchCell.Value2
                    }
                    Write-Host "      ✅ Found at: $($searchCell.Address) - Value: '$($searchCell.Value2)'" -ForegroundColor Green
                } else {
                    Write-Host "      ❌ Not found in this worksheet" -ForegroundColor Red
                }
                
                # Also search for variations
                $variations = @("Boeing Invoice", "Boeing", "Invoice #", "Invoice")
                foreach ($variation in $variations) {
                    $varCell = $usedRange.Find($variation)
                    if ($varCell) {
                        Write-Host "      📝 Found variation '$variation' at: $($varCell.Address) - Value: '$($varCell.Value2)'" -ForegroundColor Yellow
                    }
                }
            } else {
                Write-Host "      ⚠️ Worksheet has no used range (empty)" -ForegroundColor Yellow
            }
        }
        catch {
            Write-Host "      ❌ Error searching worksheet: $_" -ForegroundColor Red
        }
    }
    
    # Results summary
    Write-Host "`n📋 SEARCH RESULTS:" -ForegroundColor Yellow
    if ($foundBoeingInvoice) {
        Write-Host "   ✅ 'Boeing Invoice #' text found!" -ForegroundColor Green
        Write-Host "   ✅ BOE script should be able to process this file" -ForegroundColor Green
        
        foreach ($result in $searchResults) {
            Write-Host "      Sheet: $($result.Sheet), Location: $($result.Address)" -ForegroundColor White
        }
    } else {
        Write-Host "   ❌ 'Boeing Invoice #' text NOT found" -ForegroundColor Red
        Write-Host "   ❌ This explains why BOE output file is empty" -ForegroundColor Red
        Write-Host "`n💡 POSSIBLE SOLUTIONS:" -ForegroundColor Cyan
        Write-Host "   1. Check if the input file format has changed" -ForegroundColor White
        Write-Host "   2. Update BOE script to search for different text" -ForegroundColor White
        Write-Host "   3. Verify this is the correct input file for processing" -ForegroundColor White
    }
    
    # Show sample data from first worksheet
    if ($Workbook.Worksheets.Count -gt 0) {
        $firstSheet = $Workbook.Worksheets.Item(1)
        $usedRange = $firstSheet.UsedRange
        
        if ($usedRange -and $usedRange.Rows.Count -gt 0) {
            Write-Host "`n📋 SAMPLE DATA FROM FIRST WORKSHEET '$($firstSheet.Name)':" -ForegroundColor Yellow
            
            $maxCols = [Math]::Min(8, $usedRange.Columns.Count)
            $maxRows = [Math]::Min(10, $usedRange.Rows.Count)
            
            for ($row = 1; $row -le $maxRows; $row++) {
                $rowData = @()
                for ($col = 1; $col -le $maxCols; $col++) {
                    $cellValue = $firstSheet.Cells.Item($row, $col).Value2
                    $displayValue = if ($cellValue) { 
                        $cellValue.ToString().Substring(0, [Math]::Min(15, $cellValue.ToString().Length)) 
                    } else { 
                        "[empty]" 
                    }
                    $rowData += $displayValue
                }
                Write-Host "   Row $row`: $($rowData -join ' | ')" -ForegroundColor White
            }
            
            if ($usedRange.Rows.Count -gt 10) {
                Write-Host "   ... and $($usedRange.Rows.Count - 10) more rows" -ForegroundColor Gray
            }
            if ($usedRange.Columns.Count -gt 8) {
                Write-Host "   ... and $($usedRange.Columns.Count - 8) more columns" -ForegroundColor Gray
            }
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
    
    Write-Host "`n✅ Input file analysis complete!" -ForegroundColor Green

} catch {
    Write-Host "`n❌ Error analyzing input file: $_" -ForegroundColor Red
    
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

Write-Host "`n=== INPUT ANALYSIS COMPLETE ===" -ForegroundColor Green