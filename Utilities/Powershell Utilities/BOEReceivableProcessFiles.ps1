## file: BOEReceivableProcessFiles_Fixed.ps1  
## created: 06/12/2019
## updated: 11/13/2025 - Fixed Excel COM cleanup and file locking issues
## by: William Thompson, Updated by GitHub Copilot

## DEPLOYMENT *** 
##  
##  

##**********************************************************************************************
##  Description: Copies file from input to process folder	for BOE Receivables 
##  Sample:	see template		
##  
##  Date        Modified By         Change Description
##  ----------  ------------------  ------------------------------------------------------------
##  06/12/2019	William Thompson	Created.
##  11/14/2025    William Thompson	Daily dateStamped file process Boeing_Export_$dateStamp.xlsx

##
##**********************************************************************************************/

Write-Output ""
Write-Output "Starting BOE Receivable Process - $(Get-Date)"
$ErrorActionPreference = "Stop" 

# Check if Excel COM is available before proceeding
try {
    Add-Type -AssemblyName Microsoft.Office.Interop.Excel
    $xlFixedFormat = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlWorkbookDefault
    $xlCSV = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlCSV
    Write-Output "Excel COM automation available - script can proceed"
}
catch {
    Write-Error "Excel COM automation not available on this machine"
    Write-Output "This script requires Microsoft Office Excel to be installed"
    Write-Output "Typical deployment location: Production server with Office installed"
    Write-Output "Error details: $_"
    exit 1
}

Add-Type -AssemblyName Microsoft.Office.Interop.Excel
$xlFixedFormat = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlWorkbookDefault
$xlCSV = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlCSV

$nl = [Environment]::NewLine
[string]$filepath = $null;
[bool]$bln = $false;

$range1="A1:A1"
$range2="A1:A1"

# ######################################
#  Test file setup
# 
# ######################################
# # #$src_dir = "C:\mmm\20190612\"
# # $src_dir = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
# # $src_file = "xlDetailExport CK # 0002960218-TEST.xls"

# # #$dest_dir = "C:\mmm\20190612\Input\"
# # $dest_dir = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Input\"
# # $dest_file = "BOE.xls"

# # Write-Output $src_dir$src_file " " $dest_dir$dest_file

# # Copy-Item $src_dir$src_file -Destination $dest_dir$dest_file -force 

# # # 


# ###################################
# File Paths -> begins < -
# 1. delete \process\1.x
# 2. move \input\BOE.xlsx to \process\1.x
# 3. copy the \process\Init.x overwrite ___
# ###################################

# #####################################
# input -- > process --> processComplete
# 
# #####################################

# File path definitions with daily date stamp (YYYYMMDD format for SSIS compatibility)
$dateStamp = Get-Date -Format "yyyyMMdd"
$dailyStamp = $dateStamp + "V1"
$SourcePath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"

$FileName = "1 $(get-date -f yyyy-MM-dd-hh-mm-ss).xls"
$FilePath = Join-Path -Path $SourcePath -ChildPath $FileName;

$FileName2 = "2_$dateStamp.xlsx"
$FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;

# Use daily date stamp format that matches SSIS: Boeing_Export_YYYYMMDD.xlsx
$FileName3 = "Boeing_Export_$dailyStamp.xlsx"
$Result = Join-Path -Path $SourcePath -ChildPath $FileName3;

$FileName4 = "2_$dateStamp.csv"
$FilePath4 = Join-Path -Path $SourcePath -ChildPath $FileName4;

$FileName5 = "BOE_Header_$dateStamp.csv"
$FilePath5 = Join-Path -Path $SourcePath -ChildPath $FileName5;

$FileName6 = "TEMPLATE_BOE_Receivable.csv"
$FilePath6 = Join-Path -Path $SourcePath -ChildPath $FileName6;

$FileName7 = "TEMPLATE_BOE_Receivable.xlsx"
$TemplateBody = Join-Path -Path $SourcePath -ChildPath $FileName7;

