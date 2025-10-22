# # get this file's path
$scriptPath = $MyInvocation.MyCommand.Path

# #output #path to screen
Write-Output $scriptPath
# # get the current user
whoami.exe

# Write-Output 'Create system-wide variables'  

#set path for local repo to 'C:\Users\williamt\source\skillsinc\skills-inc-org\IT_TeamProject'
$path = 'C:\Users\williamt\source\skillsinc\skills-inc-org\IT_TeamProject' 
Set-Location $path  

##git config --global --replace-all credential.helper manager-core 
##git config --show-origin --get-all credential.helper 

where.exe git-credential-manager-core
# check for git-credential-manager-core and fallback to git-credential-manager
$gcmCorePaths = & where.exe git-credential-manager-core 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Output "Found git-credential-manager-core at:"
    $gcmCorePaths | ForEach-Object { Write-Output "  $_" }
    $exe = $gcmCorePaths | Select-Object -First 1
    if (Test-Path $exe) { & "$exe" --version 2>$null | ForEach-Object { Write-Output "Version: $_" } }
} else {
    Write-Output "git-credential-manager-core not found, checking for git-credential-manager..."
    $gcmPaths = & where.exe git-credential-manager 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Output "Found git-credential-manager at:"
        $gcmPaths | ForEach-Object { Write-Output "  $_" }
        $exe = $gcmPaths | Select-Object -First 1
        if (Test-Path $exe) { & "$exe" --version 2>$null | ForEach-Object { Write-Output "Version: $_" } }
    } else {
        Write-Output "Neither git-credential-manager-core nor git-credential-manager were found in PATH."
        Write-Output "Install Git Credential Manager: https://aka.ms/gcm"
    }
}
## where.exe git-credential-manager.exe