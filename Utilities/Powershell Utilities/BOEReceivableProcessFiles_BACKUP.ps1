## file: boereceivableprocessfiles_BACKUP.ps1 

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
##  

##
##**********************************************************************************************/

Write-Output ""
Write-Output "Testing..."
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

$FileName2 = "2.xlsx"
$FilePath2 = Join-Path -Path $SourcePath -ChildPath $FileName2;

# Use daily date stamp format that matches SSIS: Boeing_Export_YYYYMMDD.xlsx
$FileName3 = "Boeing_Export_$dailyStamp.xlsx"
$Result = Join-Path -Path $SourcePath -ChildPath $FileName3;

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

$InputName = "BOE.xls"
$InputPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Input"
#$InputPath = "C:\mmm\20190612\Input"
$InputFilePath = Join-Path -Path $InputPath -ChildPath $InputName;

$ProcessName = "BOE.xls"
$ProcessPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"
#$ProcessPath = "C:\mmm\20190612\Process"
$ProcessFilePath = Join-Path -Path $ProcessPath -ChildPath $ProcessName;

$ProcessCompleteName = "BOE.xls"
$ProcessCompletePath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\ProcessComplete"
#$ProcessCompletePath = "C:\mmm\20190612\ProcessComplete"
$ProcessCompleteFilePath = Join-Path -Path $ProcessCompletePath -ChildPath $ProcessCompleteName;

$ProcessCompleteResultName = $FileName3
$ProcessCompleteResultPath = $ProcessCompletePath
$ProcessCompleteResultFilePath = Join-Path -Path $ProcessCompleteResultPath -ChildPath $ProcessCompleteResultName;

# ######################
# DEV RISK HERE IS HIGH - FILE CAN REMAIN OPEN IN OTHER PROCESS
# remove \process\1.x
If ((Test-Path -Path $FilePath) -eq $true) {
  try {
    Remove-Item –path $FilePath -Force -ErrorAction "Stop"
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
  Copy-Item -Path $InputFilePath -Destination $ProcessFilePath -Force   
 }
 catch {
   $_
   throw
 }

If ((Test-Path -Path $ProcessFilePath) -eq $false) {
  throw "Expected File Path  not found"

  } 

# COPY \process\BOE.x
# TO: \process\1.x

Write-Output "Debug Prerequisite copy from "  $ProcessFilePath
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



# This command tells whether all elements in the path exist
#$bln = (Test-Path -Path $FilePath) 



# ###################################
# File Paths /// ends ///
#
#
# ###################################



# Setup Excel, open $File and set the the first worksheet
$Excel = New-Object -ComObject Excel.Application
$Excel.visible = $false
$Excel.DisplayAlerts = $false
$Excel.EnableEvents = $false
$Excel.AskToUpdateLinks = $false
$Excel.DisplayAlerts = $false
$Workbook = $Excel.workbooks.open($FilePath)
$Excel.AskToUpdateLinks = $false
$Excel.DisplayAlerts = $false
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

$Excel.DisplayAlerts = $false
$wb22.SaveAs($FilePath2 , $xlFixedFormat) 
$wb22.Close($true);
$Excel.DisplayAlerts = $false


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
$dtePayment_check_date     = ([datetime]($payment_check_date)).ToString("yyyy-MM-dd hh:mm tt")

#payment_settlement_date(B8)
$payment_settlement_date = [datetime]::FromOADate(($Worksheet.Range("B8").Value2));
$dtePayment_settlement_date    = ([datetime]($payment_settlement_date)).ToString("yyyy-MM-dd hh:mm tt")

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
    check_trace_num       = ($check_trace_num)
    site_supplier_code       = ($site_supplier_code)
    best_code       = ($best_code)
    payment_check_date     = ($dtePayment_check_date)
    payment_settlement_date    = ($dtePayment_settlement_date)

    payment   = ($payment)
    invoices_paid_str  = ($invoices_paid_str)
    payment_status = ($payment_status)


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

$Excel.DisplayAlerts = $false
$Excel.EnableEvents = $false

$SearchString = "StartDate"
$FormatType = "Date"
FindSearchRangeDates $Worksheet $SearchString $FormatType;
$Excel.DisplayAlerts = $false
$Workbook.Save() 
$Excel.DisplayAlerts = $false


# note the search and format validation was skipped for BOE.

# #Late Sale
# $SearchString = "Late Sale"
# $FormatType = "Text"
# FindSearchRangeDates $Worksheet $SearchString $FormatType;


$Excel.DisplayAlerts = $false
$Workbook.Save() 


# ### ////////////////////////////


# Ver 2 FR 5.022
# #########################################
# 5.022 Search in header to define 
# header-to-end-range (title not in range)
# ** Dev risk is high - don't confuse size of range
#    with boundary. 
# #########################################

$SearchString = "Boeing Invoice #"
$RangeFinder1 = $Worksheet.Range("A1:z20").EntireRow
$Search2 = $RangeFinder1.find($SearchString,[Type]::Missing,[Type]::Missing,[Type]::Missing) 

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
$wb2 = $Excel.workbooks.open($FilePath2)
$ws2 = $wb2.Worksheets.item(1) 
$ws2.activate()

# FR 5.022
# Development risk -  must assign to a range (which will remain)

$wb2.ActiveSheet.Range("A1").PasteSpecial(8) | Out-Null
$wb2.ActiveSheet.Range("A1").PasteSpecial(-4122)  | Out-Null
$wb2.ActiveSheet.Range("A1").PasteSpecial(-4104) | Out-Null

# Step 1: Daily Operations Verification - [Supplier Invoice #] String Type Conversion
Write-Output "Step 1: Locating and converting [Supplier Invoice #] column to string type..."
try {
    $supplierInvoiceCol = $null
    $headerRow = 1
    
    # Locate the column
    for ($col = 1; $col -le 20; $col++) {
        $hdr = $wb2.ActiveSheet.Cells.Item($headerRow, $col).Value2
        if ($null -ne $hdr) {
            $txt = $hdr.ToString()
            if ($txt -match "Supplier Invoice") {
                $supplierInvoiceCol = $col
                Write-Output "SUCCESS: Found [Supplier Invoice #] at column $col - '$txt'"
                break
            }
        }
    }
    
    if ($null -ne $supplierInvoiceCol) {
        # Convert column to string type for consistent handling
        $lastRow = $wb2.ActiveSheet.UsedRange.Rows.Count
        Write-Output "Converting [Supplier Invoice #] data to string format (rows 2-$lastRow)..."
        
        $stringConversions = 0
        for ($row = 2; $row -le $lastRow; $row++) {
            $cellValue = $wb2.ActiveSheet.Cells.Item($row, $supplierInvoiceCol).Value2
            
            if ($null -ne $cellValue -and $cellValue.ToString().Trim() -ne "") {
                $originalValue = $cellValue.ToString().Trim()
                
                # Ensure value is treated as string (prepend with apostrophe for Excel)
                $wb2.ActiveSheet.Cells.Item($row, $supplierInvoiceCol).Formula = "=""$originalValue"""
                $stringConversions++
            }
        }
        
        # Format entire column as text to ensure string type
        $columnRange = $wb2.ActiveSheet.Range($wb2.ActiveSheet.Cells.Item(1, $supplierInvoiceCol), $wb2.ActiveSheet.Cells.Item($lastRow, $supplierInvoiceCol))
        $columnRange.NumberFormat = "@"  # Text format
        
        Write-Output "Step 1 COMPLETED: [Supplier Invoice #] column converted to string type"
        Write-Output "  - Column position: $supplierInvoiceCol"
        Write-Output "  - Values processed: $stringConversions"
        Write-Output "  - Format applied: Text (@)"
        Write-Output "  - Supports mixed formats: numeric (1460110) and alphanumeric (250531BOE602)"
    }
    else {
        Write-Output "Step 1 FAILED: [Supplier Invoice #] not found in first 20 columns"
        Write-Output "Available headers for debugging:"
        for ($c = 1; $c -le 10; $c++) {
            $val = $wb2.ActiveSheet.Cells.Item($headerRow, $c).Value2
            if ($null -ne $val) { Write-Output "  Col $c`: '$($val.ToString())'" }
        }
    }
}
catch {
    Write-Warning "Step 1 ERROR: $_"
    Write-Output "Continuing with processing - [Supplier Invoice #] may need manual verification"
}$wb2.Save()
$wb2.SaveAs($FilePath4 , $xlcsv) 
$wb2.close($false) 

}

