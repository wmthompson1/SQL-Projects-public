# BOEReceivable_Test_Prep.ps1
## Description: ETL test preparation script - places blank test files in process folder
##              to prevent accidental processing of production data during testing
## Created: 2025-11-20
## By: William Thompson
##
## Purpose: Guard against errant ETL runs by copying blank test files:
##   TestFileCache\BLANK_BOE_Header.csv --> process\BOEReceivableHeader.csv
##   TestFileCache\BLANK_BOE_Receivable.xls --> process\Boeing_Export_YYYYMMDDV1.xls
##
## Exit Codes:
##   0 = Success - test files copied successfully
##   1 = Error - critical failure (missing source files, path access issues)
##   2 = Warning - partial success (one file failed but process can continue)

#Requires -Version 5.1

# Strict error handling
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# Script metadata
$ScriptVersion = "2.0"
$ScriptName = "BOEReceivable_Test_Prep"

# Initialize return code
$ExitCode = 0

#region Functions

function Write-Log {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message,
        
        [Parameter(Mandatory=$false)]
        [ValidateSet('INFO', 'SUCCESS', 'WARNING', 'ERROR')]
        [string]$Level = 'INFO'
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    switch ($Level) {
        'ERROR'   { Write-Host $logMessage -ForegroundColor Red }
        'WARNING' { Write-Host $logMessage -ForegroundColor Yellow }
        'SUCCESS' { Write-Host $logMessage -ForegroundColor Green }
        default   { Write-Host $logMessage -ForegroundColor White }
    }
}

function Test-DirectoryAccess {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [string]$DirectoryName
    )
    
    try {
        if (-not (Test-Path $Path)) {
            Write-Log "Creating missing directory: $DirectoryName at $Path" -Level WARNING
            New-Item -Path $Path -ItemType Directory -Force | Out-Null
            Write-Log "Directory created successfully: $Path" -Level SUCCESS
        }
        
        # Test write access
        $testFile = Join-Path $Path "test_access_$(Get-Date -Format 'yyyyMMddHHmmss').tmp"
        "test" | Out-File -FilePath $testFile -Force
        Remove-Item $testFile -Force
        
        return $true
    }
    catch {
        Write-Log "Cannot access or write to directory: $Path - $_" -Level ERROR
        return $false
    }
}

function Copy-FileWithValidation {
    param(
        [Parameter(Mandatory=$true)]
        [string]$SourcePath,
        
        [Parameter(Mandatory=$true)]
        [string]$DestinationPath,
        
        [Parameter(Mandatory=$true)]
        [string]$FileDescription
    )
    
    try {
        # Validate source exists
        if (-not (Test-Path $SourcePath)) {
            Write-Log "Source file not found: $SourcePath" -Level ERROR
            return $false
        }
        
        # Get source file info
        $sourceFile = Get-Item $SourcePath
        $sourceSize = [math]::Round($sourceFile.Length / 1KB, 2)
        Write-Log "Source file validated: $FileDescription ($sourceSize KB)" -Level INFO
        
        # Check if destination exists and backup if needed
        if (Test-Path $DestinationPath) {
            $destFile = Get-Item $DestinationPath
            $destSize = [math]::Round($destFile.Length / 1KB, 2)
            Write-Log "Existing destination file will be overwritten ($destSize KB)" -Level WARNING
            
            # Create backup of existing file
            $backupPath = "$DestinationPath.backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
            try {
                Copy-Item -Path $DestinationPath -Destination $backupPath -Force
                Write-Log "Backup created: $backupPath" -Level INFO
            }
            catch {
                Write-Log "Could not create backup (non-critical): $_" -Level WARNING
            }
        }
        
        # Perform copy
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Force -ErrorAction Stop
        
        # Validate copy
        if (Test-Path $DestinationPath) {
            $copiedFile = Get-Item $DestinationPath
            $copiedSize = [math]::Round($copiedFile.Length / 1KB, 2)
            
            if ($copiedFile.Length -eq $sourceFile.Length) {
                Write-Log "Successfully copied: $FileDescription ($copiedSize KB)" -Level SUCCESS
                return $true
            }
            else {
                Write-Log "File copied but size mismatch! Source: $sourceSize KB, Destination: $copiedSize KB" -Level ERROR
                return $false
            }
        }
        else {
            Write-Log "Copy operation completed but file not found at destination" -Level ERROR
            return $false
        }
    }
    catch {
        Write-Log "Failed to copy $FileDescription : $_" -Level ERROR
        return $false
    }
}

