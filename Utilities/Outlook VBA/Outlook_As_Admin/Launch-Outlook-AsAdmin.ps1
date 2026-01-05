
<# 
Purpose: Launch Outlook as a different user (e.g., admin) and automatically use the "Outlook" profile.
Notes:
- You will be prompted for the admin password.
- Outlook runs under the admin Windows context but signs in to your regular mailbox via Modern Auth.
- The /profile "Outlook" switch loads (or creates) that profile under the admin account’s user hive.
- Use -SafeMode if add-ins/VBA are causing issues.


# Force "Outlook" profile:
.\Launch-Outlook-AsAdmin.ps1 -AdminUser "SKILLS\WilliamAdmin"

# Safe Mode (recommended if VBA/add-ins misbehave):
.\Launch-Outlook-AsAdmin.ps1 -AdminUser "SKILLS\WilliamAdmin" -SafeMode

# If you want to choose a profile instead:
.\Launch-Outlook-AsAdmin.ps1 -AdminUser "DOMAIN\AdminUser" -ForceProfilePicker

cd ".\Utilities\Powershell Utilities\"  

#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AdminUser,                 # e.g. "DOMAIN\AdminUser" or "AdminUser"
    [switch]$SafeMode,                  # Optional: start Outlook in Safe Mode
    [switch]$ForceProfilePicker         # Optional: show the profile picker instead of forcing "Outlook"
)

function Get-OutlookPath {
    $paths = @(
        "$Env:ProgramFiles\Microsoft Office\root\Office16\OUTLOOK.EXE",   # Microsoft 365 / Office 2016+
        "$Env:ProgramFiles(x86)\Microsoft Office\root\Office16\OUTLOOK.EXE",
        "$Env:ProgramFiles\Microsoft Office\Office16\OUTLOOK.EXE",        # Volume license fallback
        "$Env:ProgramFiles(x86)\Microsoft Office\Office16\OUTLOOK.EXE",
        "$Env:ProgramFiles\Microsoft Office\Office15\OUTLOOK.EXE",        # Older versions fallback
        "$Env:ProgramFiles(x86)\Microsoft Office\Office15\OUTLOOK.EXE"
    )
    foreach ($p in $paths) {
        if (Test-Path $p) { return $p }
    }
    throw "Outlook.exe not found in standard locations."
}

$outlook = Get-OutlookPath

# Build argument list: default to /profile "Outlook"
$args = @()
if ($ForceProfilePicker.IsPresent) {
    $args += "/profiles"
} else {
    $args += '/profile "Outlook"'
}
if ($SafeMode.IsPresent) {
    $args += "/safe"
}

# Prompt for admin credentials
$securePassword = Read-Host -AsSecureString -Prompt "Enter password for $AdminUser"
$cred = New-Object System.Management.Automation.PSCredential($AdminUser, $securePassword)

Write-Host "Starting Outlook as $AdminUser with arguments: $($args -join ' ')" -ForegroundColor Cyan

Start-Process -FilePath $outlook `
    -ArgumentList ($args -join ' ') `
    -Credential $cred `
    -WorkingDirectory (Split-Path $outlook) `
    -WindowStyle Normal
