# PowerShell script to copy .rdl files to .xml files for better readability and tooling support
# RDL (Report Definition Language) files are XML files used by SQL Server Reporting Services
# copy *.rdl to *.xml. *.xml will filter for next step. 
# *.xml will filter for next step.  


param(
    [string]$PriorPath = "Server\SSRS_Master\PriorVersion",
    [string]$CurrentPath = "Server\SSRS_Master\CurrentVersion",
    [string]$inputSuffix = ".rdl",
    [string]$outputSuffix = ".xml"
)

function Copy-RdlToXml {
    param(
        [string]$RdlFilePath,
        [string]$XmlFilePath
    )
    
    try {
        # Read the RDL content
        $rdlContent = Get-Content -Path $RdlFilePath -Raw -Encoding UTF8
        
        # Add XML header comment for clarity
        $fileName = [System.IO.Path]::GetFileName($RdlFilePath)
        $conversionDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        
        $xmlHeader = "<!-- Converted from RDL file: $fileName -->`r`n"
        $xmlHeader += "<!-- Conversion date: $conversionDate -->`r`n"
        $xmlContent = $xmlHeader + $rdlContent
        
        # Write to XML file
        $xmlContent | Out-File -FilePath $XmlFilePath -Encoding UTF8
        
        $sourceFile = [System.IO.Path]::GetFileName($RdlFilePath)
        $targetFile = [System.IO.Path]::GetFileName($XmlFilePath)
        Write-Host "Converted: $sourceFile -> $targetFile" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Failed to convert: $RdlFilePath" -ForegroundColor Red
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Convert-FolderFiles {
    param(
        [string]$FolderPath,
        [string]$FolderName
    )
    
    Write-Host "Processing $FolderName folder: $FolderPath" -ForegroundColor Cyan
    
    # Find all files with the input suffix
    $inputFiles = Get-ChildItem -Path $FolderPath -Filter "*$inputSuffix" -Recurse

    if ($inputFiles.Count -eq 0) {
        Write-Host "No $inputSuffix files found in '$FolderPath'" -ForegroundColor Yellow
        return 0
    }

    Write-Host "Found $($inputFiles.Count) $inputSuffix files to convert to $outputSuffix..."

    $successCount = 0

    foreach ($inputFile in $inputFiles) {
        $fileName = [System.IO.Path]::GetFileNameWithoutExtension($inputFile.Name)
        
        # Create output file path with new suffix in the same directory
        $outputFilePath = Join-Path $inputFile.DirectoryName "$fileName$outputSuffix"
        
        if (Copy-RdlToXml -RdlFilePath $inputFile.FullName -XmlFilePath $outputFilePath) {
            $successCount++
        }
    }
    
    Write-Host "${FolderName}: $successCount/$($inputFiles.Count) files converted from $inputSuffix to $outputSuffix" -ForegroundColor Green
    return $successCount
}

# Main execution
Write-Host "RDL to XML Converter for Both Folders" -ForegroundColor Magenta
Write-Host "====================================" -ForegroundColor Magenta
Write-Host "Prior Path: $PriorPath" -ForegroundColor Gray
Write-Host "Current Path: $CurrentPath" -ForegroundColor Gray
Write-Host ""

$totalSuccess = 0

# Process Prior Version folder
if (Test-Path $PriorPath) {
    $totalSuccess += Convert-FolderFiles -FolderPath $PriorPath -FolderName "PriorVersion"
    Write-Host ""
} else {
    Write-Host "Prior folder not found: $PriorPath" -ForegroundColor Red
}

# Process Current Version folder
if (Test-Path $CurrentPath) {
    $totalSuccess += Convert-FolderFiles -FolderPath $CurrentPath -FolderName "CurrentVersion"
    Write-Host ""
} else {
    Write-Host "Current folder not found: $CurrentPath" -ForegroundColor Red
}

Write-Host "Total files converted: $totalSuccess" -ForegroundColor Cyan
Write-Host "Both folders are now ready for comparison!" -ForegroundColor Green