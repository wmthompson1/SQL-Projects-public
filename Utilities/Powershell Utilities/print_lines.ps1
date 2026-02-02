param([int]$start=1,[int]$end=200)
$lines=Get-Content "Utilities/Powershell Utilities/BOEReceivableProcessFiles.ps1"
for($i=$start-1;$i -le $end-1 -and $i -lt $lines.Count; $i++){
    "{0,4}: {1}" -f ($i+1), $lines[$i]
}