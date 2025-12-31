<#
Generates TABLE_INDEX.md mapping table name -> relative SQL file path
Run from repository root (or this script will compute paths relative to repo root).
#>
$out = Join-Path -Path $PSScriptRoot -ChildPath 'TABLE_INDEX.md'
Write-Output ("Generating table index to: $out")

Write-Output "Scanning Tables subfolder for .sql files..."
$tablesPath = Join-Path -Path $PSScriptRoot -ChildPath 'Tables'
$files = Get-ChildItem -Path $tablesPath -File -Filter '*.sql' -ErrorAction SilentlyContinue

"# Table Index for Schema DDL Files" | Out-File -FilePath $out -Encoding utf8
"" | Out-File -FilePath $out -Encoding utf8 -Append
"This file maps table names (derived from filenames) to the extracted CREATE script files." | Out-File -FilePath $out -Encoding utf8 -Append
"" | Out-File -FilePath $out -Encoding utf8 -Append
"| Table | File |" | Out-File -FilePath $out -Encoding utf8 -Append
"| --- | --- |" | Out-File -FilePath $out -Encoding utf8 -Append

foreach ($f in $files | Sort-Object -Property Name) {
    $name = $f.BaseName
    if ($name -match '\.') {
        $tbl = $name.Split('.')[1]
    } else {
        $tbl = $name
    }
    # Use relative path to Tables subfolder
    $rel = "Tables/$($f.Name)"
    "| $tbl | $rel |" | Out-File -FilePath $out -Encoding utf8 -Append
}

Write-Output "Wrote TABLE_INDEX.md with $($files.Count) entries."
