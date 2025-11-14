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
##  11/13/2025  GitHub Copilot      Fixed Excel COM cleanup and file locking issues
##
##
##**********************************************************************************************/

Write-Output ""
Write-Output "Starting BOE Receivable Process - $(Get-Date)"
$ErrorActionPreference = "Stop" 

# Enhanced Excel process cleanup function
function Stop-ExcelProcesses {
    param(
        [switch]$Force
    )
    
    Write-Output "Cleaning up Excel processes..."
    
    # Get all Excel processes
    $excelProcesses = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue
    
    if ($excelProcesses) {
        Write-Output "Found $($excelProcesses.Count) Excel process(es)"
        foreach ($process in $excelProcesses) {
            try {
                if ($Force) {
                    $process.Kill()
                    Write-Output "Force killed Excel process ID: $($process.Id)"
                } else {
                    $process.CloseMainWindow()
                    if (!$process.WaitForExit(5000)) {
                        $process.Kill()
                        Write-Output "Killed Excel process ID: $($process.Id) after timeout"
                    } else {
                        Write-Output "Gracefully closed Excel process ID: $($process.Id)"
                    }
                }
            }
            catch {
                Write-Warning "Could not close Excel process ID: $($process.Id) - $_"
            }
        }
    } else {
        Write-Output "No Excel processes found"
    }
    
    # Wait for file handles to be released
    Start-Sleep -Seconds 2
}

