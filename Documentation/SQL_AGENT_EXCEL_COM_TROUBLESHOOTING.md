# SQL Server Agent Excel COM Troubleshooting Guide

## Issue Summary
SQL Server Agent job "RunSSISPackageBOE" fails with Excel automation error:
```
Excel automation error: Failed to save final Excel file with any method: Unable to get the SaveAs property of the Workbook class
```

## Root Cause
Excel COM automation requires an interactive desktop session and specific permissions that SQL Server Agent service accounts typically don't have.

## Immediate Solutions

### Solution 1: DCOM Configuration (Recommended)
1. Run `dcomcnfg.exe` as Administrator
2. Navigate to: Component Services → Computers → My Computer → DCOM Config
3. Find "Microsoft Excel Application"
4. Right-click → Properties → Security tab
5. Set permissions for the SQL Server Agent service account:
   - **Launch and Activation Permissions**: Allow Local Launch, Local Activation
   - **Access Permissions**: Allow Local Access
   - **Authentication Level**: None (or same as SQL Server)

### Solution 2: Service Account Configuration
1. Change SQL Server Agent service account to one with:
   - "Log on as a service" right
   - "Allow log on locally" right (if running locally)
   - Local administrator privileges
2. Restart SQL Server Agent service

### Solution 3: Proxy Account Setup
1. Create a SQL Server Agent proxy account with Excel access
2. Configure the PowerShell job step to use this proxy
3. Steps in SSMS:
   ```sql
   -- Create credential
   USE master;
   CREATE CREDENTIAL [Excel_User_Credential] 
   WITH IDENTITY = 'domain\excel_user', 
   SECRET = 'password';
   
   -- Create proxy
   EXEC msdb.dbo.sp_add_proxy 
   @proxy_name = 'Excel_PowerShell_Proxy',
   @credential_name = 'Excel_User_Credential',
   @enabled = 1;
   
   -- Grant access to PowerShell subsystem
   EXEC msdb.dbo.sp_grant_proxy_to_subsystem 
   @proxy_name = 'Excel_PowerShell_Proxy',
   @subsystem_name = 'PowerShell';
   ```

### Solution 4: Alternative Execution Method
Instead of running PowerShell directly in SQL Server Agent:

1. **Option A**: Use Windows Task Scheduler
   - Create scheduled task running under interactive account
   - SQL Server job triggers the task via `schtasks` command

2. **Option B**: File-based triggering
   - SQL Server job creates trigger file
   - Separate Windows service/task monitors for trigger file
   - External process runs PowerShell script

## Quick Test Commands

### Test 1: Manual Execution
```powershell
# Run from command line as SQL Server Agent service account
cd "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
powershell -ExecutionPolicy Bypass -File ".\BOEReceivableProcessFiles.ps1"
```

### Test 2: DCOM Test
```powershell
# Test Excel COM creation
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)
$worksheet.Cells.Item(1,1) = "Test"
$testPath = "C:\temp\test.xlsx"
$workbook.SaveAs($testPath)
$workbook.Close()
$excel.Quit()
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
```

### Test 3: Service Account Check
```powershell
# Check current user context
whoami
whoami /groups
```

## Enhanced Script Features

The updated BOEReceivableProcessFiles.ps1 now includes:

1. **Multiple Save Fallbacks**:
   - Standard SaveAs with format
   - SaveAs without format
   - Temporary file approach
   - Use existing processed file
   - Copy fallback method

2. **SQL Server Agent Detection**:
   - Automatically detects when running under SQL Agent
   - Provides specific troubleshooting guidance

3. **Enhanced Error Handling**:
   - More detailed error messages
   - Multiple recovery attempts
   - Graceful degradation

## Monitoring and Validation

### Check if Files are Created
```powershell
# Verify today's output files exist
$dateStamp = Get-Date -Format "yyyyMMdd"
$processPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process"

Get-ChildItem $processPath -Filter "*$dateStamp*" | 
    Select-Object Name, Length, LastWriteTime |
    Format-Table -AutoSize
```

### Verify Excel File Structure
```powershell
# Check if Excel file has proper Sheet1 structure
$excelFile = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\Boeing_Export_$dateStamp.xlsx"
if (Test-Path $excelFile) {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $workbook = $excel.Workbooks.Open($excelFile)
    Write-Output "Worksheets: $($workbook.Worksheets.Count)"
    Write-Output "Sheet1 exists: $($workbook.Worksheets.Item(1).Name -eq 'Sheet1')"
    $workbook.Close()
    $excel.Quit()
}
```

## Alternative Solutions (If COM Continues to Fail)

### Option 1: ImportExcel PowerShell Module
Replace Excel COM with ImportExcel module:
```powershell
Install-Module ImportExcel -Force
Import-Module ImportExcel

# Convert CSV to Excel with proper worksheet naming
Import-Csv "data.csv" | Export-Excel "output.xlsx" -WorksheetName "Sheet1" -AutoSize
```

### Option 2: .NET Excel Libraries
Use EPPlus or ClosedXML libraries for Excel generation without COM.

### Option 3: SSIS-Only Processing
Modify SSIS package to process CSV files directly instead of Excel.

## Contact Information
For immediate assistance with SQL Server Agent Excel COM issues:
- Test manually first: Run script interactively to verify it works
- Check Windows Event Log for detailed error messages
- Review SQL Server Agent error logs
- Validate service account permissions

---
**Generated**: November 13, 2025  
**Status**: SQL Server Agent Excel COM troubleshooting guide  
**Script Version**: Enhanced with multiple save fallbacks and SQL Agent detection