# Run a traced fetch using the mingw64 git and capture the log
$env:GIT_TRACE = "1"
$env:GIT_CURL_VERBOSE = "1"
$env:GCM_TRACE = "1"
& 'C:\Program Files\Git\mingw64\bin\git.exe' -c credential.helper=manager fetch origin 2>&1 | Tee-Object -FilePath "$env:TEMP\git_fetch_trace.log"
"`nLog saved to: $env:TEMP\git_fetch_trace.log`n"
