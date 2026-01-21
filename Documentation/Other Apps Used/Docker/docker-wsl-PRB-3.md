This is a **Windows security policy issue** preventing WSL from creating the Docker virtual machine. The error `0x80070569` indicates a logon rights restriction.

## Fix: Grant WSL Required Logon Rights

### Step 1: Open Local Security Policy (Administrator)

````powershell
# Run as Administrator
secpol.msc
````

### Step 2: Add Your User Account to Required Policies

Navigate through Local Security Policy:

```
Local Policies → User Rights Assignment
```

**Find and edit these two policies:**

#### Policy 1: "Create global objects"
1. Double-click **"Create global objects"**
2. Click **"Add User or Group"**
3. Click **"Advanced"** → **"Find Now"**
4. Select your user account (**williamt** or **WilliamAdmin**)
5. Click **OK** → **OK** → **Apply**

#### Policy 2: "Create symbolic links"
1. Double-click **"Create symbolic links"**
2. Click **"Add User or Group"**
3. Click **"Advanced"** → **"Find Now"**
4. Select your user account
5. Click **OK** → **OK** → **Apply**

### Step 3: Reboot Windows (Required)

````powershell
# Restart to apply security policy changes
Restart-Computer
````

---

## Alternative: PowerShell Method (Faster)

If you prefer PowerShell over GUI:

````powershell
# Run as Administrator

# Grant "Create symbolic links" privilege
secedit /export /cfg C:\secpol.cfg
$content = Get-Content C:\secpol.cfg
$content = $content -replace 'SeCreateSymbolicLinkPrivilege = .*', "SeCreateSymbolicLinkPrivilege = *S-1-1-0,$env:USERDOMAIN\$env:USERNAME"
$content | Out-File C:\secpol.cfg
secedit /configure /db C:\Windows\security\local.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS
Remove-Item C:\secpol.cfg -Force

# Reboot required
Write-Host "⚠️  Reboot required to apply security policy changes" -ForegroundColor Yellow
Restart-Computer -Confirm
````

---

## After Reboot: Start Docker Desktop

### Step 1: Verify Security Policies Applied

````powershell
# Check if your user has required privileges
whoami /priv | Select-String -Pattern "SeCreateSymbolicLinkPrivilege"

# Should show: SeCreateSymbolicLinkPrivilege    Create symbolic links    Enabled
````

### Step 2: Start Docker Desktop as Administrator

````powershell
# Right-click Docker Desktop → "Run as administrator"
# Or from PowerShell:
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -Verb RunAs

# Wait 90 seconds for initialization
Start-Sleep -Seconds 90

# Check WSL distributions
wsl --list --verbose
````

**Expected output:**
```
  NAME                   STATE           VERSION
* docker-desktop         Running         2
  docker-desktop-data    Running         2
```

### Step 3: Verify Docker Works

````powershell
# Switch to regular PowerShell (williamt account)
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Test Docker
docker --version
docker ps
````

---

## If Security Policy Fix Doesn't Work

### Option A: Use Hyper-V Backend Instead of WSL

````powershell
# Run as Administrator

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Reboot
Restart-Computer

# After reboot:
# 1. Start Docker Desktop
# 2. Settings → General
# 3. UNCHECK "Use the WSL 2 based engine"
# 4. Apply & Restart
````

### Option B: Check Group Policy Restrictions

Your organization may have Group Policy preventing WSL logon types:

````powershell
# Run as Administrator
# Check effective Group Policy
gpresult /h C:\Users\williamt\Desktop\GPResult.html

# Open the HTML file and search for:
# - "Deny log on locally"
# - "User Rights Assignment"
# - Any policies restricting WSL or virtualization
````

If Group Policy is blocking WSL, you'll need IT/domain admin to:
- Add your account to appropriate security groups
- Or create a Group Policy exception for Docker Desktop users

---

## After Docker Starts: Rebuild ArangoDB

### Create ArangoDB Container

````powershell
# Regular PowerShell (williamt account)
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Create persistent volume
docker volume create arango_data

