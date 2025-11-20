Simulate app by copying from \input\[text](<Input/Test Input Excel File Nov 2025 - Copy.xls>) to \input\boe.xls

```sql $testFile = "Utilities\Powershell Utilities\Input\Test Input Excel File Nov 2025 - Copy.xls"
$targetFile = "Utilities\Powershell Utilities\Input\BOE.xls"

if (Test-Path $testFile) {
    Copy-Item -Path $testFile -Destination $targetFile -Force
    Write-Output "SUCCESS: Test file copied to BOE.xls"
} else {
    Write-Warning "Test file not found: $testFile"
}

$sourceTemplates = "\\skillsinc.local\public\IS\DataTransfer\BOE Receivable\Process\"
$destTemplates = "Utilities\Powershell Utilities\Process\"

# Ensure Process folder exists
if (-not (Test-Path $destTemplates)) {
    New-Item -ItemType Directory -Path $destTemplates -Force
}

# Copy template files
Copy-Item "$sourceTemplates\TEMPLATE_BOE_Header.csv" -Destination $destTemplates -Force
Copy-Item "$sourceTemplates\TEMPLATE_BOE_Receivable.xlsx" -Destination $destTemplates -Force

Write-Output "Template files copied to local Process folder"
Get-ChildItem $destTemplates -Filter "TEMPLATE*"