## 
## file: Create-BOE-Column-Rules.ps1
## Purpose: Generate clean BOE_Column_Rules.json file without encoding issues
## Run this script in the same directory where BOEReceivableProcessFiles.ps1 is located

$rules = @{
    description = "Column formatting rules for BOE Receivable Excel processing"
    rules = @(
        @{
            columnPattern = "Supplier.*Invoice|Supplier\\s+Invoice"
            dataType = "String"
            excelFormat = "@"
            stripFormulas = $true
            trim = $true
            description = "Supplier Invoice # - must be text to preserve leading zeros and alphanumeric values (handles NBSP)"
        },
        @{
            columnPattern = "Boeing.*Invoice"
            dataType = "String"
            excelFormat = "@"
            stripFormulas = $false
            trim = $true
            description = "Boeing Invoice # - text format"
        },
        @{
            columnPattern = "Invoice.*Received.*Date"
            dataType = "String"
            excelFormat = "@"
            stripFormulas = $false
            trim = $false
            description = "Invoice Received Date - text format allows NULL values, SSIS will handle datetime conversion with NULL support"
        },
        @{
            columnPattern = "StartDate|Start.*Date"
            dataType = "Date"
            excelFormat = "mm/dd/yyyy"
            stripFormulas = $false
            trim = $false
            description = "Date fields - short date format"
        },
        @{
            columnPattern = ".*Date.*Time|Settlement.*Date|Check.*Date"
            dataType = "DateTime"
            excelFormat = "mm/dd/yyyy hh:mm:ss"
            stripFormulas = $false
            trim = $false
            description = "DateTime fields - full timestamp"
        },
        @{
            columnPattern = "^Payment$|.*Amt$|.*Amount$"
            dataType = "Currency"
            excelFormat = "0.00"
            stripFormulas = $false
            stripCommas = $true
            trim = $false
            description = "Currency fields - exact match for 'Payment' or columns ending in 'Amt' or 'Amount'"
        },
        @{
            columnPattern = "Conversion.*Rate|.*Rate$"
            dataType = "Currency"
            excelFormat = "0.00"
            stripFormulas = $false
            stripCommas = $true
            trim = $false
            description = "Conversion Rate and other rate fields - numeric format with 2 decimals"
        }
    )
    notes = @(
        "columnPattern uses regex for matching",
        "excelFormat codes: @ = text, mm/dd/yyyy = date, `$#,##0.00 = currency",
        "stripFormulas removes Excel formulas like =\""value\"" and keeps just the value",
        "Rules are applied in order - first match wins"
    )
}

# Get script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$outputPath = Join-Path -Path $scriptPath -ChildPath "BOE_Column_Rules.json"

# Convert to JSON and save with UTF8 encoding (no BOM)
$jsonContent = $rules | ConvertTo-Json -Depth 10
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($outputPath, $jsonContent, $utf8NoBom)

Write-Output "SUCCESS: Created clean BOE_Column_Rules.json"
Write-Output "Location: $outputPath"
Write-Output "File size: $((Get-Item $outputPath).Length) bytes"
Write-Output ""
Write-Output "Verification:"
try {
    $test = Get-Content $outputPath -Raw | ConvertFrom-Json
    Write-Output "JSON is valid - $($test.rules.Count) rules loaded successfully"
}
catch {
    Write-Error "JSON validation failed: $_"
}
