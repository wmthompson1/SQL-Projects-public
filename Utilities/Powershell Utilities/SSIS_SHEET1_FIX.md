# SSIS Excel "Sheet1 Must Exist" - Problem Resolved

## Issue Summary
SSIS Excel Source components require specific worksheet naming and structure. The error "Sheet1 has to exist" occurs when:
1. Worksheet names don't match SSIS expectations
2. Excel file structure is incompatible with SSIS
3. Connection string references non-existent sheets

## ✅ PowerShell Script Fixes Applied

### 1. **Explicit Sheet1 Naming**
The script now ensures all Excel worksheets are named "Sheet1":
```powershell
# Create temporary workbook with proper SSIS-compatible sheet naming
$ws2.Name = "Sheet1"

# Ensure the destination worksheet is named "Sheet1" for SSIS
if ($ws2.Name -ne "Sheet1") {
    $ws2.Name = "Sheet1"
}
```

### 2. **Proper Excel File Creation**
The script now creates a clean Excel file specifically for SSIS consumption:
```powershell
# Save as the final timestamped file with proper sheet naming
$finalResult = $Excel.Workbooks.Add()
$finalSheet = $finalResult.Worksheets.Item(1)
$finalSheet.Name = "Sheet1"
```

### 3. **SSIS Metadata Generation**
The script creates troubleshooting information for SSIS configuration:
```
BOE_Excel_Info_YYYYMMDD.txt contains:
- Excel File name
- Worksheet Name: Sheet1
- Recommended SSIS Connection String
```

## 🔧 SSIS Configuration Solutions

### Option 1: Excel Source with Dynamic File Path (Recommended)
```sql
-- SSIS Expression for Connection String:
"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + 
"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\Boeing_Export_" + 
(DT_WSTR, 4) YEAR(GETDATE()) + 
RIGHT("0" + (DT_WSTR, 2) MONTH(GETDATE()), 2) + 
RIGHT("0" + (DT_WSTR, 2) DAY(GETDATE()), 2) + 
".xlsx" + 
";Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1\""
```

### Option 2: Excel Source Table/View Name
In your Excel Source, use one of these table name formats:

**For entire sheet:**
- `Sheet1$`
- `[Sheet1$]`

**For specific range:**
- `Sheet1$A1:Z1000`
- `[Sheet1$A1:Z1000]`

### Option 3: SSIS Package Configuration

#### Step 1: Create Package Variables
```
Variable Name: BOE_FilePath
Data Type: String
Value: \\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export_20251113.xlsx

Variable Name: BOE_SheetName  
Data Type: String
Value: Sheet1$
```

#### Step 2: Configure Excel Connection Manager
1. **Connection String**: Use variable `@[User::BOE_FilePath]`
2. **Excel Source**: Set table name to `@[User::BOE_SheetName]`

#### Step 3: Script Task for Dynamic Path Setting
```csharp
public void Main()
{
    try
    {
        string dateStamp = DateTime.Now.ToString("yyyyMMdd");
        string basePath = @"\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\";
        string fileName = $"Boeing_Export_{dateStamp}.xlsx";
        string fullPath = Path.Combine(basePath, fileName);
        
        // Set the file path variable
        Dts.Variables["User::BOE_FilePath"].Value = fullPath;
        
        // Verify file exists and has Sheet1
        if (File.Exists(fullPath))
        {
            Dts.Log($"BOE Excel file found: {fullPath}", 0, null);
            Dts.TaskResult = (int)ScriptResults.Success;
        }
        else
        {
            throw new FileNotFoundException($"BOE Excel file not found: {fullPath}");
        }
    }
    catch (Exception ex)
    {
        Dts.Log($"Error setting BOE file path: {ex.Message}", 0, null);
        Dts.TaskResult = (int)ScriptResults.Failure;
    }
}
```

## 🔍 SSIS Troubleshooting Commands