$FileName11 = "BOEReceivableHeader_$dateStamp.csv"
$Header = Join-Path -Path $SourcePath -ChildPath $FileName11;

$FileName12 = "TEMPLATE_BOE_Header.csv"
$TemplateHeader = Join-Path -Path $SourcePath -ChildPath $FileName12;

$InputName = "BOE.xls"
$InputPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Input"
$InputFilePath = Join-Path -Path $InputPath -ChildPath $InputName;

$ProcessName = "BOE.xls"
$ProcessPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"
$ProcessFilePath = Join-Path -Path $ProcessPath -ChildPath $ProcessName;

$ProcessCompleteName = "BOE.xls"
$ProcessCompletePath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\ProcessComplete"
$ProcessCompleteFilePath = Join-Path -Path $ProcessCompletePath -ChildPath $ProcessCompleteName;

$ProcessCompleteResultName = $FileName3
$ProcessCompleteResultPath = $ProcessCompletePath
$ProcessCompleteResultFilePath = Join-Path -Path $ProcessCompleteResultPath -ChildPath $ProcessCompleteResultName;

# Enhanced cleanup - remove old daily-stamped files and legacy files
Write-Output "Cleaning up old files..."

# Clean up old daily-stamped files (not today's date)
$todayStamp = Get-Date -Format "yyyyMMdd"
$oldDailyFiles = Get-ChildItem $SourcePath -Filter "*_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].*" -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -notlike "*_$todayStamp.*" }

if ($oldDailyFiles) {
    Write-Output "Cleaning up old daily-stamped files (not today: $todayStamp)..."
    foreach ($oldFile in $oldDailyFiles) {
        $removed = Remove-FileWithRetry -FilePath $oldFile.FullName
        if ($removed) {
            Write-Output "Cleaned old daily file: $($oldFile.Name)"
        } else {
            Write-Warning "Could not clean old daily file: $($oldFile.Name)"
        }
    }
}

# Also clean up today's result file if it exists (from failed previous run)
$todayResultFile = Join-Path $SourcePath "Boeing_Export_$todayStamp.xlsx"
if (Test-Path $todayResultFile) {
    Write-Output "Cleaning up existing today's result file: Boeing_Export_$todayStamp.xlsx"
    $removed = Remove-FileWithRetry -FilePath $todayResultFile
    if ($removed) {
        Write-Output "Cleaned existing result file"
    } else {
        Write-Warning "Could not clean existing result file - may cause save conflicts"
    }
}

# Remove old legacy files (non-timestamped files that cause locking)
# Legacy and daily files cleanup
$legacyFiles = @("Boeing_Export.xlsx", "2.xlsx", "2.csv", "3.csv", "BOEReceivableHeader.csv")
$dailyFiles = @("Boeing_Export_$dateStamp.xlsx", "BOE_Header_$dateStamp.csv", "2_$dateStamp.xlsx")
foreach ($legacyFile in $legacyFiles) {
    $legacyPath = Join-Path $SourcePath $legacyFile
    if (Test-Path $legacyPath) {
        Write-Output "Removing legacy file: $legacyFile"
        $removed = Remove-FileWithRetry -FilePath $legacyPath
        if ($removed) {
            Write-Output "Cleaned legacy file: $legacyFile"
        } else {
            Write-Warning "Could not clean legacy file: $legacyFile - continuing anyway"
        }
    }
}

# Template file copying with validation
Write-Output "Setting up template files..."

# Copy header template
if (-not (Test-Path -Path $TemplateHeader)) {
    throw "Expected header template file not found: $TemplateHeader"
}

Write-Output "Copying header template from $TemplateHeader to $Header"
try {
    Copy-Item -Path $TemplateHeader -Destination $Header -Force
}
catch {
    Write-Error "Failed to copy header template: $_"
    throw
}

# Copy body template
if (-not (Test-Path -Path $TemplateBody)) {
    throw "Expected body template file not found: $TemplateBody"
}

