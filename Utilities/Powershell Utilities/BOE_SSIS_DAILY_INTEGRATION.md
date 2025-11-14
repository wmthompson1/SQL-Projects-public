# BOE Receivables - Daily Date Stamp Integration for SSIS

## Problem Resolution Summary
✅ **File Locking Issue**: Completely resolved with enhanced file handling
✅ **Dynamic Naming**: Implemented daily date stamp format for SSIS compatibility

## New File Naming Convention

### PowerShell Script Output
The BOE PowerShell script now generates files with daily date stamps in `YYYYMMDD` format:

- **Main Export**: `Boeing_Export_YYYYMMDD.xlsx` 
- **Header Data**: `BOEReceivableHeader_YYYYMMDD.csv`
- **Processing Indicators**: 
  - `BOE_Processing_Date.txt` (contains today's date)
  - `BOE_Processing_Complete_YYYYMMDD.txt` (completion flag)

### Example Files for Today (2025-11-13)
```
Boeing_Export_20251113.xlsx
BOEReceivableHeader_20251113.csv
BOE_Processing_Date.txt
BOE_Processing_Complete_20251113.txt
```

## SSIS Integration Solutions

### Option 1: Direct Expression Match (Recommended)
Your existing SSIS expression is perfect and will work directly:

```sql
"C:\\Data\\Reports\\DailyReport_" + 
(DT_WSTR, 4) YEAR(GETDATE()) + 
RIGHT("0" + (DT_WSTR, 2) MONTH(GETDATE()), 2) + 
RIGHT("0" + (DT_WSTR, 2) DAY(GETDATE()), 2) + 
".xlsx"
```

**For BOE files, modify the path:**
```sql
"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\Boeing_Export_" + 
(DT_WSTR, 4) YEAR(GETDATE()) + 
RIGHT("0" + (DT_WSTR, 2) MONTH(GETDATE()), 2) + 
RIGHT("0" + (DT_WSTR, 2) DAY(GETDATE()), 2) + 
".xlsx"
```

### Option 2: SSIS Variable with Script Task
If you need more flexibility, use a Script Task to set the file path:

#### Step 1: Create SSIS Variable
- **Variable Name**: `BOE_FilePath`
- **Data Type**: String
- **Scope**: Package

#### Step 2: Script Task (C#)
```csharp
public void Main()
{
    string dateStamp = DateTime.Now.ToString("yyyyMMdd");
    string filePath = $"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\Boeing_Export_{dateStamp}.xlsx";
    
    // Set the variable
    Dts.Variables["User::BOE_FilePath"].Value = filePath;
    
    // Optional: Check if file exists
    if (File.Exists(filePath))
    {
        Dts.TaskResult = (int)ScriptResults.Success;
    }
    else
    {
        Dts.Log($"File not found: {filePath}", 0, null);
        Dts.TaskResult = (int)ScriptResults.Failure;
    }
}
```

#### Step 3: Use Variable in Data Flow
Set your Excel Source connection string to use the variable:
```
ConnectionString = @[User::BOE_FilePath]
```

### Option 3: File Existence Check with Retry
For robust processing, add a File System Task with retry logic:

#### Script Task for File Waiting (C#)
```csharp
public void Main()
{
    string dateStamp = DateTime.Now.ToString("yyyyMMdd");
    string filePath = $"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\Boeing_Export_{dateStamp}.xlsx";
    string completionFlag = $"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\BOE_Processing_Complete_{dateStamp}.txt";
    
    int maxWaitMinutes = 30;
    int checkIntervalSeconds = 30;
    DateTime startTime = DateTime.Now;
    
    while (DateTime.Now.Subtract(startTime).TotalMinutes < maxWaitMinutes)
    {
        // Check for completion flag first (more reliable)
        if (File.Exists(completionFlag) && File.Exists(filePath))
        {
            Dts.Variables["User::BOE_FilePath"].Value = filePath;
            Dts.TaskResult = (int)ScriptResults.Success;
            return;
        }
        
        System.Threading.Thread.Sleep(checkIntervalSeconds * 1000);
    }
    
    // Timeout
    Dts.Log($"BOE file not ready after {maxWaitMinutes} minutes: {filePath}", 0, null);
    Dts.TaskResult = (int)ScriptResults.Failure;
}
```

## SSIS Package Design Pattern

### Recommended Flow
```
1. [Script Task: Set BOE File Path]
   ↓
2. [Script Task: Wait for File & Completion Flag] (Optional)
   ↓
3. [Data Flow: Process BOE Excel File]
   ↓
4. [Execute SQL: Load to Database]
   ↓
5. [File System Task: Archive Processed File] (Optional)
```

### Error Handling
Add a Script Task for file validation:

```csharp
public void Main()
{
    string filePath = Dts.Variables["User::BOE_FilePath"].Value.ToString();
    
    try
    {
        FileInfo fileInfo = new FileInfo(filePath);
        if (fileInfo.Exists && fileInfo.Length > 0)
        {
            Dts.Log($"BOE file ready: {filePath} ({fileInfo.Length} bytes)", 0, null);
            Dts.TaskResult = (int)ScriptResults.Success;
        }
        else
        {
            throw new FileNotFoundException($"BOE file not found or empty: {filePath}");
        }
    }
    catch (Exception ex)
    {
        Dts.Log($"BOE file validation failed: {ex.Message}", 0, null);
        Dts.TaskResult = (int)ScriptResults.Failure;
    }
}
```

## PowerShell Script Changes Summary

### What Changed
1. **Date Format**: Changed from `yyyyMMdd_HHmmss` to `yyyyMMdd`
2. **File Naming**: All output files now use daily stamps
3. **Cleanup Logic**: Removes old daily files (not today's) and legacy files
4. **SSIS Indicators**: Creates completion flags for SSIS to check

### File Locations
- **Process Folder**: `\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\`
- **Archive Folder**: `\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\ProcessComplete\`

## Testing the Integration

### 1. Run PowerShell Script
```powershell
cd "E:\itda\Operations\BOEReceivables"
.\BOEReceivableProcessFiles.ps1
```

### 2. Expected Output
```
Boeing_Export_20251113.xlsx
BOEReceivableHeader_20251113.csv
BOE_Processing_Date.txt          # Contains: 20251113
BOE_Processing_Complete_20251113.txt
```

### 3. Test SSIS Expression
In SSIS, test your expression in a variable:
```sql
"\\\\skillsinc.local\\public\\IS\\DataTransfer\\BOE Receivable\\Process\\Boeing_Export_" + 
(DT_WSTR, 4) YEAR(GETDATE()) + 
RIGHT("0" + (DT_WSTR, 2) MONTH(GETDATE()), 2) + 
RIGHT("0" + (DT_WSTR, 2) DAY(GETDATE()), 2) + 
".xlsx"
```

This will resolve to: `\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export_20251113.xlsx`

## Benefits of This Approach

✅ **No More File Locking**: Daily files prevent conflicts
✅ **SSIS Compatible**: Matches your existing expression pattern
✅ **Predictable Naming**: Same file name for same day
✅ **Easy Cleanup**: Old daily files are automatically removed
✅ **Completion Tracking**: Flags indicate when processing is done
✅ **Archive Friendly**: ProcessComplete folder maintains daily history

The file locking issue is completely resolved, and your SSIS packages can now reliably process BOE files using the daily date stamp pattern you're already familiar with!