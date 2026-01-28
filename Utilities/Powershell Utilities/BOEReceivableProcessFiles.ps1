## 

## file: BOEReceivableProcessFiles.ps1  
## created: 06/12/2019
## by: William Thompson


##**********************************************************************************************
##  Description: Copies file from input to process folder	for BOE Receivables 
##  Sample:	see template		
##  
##  Date        Modified By         Change Description
##  ----------  ------------------  ------------------------------------------------------------
##  06/12/2019	William Thompson	Created.
##  regarding BOEReceivableProcessFiles.ps1 and conversion rate column, I am ready to test now.

##  cd "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\"
##  .\BOEReceivableProcessFiles.ps1

## Running locally on dev machine requires Excel installed
##  Note: Excel COM automation is not available on servers without Office installed
##  Typical deployment location: Production server with Office installed
##  Running locally resolves to local input/output paths for testing

## Local
## testing locally ingests $testInputFile instead of App input file.
## output: Utilities\Powershell Utilities\Boeing_Export_YYYYMMDDV1.csv
## Utilities\Powershell Utilities\ProcessComplete

## Server
## Script output path is SSIS input path 1 of 2
## output: \\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export_YYYYMMDDV1.csv
## sample: \\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\BOEReceivableHeader_20260128.csv

## sql-bi-1 launch 
## cd E:\ITDA\Operations\BOEReceivables
## cd 'E:\ITDA\Operations\BOEReceivables' .\BOEReceivableProcessFiles.ps1
## IMPORTANT: The script runs on sql-bi-1 but file paths are on 
## \\skillsinc.local\public\IS\DataTransfer\BOE Receivable\
##**********************************************************************************************/

Write-Output ""
Write-Output "Testing..."
$ErrorActionPreference = "Stop" 


$nl = [Environment]::NewLine
[string]$filepath = $null;
[bool]$bln = $false;

$range1="A1:A1"
$range2="A1:A1"

# #####################################
# input -- > process --> processComplete
# 
# #####################################
if ($env:COMPUTERNAME -eq "WILLIAM-ADMINPC") {
  $project = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\" 
} else {
  $project = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
}

$InputFilePath = Join-Path -Path $project -ChildPath "Input\BOE.xls"

# Setup logging directory and helper
$LogDir = Join-Path -Path $project -ChildPath "logs"
# Also create logs under the Process output share
$LogDirOutputs = Join-Path -Path $project -ChildPath "Process\logs"

foreach ($d in @($LogDir, $LogDirOutputs)) {
    if (-not (Test-Path -Path $d)) {
        try {
            New-Item -ItemType Directory -Path $d -Force | Out-Null
        }
        catch {
            Write-Warning "Failed to create log directory ${d}: $($_.Exception.Message)"
        }
    }
}

$LogFile = Join-Path -Path $LogDir -ChildPath "BOE_Excel_Diag.log"
$LogFileOutputs = Join-Path -Path $LogDirOutputs -ChildPath "BOE_Excel_Diag.log"

function Write-Log {
  param([string]$Message)
  $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  $line = "${ts} - $Message"
  try {
    $line | Out-File -FilePath $LogFile -Encoding UTF8 -Append
    $line | Out-File -FilePath $LogFileOutputs -Encoding UTF8 -Append
  }
  catch {
    Write-Warning "Failed to write to log files ${LogFile} and ${LogFileOutputs}: $($_.Exception.Message)"
  }
  Write-Output $Message
}

# Helper: invoke COM actions with retry on RPC_E_CALL_REJECTED (HRESULT 0x80010001)
function Invoke-ComRetry {
  param(
    [Parameter(Mandatory=$true)] [ScriptBlock] $Action,
    [int] $MaxAttempts = 6,
    [int] $BaseDelayMs = 250
  )

  for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
    try {
      & $Action
      return
    }
    catch {
      $ex = $_.Exception
      $h = $ex.HResult 2>$null
      $msg = $ex.Message
      # Retry on common COM busy/rejection HRESULTs or messages such as RPC_E_CALL_REJECTED and 0x800AC472
      if ($h -eq -2147418111 -or $msg -like '*Call was rejected*' -or $msg -like '*0x800AC472*' -or $msg -like '*800AC472*') {
        $delay = [int]($BaseDelayMs * [math]::Pow(2, $attempt - 1))
        Write-Log "COM call rejected or busy (HResult: $h) (attempt $attempt/$MaxAttempts). Sleeping ${delay}ms and retrying... Exception: $msg"
        Start-Sleep -Milliseconds $delay
        continue
      }
      else {
        throw
      }
    }
  }
  throw "COM action failed after $MaxAttempts attempts"
}
# Simulate app file input for local testing
if ($env:COMPUTERNAME -eq "WILLIAM-ADMINPC") {
    ## $testInputFile = $project + "Input\Test Input Excel File Nov 2025 - Copy.xls"
    # xlDetailExport 9703
    # $testInputFile = $project + "Input\xlDetailExport 003243654 Test William.xls"
    $testInputFile = $project + "Input\xlDetailExport 20260119.xls"
    ## 
    $testOutputFile = $project + "Input\BOE.xls"
    
    if (Test-Path $testInputFile) {
        Write-Output "==================================================================================="
        Write-Output "DEVELOPMENT MODE: Processing test file"
        Write-Output "Source: $testInputFile"
        Write-Output "==================================================================================="
        Copy-Item -Path $testInputFile -Destination $testOutputFile -Force
        Write-Output "SUCCESS: Test file copied to Input\BOE.xls"
    } else {
        Write-Warning "Test input file not found: $testInputFile"
        Write-Output "Script will proceed if BOE.xls already exists in Input folder"
    }
}

