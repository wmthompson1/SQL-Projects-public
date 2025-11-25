## 
## file: BOEReceivable_Deploy_Copy.ps1  
## created: 11/25/2025
## by: William Thompson
##
##**********************************************************************************************
##  Description: Deployment script for BOE Receivable processing files
##  Copies development files to production location
##  
##  Date        Modified By         Change Description
##  ----------  ------------------  ------------------------------------------------------------
##  11/25/2025  William Thompson    Created - Deploy PowerShell script and JSON rules to production
##**********************************************************************************************

Write-Output ""
Write-Output "=== BOE RECEIVABLE DEPLOYMENT SCRIPT ==="
Write-Output "Deploying files to production..."
Write-Output ""

$ErrorActionPreference = "Stop"

# Source (Development) and Destination (Production) paths
$devPath = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\"
$prodPath = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\"

# Files to deploy
$filesToDeploy = @(
    @{
        Name = "BOEReceivableProcessFiles.ps1"
        Description = "Main ETL processing script"
    },
    @{
        Name = "BOE_Column_Rules.json"
        Description = "Column formatting rules configuration"
    }
)

# Deployment summary
$successCount = 0
$failCount = 0
$deploymentResults = @()

foreach ($file in $filesToDeploy) {
    $fileName = $file.Name
    $description = $file.Description
    $sourcePath = Join-Path -Path $devPath -ChildPath $fileName
    $destPath = Join-Path -Path $prodPath -ChildPath $fileName
    
    Write-Output "-------------------------------------------------------------------"
    Write-Output "Deploying: $fileName"
    Write-Output "Description: $description"
    Write-Output "Source: $sourcePath"
    Write-Output "Destination: $destPath"
    
    try {
        # Check if source file exists
        if (-not (Test-Path $sourcePath)) {
            throw "Source file not found: $sourcePath"
        }
        
        # Get source file info
        $sourceFile = Get-Item $sourcePath
        $sourceSize = [math]::Round($sourceFile.Length / 1KB, 2)
        $sourceModified = $sourceFile.LastWriteTime
        
        Write-Output "Source file size: $sourceSize KB"
        Write-Output "Source last modified: $sourceModified"
        
        # Backup existing production file if it exists
        if (Test-Path $destPath) {
            $backupPath = $destPath + ".backup_" + (Get-Date -Format "yyyyMMdd_HHmmss")
            Write-Output "Backing up existing production file to: $backupPath"
            Copy-Item -Path $destPath -Destination $backupPath -Force
        }
        
        # Copy file to production
        Copy-Item -Path $sourcePath -Destination $destPath -Force -ErrorAction Stop
        
        # Verify deployment
        if (Test-Path $destPath) {
            $destFile = Get-Item $destPath
            $destSize = [math]::Round($destFile.Length / 1KB, 2)
            
            if ($sourceFile.Length -eq $destFile.Length) {
                Write-Output "SUCCESS: File deployed successfully ($destSize KB)"
                $successCount++
                $deploymentResults += [PSCustomObject]@{
                    File = $fileName
                    Status = "SUCCESS"
                    Size = "$destSize KB"
                    Modified = $destFile.LastWriteTime
                }
            } else {
                throw "File size mismatch - deployment may be incomplete"
            }
        } else {
            throw "Destination file not found after copy operation"
        }
    }
    catch {
        Write-Error "FAILED: $($_.Exception.Message)"
        $failCount++
        $deploymentResults += [PSCustomObject]@{
            File = $fileName
            Status = "FAILED"
            Size = "N/A"
            Modified = "N/A"
            Error = $_.Exception.Message
        }
    }
    
    Write-Output ""
}

# Deployment Summary
Write-Output "==================================================================="
Write-Output "DEPLOYMENT SUMMARY"
Write-Output "==================================================================="
Write-Output "Total files: $($filesToDeploy.Count)"
Write-Output "Successful: $successCount"
Write-Output "Failed: $failCount"
Write-Output ""

# Display results table
$deploymentResults | Format-Table -AutoSize

if ($failCount -eq 0) {
    Write-Output "==================================================================="
    Write-Output "ALL FILES DEPLOYED SUCCESSFULLY!"
    Write-Output "==================================================================="
    Write-Output ""
    Write-Output "Next steps:"
    Write-Output "1. Test the SQL Agent job with the updated files"
    Write-Output "2. Verify SSIS package processes without errors"
    Write-Output "3. Check SQL Server destination table for correct data"
    Write-Output ""
} else {
    Write-Warning "Some files failed to deploy. Review errors above."
    throw "Deployment incomplete - $failCount file(s) failed"
}

Write-Output "Deployment script completed: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
