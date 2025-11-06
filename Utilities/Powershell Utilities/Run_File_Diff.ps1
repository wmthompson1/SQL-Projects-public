# powershell script to run a file diff between two files in two directories
# diiferentiate by finding changes between /Versionprior/*.rdl and /VersionCurrent/*.rdl
# usage: Run_File_Diff.ps1


# $FileOld = "SQL_Reports/AP Automation/AP Automation.sql"
# $FileNew = "SQL_Reports/AP Automation/AP Automation2.sql"

$FileOld = "Server\SSRS_Master\PriorVersion\Rec POs To Invoice.rdl"
$FileNew = "Server\SSRS_Master\CurrentVersion\Rec POs To Invoice.rdl"

# Uncomment below to diff README files
# $FileOld = "Server\SSRS_Master\PriorVersion\README.md"
# $FileNew = "Server\SSRS_Master\CurrentVersion\README.md"


git diff --no-index $FileOld $FileNew