# Check if Excel COM is available before proceeding
try {
    $testExcel = New-Object -ComObject Excel.Application
    $testExcel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($testExcel) | Out-Null
    
    # Define Excel constants directly (works without PIA)
    $xlFixedFormat = 51  # xlWorkbookDefault
    $xlCSV = 6           # xlCSV
    Write-Output "Excel COM automation available - script can proceed"
}
catch {
    Write-Error "Excel COM automation not available on this machine"
    Write-Output "This script requires Microsoft Office Excel to be installed"
    Write-Output "Typical deployment location: Production server with Office installed"
    Write-Output "Error details: $_"
    exit 1
}


# File path definitions with daily date stamp (YYYYMMDD format for SSIS compatibility)
$dateStamp = Get-Date -Format "yyyyMMdd"
$dailyStamp = $dateStamp + "V1"
$SourcePath = $project + "Process"

$secondsStamp = Get-Date -Format "yyyyMMdd-HHmmss"
$UniqueStamp = $secondsStamp + "V1"


$FileName = "1 $(get-date -f yyyy-MM-dd-hh-mm-ss).xls"
$FilePath = Join-Path -Path $SourcePath -ChildPath $FileName;

# $FileName2 = "2.xlsx"
# $FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;SourcePath

$FileName2 = "2_${secondsStamp}.xlsx"
$FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;

# Use daily date stamp format that matches SSIS: Boeing_Export_YYYYMMDD.csv (changed from .xlsx for SSIS CSV flat file source)
$FileName3 = "Boeing_Export_$dailyStamp.csv"
$Result = Join-Path -Path $SourcePath -ChildPath $FileName3;

# Use unique time stamp format that matches then copy to Boeing_Export_YYYYMMDD.csv
$FileName3_intermediate = "Boeing_Export_$UniqueStamp.csv"
$Result_intermediate = Join-Path -Path $SourcePath -ChildPath $FileName3_intermediate;

$FileName4 = "2.csv"
$FilePath4 = Join-Path -Path $SourcePath -ChildPath $FileName4;

# use 11 for boe recb
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



$ProcessCompleteResultName = $FileName3   ## 3.csv  
$ProcessCompletePath = $project + "ProcessComplete"
$ProcessCompleteResultPath = $ProcessCompletePath
$ProcessCompleteResultFilePath = Join-Path -Path $ProcessCompleteResultPath -ChildPath $ProcessCompleteResultName;

$ProcessFilePath = Join-Path -Path $project -ChildPath "Process\BOE.xls"
$ProcessCompleteFilePath = Join-Path -Path $project -ChildPath "ProcessComplete\BOEReceivable_$dailyStamp.csv" 

# ######################
# DEV RISK HERE IS HIGH - FILE CAN REMAIN OPEN IN OTHER PROCESS
# remove \process\1.x
If ((Test-Path -Path $FilePath) -eq $true) {
  try {
    Remove-Item -Path $FilePath -Force -ErrorAction "Stop"
    Write-Output "Cleaning: " $nl $FilePath
  }
  catch {
    throw
  }
  finally {
    Write-output "."
  }

  } 


# pristine process flow
# copy \process\TEMPLATE Header.c
# to \process\BOEReceivableHeader.c
Write-Output $TemplateHeader
If ((Test-Path -Path $TemplateHeader) -eq $false) {
  throw "Expected init-csv file not found"

  } 
  Write-Output "Debug copy from " $TemplateHeader
  Write-Output "To " $Header
  try {
  Copy-Item -Path $TemplateHeader -Destination $Header -Force
  }
  catch {
    $_
    throw
  }

  # pristine process flow
# copy \process\INIT.x
# to \process\1.x
If ((Test-Path -Path $TemplateBody) -eq $false) {
  throw "Expected init-xlsx file not found"

  } 
  Write-Output "Debug copy from " $TemplateBody
  Write-Output "To " $FilePath
  try {
  Copy-Item -Path $TemplateBody -Destination $FilePath -Force
  }
  catch {
    $_
    throw
  }

# test for exists of \input\BOE

Try {
If ((Test-Path -Path $InputFilePath) -eq $false) {
    throw "Expected file not found"
  
    } 
 } catch {
    $_
    throw "Expected file not found"
 }


 # copy \input\BOE.x
 # TO: \process\BOE.x
 Write-Output "Debug Prerequisite copy from " $InputFilePath
 Write-Output "to " $ProcessFilePath
 try {
  Copy-Item -Path $InputFilePath -Destination $ProcessFilePath -Force   ## Process\BOE.xls
 }
 catch {
   $_
   throw
 }

If ((Test-Path -Path $ProcessFilePath) -eq $false) {
  throw "Expected File Path  not found"

  } 

# COPY \process\BOE.x


Write-Output "Debug Prerequisite copy from "  $ProcessFilePath   # COPY \process\BOE.x  TO: \process\1.x
Write-Output "to " $FilePath
try {
  Write-Output "Debug Copy: "  $ProcessFilePath
  Write-Output "Debug To: " $FilePath
  Copy-Item -Path $ProcessFilePath -Destination $FilePath -Force

}
catch {
  $_
  Throw
}


If ((Test-Path -Path $FilePath) -eq $false) {
  throw "Expected File Path  not found"

  } 




# ###################################
# File Paths /// ends ///
#
#
# ###################################



