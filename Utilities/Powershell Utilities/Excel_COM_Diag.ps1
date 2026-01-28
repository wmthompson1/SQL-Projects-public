## Excel_COM_Diag.ps1
## Small standalone diagnostic script to probe Excel COM on the server
## Writes findings to logs/Excel_COM_Diag.log under the script project folder

Write-Output "Running Excel COM diagnostic..."
$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$project = $scriptDir + '\'
$LogDir = Join-Path -Path $project -ChildPath "logs"
if (-not (Test-Path -Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
$LogFile = Join-Path -Path $LogDir -ChildPath "Excel_COM_Diag.log"

function Write-Log {
    param([string]$Message)
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "${ts} - $Message"
    try { $line | Out-File -FilePath $LogFile -Encoding UTF8 -Append } catch {}
    Write-Output $Message
}

Write-Log "Starting Excel COM diagnostic"

try {
    $excel = New-Object -ComObject Excel.Application
    Write-Log "Created Excel COM object"
}
catch {
    Write-Log "ERROR: Failed to create Excel COM object: $($_.Exception.Message)"
    exit 2
}

try {
    $vers = $excel.Version
    Write-Log "Excel.Version: $vers"
}
catch {
    Write-Log "WARN: Could not read Excel.Version: $($_.Exception.Message)"
}

try {
    $appVers = $excel.Application.Version
    Write-Log "Excel.Application.Version: $appVers"
}
catch {
    Write-Log "WARN: Could not read Excel.Application.Version: $($_.Exception.Message)"
}

try {
    $rcwType = $excel.GetType()
    Write-Log "RCW Type FullName: $($rcwType.FullName)"
    Write-Log "RCW Assembly: $($rcwType.Assembly.FullName)"
}
catch {
    Write-Log "WARN: Unable to inspect RCW type: $($_.Exception.Message)"
}

try {
    $progidType = [System.Type]::GetTypeFromProgID('Excel.Application')
    if ($progidType) {
        Write-Log "ProgID Type FullName: $($progidType.FullName)"
        Write-Log "ProgID GUID: $($progidType.GUID)"
        Write-Log "ProgID Assembly: $($progidType.Assembly.FullName)"
    }
    else { Write-Log "ProgID type not found for Excel.Application" }
}
catch {
    Write-Log "WARN: Unable to get ProgID type: $($_.Exception.Message)"
}

try {
    $ask = $null
    $member = $excel | Get-Member -Name AskToUpdateLinks -ErrorAction SilentlyContinue
    if ($member) { $ask = $excel.AskToUpdateLinks; Write-Log "AskToUpdateLinks present, value: $ask" }
    else { Write-Log "AskToUpdateLinks member not present on Excel object" }
}
catch {
    Write-Log "WARN: Error probing AskToUpdateLinks: $($_.Exception.Message)"
}

# Probe Excel executable path and file version
try {
    $excelPath = $null
    try { $excelPath = $excel.Path } catch {}
    if ($excelPath -and (Test-Path $excelPath)) {
        Write-Log "Excel.Application.Path: $excelPath"
        try {
            $fi = Get-Item $excelPath -ErrorAction Stop
            $verInfo = $fi.VersionInfo
            Write-Log "EXE FileVersion: $($verInfo.FileVersion)"
            Write-Log "EXE ProductVersion: $($verInfo.ProductVersion)"
        }
        catch {
            Write-Log "WARN: Unable to read EXE version info for ${excelPath}: $($_.Exception.Message)"
        }
    }
    else {
        Write-Log "Excel.Application.Path not available or path does not exist: ${excelPath}"
    }
}
catch {
    Write-Log "WARN: Error probing Excel path: $($_.Exception.Message)"
}

# Fallback: probe common install locations for EXCEL.EXE
try {
    $commonPaths = @("C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE", "C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE", "C:\Program Files\Microsoft Office\Office16\EXCEL.EXE")
    foreach ($p in $commonPaths) {
        if (Test-Path $p) {
            Write-Log "Found EXCEL.EXE at: $p"
            try { $vi = (Get-Item $p).VersionInfo; Write-Log "Found EXE FileVersion: $($vi.FileVersion) ProductVersion: $($vi.ProductVersion)" } catch {}
        }
    }
}
catch {
    Write-Log "WARN: Error probing common EXCEL locations: $($_.Exception.Message)"
}

# Registry checks (common Office/ClickToRun keys)
try {
    $keys = @('HKLM:\SOFTWARE\Microsoft\Office', 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Office', 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration')
    foreach ($k in $keys) {
        if (Test-Path $k) { Write-Log "Registry: Found $k" } else { Write-Log "Registry: Not found $k" }
    }
    if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration') {
        $cfg = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration' -ErrorAction SilentlyContinue
        if ($cfg) {
            Write-Log "ClickToRun ProductVersion: $($cfg.ProductVersion)"
            Write-Log "ClickToRun Platform: $($cfg.Platform)"
            Write-Log "ClickToRun ClientFolder: $($cfg.ClientFolder)"
            Write-Log "ClickToRun UpdateChannel: $($cfg.UpdateChannel)"
        }
        else {
            Write-Log "ClickToRun Configuration key present but could not read properties"
        }
    }
}
catch {
    Write-Log "WARN: Registry probe failed: $($_.Exception.Message)"
}

# Cleanup
try { $excel.Quit() } catch {}
try { [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null } catch {}
try {
    # DCOM / interactive session hints
    $sessionId = (Get-Process -Id $PID -ErrorAction SilentlyContinue).SessionId
    Write-Log "Current PowerShell SessionId: $sessionId"
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    Write-Log "Current user: $user"
}
catch {
    Write-Log "WARN: Unable to capture session/user info: $($_.Exception.Message)"
}
Write-Log "Excel COM diagnostic completed"

Write-Output "Diagnostic log written to: $LogFile"
