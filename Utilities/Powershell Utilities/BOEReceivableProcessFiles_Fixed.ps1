## file: BOEReceivableProcessFiles_Fixed.ps1  
## created: 06/12/2019
## updated: 11/13/2025 - Fixed Excel COM cleanup and file locking issues
## by: William Thompson, Updated by GitHub Copilot
## C:\development\CB 12 Powershell\Powershell\Excel\BOEReceivableProcessFiles.ps1
## \\sql-bi-1\Operations\BOEReceivables\BOEReceivableProcessFiles.ps1
## DEPLOYMENT *** 
##  
##  
## C:\development\CB 12 Powershell\Powershell\Excel\BOEReceivableProcessFiles.ps1
## \\sql-bi-1\Operations\BOEReceivables\BOEReceivableProcessFiles.ps1

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

# Enhanced file removal with lock handling
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
            Wait-ForFileAvailable -FilePath $FilePath -MaxRetries 3 -DelaySeconds 1
            Remove-Item -Path $FilePath -Force -ErrorAction Stop
            Write-Output "Successfully removed: $FilePath"
            $success = $true
        }
        catch {
            $retryCount++
            Write-Warning "Failed to remove file (attempt $retryCount/$MaxRetries): $FilePath - $_"
            
            if ($retryCount -eq 3) {
                # Try Excel cleanup before final attempts
                Stop-ExcelProcesses -Force
            }
            
            if ($retryCount -lt $MaxRetries) {
                Start-Sleep -Seconds 2
            }
        }
    }
    
    if (-not $success) {
        throw "Could not remove file after $MaxRetries attempts: $FilePath"
    }
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

# File path definitions
$SourcePath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"

$FileName = "1 $(get-date -f yyyy-MM-dd-hh-mm-ss).xls"
$FilePath = Join-Path -Path $SourcePath -ChildPath $FileName;

$FileName2 = "2.xlsx"
$FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;

$FileName3 = "Boeing_Export.xlsx"
$Result = Join-Path -Path $SourcePath -ChildPath $FileName3;

$FileName4 = "2.csv"
$FilePath4 = Join-Path -Path $SourcePath -ChildPath $FileName4;

$FileName5 = "3.csv"
$FilePath5 = Join-Path -Path $SourcePath -ChildPath $FileName5;

$FileName6 = "TEMPLATE_BOE_Receivable.csv"
$FilePath6 = Join-Path -Path $SourcePath -ChildPath $FileName6;

$FileName7 = "TEMPLATE_BOE_Receivable.xlsx"
$TemplateBody = Join-Path -Path $SourcePath -ChildPath $FileName7;

$FileName11 = "BOEReceivableHeader.csv"
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

# Enhanced cleanup - remove old files with retry logic
Write-Output "Cleaning up old files..."

# Remove old timestamped files
if (Test-Path -Path $FilePath) {
    try {
        Remove-FileWithRetry -FilePath $FilePath
        Write-Output "Cleaned: $FilePath"
    }
    catch {
        Write-Error "Failed to clean old file: $FilePath - $_"
        throw
    }
}

# Remove Boeing_Export.xlsx if it exists (this is likely the locked file)
if (Test-Path -Path $Result) {
    try {
        Remove-FileWithRetry -FilePath $Result
        Write-Output "Cleaned: $Result"
    }
    catch {
        Write-Error "Failed to clean Boeing_Export.xlsx: $Result - $_"
        throw
    }
}

# Remove other temporary files
@($FilePath2, $FilePath4) | ForEach-Object {
    if (Test-Path -Path $_) {
        try {
            Remove-FileWithRetry -FilePath $_
            Write-Output "Cleaned: $_"
        }
        catch {
            Write-Warning "Could not clean: $_ - $_"
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
    throw "Expected input file not found: $InputFilePath"
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

    # Create temporary workbook
    $wb22 = $Excel.Workbooks.Add()
    $ws2 = $wb22.Worksheets.Item(1) 
    
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
        
        # Open second workbook for data transfer
        $wb2 = $Excel.Workbooks.Open($FilePath2)
        $ws2 = $wb2.Worksheets.Item(1) 
        $ws2.Activate()

        $wb2.ActiveSheet.Range("A1").PasteSpecial(8) | Out-Null
        $wb2.ActiveSheet.Range("A1").PasteSpecial(-4122) | Out-Null
        $wb2.ActiveSheet.Range("A1").PasteSpecial(-4104) | Out-Null

        $wb2.Save()
        $wb2.SaveAs($FilePath4, $xlCSV) 
        $wb2.Close($false)
        $wb2 = $null
        $ws2 = $null
    }
    else {
        Write-Warning "Could not find 'Boeing Invoice #' in the worksheet"
    }

    Write-Output "Excel processing completed successfully"

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

    # Final file copies
    Write-Output "Creating final output files..."
    Copy-Item $FilePath2 -Destination $Result -Force
    Copy-Item $FilePath5 -Destination $Header -Force 
    Copy-Item $Result -Destination $ProcessCompleteResultFilePath -Force

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