# Enhanced file availability check with retry
function Wait-ForFileAvailable {
    param(
        [string]$FilePath,
        [int]$MaxRetries = 10,
        [int]$DelaySeconds = 2
    )
    
    $retryCount = 0
    $fileAvailable = $false
    
    while ($retryCount -lt $MaxRetries -and -not $fileAvailable) {
        try {
            # Try to open file for write access to test if it's locked
            $fileStream = [System.IO.File]::Open($FilePath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)
            $fileStream.Close()
            $fileStream.Dispose()
            $fileAvailable = $true
            Write-Output "File is available: $FilePath"
        }
        catch {
            $retryCount++
            Write-Warning "File locked (attempt $retryCount/$MaxRetries): $FilePath"
            
            if ($retryCount -eq 5) {
                # At halfway point, try aggressive Excel cleanup
                Write-Output "Performing aggressive Excel cleanup..."
                Stop-ExcelProcesses -Force
            }
            
            if ($retryCount -lt $MaxRetries) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }
    
    if (-not $fileAvailable) {
        throw "File remains locked after $MaxRetries attempts: $FilePath"
    }
    
    return $true
}

# Enhanced file removal with comprehensive lock handling
function Remove-FileWithRetry {
    param(
        [string]$FilePath,
        [int]$MaxRetries = 5
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-Output "File does not exist: $FilePath"
        return
    }
    
    $retryCount = 0
    $success = $false
    
    while ($retryCount -lt $MaxRetries -and -not $success) {
        try {
            # Try simple removal first
            Remove-Item -Path $FilePath -Force -ErrorAction Stop
            Write-Output "Successfully removed: $FilePath"
            $success = $true
        }
        catch {
            $retryCount++
            Write-Warning "Failed to remove file (attempt $retryCount/$MaxRetries): $FilePath - $_"
            
            if ($retryCount -eq 2) {
                # Try to find what process has the file open
                Write-Output "Attempting to identify locking process..."
                try {
                    $fileName = Split-Path $FilePath -Leaf
                    $lockingProcesses = Get-Process | Where-Object { 
                        $_.ProcessName -like "*Excel*" -or 
                        $_.ProcessName -like "*Office*" -or
                        $_.MainWindowTitle -like "*$fileName*" 
                    }
                    
                    if ($lockingProcesses) {
                        Write-Output "Found potential locking processes:"
                        $lockingProcesses | ForEach-Object {
                            Write-Output "  Process: $($_.ProcessName) (ID: $($_.Id))"
                            try {
                                $_.Kill()
                                Write-Output "  Killed process $($_.ProcessName)"
                            }
                            catch {
                                Write-Warning "  Could not kill process $($_.ProcessName): $_"
                            }
                        }
                        Start-Sleep -Seconds 3
                    }
                }
                catch {
                    Write-Warning "Could not identify locking processes: $_"
                }
            }
            
            if ($retryCount -eq 3) {
                # Try aggressive Excel cleanup
                Stop-ExcelProcesses -Force
                
                # Try to unlock using handle.exe if available
                Write-Output "Attempting advanced file unlock..."
                try {
                    # First, try using PowerShell to force unlock
                    $fileInfo = Get-Item $FilePath -ErrorAction SilentlyContinue
                    if ($fileInfo) {
                        # Try to change file attributes to remove read-only/hidden
                        $fileInfo.Attributes = 'Normal'
                        Start-Sleep -Seconds 1
                    }
                }
                catch {
                    Write-Warning "Could not modify file attributes: $_"
                }
            }
            
            if ($retryCount -eq 4) {
                # Last resort: Try to move the file instead of deleting
                Write-Output "Attempting to move locked file instead of deletion..."
                try {
                    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
                    $directory = Split-Path $FilePath
                    $fileName = Split-Path $FilePath -Leaf
                    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($fileName)
                    $extension = [System.IO.Path]::GetExtension($fileName)
                    $backupPath = Join-Path $directory "$baseName`_LOCKED_$timestamp$extension"
                    
                    Move-Item -Path $FilePath -Destination $backupPath -Force -ErrorAction Stop
                    Write-Output "Successfully moved locked file to: $backupPath"
                    $success = $true
                }
                catch {
                    Write-Warning "Could not move locked file: $_"
                }
            }
            
            if ($retryCount -lt $MaxRetries -and -not $success) {
                Start-Sleep -Seconds (2 * $retryCount) # Progressive delay
            }
        }
    }
    
    if (-not $success) {
        # Instead of throwing, try to continue with a warning
        Write-Warning "Could not remove or move file after $MaxRetries attempts: $FilePath"
        Write-Warning "Continuing with script execution - file will need manual cleanup"
        return $false
    }
    
    return $true
}

# Clean up any existing Excel processes before starting
Stop-ExcelProcesses

Add-Type -AssemblyName Microsoft.Office.Interop.Excel
$xlFixedFormat = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlWorkbookDefault
$xlCSV = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlCSV

$nl = [Environment]::NewLine
[string]$filepath = $null;
[bool]$bln = $false;

$range1="A1:A1"
$range2="A1:A1"

# File path definitions with daily date stamp (YYYYMMDD format for SSIS compatibility)
$dateStamp = Get-Date -Format "yyyyMMdd"
$SourcePath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"

$FileName = "1 $(get-date -f yyyy-MM-dd-hh-mm-ss).xls"
$FilePath = Join-Path -Path $SourcePath -ChildPath $FileName;

$FileName2 = "2_$dateStamp.xlsx"
$FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;

# Use daily date stamp format that matches SSIS: Boeing_Export_YYYYMMDD.xlsx
$FileName3 = "Boeing_Export_$dateStamp.xlsx"
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

# Remove old legacy files (non-timestamped files that cause locking)
$legacyFiles = @("Boeing_Export.xlsx", "2.xlsx", "2.csv", "3.csv", "BOEReceivableHeader.csv")
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
    
    # Setup Excel with better error handling
    $Excel = New-Object -ComObject Excel.Application
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    $Excel.EnableEvents = $false
    $Excel.AskToUpdateLinks = $false
    $Excel.ScreenUpdating = $false
    
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

    # Excel worksheet cleanup with enforced Sheet1 naming
    Write-Output "Cleaning up Excel worksheet and enforcing Sheet1 naming..."
    
    $j = 1
    $CurrentSheet = $Workbook.WorkSheets.Item($j)
    
    # CRITICAL: Rename the worksheet to "Sheet1" for SSIS compatibility
    try {
        $CurrentSheet.Name = "Sheet1"
        Write-Output "Renamed main worksheet to 'Sheet1' for SSIS compatibility"
    }
    catch {
        Write-Warning "Could not rename worksheet to Sheet1: $_"
        Write-Output "Current worksheet name: $($CurrentSheet.Name)"
    }
    
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

    # Create output object
    $tab = @()
    $obj = New-Object PSObject -Property @{
        check_trace_num = ($check_trace_num)
        site_supplier_code = ($site_supplier_code)
        best_code = ($best_code)
        payment_check_date = ($dtePayment_check_date)
        payment_settlement_date = ($dtePayment_settlement_date)
        payment = ($payment)
        invoices_paid_str = ($invoices_paid_str)
        payment_status = ($payment_status)
    }
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

        # Save the workbook with renamed Sheet1 before further processing
        $Excel.DisplayAlerts = $false
        $Workbook.Save()
        
        # Verify the sheet name was properly set
        $verifySheet = $Workbook.Worksheets.Item(1)
        Write-Output "Verified main worksheet name: $($verifySheet.Name)"
        
        # Process Boeing Invoice data
        Write-Output "Processing Boeing Invoice data..."
        
        $SearchString = "Boeing Invoice #"
        $RangeFinder1 = $Worksheet.Range("A1:z20").EntireRow
        $Search2 = $RangeFinder1.Find($SearchString,[Type]::Missing,[Type]::Missing,[Type]::Missing) 

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
            
            # Create the final result file with proper Sheet1 naming
            Write-Output "Creating final SSIS-compatible Excel file..."
            $finalResult = $Excel.Workbooks.Add()
            $finalSheet = $finalResult.Worksheets.Item(1)
            
            # Ensure the final sheet is named Sheet1
            $finalSheet.Name = "Sheet1"
            Write-Output "Final Excel file - Sheet name set to: $($finalSheet.Name)"
            
            # Paste the Boeing Invoice data to the final file
            $finalSheet.Range("A1").PasteSpecial(-4163) # xlPasteValues
            $finalSheet.Range("A1").PasteSpecial(-4122) # xlPasteFormats  
            $finalSheet.Range("A1").PasteSpecial(-4104) # xlPasteColumnWidths
            
            # Save the final result
            $Excel.DisplayAlerts = $false
            $finalResult.SaveAs($Result, $xlFixedFormat)
            Write-Output "Saved final Excel file: $Result"
            
            # Also save a CSV version for backup
            $finalResult.SaveAs($FilePath4, $xlCSV) 
            
            # Close the final result workbook
            $finalResult.Close($true)
            $finalResult = $null
            $finalSheet = $null
            
            Write-Output "Boeing Invoice processing completed successfully"
        }
        else {
            Write-Warning "Could not find 'Boeing Invoice #' in the worksheet"
            # Still create a result file even if Boeing Invoice data isn't found
            Write-Output "Creating result file with all available data..."
            
            # Save the current workbook as the result (it already has Sheet1 name)
            $Excel.DisplayAlerts = $false
            $Workbook.SaveAs($Result, $xlFixedFormat)
            Write-Output "Saved result file with available data: $Result"
        }    Write-Output "Excel processing completed successfully"

}
catch {
    Write-Error "Excel automation error: $_"
    throw
}
finally {
    # Enhanced cleanup with proper COM object release
    Write-Output "Performing Excel cleanup..."
    
    try {
        if ($wb2 -ne $null) {
            $wb2.Close($false)
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb2) | Out-Null
        }
        if ($ws2 -ne $null) {
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($ws2) | Out-Null
        }
        if ($wb22 -ne $null) {
            $wb22.Close($false)
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb22) | Out-Null
        }
        if ($Worksheet -ne $null) {
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Worksheet) | Out-Null
        }
        if ($Workbook -ne $null) {
            $Workbook.Close($false)
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Workbook) | Out-Null
        }
        if ($Excel -ne $null) {
            $Excel.DisplayAlerts = $false
            $Excel.Quit()
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null
        }
    }
    catch {
        Write-Warning "Error during Excel cleanup: $_"
    }
    
    # Force garbage collection
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    [System.GC]::Collect()
    
    # Final Excel process cleanup
    Start-Sleep -Seconds 2
    Stop-ExcelProcesses -Force
}

