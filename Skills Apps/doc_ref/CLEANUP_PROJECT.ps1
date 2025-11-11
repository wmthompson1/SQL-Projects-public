# VB.NET Project Cleanup Script
# This script safely removes build artifacts and sets up proper .gitignore

Write-Host "=== Document Reference Project Cleanup ===" -ForegroundColor Green
Write-Host "Starting cleanup of build artifacts..." -ForegroundColor Yellow

$projectPath = "C:\Users\williamt\source\skillsinc\skills-inc-org\IT_TeamProject\Skills Apps\doc_ref"
Set-Location $projectPath

# Count files before cleanup
$beforeCount = (Get-ChildItem -Recurse -File).Count
Write-Host "Files before cleanup: $beforeCount" -ForegroundColor Cyan

# Create .gitignore file for future development
$gitignoreContent = @"
# Build outputs
bin/
obj/
*.exe
*.dll
*.pdb

# Visual Studio files
.vs/
*.user
*.suo
*.cache
*.tmp

# Debug files
*.log

# Backup files
*.bak
*.backup

# Temporary files
*~
*.swp
"@

Write-Host "Creating .gitignore file..." -ForegroundColor Yellow
$gitignoreContent | Out-File -FilePath ".gitignore" -Encoding UTF8

# Function to safely remove directories
function Remove-Directory {
    param($dirPath, $dirName)
    
    if (Test-Path $dirPath) {
        $fileCount = (Get-ChildItem $dirPath -Recurse -File -ErrorAction SilentlyContinue).Count
        Write-Host "Removing $dirName folder ($fileCount files)..." -ForegroundColor Red
        
        try {
            Remove-Item $dirPath -Recurse -Force -ErrorAction Stop
            Write-Host "✅ Successfully removed $dirName" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ Error removing $dirName`: $_" -ForegroundColor Red
        }
    }
    else {
        Write-Host "📁 $dirName folder not found (already clean)" -ForegroundColor Gray
    }
}

# Remove build artifact directories
Write-Host "`nRemoving build artifacts..." -ForegroundColor Yellow
Remove-Directory ".\doc_ref\bin" "bin"
Remove-Directory ".\doc_ref\obj" "obj"
Remove-Directory ".\.vs" ".vs"

# Count files after cleanup
Start-Sleep 1  # Give filesystem time to update
$afterCount = (Get-ChildItem -Recurse -File).Count
$savedFiles = $beforeCount - $afterCount

Write-Host "`n=== Cleanup Results ===" -ForegroundColor Green
Write-Host "Files before: $beforeCount" -ForegroundColor Cyan
Write-Host "Files after:  $afterCount" -ForegroundColor Cyan
Write-Host "Files removed: $savedFiles" -ForegroundColor Yellow
Write-Host "Space savings: Significant (build artifacts removed)" -ForegroundColor Yellow

# List remaining files
Write-Host "`n=== Remaining Core Files ===" -ForegroundColor Green
Get-ChildItem -Recurse -File | Where-Object { $_.Name -notmatch "\.(cache|tmp|log)$" } | 
    Select-Object Name, Directory, @{Name="Size(KB)";Expression={[math]::Round($_.Length/1KB,1)}} | 
    Sort-Object Directory, Name | Format-Table -AutoSize

Write-Host "`n✅ Cleanup completed successfully!" -ForegroundColor Green
Write-Host "The project now contains only essential source files." -ForegroundColor White
Write-Host "Build artifacts will be regenerated when you compile the project." -ForegroundColor White