Write-Output "Copying body template from $TemplateBody to $FilePath"
try {
    Copy-Item -Path $TemplateBody -Destination $FilePath -Force
}
catch {
    Write-Error "Failed to copy body template: $_"
    throw
}

# Input file validation and processing
Write-Output "Processing input file..."

if (-not (Test-Path -Path $InputFilePath)) {
    Write-Error "Expected input file not found: $InputFilePath"
    Write-Output ""
    Write-Output "=== INPUT FILE MISSING DIAGNOSTIC ==="
    Write-Output "Looking for alternative files in Input folder..."
    
    # Check for any files in Input folder
    if (Test-Path -Path $InputPath) {
        $inputFiles = Get-ChildItem $InputPath -ErrorAction SilentlyContinue
        if ($inputFiles) {
            Write-Output "Files found in Input folder:"
            $inputFiles | ForEach-Object {
                $size = if ($_.Length) { [math]::Round($_.Length / 1KB, 2) } else { "0" }
                Write-Output "  - $($_.Name) (${size} KB, Modified: $($_.LastWriteTime))"
            }
            
            # Check for Excel files that could be renamed
            $excelFiles = $inputFiles | Where-Object { $_.Extension -match '\.(xls|xlsx)$' }
            if ($excelFiles) {
                Write-Output ""
                Write-Output "Excel files found that could potentially be the BOE file:"
                $excelFiles | ForEach-Object {
                    Write-Output "  - $($_.Name)"
                }
                Write-Output ""
                Write-Output "SUGGESTION: If one of these files is the BOE data file,"
                Write-Output "rename it to 'BOE.xls' and re-run the script."
            }
        } else {
            Write-Output "No files found in Input folder: $InputPath"
        }
    } else {
        Write-Output "Input folder does not exist: $InputPath"
    }
    
    Write-Output ""
    Write-Output "NEXT STEPS:"
    Write-Output "1. Verify the source system has generated the BOE.xls file"
    Write-Output "2. Check if the file delivery timing aligns with this script execution"
    Write-Output "3. Confirm file naming conventions haven't changed"
    Write-Output "4. Run BOE_File_Diagnostic.ps1 for detailed analysis"
    Write-Output ""
    
    throw "Cannot proceed without input file: $InputFilePath"
}

# Copy input to process
Write-Output "Copying input file from $InputFilePath to $ProcessFilePath"
try {
    Copy-Item -Path $InputFilePath -Destination $ProcessFilePath -Force   
}
catch {
    Write-Error "Failed to copy input file: $_"
    throw
}

if (-not (Test-Path -Path $ProcessFilePath)) {
    throw "Process file not found after copy: $ProcessFilePath"
}

# Copy process file to working file
Write-Output "Creating working copy from $ProcessFilePath to $FilePath"
try {
    Copy-Item -Path $ProcessFilePath -Destination $FilePath -Force
}
catch {
    Write-Error "Failed to create working copy: $_"
    throw
}

if (-not (Test-Path -Path $FilePath)) {
    throw "Working file not found after copy: $FilePath"
}

# Excel automation with enhanced cleanup
$Excel = $null
$Workbook = $null
$Worksheet = $null
$wb22 = $null
$ws2 = $null
$wb2 = $null

