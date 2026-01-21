# Run from repository root: .\migrate-data-models-to-schema.ps1

<#
.SYNOPSIS
    Move Documentation/Data Models to Documentation/Schema/Data_Models
.DESCRIPTION
    Restructures documentation to consolidate schema-related content under Schema/ folder.
    Uses git mv to preserve history.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Verify we're in repo root
if (-not (Test-Path ".git")) {
    Write-Error "Must run from repository root (SQL-Projects folder)"
    exit 1
}

Write-Host "`n📂 Restructuring Documentation folder..." -ForegroundColor Cyan
Write-Host "   Moving Data Models → Schema/Data_Models`n" -ForegroundColor Cyan

# Check if source exists
if (-not (Test-Path "Documentation\Data Models")) {
    Write-Host "❌ Documentation\Data Models not found" -ForegroundColor Red
    Write-Host "   Either already moved or path is incorrect`n" -ForegroundColor Yellow
    exit 1
}

# Create target directory
if (-not (Test-Path "Documentation\Schema\Data_Models")) {
    New-Item -ItemType Directory -Path "Documentation\Schema\Data_Models" -Force | Out-Null
    Write-Host "✅ Created Documentation\Schema\Data_Models\" -ForegroundColor Green
}

# Move domain folders
$domainFolders = @(
    "Payables",
    "Receivables", 
    "Inventory_Transactions",
    "Work_Orders",
    "Shipping",
    "Purchasing"
)

Write-Host "`n📁 Moving domain folders..." -ForegroundColor Cyan

foreach ($folder in $domainFolders) {
    $source = "Documentation\Data Models\$folder"
    $target = "Documentation\Schema\Data_Models\$folder"
    
    if (Test-Path $source) {
        Write-Host "   $folder..." -ForegroundColor Yellow
        git mv "$source" "$target" 2>$null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "      ⚠️  git mv failed, using PowerShell Move-Item" -ForegroundColor Yellow
            Move-Item -Path $source -Destination $target -Force
        }
    } else {
        Write-Host "   $folder (not found, skipping)" -ForegroundColor Gray
    }
}

# Move DDL extraction tooling
Write-Host "`n🔧 Moving DDL extraction tools..." -ForegroundColor Cyan

if (Test-Path "Documentation\Data Models\ddl") {
    if (-not (Test-Path "Documentation\Schema\ddl-extract")) {
        Write-Host "   ddl → ddl-extract..." -ForegroundColor Yellow
        git mv "Documentation\Data Models\ddl" "Documentation\Schema\ddl-extract" 2>$null
        if ($LASTEXITCODE -ne 0) {
            Move-Item -Path "Documentation\Data Models\ddl" -Destination "Documentation\Schema\ddl-extract" -Force
        }
    } else {
        Write-Host "   ⚠️  ddl-extract already exists, merging..." -ForegroundColor Yellow
        Get-ChildItem "Documentation\Data Models\ddl" -Recurse | ForEach-Object {
            $relativePath = $_.FullName.Replace((Resolve-Path "Documentation\Data Models\ddl").Path + "\", "")
            $targetPath = Join-Path "Documentation\Schema\ddl-extract" $relativePath
            
            if ($_.PSIsContainer) {
                New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
            } else {
                Copy-Item -Path $_.FullName -Destination $targetPath -Force
            }
        }
        Remove-Item "Documentation\Data Models\ddl" -Recurse -Force
    }
}

# Move any root-level markdown files
Write-Host "`n📄 Moving markdown files..." -ForegroundColor Cyan

Get-ChildItem "Documentation\Data Models\*.md" -ErrorAction SilentlyContinue | ForEach-Object {
    $target = "Documentation\Schema\Data_Models\$($_.Name)"
    Write-Host "   $($_.Name)..." -ForegroundColor Yellow
    git mv $_.FullName $target 2>$null
    if ($LASTEXITCODE -ne 0) {
        Move-Item -Path $_.FullName -Destination $target -Force
    }
}

# Check if Data Models is empty, then remove
Write-Host "`n🗑️  Cleaning up..." -ForegroundColor Cyan

$remainingItems = Get-ChildItem "Documentation\Data Models" -Force -Recurse -ErrorAction SilentlyContinue
if ($remainingItems.Count -eq 0) {
    Remove-Item "Documentation\Data Models" -Force
    Write-Host "   ✅ Removed empty Data Models folder" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Data Models folder still contains items:" -ForegroundColor Yellow
    $remainingItems | ForEach-Object {
        Write-Host "      - $($_.FullName.Replace((Get-Location).Path, '.'))" -ForegroundColor Gray
    }
}

# Summary
Write-Host "`n" + ("=" * 70) -ForegroundColor Cyan
Write-Host "✅ Restructure Complete!" -ForegroundColor Green
Write-Host ("=" * 70) -ForegroundColor Cyan

Write-Host "`n📊 New Structure:" -ForegroundColor Cyan
Write-Host @"
Documentation/
├── Schema/
│   ├── Tables/              # Authoritative DDL files
│   ├── Data_Models/         # ✅ Domain flow documentation (moved)
│   │   ├── Payables/
│   │   ├── Receivables/
│   │   ├── Inventory_Transactions/
│   │   ├── Work_Orders/
│   │   ├── Shipping/
│   │   └── Purchasing/
│   └── ddl-extract/         # ✅ Extraction tooling (moved)
├── Policies/
└── Help-md/
"@

Write-Host "`n📋 Next Steps:" -ForegroundColor Cyan
Write-Host "  1. Review changes: git status" -ForegroundColor White
Write-Host "  2. Commit: git commit -m 'refactor: move Data Models to Schema/Data_Models'" -ForegroundColor White
Write-Host "  3. Update copilot-instructions.md (documentation structure section)" -ForegroundColor White
Write-Host "  4. Update README.md if it references Data Models path" -ForegroundColor White
Write-Host "  5. Test graph builder: python hf-space-inventory-sqlgen\combined_graph_builder.py" -ForegroundColor White
Write-Host "  6. Push: git push origin main`n" -ForegroundColor White