# Setup Excel, open $File and set the the first worksheet
# Create Excel COM object
$Excel = New-Object -ComObject Excel.Application
Invoke-ComRetry { $Excel.visible = $false }
Invoke-ComRetry { $Excel.DisplayAlerts = $false }

# Log Excel version information to help diagnose server versioning issues
try {
  $excelVersion = $Excel.Version
  Write-Log "Excel COM Version: $excelVersion"
}
catch {
  Write-Warning "Unable to read Excel.Version: $($_.Exception.Message)"
  Write-Log "WARN: Unable to read Excel.Version: $($_.Exception.Message)"
}
try {
  $appVersion = $Excel.Application.Version
  Write-Log "Excel.Application.Version: $appVersion"
}
catch {
  Write-Warning "Unable to read Excel.Application.Version: $($_.Exception.Message)"
  Write-Log "WARN: Unable to read Excel.Application.Version: $($_.Exception.Message)"
}

# Probe AskToUpdateLinks availability (some Excel builds may not expose this property)
try {
  $askVal = $Excel.AskToUpdateLinks
  Write-Log "AskToUpdateLinks property present, current value: $askVal"
}
catch {
  Write-Warning "AskToUpdateLinks property not accessible: $($_.Exception.Message)"
  Write-Log "WARN: AskToUpdateLinks property not accessible: $($_.Exception.Message)"
}

# Ensure events are disabled before interacting with workbook
Invoke-ComRetry { $Excel.EnableEvents = $false }
try {
  Invoke-ComRetry { $Excel.AskToUpdateLinks = $false }
}
catch {
  Write-Warning "Unable to set Excel.AskToUpdateLinks: $($_.Exception.Message)"
  Write-Log "WARN: Unable to set Excel.AskToUpdateLinks: $($_.Exception.Message)"
}
Invoke-ComRetry { $Excel.DisplayAlerts = $false }

# --- Additional COM/Version diagnostics ---
try {
  $rcwType = $Excel.GetType()
  if ($rcwType) {
    Write-Log "RCW Type FullName: $($rcwType.FullName)"
    Write-Log "RCW Type Assembly: $($rcwType.Assembly.FullName)"
  }
}
catch {
  Write-Log "WARN: Unable to inspect RCW type: $($_.Exception.Message)"
}

try {
  $progidType = [System.Type]::GetTypeFromProgID("Excel.Application")
  if ($progidType) {
    Write-Log "ProgID Type FullName: $($progidType.FullName)"
    Write-Log "ProgID GUID: $($progidType.GUID)"
    Write-Log "ProgID Assembly: $($progidType.Assembly.FullName)"
  }
  else {
    Write-Log "WARN: ProgID type not found for Excel.Application"
  }
}
catch {
  Write-Log "WARN: Unable to get ProgID type: $($_.Exception.Message)"
}

# Registry probes for common Office install metadata
try {
  $officeKey = 'HKLM:\SOFTWARE\Microsoft\Office'
  $officeKeyWow = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Office'
  if (Test-Path $officeKey) { Write-Log "Registry: Found $officeKey" } else { Write-Log "Registry: Not found $officeKey" }
  if (Test-Path $officeKeyWow) { Write-Log "Registry: Found $officeKeyWow" } else { Write-Log "Registry: Not found $officeKeyWow" }

  $clickKey = 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration'
  if (Test-Path $clickKey) {
    $cfg = Get-ItemProperty -Path $clickKey -ErrorAction SilentlyContinue
    Write-Log "ClickToRun ProductVersion: $($cfg.ProductVersion)"
  }
  else { Write-Log "ClickToRun key not found: $clickKey" }
}
catch {
  Write-Log "WARN: Registry probe failed: $($_.Exception.Message)"
}

try {
  Write-Log "Opening workbook with UpdateLinks=0 to prevent link prompts: $FilePath"
  # UpdateLinks parameter (2nd) = 0 -> don't update external links on open
  Invoke-ComRetry { $global:Workbook = $Excel.workbooks.open($FilePath, 0) }
}
catch {
  Write-Log "ERROR: Workbooks.Open failed: $($_.Exception.Message)"
  Write-Log "ERROR: Workbooks.Open stack: $($_.Exception.StackTrace)"
  throw
}
Write-Log "INFO: Skipping setting Application-level properties (AskToUpdateLinks/DisplayAlerts) after Open to avoid COM busy errors. Workbook opened with UpdateLinks=0."

# Validate that Workbook was opened successfully before using it
if ($null -eq $Workbook) {
  Write-Log "ERROR: Workbook variable is null after Open for file: $FilePath"
  Write-Log "Attempting one more Open attempt..."
  try {
    Invoke-ComRetry { $global:Workbook = $Excel.Workbooks.Open($FilePath, 0) }
  }
  catch {
    Write-Log "ERROR: Retry Workbooks.Open failed: $($_.Exception.Message)"
  }
  if ($null -eq $Workbook) {
    Write-Log "FATAL: Workbook still null after retry. Aborting to avoid null dereference. File: $FilePath"
    try { Invoke-ComRetry { $Excel.Quit() } } catch {}
    throw "Workbook open failed for $FilePath"
  }
}

#$Worksheets = $Workbooks.worksheets
$Worksheet = $Workbook.Worksheets.Item(1)
$worksheet.Activate();

$SheetName = $Worksheet.Name;


# ## Create wb2 (file2) #######################
#
#
###############################################
$wb22 = $Excel.Workbooks.Add()
$ws2 = $wb22.Worksheets.item(1) 