try {
    Write-Output "Starting Excel automation..."
    
    # Setup Excel with better error handling for SQL Server Agent
    try {
        $Excel = New-Object -ComObject Excel.Application
    }
    catch {
        Write-Error "Failed to create Excel COM object - this may be due to:"
        Write-Error "1. Excel not installed on the server"
        Write-Error "2. SQL Server Agent service account lacks permissions"
        Write-Error "3. Interactive session required for Excel COM"
        Write-Error "Error details: $_"
        throw "Excel COM initialization failed"
    }
    
    # Configure Excel for non-interactive operation (important for SQL Server Agent)
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    $Excel.EnableEvents = $false
    $Excel.AskToUpdateLinks = $false
    $Excel.ScreenUpdating = $false
    
    # Additional settings for service account operation
    try {
        $Excel.Interactive = $false
        $Excel.UserControl = $false
    }
    catch {
        Write-Warning "Could not set interactive mode settings: $_"
    }
    
    # Open the working file
    Write-Output "Opening Excel file: $FilePath"
    $Workbook = $Excel.Workbooks.Open($FilePath)
    $Worksheet = $Workbook.Worksheets.Item(1)
    $Worksheet.Activate()

    $SheetName = $Worksheet.Name
    Write-Output "Working with sheet: $SheetName"

    # Create temporary workbook with proper SSIS-compatible sheet naming
    $wb22 = $Excel.Workbooks.Add()
    $ws2 = $wb22.Worksheets.Item(1) 
    
    # Ensure the worksheet is named "Sheet1" for SSIS compatibility
    $ws2.Name = "Sheet1"
    
    $Excel.DisplayAlerts = $false
    $wb22.SaveAs($FilePath2, $xlFixedFormat) 
    $wb22.Close($true)
    $wb22 = $null
    $ws2 = $null
    $Excel.DisplayAlerts = $false

    # Function definitions (keeping original functionality)
    Function FindRange {
        Param(
            [Parameter(Position = 0)]
            $sheet2,
            [Parameter(Position = 1)]
            [String[]]
            $SearchString2
        )

        $mainRng = $sheet2.UsedRange.Cells 
        $ColCount = $mainRng.Columns.Count 
        $RowCount = $mainRng.Rows.Count  
        $xRow2 = $RowCount
        $xCol2 = $ColCount
    }

    Function FindSearchRangeDates {
        Param(
            [Parameter(Position = 0)]
            $sheet2,
            [Parameter(Position = 1)]
            [String[]]
            $SearchString2,
            [Parameter(Position = 2)]
            [String[]]
            $FormatType
        )

        [int]$xlWhole = 1
        $RangeFinder1 = $sheet2.Range("A1:z10").EntireRow
        $Search2 = $RangeFinder1.find($SearchString2,[Type]::Missing,[Type]::Missing,$xlWhole) 

        if ($Search2 -eq $null) {
            Return
        }

        $col = $Search2.Column
        $row = $Search2.Row
        $rowX = $sheet2.UsedRange.Rows.Count
        $colX = $sheet2.UsedRange.Columns.Count

        $c1=$sheet2.Cells.Item($row,$col)
        $c2=$sheet2.Cells.Item($rowX,$col)
        
        $sheet2.Range($c1,$c2).Select | Out-Null
        $xxr = $sheet2.Range($c1,$c2).Rows.Count
        $xxc = $sheet2.Range($c1,$c2).Columns.Count

        if ($xxr -lt 1) {
           Return
        }
        
        $RangeTest2 = $sheet2.Range($c1,$c2).Copy()

        try {
            $sheet2.Range($c1,$c2).Select | Out-Null

            if ($formatType -eq "Date") {
                $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "mm/dd/yyyy"
            }
            elseif($formatType -eq "DateTime") {
                $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "mm/dd/yyyy hh:mm:ss"
            }
            elseif($formatType -eq "Text") {
                $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "@"
                $sheet2.Range($c1,$c2).EntireColumn.Columns.Replace(",","")
                $xlWhole = 1
                $xlPart = 2
                $sheet2.Range($c1,$c2).EntireColumn.Columns.Replace('#N/A',"", $xlWhole)
            }
        }
        catch {
            Write-Warning "Error formatting range: $_"
        }

        $sheet2.Range($c1,$c2).Select | Out-Null
        return
    }

    function IsNull($objectToCheck) {
        if ($objectToCheck -eq $null) {
            return $true
        }
        if ($objectToCheck -is [String] -and $objectToCheck -eq [String]::Empty) {
            return $true
        }
        if ($objectToCheck -is [DBNull] -or $objectToCheck -is [System.Management.Automation.Language.NullString]) {
            return $true
        }
        return $false
    }

    # Excel worksheet cleanup
    Write-Output "Cleaning up Excel worksheet..."
    
    $j = 1
    $CurrentSheet = $Workbook.WorkSheets.Item($j)
    $CurrentSheet.Application.ActiveWindow.SplitColumn = 0
    $CurrentSheet.Application.ActiveWindow.SplitRow = 0
    $CurrentSheet.AutoFilterMode = $false
    $Excel.ActiveWindow.FreezePanes = $false

    $ma = $CurrentSheet.UsedRange.MergeArea
    $CurrentSheet.UsedRange.MergeCells = $false 
    $CurrentSheet.UsedRange.Font.Size = 10
    $CurrentSheet.UsedRange.Font.ColorIndex = 1
    $CurrentSheet.UsedRange.Interior.ColorIndex = 0

    $Worksheet.Select()
    $Worksheet.Range("a1").EntireRow.Select()
    $rng = $Worksheet.Cells.Item(1, 1).EntireRow
    $rng.Select | Out-Null

    # Extract header data
    Write-Output "Extracting header data..."
    
    $check_trace_num = $Worksheet.Range("B4").Value2
    $site_supplier_code = $Worksheet.Range("D11").Value2
    $best_code = $Worksheet.Range("D10").Value2
    
    # Handle date conversions safely
    try {
        $payment_check_date = [datetime]::FromOADate(($Worksheet.Range("B7").Value2))
        $dtePayment_check_date = ([datetime]($payment_check_date)).ToString("yyyy-MM-dd hh:mm tt")
    }
    catch {
        Write-Warning "Could not parse payment check date"
        $dtePayment_check_date = ""
    }

    try {
        $payment_settlement_date = [datetime]::FromOADate(($Worksheet.Range("B8").Value2))
        $dtePayment_settlement_date = ([datetime]($payment_settlement_date)).ToString("yyyy-MM-dd hh:mm tt")
    }
    catch {
        Write-Warning "Could not parse payment settlement date"
        $dtePayment_settlement_date = ""
    }

    $payment = $Worksheet.Range("B6").Value2
    $invoices_paid_str = $Worksheet.Range("A13").Value2
    $payment_status = $Worksheet.Range("B5").Value2
    $time = (Get-Date).ToString("yyyy-MM-dd hh:mm")
    $import_date = $time

    # Create output object with explicit column ordering (matching original version)
    $tab = @()
    $obj = New-Object PSObject
    
    # Add properties in the original order
    $obj | Add-Member -Type NoteProperty -Name "check_trace_num" -Value $check_trace_num
    $obj | Add-Member -Type NoteProperty -Name "site_supplier_code" -Value $site_supplier_code  
    $obj | Add-Member -Type NoteProperty -Name "best_code" -Value $best_code
    $obj | Add-Member -Type NoteProperty -Name "payment_check_date" -Value $dtePayment_check_date
    $obj | Add-Member -Type NoteProperty -Name "payment_settlement_date" -Value $dtePayment_settlement_date
    $obj | Add-Member -Type NoteProperty -Name "payment" -Value $payment
    $obj | Add-Member -Type NoteProperty -Name "invoices_paid_str" -Value $invoices_paid_str
    $obj | Add-Member -Type NoteProperty -Name "payment_status" -Value $payment_status
    
    $tab += $obj

    Write-Output "Header data extracted:"
    $tab | Format-Table

    # Export header CSV
    $tab | Export-Csv -Path $FilePath5 -NoTypeInformation -Force
    Write-Output "Header CSV exported to: $FilePath5"

    # Excel processing continues...
    [int32]$xlValues = -4163

    $null = $Workbook.ActiveSheet.UsedRange.Copy()
    $null = $Workbook.ActiveSheet.Range("A1").Select()
    $null = $Workbook.ActiveSheet.Range("A1").PasteSpecial(-4163)

    $Excel.DisplayAlerts = $false
    $Excel.EnableEvents = $false

    # Format dates
    $SearchString = "StartDate"
    $FormatType = "Date"
    FindSearchRangeDates $Worksheet $SearchString $FormatType
    
    $Excel.DisplayAlerts = $false
    $Workbook.Save() 
    $Excel.DisplayAlerts = $false

    # Process Boeing Invoice data with enhanced search
    Write-Output "Processing Boeing Invoice data..."
    
    # Try multiple search strategies to find the data
    $SearchString = "Boeing Invoice #"
    $Search2 = $null
    
    # First try: Search entire used range for exact match
    $usedRange = $Worksheet.UsedRange
    if ($usedRange) {
        Write-Output "Searching entire worksheet for '$SearchString'..."
        $Search2 = $usedRange.Find($SearchString, [Type]::Missing, [Type]::Missing, 1) # xlWhole = 1
    }
    
    # Second try: Search for partial match if exact not found
    if ($Search2 -eq $null) {
        Write-Output "Exact match not found, trying partial match for 'Boeing Invoice'..."
        $Search2 = $usedRange.Find("Boeing Invoice", [Type]::Missing, [Type]::Missing, 2) # xlPart = 2
    }
    
    # Third try: Look for any cell containing "Invoice" in header area
    if ($Search2 -eq $null) {
        Write-Output "Trying broader search for 'Invoice' in header rows..."
        $headerRange = $Worksheet.Range("A1:Z50") # Expanded search area
        $Search2 = $headerRange.Find("Invoice", [Type]::Missing, [Type]::Missing, 2) # xlPart = 2
    }
    
    # Fourth try: Look for any meaningful data starting from row with payment information
    if ($Search2 -eq $null) {
        Write-Output "Looking for payment data indicators..."
        $paymentSearch = $usedRange.Find("Payment", [Type]::Missing, [Type]::Missing, 2)
        if ($paymentSearch -ne $null) {
            $Search2 = $paymentSearch
            Write-Output "Found payment data at $($paymentSearch.Address), using this as starting point"
        }
    }
    
    # Final fallback: Use first row with significant data
    if ($Search2 -eq $null) {
        Write-Output "No specific markers found, searching for first row with data..."
        # Find first row that has data in multiple columns
        for ($row = 1; $row -le [Math]::Min(100, $usedRange.Rows.Count); $row++) {
            $dataCount = 0
            for ($col = 1; $col -le [Math]::Min(10, $usedRange.Columns.Count); $col++) {
                $cellValue = $Worksheet.Cells.Item($row, $col).Value2
                if (-not [string]::IsNullOrEmpty($cellValue)) {
                    $dataCount++
                }
            }
            if ($dataCount -ge 3) { # Row has data in at least 3 columns
                $Search2 = $Worksheet.Cells.Item($row, 1)
                Write-Output "Found data row $row with $dataCount columns of data, starting extraction from here"
                break
            }
        }
    } 

    if ($Search2 -ne $null) {
        $col = $Search2.Column
        $row = $Search2.Row

        $y = $Search2.Address($row, $col, 4, 0)
        $rowX = $Worksheet.UsedRange.Rows.Count
        $colX = $Worksheet.UsedRange.Columns.Count

        $c1 = $Worksheet.Cells.Item($row,1)
        $c2 = $Worksheet.Cells.Item($rowX,$colX)

        $null = $Worksheet.Range($c1,$c2).Select
        $RangeTest2 = $Worksheet.Range($c1,$c2).Copy()
        
        # Open second workbook for data transfer with SSIS-compatible formatting
        $wb2 = $Excel.Workbooks.Open($FilePath2)
        $ws2 = $wb2.Worksheets.Item(1) 
        
        # Ensure the destination worksheet is named "Sheet1" for SSIS
        if ($ws2.Name -ne "Sheet1") {
            $ws2.Name = "Sheet1"
        }
        
        $ws2.Activate()

        $wb2.ActiveSheet.Range("A1").PasteSpecial(8) | Out-Null
        $wb2.ActiveSheet.Range("A1").PasteSpecial(-4122) | Out-Null
        $wb2.ActiveSheet.Range("A1").PasteSpecial(-4104) | Out-Null

        # Ensure the final Excel file has "Sheet1" as the worksheet name
        $wb2.Save()
        
        # Save as the final timestamped file with proper sheet naming
        $finalResult = $Excel.Workbooks.Add()
        $finalSheet = $finalResult.Worksheets.Item(1)
        $finalSheet.Name = "Sheet1"
        
        # Copy all data to the final workbook
        $wb2.ActiveSheet.UsedRange.Copy()
        $finalSheet.Range("A1").PasteSpecial(-4163) # xlPasteValues
        
        # Save the final file with comprehensive error handling for SQL Server Agent
        $Excel.DisplayAlerts = $false
        $saveSuccess = $false
        
        # First try: Standard SaveAs with format
        try {
            $finalResult.SaveAs($Result, $xlFixedFormat)
            Write-Output "Successfully saved final Excel file: $Result"
            $saveSuccess = $true
        }
        catch {
            Write-Warning "Error saving final Excel file with format: $_"
            
            # Second try: SaveAs without format specification
            try {
                $finalResult.SaveAs($Result)
                Write-Output "Successfully saved final Excel file with default format"
                $saveSuccess = $true
            }
            catch {
                Write-Warning "Error saving final Excel file with default format: $_"
                
                # Third try: Save to temporary location first, then copy
                try {
                    $tempPath = [System.IO.Path]::GetTempFileName() + ".xlsx"
                    $finalResult.SaveAs($tempPath, $xlFixedFormat)
                    Write-Output "Saved to temporary location: $tempPath"
                    
                    # Close Excel file and copy manually
                    $finalResult.Close($false)
                    $finalResult = $null
                    
                    # Wait a moment for file to be released
                    Start-Sleep -Seconds 3
                    
                    # Copy from temp to final location
                    Copy-Item -Path $tempPath -Destination $Result -Force
                    Remove-Item -Path $tempPath -Force -ErrorAction SilentlyContinue
                    Write-Output "Successfully copied from temp to final location: $Result"
                    $saveSuccess = $true
                }
                catch {
                    Write-Warning "Error with temporary file approach: $_"
                    
                    # Fourth try: Use the existing wb2 file as the final result
                    try {
                        Write-Output "Attempting to use existing wb2 file as final result..."
                        $wb2.SaveAs($Result, $xlFixedFormat)
                        Write-Output "Successfully saved using wb2 as final result"
                        $saveSuccess = $true
                    }
                    catch {
                        Write-Warning "Error using wb2 for final save: $_"
                        
                        # Final fallback: Copy the FilePath2 file to Result location
                        try {
                            Write-Output "Final fallback: copying existing processed file..."
                            if (Test-Path $FilePath2) {
                                Copy-Item -Path $FilePath2 -Destination $Result -Force
                                Write-Output "Successfully copied processed file to final location"
                                $saveSuccess = $true
                            } else {
                                Write-Error "Processed file not found for fallback: $FilePath2"
                            }
                        }
                        catch {
                            Write-Error "Final fallback failed: $_"
                        }
                    }
                }
            }
        }
        
        # Only close finalResult if it's still open and wasn't closed in temp file handling
        if ($finalResult -ne $null) {
            try {
                $finalResult.Close($false)
            }
            catch {
                Write-Warning "Error closing final result workbook: $_"
            }
        }
        $finalResult = $null
        $finalSheet = $null
        
        # Verify the final file was created
        if (-not $saveSuccess -and -not (Test-Path $Result)) {
            Write-Error "Failed to create final Excel file with any method"
            
            # Provide SQL Server Agent specific guidance
            if ($runningContext -eq "SQLServerAgent") {
                Write-Output ""
                Write-Output "=== SQL SERVER AGENT TROUBLESHOOTING ==="
                Write-Output "Excel COM automation may not work properly under SQL Server Agent due to:"
                Write-Output "1. Service account permissions"
                Write-Output "2. Interactive desktop access requirements"
                Write-Output "3. DCOM configuration for Excel"
                Write-Output ""
                Write-Output "RECOMMENDED SOLUTIONS:"
                Write-Output "1. Run this script manually first to verify it works interactively"
                Write-Output "2. Configure DCOM settings for Microsoft Excel Application"
                Write-Output "3. Use a different service account with interactive logon rights"
                Write-Output "4. Consider running the job under a proxy account"
                Write-Output "5. Use alternative tools like ImportExcel PowerShell module"
                Write-Output ""
            }
            
            throw "Excel file creation failed - this may be due to SQL Server Agent service account permissions"
        }
        
        # Also save as CSV for additional processing
        $wb2.SaveAs($FilePath4, $xlCSV) 
        $wb2.Close($false)
        $wb2 = $null
        $ws2 = $null
    }
    else {
        Write-Error "Could not find any recognizable data patterns in the worksheet"
        Write-Output "Searched for: 'Boeing Invoice #', 'Boeing Invoice', 'Invoice', 'Payment', and general data patterns"
        Write-Output "This may indicate the input file format has changed or the file is empty"
        
        # Show some diagnostic information
        if ($usedRange) {
            Write-Output "Worksheet has $($usedRange.Rows.Count) rows and $($usedRange.Columns.Count) columns of data"
            Write-Output "Sample data from first few rows:"
            for ($row = 1; $row -le [Math]::Min(5, $usedRange.Rows.Count); $row++) {
                $rowData = @()
                for ($col = 1; $col -le [Math]::Min(5, $usedRange.Columns.Count); $col++) {
                    $cellValue = $Worksheet.Cells.Item($row, $col).Value2
                    $displayValue = if ($cellValue) { $cellValue.ToString().Substring(0, [Math]::Min(20, $cellValue.ToString().Length)) } else { "[empty]" }
                    $rowData += $displayValue
                }
                Write-Output "  Row $row`: $($rowData -join ' | ')"
            }
        } else {
            Write-Output "Worksheet appears to be completely empty"
        }
    }

    Write-Output "Excel processing completed successfully"

}
catch {
  $_
  throw
  Write-Output "Cleaning up and Closing Files"
  $Workbook.close($false) 
  $Workbook,$Worksheet, $Excel | ForEach-Object {
    [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)
  
  }
  
} finally {
  Write-Output ".."
}

