# Test-CSVDateColumn.ps1
# Quick diagnostic for Invoice Received Date column issues

param(
    [string]$CsvPath = ".\Process\Boeing_Export_*.csv"
)

$csvFiles = Get-ChildItem $CsvPath | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $csvFiles) {
    Write-Error "No CSV file found matching: $CsvPath"
    exit 1
}

Write-Output "Analyzing: $($csvFiles.FullName)"
Write-Output ""

$data = Import-Csv $csvFiles.FullName

# Check if column exists
$headers = $data[0].PSObject.Properties.Name
Write-Output "=== COLUMNS FOUND ==="
$headers | ForEach-Object { Write-Output "  - $_" }
Write-Output ""

# Analyze ALL columns for potential SSIS issues
Write-Output "=== COLUMN ANALYSIS - ALL COLUMNS ==="
Write-Output ""

foreach ($header in $headers) {
    # Get first 10 non-empty values
    $sampleValues = $data | Select-Object -First 20 | ForEach-Object { $_.$header } | Where-Object { $_ -ne "" -and $null -ne $_ } | Select-Object -First 10
    
    if ($sampleValues.Count -eq 0) {
        Write-Output "[$header] - ALL EMPTY ← PROBLEM!"
        continue
    }
    
    # Check for problematic characters
    $hasCommas = ($sampleValues | Where-Object { $_ -match ',' }).Count -gt 0
    $hasDollarSigns = ($sampleValues | Where-Object { $_ -match '\$' }).Count -gt 0
    $hasQuotes = ($sampleValues | Where-Object { $_ -match '"' }).Count -gt 0
    $hasApostrophes = ($sampleValues | Where-Object { $_ -match "^'" }).Count -gt 0
    
    # Detect data type
    $isNumeric = ($sampleValues | Where-Object { $_ -match '^\$?[\d,]+\.?\d*$' }).Count -eq $sampleValues.Count
    $isDate = ($sampleValues | Where-Object { $_ -match '^\d{1,2}/\d{1,2}/\d{4}' }).Count -eq $sampleValues.Count
    
    $issues = @()
    if ($hasCommas) { $issues += "commas" }
    if ($hasDollarSigns) { $issues += "dollar-signs" }
    if ($hasQuotes) { $issues += "quotes" }
    if ($hasApostrophes) { $issues += "apostrophes" }
    
    $typeGuess = "text"
    if ($isNumeric) { $typeGuess = "numeric/currency" }
    if ($isDate) { $typeGuess = "date" }
    
    $issueStr = if ($issues.Count -gt 0) { " [" + ($issues -join ", ") + "]" } else { "" }
    
    Write-Output "[$header]$issueStr"
    Write-Output "  Type: $typeGuess"
    Write-Output "  Sample: $($sampleValues[0])"
    if ($sampleValues.Count -gt 1) {
        Write-Output "          $($sampleValues[1])"
    }
}

Write-Output ""
Write-Output "=== SPECIFIC COLUMN CHECKS ==="
Write-Output ""

# Check Invoice Gross Amt specifically
$amtColumn = $headers | Where-Object { $_ -match 'Invoice.*Gross.*Amt|Gross.*Amount' } | Select-Object -First 1
if ($amtColumn) {
    Write-Output "=== INVOICE GROSS AMT ANALYSIS ==="
    Write-Output "Column name: '$amtColumn'"
    
    $amtValues = $data | Select-Object -First 20 | ForEach-Object { $_.$amtColumn } | Where-Object { $_ }
    Write-Output "Sample values:"
    $amtValues | Select-Object -First 10 | ForEach-Object -Begin { $i = 1 } -Process {
        Write-Output "  [$i] $_"
        $i++
    }
    
    # Check for nulls
    $nullCount = ($data | Where-Object { $null -eq $_.$amtColumn -or $_.$amtColumn -eq "" }).Count
    if ($nullCount -gt 0) {
        Write-Warning "  → $nullCount empty/null values found!"
    }
}

# Check for specific problem columns
$problemColumns = @('Invoice Gross Amt', 'Applied Disc Amt', 'Invoice Net Amt')

Write-Output ""
Write-Output "=== CURRENCY COLUMNS ANALYSIS ==="
foreach ($colName in $problemColumns) {
    $col = $headers | Where-Object { $_ -match $colName } | Select-Object -First 1
    if ($col) {
        Write-Output ""
        Write-Output "[$col]"
        $values = $data | Select-Object -First 20 | ForEach-Object { $_.$col } | Where-Object { $_ }
        $values | Select-Object -First 10 | ForEach-Object -Begin { $i = 1 } -Process {
            Write-Output "  [$i] $_"
            $i++
        }
        
        # Check for empty/null
        $nullCount = ($data | Where-Object { $null -eq $_.$col -or $_.$col -eq "" }).Count
        if ($nullCount -gt 0) {
            Write-Warning "  → $nullCount empty/null values!"
        }
    } else {
        Write-Output ""
        Write-Output "[$colName] - NOT FOUND IN CSV"
    }
}

$formats = @{
    'ISO (yyyy-MM-dd HH:mm:ss)' = 'yyyy-MM-dd \d{2}:\d{2}:\d{2}'
    'US (MM/dd/yyyy HH:mm:ss)' = '\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{2}:\d{2}'
    'US (MM/dd/yyyy)' = '^\d{1,2}/\d{1,2}/\d{4}$'
    'ISO (yyyy-MM-dd)' = '^\d{4}-\d{2}-\d{2}$'
}

foreach ($formatName in $formats.Keys) {
    $pattern = $formats[$formatName]
    $matches = ($sampleDates | Where-Object { $_ -match $pattern }).Count
    if ($matches -gt 0) {
        Write-Output "$formatName : $matches/$($sampleDates.Count) matches"
    }
}
