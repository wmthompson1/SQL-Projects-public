$max=36
$logpath = ".github\workflows\validate_solder_latest.log"
for ($i=0; $i -lt $max; $i++) {
    Write-Output ('Attempt {0}/{1}: checking for latest run...' -f ($i+1), $max)
    $dbid = gh run list --workflow validate-solder.yml --limit 1 --json databaseId --jq '.[] | .databaseId' 2>$null
    if ($dbid -and $dbid -ne "") {
        Write-Output ('Found run DBID={0}, attempting to download logs...' -f $dbid)
        gh run view $dbid --log > $logpath 2>$null
        if ($LASTEXITCODE -eq 0 -and (Test-Path $logpath)) {
            Write-Output "Logs downloaded to $logpath"
            exit 0
        } else {
            Write-Output "Logs not yet available for run $dbid"
        }
    } else {
        Write-Output "No run id found yet."
    }
    Start-Sleep -Seconds 5
}
Write-Output "Timed out waiting for logs after $max attempts." 
exit 2
