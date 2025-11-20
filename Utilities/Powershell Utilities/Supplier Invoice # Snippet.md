
# file: Supplier invoice # snippet.md

# Step 1: Daily Operations Verification - [Supplier Invoice #] String Type Conversion
Write-Output "Step 1: Locating and converting [Supplier Invoice #] column to string type..."
try {
    $supplierInvoiceCol = $null
    $headerRow = 1
    
    # Locate the column
    for ($col = 1; $col -le 20; $col++) {
        $hdr = $wb2.ActiveSheet.Cells.Item($headerRow, $col).Value2
        if ($null -ne $hdr) {
            $txt = $hdr.ToString()
            if ($txt -match "Supplier Invoice") {
                $supplierInvoiceCol = $col
                Write-Output "SUCCESS: Found [Supplier Invoice #] at column $col - '$txt'"
                break
            }
        }
    }
    
    if ($null -ne $supplierInvoiceCol) {
        # Convert column to string type for consistent handling
        $lastRow = $wb2.ActiveSheet.UsedRange.Rows.Count
        Write-Output "Converting [Supplier Invoice #] data to string format (rows 2-$lastRow)..."
        
        $stringConversions = 0
        for ($row = 2; $row -le $lastRow; $row++) {
            $cellValue = $wb2.ActiveSheet.Cells.Item($row, $supplierInvoiceCol).Value2
            
            if ($null -ne $cellValue -and $cellValue.ToString().Trim() -ne "") {
                $originalValue = $cellValue.ToString().Trim()
                
                # Clean up any Excel formula artifacts
                $cleanValue = $originalValue -replace '^="(.+)"$', '$1'
                $wb2.ActiveSheet.Cells.Item($row, $supplierInvoiceCol).Value2 = $cleanValue
                $stringConversions++
            }
        }
        
        # Format entire column as text to ensure string type
        $columnRange = $wb2.ActiveSheet.Range($wb2.ActiveSheet.Cells.Item(1, $supplierInvoiceCol), $wb2.ActiveSheet.Cells.Item($lastRow, $supplierInvoiceCol))
        $columnRange.NumberFormat = "@"  # Text format
        
        Write-Output "Step 1 COMPLETED: [Supplier Invoice #] column converted to string type"
        Write-Output "  - Column position: $supplierInvoiceCol"
        Write-Output "  - Values processed: $stringConversions"
        Write-Output "  - Format applied: Text (@)"
        Write-Output "  - Supports mixed formats: numeric (1460110) and alphanumeric (250531BOE602)"
    }
    else {
        Write-Output "Step 1 FAILED: [Supplier Invoice #] not found in first 20 columns"
        Write-Output "Available headers for debugging:"
        for ($c = 1; $c -le 10; $c++) {
            $val = $wb2.ActiveSheet.Cells.Item($headerRow, $c).Value2
            if ($null -ne $val) { Write-Output "  Col $c`: '$($val.ToString())'" }
        }
    }
}
catch {
    Write-Warning "Step 1 ERROR: $_"
    Write-Output "Continuing with processing - [Supplier Invoice #] may need manual verification"
}$wb2.Save()
$wb2.SaveAs($FilePath4 , $xlcsv) 
$wb2.close($false) 

}
