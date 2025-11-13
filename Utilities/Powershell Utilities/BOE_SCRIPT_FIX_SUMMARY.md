# BOE Receivable Process Script - File Locking Fix

## Problem Summary
The original BOEReceivableProcessFiles.ps1 script was failing with the error:
```
The process cannot access the file '\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export.xlsx' because it is being used by another process.
```

This is a common issue with Excel COM automation where Excel processes don't properly release file handles, even when no visible Excel processes are running.

## Root Causes Identified

### 1. **Excel COM Object Cleanup Issues**
- Original script didn't properly release all COM objects
- Missing garbage collection after COM object disposal
- Excel processes could remain running invisibly

### 2. **File Handle Management**
- No retry logic for file operations
- No validation that files are actually available before operations
- Missing process cleanup before script execution

### 3. **Error Recovery**
- Limited error handling for file locking scenarios
- No mechanism to detect and resolve file locks
- Script would fail immediately on first file access error

## Implemented Solutions

### 1. **Enhanced Excel Process Management**
```powershell
function Stop-ExcelProcesses {
    param([switch]$Force)
    # Finds and terminates all Excel processes
    # Graceful shutdown first, force kill if necessary
    # Waits for file handles to be released
}
```

### 2. **File Lock Detection and Retry Logic**
```powershell
function Wait-ForFileAvailable {
    param([string]$FilePath, [int]$MaxRetries = 10, [int]$DelaySeconds = 2)
    # Tests file availability by attempting exclusive access
    # Retries with progressive cleanup strategies
    # Fails gracefully after maximum attempts
}
```

### 3. **Robust File Operations**
```powershell
function Remove-FileWithRetry {
    param([string]$FilePath, [int]$MaxRetries = 5)
    # Attempts file removal with retry logic
    # Includes Excel process cleanup at retry midpoint
    # Comprehensive error reporting
}
```

### 4. **Enhanced COM Object Cleanup**
- Proper disposal of all COM objects in finally blocks
- Explicit garbage collection after COM operations
- Multiple cleanup passes to ensure complete release

### 5. **Proactive Process Management**
- Excel process cleanup at script start
- Aggressive cleanup during retry operations
- Final cleanup at script completion

## Key Improvements

### **Before (Original Script)**
```powershell
# Basic cleanup - could leave processes running
$Workbook.close($false) 
$Workbook,$Worksheet, $Excel | ForEach-Object {
  [void] [Runtime.Interopservices.Marshal]::ReleaseComObject($_)
}
$Excel.quit()
spps -n excel  # Kill all Excel processes (risky)
```

### **After (Fixed Script)**
```powershell
# Comprehensive cleanup with error handling
try {
    if ($Workbook -ne $null) {
        $Workbook.Close($false)
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Workbook) | Out-Null
    }
    if ($Excel -ne $null) {
        $Excel.Quit()
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null
    }
}
catch { Write-Warning "Error during Excel cleanup: $_" }

# Force garbage collection
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
[System.GC]::Collect()

# Controlled process cleanup
Stop-ExcelProcesses -Force
```

## Usage Instructions

### 1. **Replace the Original Script**
- Backup the original: `BOEReceivableProcessFiles.ps1` → `BOEReceivableProcessFiles_BACKUP.ps1`
- Deploy the fixed version: `BOEReceivableProcessFiles_Fixed.ps1` → `BOEReceivableProcessFiles.ps1`

### 2. **Update Scheduled Task**
The fixed script includes enhanced logging, so you'll see more detailed output:
```
Starting BOE Receivable Process - 11/13/2025 10:30:00 AM
Cleaning up Excel processes...
No Excel processes found
Cleaning up old files...
Cleaned: \\skillsinc.local\...\Boeing_Export.xlsx
Setting up template files...
Processing input file...
Starting Excel automation...
...
BOE Receivable processing completed successfully - 11/13/2025 10:35:00 AM
```

### 3. **Monitor for Success**
The fixed script provides:
- **Detailed Progress Logging**: Track each processing stage
- **File Operation Status**: Confirmation of successful file operations  
- **Error Context**: Clear error messages if issues occur
- **Completion Summary**: List of output files created

## File Structure (Unchanged)
The script maintains the same three-stage processing:
```
Input/
├── BOE.xls (incoming file)

Process/
├── TEMPLATE_BOE_Receivable.xlsx
├── TEMPLATE_BOE_Header.csv
├── Working files (temporary)

ProcessComplete/
├── BOE.xls (archive)
├── Boeing_Export.xlsx (final output)
├── BOEReceivableHeader.csv (header data)
```

## Emergency Recovery

If the script still encounters issues:

### 1. **Manual Excel Cleanup**
```powershell
# Run this in PowerShell as Administrator
Get-Process -Name "EXCEL" | Stop-Process -Force
Start-Sleep -Seconds 5
```

### 2. **File Lock Detection**
```powershell
# Check if file is locked
$file = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export.xlsx"
try {
    $stream = [System.IO.File]::Open($file, 'Open', 'ReadWrite', 'None')
    $stream.Close()
    Write-Host "File is available"
} catch {
    Write-Host "File is locked: $_"
}
```

### 3. **Network Share Validation**
```powershell
# Verify network path accessibility
Test-Path "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
```

## Testing Recommendations

1. **Run Manually First**: Execute the fixed script manually to verify operation
2. **Check Output Files**: Confirm all expected files are created in ProcessComplete
3. **Monitor Logs**: Review enhanced logging output for any warnings
4. **Schedule Gradually**: Start with longer intervals, then optimize timing

The fixed script should resolve the file locking issues and provide much more reliable operation for your scheduled job.