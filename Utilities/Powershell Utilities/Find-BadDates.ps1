# Find-BadDates.ps1
# Identify problematic date values in CSV

param(
    [string]$CsvPath = ".\Process\Boeing_Export_*.csv"
)

$csvFiles = Get-ChildItem $CsvPath | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $csvFiles) {
    Write-Error "No CSV file found"
    exit 1
}

Write-Output "Analyzing: $($csvFiles.FullName)"
Write-Output ""

$data = Import-Csv $csvFiles.FullName

# Find date column
$headers = $data[0].PSObject.Properties.Name
$dateColumn = $headers | Where-Object { $_ -match 'Invoice.*Received.*Date' } | Select-Object -First 1

if (-not $dateColumn) {
    Write-Error "Invoice Received Date column not found!"
    exit 1
}

Write-Output "=== SCANNING ALL ROWS FOR DATE ISSUES ==="
Write-Output "Column: $dateColumn"
Write-Output "Total rows: $($data.Count)"
Write-Output ""

$issues = @()
$rowNum = 2  # Start at 2 (1 is header)

foreach ($row in $data) {
    $dateValue = $row.$dateColumn
    
    # Check for empty
    if ($null -eq $dateValue -or $dateValue -eq "" -or $dateValue -eq " ") {
        $issues += [PSCustomObject]@{
            Row = $rowNum
            Value = "<EMPTY>"
            Issue = "Null or empty"
        }
    }
    # Check for invalid format
    elseif ($dateValue -notmatch '^\d{1,2}/\d{1,2}/\d{4}') {
        $issues += [PSCustomObject]@{
            Row = $rowNum
            Value = $dateValue
            Issue = "Invalid format (expected MM/dd/yyyy)"
        }
    }
    # Try to parse as date
    else {
        try {
            $null = [DateTime]::Parse($dateValue)
        } catch {
            $issues += [PSCustomObject]@{
                Row = $rowNum
                Value = $dateValue
                Issue = "Cannot parse as date"
            }
        }
    }
    
    $rowNum++
}

if ($issues.Count -eq 0) {
    Write-Output "✓ No date issues found in all $($data.Count) rows"
} else {
    Write-Warning "Found $($issues.Count) date issues:"
    Write-Output ""
    $issues | Format-Table -AutoSize
    
    Write-Output ""
    Write-Output "=== ROWS AROUND ROW 1733 (SSIS failure point) ==="
    if ($data.Count -ge 1733) {
        $start = [Math]::Max(1, 1731)
        $end = [Math]::Min($data.Count, 1735)
        
        for ($i = $start; $i -le $end; $i++) {
            $val = $data[$i-1].$dateColumn
            $marker = if ($i -eq 1733) { " ← SSIS FAILED HERE" } else { "" }
            Write-Output "Row ${i} : ${val}${marker}"
        }
    }
}
