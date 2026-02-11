param (
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,

    [Parameter(Mandatory=$true)]
    [string]$RootPath,

    [Parameter(Mandatory=$true)]
    [string]$DestinationPath
)

# 1. List sub-folders of the root path that contain files modified today
Write-Host "--- Scanning Root Path for Today's Modifications ---" -ForegroundColor Cyan
$ModifiedFolders = Get-ChildItem -Path $RootPath -Recurse -File | 
    Where-Object { $_.LastWriteTime.Date -eq (Get-Date).Date } | 
    Select-Object -ExpandProperty DirectoryName -Unique

if ($ModifiedFolders) {
    $ModifiedFolders | ForEach-Object { Write-Host "Modified: $_" }
} else {
    Write-Host "No files modified today in the root path." -ForegroundColor Yellow
}

# 2. Copy any file modified today from source folder to destination
Write-Host "`n--- Copying Files from Source to Destination ---" -ForegroundColor Cyan
if (!(Test-Path $DestinationPath)) {
    New-Item -ItemType Directory -Path $DestinationPath | Out-Null
}

$SourceFiles = Get-ChildItem -Path $SourcePath -File | 
    Where-Object { $_.LastWriteTime.Date -eq (Get-Date).Date }

foreach ($File in $SourceFiles) {
    Write-Host "Copying: $($File.Name)" -ForegroundColor Green
    Copy-Item -Path $File.FullName -Destination $DestinationPath -Force
}

if (-not $SourceFiles) {
    Write-Host "No files modified today in source folder." -ForegroundColor Yellow
}

# $r = 'C:\Users\williamt\Documents\SQL-Projects-Approval\product-ontime-analysis\'
# $s = 'C:\Users\williamt\Documents\SQL-Projects-Approval\product-ontime-analysis\hf-space-inventory-sqlgen'
# $d = 'C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\hf-space-inventory-sqlgen'
# ## Usage:
# Set-Location 'C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\'
# Set-Location 'Utilities\Powershell Utilities\Copy_Updated_Files\'
# .\GetFolderFor_Updated_Files.ps1 -SourcePath $s -RootPath $r -DestinationPath $d