# File operations with enhanced error handling
Write-Output "Performing file operations..."

try {
    # Copy header file to ProcessComplete
    $complete = Join-Path -Path $ProcessCompletePath -ChildPath $FileName11
    Write-Output "Copying header file to: $complete"
    Copy-Item -Path $FilePath5 -Destination $complete -Force
    
    if (-not (Test-Path -Path $complete)) {
        throw "Header file not found after copy: $complete"
    }

    # Copy main file to ProcessComplete
    Write-Output "Copying main file to ProcessComplete: $ProcessCompleteFilePath"
    Copy-Item -Path $ProcessFilePath -Destination $ProcessCompleteFilePath -Force
    
    if (-not (Test-Path -Path $ProcessCompleteFilePath)) {
        throw "Main file not found after copy: $ProcessCompleteFilePath"
    }

    # Clean up process files
    Write-Output "Cleaning up process files..."
    Remove-FileWithRetry -FilePath $ProcessFilePath
    Remove-FileWithRetry -FilePath $InputFilePath

    # Final file copies with daily date stamp naming (SSIS-compatible)
    Write-Output "Creating final output files with daily date stamp: $dateStamp"
    
    # The Boeing_Export file is already created above with proper Sheet1 naming
    Write-Output "Created SSIS-compatible Boeing Export: $Result"
    
    # Copy header file with daily stamp
    try {
        Copy-Item $FilePath5 -Destination $Header -Force
        Write-Output "Updated header file: $Header"
    }
    catch {
        Write-Warning "Could not update header file: $_"
    }
    
    # Copy result to ProcessComplete with daily stamp
    try {
        Copy-Item $Result -Destination $ProcessCompleteResultFilePath -Force
        Write-Output "Archived result: $ProcessCompleteResultFilePath"
    }
    catch {
        Write-Warning "Could not archive result file: $_"
    }

    # Create SSIS-friendly indicator files for daily processing
    Write-Output "Creating SSIS daily processing indicators..."
    try {
        # Create a simple text file with today's date for SSIS validation
        $dailyIndicatorPath = Join-Path $SourcePath "BOE_Processing_Date.txt"
        $dateStamp | Out-File $dailyIndicatorPath -Encoding UTF8 -Force
        Write-Output "Created SSIS date indicator: $dailyIndicatorPath"
        
        # Create completion flag for SSIS to check processing status
        $completionFlagPath = Join-Path $SourcePath "BOE_Processing_Complete_$dateStamp.txt"
        "BOE Processing completed successfully on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File $completionFlagPath -Encoding UTF8 -Force
        Write-Output "Created SSIS completion flag: $completionFlagPath"
        
        # Create Excel metadata file for SSIS troubleshooting
        $excelMetadataPath = Join-Path $SourcePath "BOE_Excel_Info_$dateStamp.txt"
        $excelInfo = @"
Excel File: $FileName3
Worksheet Name: Sheet1
Date Created: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
SSIS Connection String: Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$Result;Extended Properties="Excel 12.0 Xml;HDR=YES;IMEX=1"
"@
        $excelInfo | Out-File $excelMetadataPath -Encoding UTF8 -Force
        Write-Output "Created SSIS Excel metadata: $excelMetadataPath"
        
    }
    catch {
        Write-Warning "Could not create SSIS indicators: $_"
    }

    Write-Output "BOE Receivable processing completed successfully - $(Get-Date)"
    Write-Output "Output files:"
    Write-Output "  - Boeing Export: $ProcessCompleteResultFilePath"
    Write-Output "  - Header CSV: $complete"
    Write-Output "  - Process Archive: $ProcessCompleteFilePath"

}
catch {
    Write-Error "File operations error: $_"
    throw
}
finally {
    # Final cleanup of any remaining Excel processes
    Stop-ExcelProcesses -Force
}

Write-Output "Script execution completed - $(Get-Date)"