catch {
  $_
  throw 
}

#$Excel.DisplayAlerts = $false

# ### //////////////////
# Ver 2 FR 5.022 Ends
# ### /////////////////

# ################################################
# copy Report_1.c to 
#  \ProcessComplete\Report_1.c
# ###############################################
# ProcessCompletePath

$complete = Join-Path -Path $ProcessCompletePath -ChildPath $FileName11;
Write-Output $complete

Copy-Item -Path $FilePath5 -Destination $complete -Force
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

# Copy main result file with error handling
Write-Output "Copying processed data: $FilePath2 -> $Result"
try {
    Copy-Item $FilePath2 -Destination $Result -Force -ErrorAction Stop
    if (Test-Path $Result) {
        $resultSize = [math]::Round((Get-Item $Result).Length/1KB, 2)
        Write-Output "SUCCESS: Boeing Export created - $resultSize KB"
    } else {
        throw "File was not created despite no copy error"
    }
}
catch {
    Write-Error "FAILED: Could not create Boeing Export file: $_"
    Write-Output "Source file check:"
    if (Test-Path $FilePath2) {
        $sourceSize = [math]::Round((Get-Item $FilePath2).Length/1KB, 2)
        Write-Output "  Source exists: $FilePath2 ($sourceSize KB)"
    } else {
        Write-Output "  Source missing: $FilePath2"
    }
    throw "Boeing Export file creation failed"
}

# Copy header file with error handling  
Write-Output "Copying header file: $FilePath5 -> $Header"
try {
    Copy-Item $FilePath5 -Destination $Header -Force -ErrorAction Stop
    Write-Output "SUCCESS: Header file copied"
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


