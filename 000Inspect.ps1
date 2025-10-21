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
where.exe git-credential-manager-core