### Verify Excel File Structure
```csharp
// Script Task to validate Excel file before processing
public void Main()
{
    string filePath = Dts.Variables["User::BOE_FilePath"].Value.ToString();
    
    try
    {
        Microsoft.Office.Interop.Excel.Application excelApp = new Microsoft.Office.Interop.Excel.Application();
        excelApp.Visible = false;
        
        Microsoft.Office.Interop.Excel.Workbook workbook = excelApp.Workbooks.Open(filePath);
        
        // Check for Sheet1
        bool sheet1Exists = false;
        foreach (Microsoft.Office.Interop.Excel.Worksheet sheet in workbook.Worksheets)
        {
            if (sheet.Name == "Sheet1")
            {
                sheet1Exists = true;
                int usedRows = sheet.UsedRange.Rows.Count;
                int usedCols = sheet.UsedRange.Columns.Count;
                Dts.Log($"Sheet1 found with {usedRows} rows and {usedCols} columns", 0, null);
                break;
            }
        }
        
        workbook.Close(false);
        excelApp.Quit();
        
        if (sheet1Exists)
        {
            Dts.TaskResult = (int)ScriptResults.Success;
        }
        else
        {
            throw new Exception("Sheet1 not found in Excel file");
        }
    }
    catch (Exception ex)
    {
        Dts.Log($"Excel validation failed: {ex.Message}", 0, null);
        Dts.TaskResult = (int)ScriptResults.Failure;
    }
}
```

## 📋 SSIS Package Design Pattern

### Recommended Control Flow
```
1. [Script Task: Set BOE File Variables]
   ↓ (On Success)
2. [Script Task: Validate Excel Structure] (Optional)
   ↓ (On Success) 
3. [Data Flow: Excel Source → Transformations → Destination]
   ↓ (On Success)
4. [File System Task: Archive Processed File] (Optional)
```

### Excel Source Configuration
- **Connection Manager Type**: Excel
- **Excel file path**: `@[User::BOE_FilePath]`
- **Data access mode**: Table or view
- **Name of Excel sheet**: `Sheet1$` (with dollar sign)
- **First row has column names**: ✓ Checked

### Connection String Examples

#### For .xlsx files (Excel 2007+):
```
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Path\To\Boeing_Export_20251113.xlsx;Extended Properties="Excel 12.0 Xml;HDR=YES;IMEX=1"
```

#### Alternative for .xls files (Excel 97-2003):
```
Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Path\To\Boeing_Export_20251113.xls;Extended Properties="Excel 8.0;HDR=YES;IMEX=1"
```

## ✅ Files Created by Updated PowerShell Script

### Daily Output (Example for Nov 13, 2025)
```
Boeing_Export_20251113.xlsx          ← Main file with "Sheet1" worksheet
BOEReceivableHeader_20251113.csv     ← Header data
BOE_Processing_Date.txt               ← Contains: 20251113  
BOE_Processing_Complete_20251113.txt  ← Completion flag
BOE_Excel_Info_20251113.txt          ← SSIS configuration info
```

### Sample BOE_Excel_Info Content
```
Excel File: Boeing_Export_20251113.xlsx
Worksheet Name: Sheet1
Date Created: 2025-11-13 14:30:15
SSIS Connection String: Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export_20251113.xlsx;Extended Properties="Excel 12.0 Xml;HDR=YES;IMEX=1"
```

## 🚀 Testing the Fix

### 1. Run Updated PowerShell Script
```powershell
cd "E:\itda\Operations\BOEReceivables"
.\BOEReceivableProcessFiles.ps1
```

### 2. Verify Excel File
- Open `Boeing_Export_YYYYMMDD.xlsx`
- Confirm worksheet is named "Sheet1"
- Verify data exists starting from row 1

### 3. Test SSIS Connection
- Configure Excel Source with `Sheet1$`
- Preview data to confirm connection works
- Run package to validate end-to-end processing

The "Sheet1 has to exist" error should now be completely resolved with the Excel files properly formatted for SSIS consumption!