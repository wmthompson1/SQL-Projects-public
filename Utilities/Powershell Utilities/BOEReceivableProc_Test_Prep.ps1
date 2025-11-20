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
        [Parameter(Mandatory=$false)]
        [AllowEmptyString()]
        [string]$Message = "",
        
        [Parameter(Mandatory=$false)]
        [ValidateSet('INFO', 'SUCCESS', 'WARNING', 'ERROR')]
        [string]$Level = 'INFO'
    )
    
    # Handle empty messages (blank lines)
    if ([string]::IsNullOrWhiteSpace($Message)) {
        Write-Host ""
        return
    }
    
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
            New-Item -Path $Path -ItemType Directory -Force | Out-Null
        }
        
        # Test write access
        $testFile = Join-Path $Path "test_access_$(Get-Date -Format 'yyyyMMddHHmmss').tmp"
        "test" | Out-File -FilePath $testFile -Force
        Remove-Item $testFile -Force
        
        return $true
    }
    catch {
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
            return $false
        }
        
        # Get source file info
        $sourceFile = Get-Item $SourcePath
        
        # Create backup if destination exists
        if (Test-Path $DestinationPath) {
            $backupPath = "$DestinationPath.backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
            try {
                Copy-Item -Path $DestinationPath -Destination $backupPath -Force
            }
            catch {
                # Backup failure is non-critical
            }
        }
        
        # Perform copy
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Force -ErrorAction Stop
        
        # Validate copy
        if (Test-Path $DestinationPath) {
            $copiedFile = Get-Item $DestinationPath
            if ($copiedFile.Length -eq $sourceFile.Length) {
                return $true
            }
            else {
                return $false
            }
        }
        else {
            return $false
        }
    }
    catch {
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
        $project = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\"
        Write-Log "Environment: DEVELOPMENT (WILLIAM-ADMINPC)" -Level INFO
        Write-Log "Project Path: $project" -Level INFO
    } 
    else {
        $project = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"
        Write-Log "Environment: PRODUCTION" -Level INFO
        Write-Log "Project Path: $project" -Level INFO
    }
    
    # Generate timestamps for file naming
    $dateStamp = Get-Date -Format "yyyyMMdd"
    $dailyStamp = "${dateStamp}V1"
    $timestampFull = Get-Date -Format "yyyyMMdd-HHmmss"
    Write-Log "Daily Stamp: $dailyStamp" -Level INFO
    Write-Log "Full Timestamp: $timestampFull" -Level INFO
    Write-Log "" -Level INFO
    
    # Define paths
    $processFolder = Join-Path $project "process"
    $testCacheFolder = Join-Path $project "TestFileCache"
    
    # Source files (blank test templates)
    $blankReceivableFile = Join-Path $testCacheFolder "BLANK_BOE_Receivable.xls"
    $blankHeaderFile = Join-Path $testCacheFolder "BLANK_BOE_Header.csv"
    
    # Intermediate and final destination files
    $intermediateReceivableFile = Join-Path $processFolder "Boeing_Export_$timestampFull.xls"
    $targetReceivableFile = Join-Path $processFolder "Boeing_Export_$dailyStamp.xls"
    $targetHeaderFile = Join-Path $processFolder "BOEReceivableHeader.csv"
    
    Write-Log "=== Path Configuration ===" -Level INFO
    Write-Log "Source Files (TestFileCache):" -Level INFO
    Write-Log "  Receivable: $blankReceivableFile" -Level INFO
    Write-Log "  Header: $blankHeaderFile" -Level INFO
    Write-Log "" -Level INFO
    Write-Log "Destination Files (Process Folder):" -Level INFO
    Write-Log "  Intermediate: $intermediateReceivableFile" -Level INFO
    Write-Log "  Final Receivable: $targetReceivableFile" -Level INFO
    Write-Log "  Header: $targetHeaderFile" -Level INFO
    
    # Validate directory access (silent)
    if (-not (Test-DirectoryAccess -Path $testCacheFolder -DirectoryName "TestFileCache")) {
        throw "Cannot access TestFileCache folder: $testCacheFolder"
    }
    
    if (-not (Test-DirectoryAccess -Path $processFolder -DirectoryName "Process")) {
        throw "Cannot access Process folder: $processFolder"
    }
    
    # Validate source files exist (silent)
    if (-not (Test-Path $blankReceivableFile)) {
        throw "Blank receivable file not found: $blankReceivableFile"
    }
    
    if (-not (Test-Path $blankHeaderFile)) {
        throw "Blank header file not found: $blankHeaderFile"
    }
    
    # Copy files (silent)
    $copyResults = @{
        Intermediate = $false
        Receivable = $false
        Header = $false
    }
    
    # Step 1: Copy blank template to intermediate timestamped file
    $copyResults.Intermediate = Copy-FileWithValidation `
        -SourcePath $blankReceivableFile `
        -DestinationPath $intermediateReceivableFile `
        -FileDescription "Intermediate BOE Receivable (Boeing_Export_$timestampFull.xls)"
    
    # Step 2: Copy intermediate to final daily file (only if step 1 succeeded)
    if ($copyResults.Intermediate) {
        $copyResults.Receivable = Copy-FileWithValidation `
            -SourcePath $intermediateReceivableFile `
            -DestinationPath $targetReceivableFile `
            -FileDescription "Final BOE Receivable (Boeing_Export_$dailyStamp.xls)"
    }
    
    # Step 3: Copy header file
    $copyResults.Header = Copy-FileWithValidation `
        -SourcePath $blankHeaderFile `
        -DestinationPath $targetHeaderFile `
        -FileDescription "Blank BOE Header (BOEReceivableHeader.csv)"
    
    # Evaluate results (silent)
    if ($copyResults.Receivable -and $copyResults.Header) {
        $ExitCode = 0
    }
    elseif ($copyResults.Receivable -or $copyResults.Header) {
        $ExitCode = 2
    }
    else {
        $ExitCode = 1
    }
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
    exit $ExitCode
}

#endregion Main Script