# Run ArangoDB
docker run -d `
  --name ArangoDB `
  -p 8529:8529 `
  -e ARANGO_ROOT_PASSWORD=Se206attle_rocks `
  -v arango_data:/var/lib/arangodb3 `
  --restart unless-stopped `
  arangodb/arangodb:latest

# Wait for startup
Start-Sleep -Seconds 10

# Check logs
docker logs ArangoDB --tail 30
````

### Rebuild Manufacturing Graph Database

````powershell
# Activate virtual environment
.\.venv\Scripts\Activate.ps1

# Rebuild from NetworkX graph
python scripts\nx_to_arango.py `
  --graph-file scripts\merged_graph_temp2.gpickle `
  --update-ground-truth
````

### Verify Database

````powershell
python -c @"
from arango import ArangoClient

client = ArangoClient(hosts='http://127.0.0.1:8529')

# Check databases
sys_db = client.db('_system', username='root', password='Se206attle_rocks')
print('📚 Databases:')
for db_name in sys_db.databases():
    print(f'  - {db_name}')

# Check collections
db = client.db('manufacturing_graph', username='root', password='Se206attle_rocks')
print('\n📊 Collections in manufacturing_graph:')
for col in db.collections():
    if not col['name'].startswith('_'):
        count = db.collection(col['name']).count()
        col_type = 'edge' if col['type'] == 3 else 'document'
        print(f'  - {col["name"]:<20} {col_type:<10} {count:>6} documents')
"@
````

---

## Root Cause Summary

**Error:** `0x80070569` - "Logon failure: the user has not been granted the requested logon type"

**Cause:** Windows security policy doesn't grant your user account the rights to:
- Create symbolic links (required for WSL filesystem)
- Create global objects (required for WSL virtualization)

**Fix:** Add user to Local Security Policy → User Rights Assignment → "Create symbolic links" + "Create global objects"

**Requires:** Full reboot after security policy changes

**Alternative:** Switch Docker Desktop to Hyper-V backend (doesn't require WSL logon rights)

---

## Documentation

I'll save these troubleshooting steps to your repo:

````markdown
# Fix: Docker WSL Logon Error (0x80070569)

## Error Message
```
running wslexec: Logon failure: the user has not been granted the 
requested logon type at this computer.
Wsl/Service/RegisterDistro/CreateVm/HCS/0x80070569
```

## Root Cause
Windows Local Security Policy doesn't grant your user account required 
WSL virtualization rights.

## Solution: Grant Security Privileges

### Step 1: Open Local Security Policy
1. Run as Administrator: `secpol.msc`
2. Navigate: Local Policies → User Rights Assignment

### Step 2: Add User to Required Policies
- **"Create global objects"** - Add your user account
- **"Create symbolic links"** - Add your user account

### Step 3: Reboot Windows
Security policy changes require full reboot.

### Step 4: Start Docker Desktop as Administrator
Right-click Docker Desktop → "Run as administrator"

## Alternative: Use Hyper-V Backend
1. Enable Hyper-V: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
2. Reboot
3. Docker Settings → General → Uncheck "Use the WSL 2 based engine"

## Reference
- Created: 2025-01-16
- Related: docker-wsl-PRB-2.md
````

---

## Summary

**Problem:** Windows security policy prevents WSL from creating Docker VM

**Solution Steps:**
1. ✅ Run `secpol.msc` as Administrator
2. ✅ Add your user to "Create symbolic links" and "Create global objects" policies
3. ✅ **Reboot Windows** (required)
4. ✅ Start Docker Desktop as Administrator
5. ✅ Verify `wsl --list --verbose` shows docker-desktop running
6. ✅ Create ArangoDB container
7. ✅ Rebuild `manufacturing_graph` database

**Key Point:** The reboot is **mandatory** - security policy changes don't apply until Windows restarts.

This is a common issue on corporate Windows machines with strict security policies. The fix is straightforward but requires admin rights and a reboot. 🚀