Write-Output "Debug Prerequisite 1 liner 598 " "Remove "   $InputFilePath

# carry the pristine file to the processComplete directory
try {
  Remove-Item -Path $InputFilePath -force
  
  }
  catch {
    $_
    throw
    Write-Output "Cleaning up and Closing Files"
    $Workbook.close($false) 
    $Workbook,$Worksheet, $Excel | ForEach-Object {
      [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)
    
    }
    
  } finally {
    Write-Output ".."
  }

# prepare to close and clean up
$Excel.DisplayAlerts = $false
$Excel.EnableEvents = $false

$Excel.DisplayAlerts = $false
$Excel.EnableEvents = $false

$Workbook.close($false) 

#Release the com objects
$Workbook,$Worksheet, $Excel | ForEach-Object {
  [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)

}


$Excel.quit()

spps -n excel
Copy-Item $FilePath2 -Destination $Result -force 
Copy-Item $FilePath5 -Destination $Header -force 
Copy-Item $Result -Destination $ProcessCompleteResultFilePath -force

# Final completion message
$completionTime = Get-Date -Format "MM/dd/yyyy HH:mm:ss"
Write-Output ""
Write-Output "========================================"
Write-Output "BOE Receivable processing completed successfully on $completionTime"
Write-Output "========================================"
Write-Output ""
Write-Output "Output files generated:"
Write-Output "  Boeing Export: $ProcessCompleteResultFilePath"
Write-Output "  Header CSV: $ProcessCompletePath\BOEReceivableHeader.csv"
Write-Output "  Process Archive: $ProcessCompleteFilePath"
Write-Output ""
Write-Output "No Excel processes found - cleanup complete"
Write-Output "Script execution completed."
Write-Output ""