#endregion Functions

#region Main Script

try {
    Write-Log "========================================" -Level INFO
    Write-Log "$ScriptName v$ScriptVersion - Starting" -Level INFO
    Write-Log "========================================" -Level INFO
    Write-Log "Computer: $env:COMPUTERNAME" -Level INFO
    Write-Log "User: $env:USERNAME" -Level INFO
    Write-Log "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -Level INFO
    Write-Log "" -Level INFO
    
    # Determine environment and set project path
    if ($env:COMPUTERNAME -eq "WILLIAM-ADMINPC") {
        $project = "C:\Users\williamt\source\skillsinc\skills-inc-org\IT_TeamProject\Utilities\Powershell Utilities\"
        Write-Log "Environment: DEVELOPMENT (WILLIAM-ADMINPC)" -Level INFO
        Write-Log "Project Path: $project" -Level INFO
    } 
    else {
        $project = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
        Write-Log "Environment: PRODUCTION" -Level INFO
        Write-Log "Project Path: $project" -Level INFO
    }
    
    # Generate daily timestamp for file naming (SSIS compatible format)
    $dateStamp = Get-Date -Format "yyyyMMdd"
    $dailyStamp = "${dateStamp}V1"
    Write-Log "Daily Stamp: $dailyStamp" -Level INFO
    Write-Log "" -Level INFO
    
    # Define paths
    $processFolder = Join-Path $project "process"
    $testCacheFolder = Join-Path $project "TestFileCache"
    
    # Source files (blank test templates)
    $blankReceivableFile = Join-Path $testCacheFolder "BLANK_BOE_Receivable.xls"
    $blankHeaderFile = Join-Path $testCacheFolder "BLANK_BOE_Header.csv"
    
    # Destination files (ETL process folder)
    $targetReceivableFile = Join-Path $processFolder "Boeing_Export_$dailyStamp.xls"
    $targetHeaderFile = Join-Path $processFolder "BOEReceivableHeader.csv"
    
    Write-Log "=== Path Configuration ===" -Level INFO
    Write-Log "Source Files (TestFileCache):" -Level INFO
    Write-Log "  Receivable: $blankReceivableFile" -Level INFO
    Write-Log "  Header: $blankHeaderFile" -Level INFO
    Write-Log "" -Level INFO
    Write-Log "Destination Files (Process Folder):" -Level INFO
    Write-Log "  Receivable: $targetReceivableFile" -Level INFO
    Write-Log "  Header: $targetHeaderFile" -Level INFO
    Write-Log "" -Level INFO
    
    # Validate directory access
    Write-Log "=== Directory Access Validation ===" -Level INFO
    
    if (-not (Test-DirectoryAccess -Path $testCacheFolder -DirectoryName "TestFileCache")) {
        throw "Cannot access TestFileCache folder: $testCacheFolder"
    }
    Write-Log "TestFileCache folder accessible: $testCacheFolder" -Level SUCCESS
    
    if (-not (Test-DirectoryAccess -Path $processFolder -DirectoryName "Process")) {
        throw "Cannot access Process folder: $processFolder"
    }
    Write-Log "Process folder accessible: $processFolder" -Level SUCCESS
    Write-Log "" -Level INFO
    
    # Validate source files exist
    Write-Log "=== Source File Validation ===" -Level INFO
    
    $sourceFilesValid = $true
    
    if (-not (Test-Path $blankReceivableFile)) {
        Write-Log "MISSING: Blank receivable file not found: $blankReceivableFile" -Level ERROR
        $sourceFilesValid = $false
    }
    else {
        $fileSize = [math]::Round((Get-Item $blankReceivableFile).Length / 1KB, 2)
        Write-Log "FOUND: Blank receivable file ($fileSize KB)" -Level SUCCESS
    }
    
    if (-not (Test-Path $blankHeaderFile)) {
        Write-Log "MISSING: Blank header file not found: $blankHeaderFile" -Level ERROR
        $sourceFilesValid = $false
    }
    else {
        $fileSize = [math]::Round((Get-Item $blankHeaderFile).Length / 1KB, 2)
        Write-Log "FOUND: Blank header file ($fileSize KB)" -Level SUCCESS
    }
    
    if (-not $sourceFilesValid) {
        throw "One or more source files are missing from TestFileCache folder"
    }
    Write-Log "" -Level INFO
    
    # Copy files with validation
    Write-Log "=== File Copy Operations ===" -Level INFO
    
    $copyResults = @{
        Receivable = $false
        Header = $false
    }
    
    # Copy receivable file
    $copyResults.Receivable = Copy-FileWithValidation `
        -SourcePath $blankReceivableFile `
        -DestinationPath $targetReceivableFile `
        -FileDescription "Blank BOE Receivable (Boeing_Export_$dailyStamp.xls)"
    
    # Copy header file
    $copyResults.Header = Copy-FileWithValidation `
        -SourcePath $blankHeaderFile `
        -DestinationPath $targetHeaderFile `
        -FileDescription "Blank BOE Header (BOEReceivableHeader.csv)"
    
    Write-Log "" -Level INFO
    
    # Evaluate results
    Write-Log "=== Operation Summary ===" -Level INFO
    
    if ($copyResults.Receivable -and $copyResults.Header) {
        Write-Log "SUCCESS: All test files copied successfully" -Level SUCCESS
        Write-Log "ETL guardrails in place - process folder protected with blank test files" -Level SUCCESS
        $ExitCode = 0
    }
    elseif ($copyResults.Receivable -or $copyResults.Header) {
        Write-Log "PARTIAL SUCCESS: Some files copied, but one or more failed" -Level WARNING
        Write-Log "  Receivable: $(if($copyResults.Receivable){'SUCCESS'}else{'FAILED'})" -Level WARNING
        Write-Log "  Header: $(if($copyResults.Header){'SUCCESS'}else{'FAILED'})" -Level WARNING
        $ExitCode = 2
    }
    else {
        Write-Log "FAILURE: No files were copied successfully" -Level ERROR
        $ExitCode = 1
    }
    
    Write-Log "" -Level INFO
    Write-Log "Final Status: Exit Code $ExitCode" -Level INFO
    Write-Log "========================================" -Level INFO
    Write-Log "$ScriptName v$ScriptVersion - Complete" -Level INFO
    Write-Log "========================================" -Level INFO
}
catch {
    Write-Log "" -Level ERROR
    Write-Log "========================================" -Level ERROR
    Write-Log "CRITICAL ERROR OCCURRED" -Level ERROR
    Write-Log "========================================" -Level ERROR
    Write-Log "Error Message: $($_.Exception.Message)" -Level ERROR
    Write-Log "Error Location: $($_.InvocationInfo.ScriptLineNumber):$($_.InvocationInfo.OffsetInLine)" -Level ERROR
    Write-Log "Stack Trace: $($_.ScriptStackTrace)" -Level ERROR
    Write-Log "" -Level ERROR
    
    $ExitCode = 1
}
finally {
    # Cleanup and exit
    if ($ExitCode -eq 0) {
        Write-Log "Script completed successfully" -Level SUCCESS
    }
    else {
        Write-Log "Script completed with errors (Exit Code: $ExitCode)" -Level ERROR
    }
    
    exit $ExitCode
}

#endregion Main Script
