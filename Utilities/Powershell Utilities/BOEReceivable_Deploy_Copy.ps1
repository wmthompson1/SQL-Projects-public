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

# Source and destination paths
$sourcePath = "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\"
$destPath = "\\SQL-BI-1\E$\ITDA\Operations\BOEReceivables\"

# Files to deploy
$files = @(
    "BOEReceivableProcessFiles.ps1",
    "BOE_Column_Rules.json",
    "BOEReceivable_Guardrails_ETL.ps1",
    "BOEReceivableProcessFilesV4.ps1 "
)

# Deploy files
foreach ($file in $files) {
    $sourceFile = Join-Path -Path $sourcePath -ChildPath $file
    $destFile = Join-Path -Path $destPath -ChildPath $file
    
    Copy-Item $sourceFile -Destination $destFile -Force
    
    $sourceSize = (Get-Item $sourceFile).Length
    $destSize = (Get-Item $destFile).Length
    
    if ($sourceSize -eq $destSize) {
        Write-Host "$file deployed ($destSize bytes)" -ForegroundColor Green
    } else {
        Write-Host "$file - SIZE MISMATCH!" -ForegroundColor Red
    }
}