$path = "Utilities/Powershell Utilities/BOEReceivableProcessFiles.ps1"
try {
    $s = Get-Content -Raw -Path $path -ErrorAction Stop
    [scriptblock]::Create($s) | Out-Null
    Write-Output "PARSE_OK"
} catch {
    Write-Output "PARSE_ERROR: $($_.Exception.Message)"
    exit 1
}