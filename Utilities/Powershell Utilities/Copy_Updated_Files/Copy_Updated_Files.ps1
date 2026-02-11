param (
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,
    [Parameter(Mandatory=$true)]
    [string]$RootPath,
    [Parameter(Mandatory=$true)]
    [string]$DestinationPath
)

# 1. Resolve absolute paths to ensure comparison works correctly
$absSource = (Resolve-Path $SourcePath).Path
$absDest = if (Test-Path $DestinationPath) { (Resolve-Path $DestinationPath).Path } else { $DestinationPath }

Write-Host "--- Copying Files from Source to Destination ---" -ForegroundColor Cyan

# 2. Get files, but EXCLUDE the destination path from the search to prevent infinite looping
$SourceFiles = Get-ChildItem -Path $SourcePath -Recurse -File | 
    Where-Object { 
        $_.LastWriteTime.Date -eq (Get-Date).Date -and 
        $_.FullName -notlike "$absDest*" 
    }

foreach ($File in $SourceFiles) {
    # Calculate relative path to maintain folder structure
    $RelativePath = $File.FullName.Substring($absSource.Length).TrimStart("\")
    $TargetPath = Join-Path $absDest $RelativePath
    $TargetDir = Split-Path $TargetPath

    if (!(Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir | Out-Null
    }

    Write-Host "Copying: $RelativePath" -ForegroundColor Green
    Copy-Item -Path $File.FullName -Destination $TargetPath -Force
}


# $s = 'C:\Users\williamt\Documents\SQL-Projects-Approval\product-ontime-analysis\hf-space-inventory-sqlgen'
# $r = 'C:\Users\williamt\Documents\SQL-Projects-Approval\product-ontime-analysis\'
# $d = 'C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\hf-space-inventory-sqlgen'
# ## Usage:
# Set-Location 'C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\'
# Set-Location 'Utilities\Powershell Utilities\Copy_Updated_Files\'
# .\Copy_Updated_Files.ps1 -SourcePath $s -RootPath $r -DestinationPath $d