try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts for wb2: $($_.Exception.Message)" }
try { $wb22.SaveAs($FilePath2 , $xlFixedFormat) } catch { Write-Log "ERROR: wb2 SaveAs failed: $($_.Exception.Message)"; throw }
try { $wb22.Close($true) } catch { Write-Log "WARN: wb2 Close failed: $($_.Exception.Message)" }
try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts after wb2 close: $($_.Exception.Message)" }


# #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


# ## ##########################################
#  Function - parms sheet, search
#
###############################################
Function FindRange 
{

  Param(
    [Parameter(Position = 0)]
    #[Object[]]
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


Function FindSearchRangeDates 
{

  Param(
    [Parameter(Position = 0)]
    #[Object[]]
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

    $col = $Search2.Column
    $row = $Search2.Row


    if ($Search2 -eq $null) {


      Return
    }

    $rowX = $sheet2.UsedRange.Rows.Count
    $colX = $sheet2.UsedRange.Columns.Count;

    $c1=$sheet2.Cells.Item($row,$col)
    $c2=$sheet2.Cells.Item($rowX,$col)

    
    $sheet2.Range($c1,$c2).Select | Out-Null;
    $xxr = $sheet2.Range($c1,$c2).Rows.Count;
    $xxc = $sheet2.Range($c1,$c2).Columns.Count;


    # Development risk -  must assign to a range (which will remain)
    if ($xxr -lt 1) {
       Return;
    }
    $RangeTest2 =  $sheet2.Range($c1,$c2).Copy();

    # Requirement 5.3 format date columns in Excel
    try {
      

    $sheet2.Range($c1,$c2).Select | Out-Null

    if ($formatType -eq "Date") {
      $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "mm/dd/yyyy"
    }
    elseif($formatType -eq "DateTime") {
      $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "mm/dd/yyyy hh:mm:ss"
    }
    elseif($formatType -eq "Text") {
      $sheet2.Range($c1,$c2).EntireColumn.NumberFormat = "@" ; ## text
      $sheet2.Range($c1,$c2).EntireColumn.Columns.Replace(",","")
      $xlWhole = 1
      $xlPart = 2
      $sheet2.Range($c1,$c2).EntireColumn.Columns.Replace('#N/A',"", $xlWhole)
    }
 
  }
  catch {
     $_
     throw
      
  }

     $sheet2.Range($c1,$c2).Select | Out-Null;

    return
}

 ################################################################################
 ################################################################################  

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
## ////////////////////////////////////////////////////////////////// 
## ////////////////////////////////////////////////////////////////// 

#### #################################################################################
# 
#  BOE Receivable Data Refresh
# 
#### ################################################################################# 

## ** REMOVING FREEZEPANES **
# FR-5.012 Worksheet FreezePanes – UnFreeze   ###
# ** DEV RISK IS HIGH
# ###############################################


$j=1

try {

$CurrentSheet = $Workbook.WorkSheets.Item($j)
$CurrentSheet.application.activewindow.splitcolumn = 0
$CurrentSheet.application.activewindow.splitrow = 0
# $CurrentSheet.application.activewindow.freezepanes = $true
# $CurrentSheet.application.activewindow.freezepanes = $null

#### Ver 2 FR-5.1 ###################################################
# Ver 2 FR-5.1 Remove Autofilter
# this effectively removes the autofilter since all are optional
# 
########################################################
$CurrentSheet.AutoFilterMode = $false

# FR-5.12 unfreeze panes
$Excel.ActiveWindow.FreezePanes = $false


# ###############################################
# Ver 2  FR-5.013 Worksheet Merge Cells – Remove.0
#
# ###############################################

$ma = $CurrentSheet.UsedRange.MergeArea
$CurrentSheet.UsedRange.MergeCells = $false 

#font size
$CurrentSheet.UsedRange.Font.Size = 10;
$CurrentSheet.UsedRange.Font.ColorIndex = 1
$CurrentSheet.UsedRange.Interior.ColorIndex = 0;

$Worksheet.Select()
$Worksheet.Range("a1").EntireRow.Select()
$rng=$Worksheet.cells.item(1 , 1).EntireRow
$rng.select | Out-Null


# ** This requirement has been updated **
# FR-5.11 Remove Autofilter

}
catch {
  $_
  throw

}

$check_trace_num = $null
$site_supplier_code = $null
$best_code = $null
$payment_check_date = $null
$payment_settlement_date = $null

$payment = $null
$invoices_paid_str = $null
$payment_status = $null

# #############################################
# BOE Receivable
# Header Fields
# #############################################

# $RangeFinder1 = $Worksheet.Range("A1:z20").EntireRow
[string]$check_trace_num
# use value2 in order to not convert formatted
$check_trace_num = $Worksheet.Range("B4").Value2

[string]$check_trace_num
$check_trace_num = $Worksheet.Range("B4").Value2
#site_supplier_code(D11)
$site_supplier_code = $Worksheet.Range("D11").Value2
#best_code(D10)
[string]$best_code = $Worksheet.Range("D10").Value2
#payment_check_date(B7)
$payment_check_date = [datetime]::FromOADate(($Worksheet.Range("B7").Value2));
$dtePayment_check_date     = ([datetime]($payment_check_date)).ToString("yyyy-MM-dd HH:mm:ss")

#payment_settlement_date(B8)
$payment_settlement_date = [datetime]::FromOADate(($Worksheet.Range("B8").Value2));
$dtePayment_settlement_date    = ([datetime]($payment_settlement_date)).ToString("yyyy-MM-dd HH:mm:ss")

#payment(B6)
$payment = $Worksheet.Range("B6").Value2
#invoices_paid_str(A13)
[string]$invoices_paid_str = $Worksheet.Range("A13").Value2
#payment_status(B5)
$payment_status = $Worksheet.Range("B5").Value2
#import_date
$time = (Get-Date).ToString("yyyy-MM-dd hh:mm")
[string]$import_date = $time

# ///////////////////////////////////////////////////////////

$tab = @()

$obj = New-Object PSObject -Property @{
    check_trace_num       = [string]($check_trace_num)
    site_supplier_code       = [string]($site_supplier_code)
    best_code       = [string]($best_code)
    payment_check_date     = [string]($dtePayment_check_date)
    payment_settlement_date    = [string]($dtePayment_settlement_date)

    payment   = ($payment)
    invoices_paid_str  = [string]($invoices_paid_str)
    payment_status = [string]($payment_status)


     }
$tab += $obj

$tab

$tab | Export-Csv -path $FilePath5 -NoTypeInformation  -force
Write-Output "See " $nl
Write-Output $Header ". . "  "."

# ####################################
# Requirements # FR 5.1
# Use PasteSpecial Values to resolve 
# any formulas/popups
# ####################################

[int32]$xlValues = -4163

#  first copy, then select, then pasteSpecial values
$null = $Workbook.ActiveSheet.UsedRange.copy()
$null = $Workbook.ActiveSheet.Range("A1").Select()
$null = $Workbook.ActiveSheet.Range("A1").PasteSpecial(-4163)

# #########################
# File Dialog Force Begins 
#  Requirement # FR 5.2
# #########################

try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts (section): $($_.Exception.Message)" }
try { Invoke-ComRetry { $Excel.EnableEvents = $false } } catch { Write-Log "WARN: Unable to set Excel.EnableEvents (section): $($_.Exception.Message)" }

# Note: StartDate column search skipped for BOE Receivable data
# (Column does not exist in BOE export format)
# $SearchString = "StartDate"
# $FormatType = "Date"
# FindSearchRangeDates $Worksheet $SearchString $FormatType;

try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts before Save: $($_.Exception.Message)" }
try { $Workbook.Save() } catch { Write-Log "ERROR: Workbook.Save failed: $($_.Exception.Message)" }
try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts after Save: $($_.Exception.Message)" }


# note the search and format validation was skipped for BOE.

# #Late Sale
# $SearchString = "Late Sale"
# $FormatType = "Text"
# FindSearchRangeDates $Worksheet $SearchString $FormatType;


try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts before Save(2): $($_.Exception.Message)" }
try { $Workbook.Save() } catch { Write-Log "ERROR: Workbook.Save failed(2): $($_.Exception.Message)" }


# ### ////////////////////////////


# ################################################################################
# TABULAR DATA SECTION EXTRACTION - SINGLE PURPOSE
# ################################################################################
# Purpose: Extract tabular invoice data from Excel worksheet
# Input: $Worksheet (source Excel data with "Boeing Invoice #" header)
# Output: $FilePath2 (2_YYYYMMDD-HHmmss.xlsx) - timestamped working file
# Process:
#   1. Find "Boeing Invoice #" header row
#   2. Copy range from header to end of data
#   3. Paste into new workbook ($FilePath2)
#   4. Apply string type conversion to Supplier Invoice # column
#   5. Save as CSV ($FilePath4) and Excel ($FilePath2)
#
#
# ################################################################################

# Ver 2 FR 5.022
# #########################################
# 5.022 Search in header to define 
# header-to-end-range (title not in range)
# ** Dev risk is high - don't confuse size of range
#    with boundary. 
# #########################################

# Find "Boeing Invoice #" - handle NBSP
$SearchRange = $Worksheet.Range("A1:z20")
$Search2 = $null
Write-Output "Searching for 'Boeing Invoice #' header in rows 1-20..."
for ($i = 1; $i -le 20; $i++) {
    for ($j = 1; $j -le 26; $j++) {
        $cellText = $Worksheet.Cells.Item($i, $j).Text
        if ($cellText) {
            $normalizedText = $cellText.Replace([char]160, " ").Trim()
            if ($i -eq 14) {
              Write-Output "Row 14, Col ${j} : '${cellText}' -> normalized: '${normalizedText}'"
            }
            if ($normalizedText -eq "Boeing Invoice #") {
                $Search2 = $Worksheet.Cells.Item($i, $j)
                Write-Output "Found Boeing Invoice # at row $i, col $j"
                break
            }
        }
    }
    if ($null -ne $Search2) { break }
}
if ($null -eq $Search2) { 
    Write-Output "ERROR: Boeing Invoice # header not found in range A1:Z20"
    throw "Boeing Invoice # header not found" 
}
$col = $Search2.Column
$row = $Search2.Row

try {

#test and debug
$y = $Search2.Address($row, $col, 4, 0) ## R1C16

$rowX = $Worksheet.UsedRange.Rows.Count
$colX = $Worksheet.UsedRange.Columns.Count;

$c1=$Worksheet.Cells.Item($row,1)
$c2=$Worksheet.Cells.Item($rowX,$colX)

$null = $Worksheet.Range($c1,$c2).Select

# FR 5.022
# Development risk -  must assign to a range (which will remain)
$RangeTest2 =  $Worksheet.Range($c1,$c2).Copy();
$wb2 = $null
try {
  Write-Log "Opening intermediate workbook with UpdateLinks=0: $FilePath2"
  Invoke-ComRetry { $global:wb2 = $Excel.workbooks.open($FilePath2, 0) }
}
catch {
  Write-Log "ERROR: Failed to open intermediate workbook ${FilePath2}: $($_.Exception.Message)"
  throw
}
$ws2 = $wb2.Worksheets.item(1) 
$ws2.activate()

$wb2.ActiveSheet.Range("A1").PasteSpecial(8) | Out-Null
$wb2.ActiveSheet.Range("A1").PasteSpecial(-4122)  | Out-Null
$wb2.ActiveSheet.Range("A1").PasteSpecial(-4104) | Out-Null

# ################################################################################
# COLUMN FORMATTING - JSON RULES-BASED APPROACH
# ################################################################################
# Purpose: Apply data type formatting based on JSON configuration rules
# Input: $wb2 (workbook with tabular data)
# Rules: BOE_Column_Rules.json (column patterns, formats, formula stripping)
# Output: Formatted columns ready for SSIS import
# ################################################################################

Write-Output "=== APPLYING COLUMN FORMATTING RULES ==="

# Load formatting rules from JSON configuration
# JSON file must be in same directory as this script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$rulesPath = Join-Path -Path $scriptPath -ChildPath "BOE_Column_Rules.json"
if (Test-Path $rulesPath) {
    try {
        # Check file size first
        $fileInfo = Get-Item $rulesPath
        Write-Output "JSON file found: $rulesPath ($($fileInfo.Length) bytes)"
        
        # Read with explicit UTF8 encoding without BOM
        $jsonContent = [System.IO.File]::ReadAllText($rulesPath, [System.Text.UTF8Encoding]::new($false))
        
        # Show first 100 chars for debugging (helps identify encoding issues)
        $preview = $jsonContent.Substring(0, [Math]::Min(100, $jsonContent.Length))
        Write-Output "JSON preview (first 100 chars): $preview"
        
        $columnRules = ($jsonContent | ConvertFrom-Json).rules
        Write-Output "Loaded $($columnRules.Count) formatting rules from: BOE_Column_Rules.json"
    }
    catch {
        Write-Error "CRITICAL: Error parsing JSON file: $($_.Exception.Message)"
        Write-Error "JSON file location: $rulesPath"
        Write-Error "File size: $($fileInfo.Length) bytes"
        Write-Error "Ensure BOE_Column_Rules.json is valid JSON and saved with UTF-8 encoding without BOM"
        Write-Error "You may need to recreate the file on the server"
        throw "Failed to load column formatting rules: $($_.Exception.Message)"
    }
} else {
    Write-Error "CRITICAL: Rules file not found: $rulesPath"
    Write-Error "Expected location: $rulesPath"
    Write-Error "BOE_Column_Rules.json must be in the same directory as this script"
    throw "Required configuration file missing: BOE_Column_Rules.json"
}

# Read and clean headers (handle NBSP and whitespace)
$headerRow = 1
$lastCol = $wb2.ActiveSheet.UsedRange.Columns.Count
$lastRow = $wb2.ActiveSheet.UsedRange.Rows.Count
$headers = @()

for ($col = 1; $col -le $lastCol; $col++) {
    $rawHeader = $wb2.ActiveSheet.Cells.Item($headerRow, $col).Text
    if ($rawHeader -ne "") {
        # Clean header for matching (don't modify Excel file)
        $cleanHeader = $rawHeader -replace [char]160, ' '  # Replace NBSP with regular space
        $cleanHeader = $cleanHeader.Trim() -replace '\s+', ' '  # Normalize whitespace
        $headers += $cleanHeader
    }
}

Write-Output "Found $($headers.Count) columns in dataset"

# Apply formatting rules to each column
$formattedCount = 0
for ($col = 1; $col -le $headers.Count; $col++) {
    $header = $headers[$col - 1]
    
    # Find matching rule (first match wins)
    $matchedRule = $null
    foreach ($rule in $columnRules) {
        if ($header -match $rule.columnPattern) {
            $matchedRule = $rule
            break
        }
    }
    
    if ($matchedRule) {
        Write-Output "[$col] '$header' -> $($matchedRule.dataType) ($($matchedRule.excelFormat))"
        
        # Get column data range (skip header)
        $dataRange = $wb2.ActiveSheet.Range(
            $wb2.ActiveSheet.Cells.Item(2, $col),
            $wb2.ActiveSheet.Cells.Item($lastRow, $col)
        )
        
        # Apply Excel number format FIRST (before stripping formulas)
        $dataRange.NumberFormat = $matchedRule.excelFormat
        
        # Strip formulas if configured
        if ($matchedRule.stripFormulas) {
            $dataRange.Copy() | Out-Null
            $dataRange.PasteSpecial(-4163) | Out-Null  # xlPasteValues
            # Note: CutCopyMode will be cleared automatically when workbook closes
            
            # Additional cleanup for ="..." text formulas (string columns only)
            if ($matchedRule.dataType -eq "String") {
                $cleanedCells = 0
                $forcedTextCells = 0
                for ($row = 2; $row -le $lastRow; $row++) {
                    $cell = $wb2.ActiveSheet.Cells.Item($row, $col)
                    if ($null -ne $cell.Value2) {
                        $val = $cell.Value2.ToString().Trim()
                        
                        # Strip ="value" to value
                        if ($val -match '^="(.+)"$') {
                            $val = $matches[1].Trim()
                            $cleanedCells++
                        }
                        
                        # Force text treatment: Prefix ALL non-empty values with apostrophe
                        # This ensures Excel/SSIS treats everything as text (both "1471074" and "250531BOE602")
                        if ($val -ne "") {
                            $cell.Value2 = "'" + $val
                            $forcedTextCells++
                        }
                    }
                }
                if ($cleanedCells -gt 0) {
                    Write-Output "  - Stripped formulas from $cleanedCells cells"
                }
                if ($forcedTextCells -gt 0) {
                    Write-Output "  - Forced text format on $forcedTextCells values"
                }
            }
        }
        
        # Trim strings if configured
        if ($matchedRule.trim -and $matchedRule.dataType -eq "String") {
            for ($row = 2; $row -le $lastRow; $row++) {
                $cell = $wb2.ActiveSheet.Cells.Item($row, $col)
                if ($null -ne $cell.Value2) {
                    $cellValue = $cell.Value2.ToString().Trim()
                    # Preserve apostrophe prefix if it exists
                    if ($cellValue.StartsWith("'")) {
                        $cell.Value2 = "'" + $cellValue.Substring(1).Trim()
                    } else {
                        $cell.Value2 = $cellValue
                    }
                }
            }
        }
        
        # Strip commas from currency fields if configured (for SSIS numeric parsing)
        if ($matchedRule.PSObject.Properties.Name -contains 'stripCommas' -and $matchedRule.stripCommas) {
            $commaCount = 0
            for ($row = 2; $row -le $lastRow; $row++) {
                $cell = $wb2.ActiveSheet.Cells.Item($row, $col)
                if ($null -ne $cell.Value2 -and $cell.Value2 -ne "") {
                    $originalValue = $cell.Value2.ToString()
                    $cleanedValue = $originalValue -replace ',', ''
                    
                    # Force decimal format based on excelFormat from JSON
                    # Convert to number and format (0.00 for currency, 0.000 for conversion rate)
                    try {
                        $numValue = [double]$cleanedValue
                        # Use the format from JSON rule
                        $formatString = "{0:" + $matchedRule.excelFormat + "}"
                        $cell.Value2 = [string]::Format($formatString, $numValue)
                    } catch {
                        # If not numeric, just remove commas
                        $cell.Value2 = $cleanedValue
                    }
                    
                    if ($originalValue -ne $cell.Value2) {
                        $commaCount++
                    }
                }
            }
            if ($commaCount -gt 0) {
                Write-Output "  - Formatted $commaCount currency values using format: $($matchedRule.excelFormat)"
            }
        }
        
        $formattedCount++
    }
}

Write-Output "Formatted $formattedCount columns using JSON rules"
Write-Output ""

# ################################################################################
# CLEANUP: Delete empty columns beyond our data
# ################################################################################
# Excel UsedRange may include empty columns that cause extra commas in CSV
# Delete any columns after the last column with data

$lastDataCol = $wb2.ActiveSheet.UsedRange.Columns.Count
$totalCols = $wb2.ActiveSheet.Columns.Count

# Find the actual last column with a header
$actualLastCol = 0
for ($c = 1; $c -le $lastDataCol; $c++) {
    $headerValue = $wb2.ActiveSheet.Cells.Item(1, $c).Text
    if ($headerValue -and $headerValue.Trim() -ne "") {
        $actualLastCol = $c
    }
}

# Delete columns after the last header column
if ($actualLastCol -gt 0 -and $actualLastCol -lt $lastDataCol) {
    $columnsToDelete = $lastDataCol - $actualLastCol
    $deleteRange = $wb2.ActiveSheet.Range(
        $wb2.ActiveSheet.Cells.Item(1, $actualLastCol + 1),
        $wb2.ActiveSheet.Cells.Item(1, $lastDataCol)
    ).EntireColumn
    $deleteRange.Delete() | Out-Null
    Write-Output "Deleted $columnsToDelete empty columns after column $actualLastCol"
}

# ################################################################################
# NOTE: EMPTY ROW FILTERING HANDLED IN SQL
# ################################################################################
# The staging table allows NULL for Invoice Received Date column.
# Empty rows from Excel will import as NULL and can be filtered using:
#   DELETE FROM staging_table WHERE [Invoice Received Date] IS NULL
# This is more reliable than PowerShell Excel COM filtering for edge cases.
# ################################################################################

$wb2.Save()
$wb2.SaveAs($FilePath4 , $xlcsv) 
$wb2.close($false) 

}

catch {
  $_
  throw 
}

try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts before re-activating worksheet: $($_.Exception.Message)" }
#$Worksheets = $Workbooks.worksheets
$Worksheet = $Workbook.Worksheets.Item(1)
$worksheet.Activate();
# ### /////////////////

# ################################################
# copy Report_1.c to 
#  \ProcessComplete\Report_1.c
# ###############################################
# ProcessCompletePath

# Copy to ProcessComplete with standard name
$complete = Join-Path -Path $ProcessCompletePath -ChildPath $FileName11;
Write-Output $complete

Copy-Item -Path $Header -Destination $complete -Force
If ((Test-Path -Path $complete) -eq $false) {
   throw "Expected File Path  not found"
 
} 

# ###################################
# copy \process\BOE.xlsx 
# to: \processcomplete\1.xlsx
# remove \process\BOE.x
# ###################################
try {
  Copy-Item -Path $ProcessFilePath -Destination $ProcessCompleteFilePath -Force
}
catch {
  Write-Output "There is a problem"
  $_
  throw
  Write-Output "Cleaning up and Closing Files"
  $Workbook.close($false) 
  $Workbook,$Worksheet, $Excel | ForEach-Object {
    [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)
}
finally {
   Write-Output "."
  }
}


If ((Test-Path -Path $ProcessCompleteFilePath) -eq $false) {
   throw "Expected File Path  not found"
 
} 

# carry the pristine file to the processComplete directory
try {
Remove-Item -Path $ProcessFilePath -force

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
try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts during cleanup: $($_.Exception.Message)" }
try { Invoke-ComRetry { $Excel.EnableEvents = $false } } catch { Write-Log "WARN: Unable to set Excel.EnableEvents during cleanup: $($_.Exception.Message)" }

try { Invoke-ComRetry { $Excel.DisplayAlerts = $false } } catch { Write-Log "WARN: Unable to set Excel.DisplayAlerts during cleanup(2): $($_.Exception.Message)" }
try { Invoke-ComRetry { $Excel.EnableEvents = $false } } catch { Write-Log "WARN: Unable to set Excel.EnableEvents during cleanup(2): $($_.Exception.Message)" }

try { $Workbook.close($false) } catch { Write-Log "WARN: Workbook.Close during cleanup failed: $($_.Exception.Message)" }

#Release the com objects
try {
  $Workbook,$Worksheet, $Excel | ForEach-Object {
    [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)
  }
} catch { Write-Log "WARN: ReleaseComObject failed: $($_.Exception.Message)" }

try { Invoke-ComRetry { $Excel.quit() } } catch { Write-Log "WARN: Excel.Quit failed: $($_.Exception.Message)" }

Stop-Process -Name excel -Force -ErrorAction SilentlyContinue

# Step 1: Daily Operations Verification - Final File Operations
Write-Output ""
Write-Output "=== STEP 1: DAILY OPERATIONS VERIFICATION - FILE OPERATIONS ==="
Write-Output "Daily Stamp: $dailyStamp"
Write-Output "Target Boeing Export: $Result"

# Clean up any existing daily file before copying
if (Test-Path $Result) {
    Write-Output "Removing existing daily file: $Result"
    try {
        Remove-Item $Result -Force -ErrorAction Stop
        Write-Output "SUCCESS: Existing file removed"
    }
    catch {
        Write-Warning "Could not remove existing file: $_"
        Write-Output "Attempting to continue with copy anyway..."
    }
}

# Step 1: Copy CSV output to intermediate timestamped Boeing Export file
Write-Output "Step 1: Copying to intermediate file: $FilePath4 (CSV) -> $Result_intermediate"
try {
    Copy-Item $FilePath4 -Destination $Result_intermediate -Force -ErrorAction Stop
    if (Test-Path $Result_intermediate) {
        $intermediateSize = [math]::Round((Get-Item $Result_intermediate).Length/1KB, 2)
        Write-Output "SUCCESS: Intermediate Boeing Export created - $intermediateSize KB"
    } else {
        throw "Intermediate file was not created despite no copy error"
    }
}
catch {
    Write-Error "FAILED: Could not create intermediate Boeing Export file: $_"
    Write-Output "Source file check:"
    if (Test-Path $FilePath4) {
        $sourceSize = [math]::Round((Get-Item $FilePath4).Length/1KB, 2)
        Write-Output "  Source exists: $FilePath4 ($sourceSize KB)"
    } else {
        Write-Output "  Source missing: $FilePath4"
    }
    throw "Intermediate Boeing Export file creation failed"
}

# Step 2: Copy intermediate to final daily file
Write-Output "Step 2: Copying to final daily file: $Result_intermediate -> $Result"
try {
    Copy-Item $Result_intermediate -Destination $Result -Force -ErrorAction Stop
    if (Test-Path $Result) {
        $resultSize = [math]::Round((Get-Item $Result).Length/1KB, 2)
        Write-Output "SUCCESS: Final Boeing Export created - $resultSize KB"
    } else {
        throw "Final file was not created despite no copy error"
    }
}
catch {
    Write-Error "FAILED: Could not create final Boeing Export file: $_"
    throw "Boeing Export file creation failed"
}

# Copy header file with error handling  
Write-Output "Copying header file: $FilePath5 -> $Header"
try {
    Copy-Item $FilePath5 -Destination $Header -Force -ErrorAction Stop
    Write-Output "SUCCESS: Header file copied"
    
    # Now create timestamped versions with the CURRENT header data
    $headerTimestampedName = "BOEReceivableHeader_$dateStamp.csv"
    $headerTimestampedPath = Join-Path -Path $SourcePath -ChildPath $headerTimestampedName
    $completeTimestamped = Join-Path -Path $ProcessCompletePath -ChildPath $headerTimestampedName
    
    Copy-Item -Path $Header -Destination $headerTimestampedPath -Force
    Write-Output "Header timestamped file created in Process folder: $headerTimestampedPath"
    
    Copy-Item -Path $Header -Destination $completeTimestamped -Force
    Write-Output "Header archived to ProcessComplete: $completeTimestamped"
}
catch {
    Write-Warning "FAILED: Could not copy header file: $_"
}

# Copy to ProcessComplete with error handling
Write-Output "Archiving to ProcessComplete: $Result -> $ProcessCompleteResultFilePath"
try {
    Copy-Item $Result -Destination $ProcessCompleteResultFilePath -Force -ErrorAction Stop
    Write-Output "SUCCESS: Result archived to ProcessComplete"
}
catch {
    Write-Warning "FAILED: Could not archive to ProcessComplete: $_"
}

Write-Output "=== STEP 1 VERIFICATION COMPLETE ==="
Write-Output "Primary Output: $Result"
Write-Output "Archive Location: $ProcessCompleteResultFilePath"




