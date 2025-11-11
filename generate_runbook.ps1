# PowerShell script to generate runbook.txt with Run_File_Diff.ps1 commands for all .xml files
# This scans the PriorVersion folder and creates exec commands for each XML file found

# Set the path to scan for XML files
$SourcePath = "Server\SSRS_Master\PriorVersion"
$RunbookFile = "runbook.txt"

# Get all .xml files from the source path
$xmlFiles = Get-ChildItem -Path $SourcePath -Filter "*.xml" | Sort-Object Name

# Create the runbook header
$runbookContent = @()
$runbookContent += "# SSRS Report Comparison Runbook"
$runbookContent += "# Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$runbookContent += "# Total XML files found: $($xmlFiles.Count)"
$runbookContent += "# =============================================="
$runbookContent += ""

# Generate exec command for each XML file
foreach ($xmlFile in $xmlFiles) {
    # Extract filename without extension
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($xmlFile.Name)
    
    # Create the PowerShell exec command
    $execCommand = "powershell.exe -File `"Utilities\Powershell Utilities\Run_File_Diff.ps1`" -FileName `"$fileName`" -FileExtension `".xml`" -Summary"
    
    $runbookContent += $execCommand
}

# Add quick check commands at the end
$runbookContent += "# =============================================="
$runbookContent += "# QUICK STATUS CHECK COMMANDS"
$runbookContent += "# =============================================="
$runbookContent += ""
$runbookContent += "# Check all log files for differences:"
$runbookContent += 'Get-ChildItem -Path "Utilities\Powershell Utilities\Logs\*-diff.txt" | ForEach-Object { Get-Content $_.FullName -TotalCount 2 }'
$runbookContent += ""
$runbookContent += "# Count files with differences:"
$runbookContent += 'Get-ChildItem -Path "Utilities\Powershell Utilities\Logs\*-diff.txt" | ForEach-Object { Get-Content $_.FullName -TotalCount 2 } | Where-Object { $_ -match "\[DIFFERENCES DETECTED\]" } | Measure-Object'
$runbookContent += ""
$runbookContent += "# List only files with differences:"
$runbookContent += 'Get-ChildItem -Path "Utilities\Powershell Utilities\Logs\*-diff.txt" | ForEach-Object { $content = Get-Content $_.FullName -TotalCount 2; if ($content[1] -match "\[DIFFERENCES DETECTED\]") { Write-Host "$($content[0]) - DIFFERENCES FOUND" -ForegroundColor Yellow } }'

# Write to runbook file
$runbookContent | Out-File -FilePath $RunbookFile -Encoding UTF8

Write-Host "Runbook generated: $RunbookFile" -ForegroundColor Green
Write-Host "Total XML files processed: $($xmlFiles.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "Sample commands from runbook:" -ForegroundColor Yellow
$runbookContent | Where-Object { $_ -match "powershell.exe" } | Select-Object -First 3 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
Write-Host "  ..." -ForegroundColor Gray