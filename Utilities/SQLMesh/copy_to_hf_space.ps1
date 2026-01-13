#!/usr/bin/env pwsh
# Copy ground truth files to hf-space-inventory-sqlgen app

$ErrorActionPreference = "Stop"

Write-Host "📦 Copying ground truth SQL integration files..." -ForegroundColor Cyan

$sourceDir = "Utilities/SQLMesh"
$targetDir = "hf-space-inventory-sqlgen"

# Files to copy
$files = @(
    "ground_truth_queries.sql",
    "ground_truth_queries.json",
    "ground_truth_integration.py"
)

foreach ($file in $files) {
    $source = Join-Path $sourceDir $file
    $target = Join-Path $targetDir $file
    
    if (Test-Path $source) {
        Copy-Item -Path $source -Destination $target -Force
        Write-Host "✅ Copied: $file" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Missing: $file" -ForegroundColor Yellow
    }
}

Write-Host "`n📝 Next steps:" -ForegroundColor Cyan
Write-Host "1. Update hf-space-inventory-sqlgen/app.py to integrate example queries"
Write-Host "2. Test locally: cd hf-space-inventory-sqlgen; python app.py"
Write-Host "3. Commit and push to deploy to Hugging Face Spaces"
Write-Host "`nSee GROUND_TRUTH_PROJECT_PLAN.md for detailed integration code"
