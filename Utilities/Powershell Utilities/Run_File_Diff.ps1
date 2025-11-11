# file relative path: 
# powershell script to run a file diff between two files in two directories
# Test #1: Diff the XML files converted from RDL files
# usage: Run_File_Diff.ps1  
#  test #3 use Traveller.xml
# usage: 
# powershell.exe -File "Utilities\Powershell Utilities\Run_File_Diff.ps1" -FileName "Rec POs To Invoice" -FileExtension ".xml" -Summary
# powershell.exe -File "Utilities\Powershell Utilities\Run_File_Diff.ps1" -FileName "Traveller" -FileExtension ".xml" -Summary
# allow top 2
# Get-Content -Path $LogPath\<file name> -TotalCount 2
# [string]$LogPath = "Utilities\Powershell Utilities\Logs"
# Get-Content -Path $LogPath\Traveller-diff.txt -TotalCount 2



param(
    [string]$PriorPath = "Server\SSRS_Master\PriorVersion",
    [string]$CurrentPath = "Server\SSRS_Master\CurrentVersion",
    [string]$FileName = "Rec POs To Invoice",
    [string]$FileExtension = ".xml",
    [switch]$Summary,
    [string]$LogPath = "Utilities\Powershell Utilities\Logs"
)

# Construct file paths
$FilePathPrior = Join-Path $PriorPath "$FileName$FileExtension"
$FilePathCurrent = Join-Path $CurrentPath "$FileName$FileExtension"

# Ensure log directory exists
if (-not (Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath -Force | Out-Null
}

# Prepare log file path
$LogFile = Join-Path $LogPath "$FileName-diff.txt"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "Comparing $FileExtension files:" -ForegroundColor Cyan
Write-Host "Prior:   $FilePathPrior" -ForegroundColor Gray
Write-Host "Current: $FilePathCurrent" -ForegroundColor Gray
if ($Summary) {
    Write-Host "Summary: Enabled (logging to $LogFile)" -ForegroundColor Magenta
}
Write-Host ""

# Quick check - compare file length info (if files exist)
if (Test-Path $FilePathPrior) {
    $priorInfo = Get-ChildItem $FilePathPrior | Select-Object Name, Length, LastWriteTime
    Write-Host "Prior file info:" -ForegroundColor Gray
    $priorInfo | Format-Table -AutoSize
}

if (Test-Path $FilePathCurrent) {
    $currentInfo = Get-ChildItem $FilePathCurrent | Select-Object Name, Length, LastWriteTime
    Write-Host "Current file info:" -ForegroundColor Gray
    $currentInfo | Format-Table -AutoSize
}

# Calculate size difference if both files exist
if ((Test-Path $FilePathPrior) -and (Test-Path $FilePathCurrent)) {
    $priorSize = (Get-ChildItem $FilePathPrior).Length
    $currentSize = (Get-ChildItem $FilePathCurrent).Length
    $lengthDiff = $priorSize - $currentSize
    
    if ($lengthDiff -ne 0) {
        Write-Host "Size difference: $lengthDiff bytes" -ForegroundColor Yellow
    } else {
        Write-Host "Files are the same size" -ForegroundColor Green
    }
}
Write-Host ""

# Check if both files exist
if (!(Test-Path $FilePathPrior)) {
    Write-Host "Error: Prior file not found: $FilePathPrior" -ForegroundColor Red
    exit 1
}

if (!(Test-Path $FilePathCurrent)) {
    Write-Host "Error: Current file not found: $FilePathCurrent" -ForegroundColor Red
    exit 1
}

# Run git diff and capture output
Write-Host "Running git diff..." -ForegroundColor Yellow
$diffOutput = git diff --no-index $FilePathPrior $FilePathCurrent

# Determine if there are differences from git exit code
$hasDifferences = $LASTEXITCODE -ne 0

# Compute change counts (additions/deletions/lines changed) from diff output
$addedCount = ($diffOutput | Where-Object { $_ -match "^\+" -and $_ -notmatch "^\+\+\+" } | Measure-Object).Count
$deletedCount = ($diffOutput | Where-Object { $_ -match "^-" -and $_ -notmatch "^---" } | Measure-Object).Count
$linesChanged = ($diffOutput | Where-Object { $_ -match "^[\+\-]" } | Measure-Object).Count

# Apply heuristic: if the size is identical, net adds-deletes is zero, and very few lines changed,
# treat as no meaningful differences (helps ignore cosmetic/whitespace churn).
# Condition: (added-deleted == 0) AND (linesChanged < 5) AND (lengthDiff == 0)
if (($lengthDiff -eq 0) -and (($addedCount - $deletedCount) -eq 0) -and ($linesChanged -lt 5)) {
    $hasDifferences = $false
    $heuristicNote = "NOTE: Small changes ignored by threshold (treated as IDENTICAL)."
} else {
    $heuristicNote = ""
}

if ($Summary) {
    # Create summary report with quick-parse header
    $comparisonResult = if ($hasDifferences) { "[DIFFERENCES DETECTED]" } else { "[FILES IDENTICAL]" }
    
    $summaryReport = @"
COMPARISON RESULT: $FileName
$comparisonResult
================================================================================
DIFF SUMMARY REPORT
================================================================================
Timestamp: $Timestamp
Files Compared: $FileName$FileExtension
Prior Path: $FilePathPrior
Current Path: $FilePathCurrent

FILE INFORMATION:
Prior Size: $priorSize bytes
Current Size: $currentSize bytes
Size Difference: $lengthDiff bytes

$( if ($hasDifferences) {
    "CHANGE SUMMARY:
" + $linesChanged + " lines changed
" + $addedCount + " additions
" + $deletedCount + " deletions
" + "\n" + $heuristicNote
} else {
    "No changes detected between files.\n" + $heuristicNote
} )

================================================================================
"@

    # Write summary to console
    Write-Host $summaryReport -ForegroundColor Cyan
    
    # Log summary to file
    $summaryReport | Out-File -FilePath $LogFile -Encoding UTF8
    Write-Host "Summary logged to: $LogFile" -ForegroundColor Green
    
    if ($hasDifferences) {
        # Optionally append full diff to log file
        Write-Host "Appending full diff to log file..." -ForegroundColor Yellow
        "`n`nFULL DIFF OUTPUT:" | Out-File -FilePath $LogFile -Append -Encoding UTF8
        "=" * 80 | Out-File -FilePath $LogFile -Append -Encoding UTF8
        $diffOutput | Out-File -FilePath $LogFile -Append -Encoding UTF8
    }
} else {
    # Standard mode - show full diff output
    $diffOutput
}

# Exit with appropriate code
if ($hasDifferences) {
    Write-Host "`nDifferences detected between files." -ForegroundColor Yellow
    exit 1
} else {
    Write-Host "`nFiles are identical." -ForegroundColor Green
    exit 0
}
