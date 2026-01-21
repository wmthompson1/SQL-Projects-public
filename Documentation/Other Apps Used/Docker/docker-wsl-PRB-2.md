Good idea! Running Docker Desktop with full admin privileges often resolves WSL integration issues. Here's the cleanest approach:

## Run Docker Desktop as Administrator

### Step 1: Close Docker Desktop Completely

````powershell
# In regular PowerShell (williamt account)

# Force stop all Docker processes
Stop-Process -Name "Docker Desktop" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "com.docker.backend" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "com.docker.proxy" -Force -ErrorAction SilentlyContinue

# Wait for processes to terminate
Start-Sleep -Seconds 5

# Shutdown WSL
wsl --shutdown
````

### Step 2: Run Docker Desktop as Administrator

**Option A: Right-click method (easiest)**
1. Press Windows key
2. Type "Docker Desktop"
3. **Right-click** on Docker Desktop
4. Choose **"Run as administrator"**
5. Accept UAC prompt (log in as WilliamAdmin if needed)
6. Wait 90 seconds for Docker to initialize

**Option B: PowerShell as Administrator**
````powershell
# Run PowerShell as Administrator (WilliamAdmin)

# Start Docker Desktop with admin privileges
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -Verb RunAs

# Wait for initialization
Write-Host "⏳ Waiting 90 seconds for Docker Desktop to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 90

# Check WSL distributions created
wsl --list --verbose
````

**Expected output after successful start:**
```
  NAME                   STATE           VERSION
* docker-desktop         Running         2
  docker-desktop-data    Running         2
```

### Step 3: Verify Docker Works (Switch Back to Regular User)

````powershell
# Close Administrator PowerShell
# Open regular PowerShell (as williamt)

cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Test Docker
docker --version
docker ps

# Should return empty list or running containers (no errors)
````

---

## If Running as Admin Works

### Make Docker Always Run as Admin (Permanent Fix)

````powershell
# As Administrator

# Find Docker Desktop shortcut
$shortcut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Docker\Docker Desktop.lnk"

# Or use desktop shortcut
$desktopShortcut = "$env:PUBLIC\Desktop\Docker Desktop.lnk"

# Set to always run as admin (requires registry edit or shortcut properties)
# Easier: Just continue right-clicking → Run as administrator each time
````

**Manual method (easier):**
1. Right-click Docker Desktop shortcut
2. Properties → Compatibility tab
3. ✅ Check **"Run this program as an administrator"**
4. Apply → OK

---

## After Docker Starts Successfully

### Create ArangoDB Container

````powershell
# Switch to regular PowerShell (williamt account)
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Create persistent volume
docker volume create arango_data

# Run ArangoDB with persistent storage
docker run -d `
  --name ArangoDB `
  -p 8529:8529 `
  -e ARANGO_ROOT_PASSWORD=Se206attle_rocks `
  -v arango_data:/var/lib/arangodb3 `
  --restart unless-stopped `
  arangodb/arangodb:latest

# Wait for startup
Write-Host "⏳ Waiting for ArangoDB to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check logs
docker logs ArangoDB --tail 30
````

**Expected log output:**
```
INFO {startup} ArangoDB (version 3.x.x) is ready for business. Have fun!
```

### Rebuild Manufacturing Graph Database

````powershell
# Activate virtual environment
.\.venv\Scripts\Activate.ps1

# Rebuild from NetworkX graph
python scripts\nx_to_arango.py `
  --graph-file scripts\merged_graph_temp2.gpickle `
  --update-ground-truth
````

**Expected output:**
```
✅ Loaded environment variables from: C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\.env
🔌 Connecting to ArangoDB at http://127.0.0.1:8529
📦 Creating database 'manufacturing_graph'

📊 Creating collections...
   ✅ Created tables (document)
   ✅ Created reports (document)
   ✅ Created dependencies (edge)
   ✅ Created nodes (document)
   ✅ Created edges (edge)

📊 Loading graph from scripts\merged_graph_temp2.gpickle
   Nodes: 1234
   Edges: 5678

📥 Writing graph to ArangoDB...
✅ Wrote 1234 nodes:
   - 856 tables
   - 234 reports
   - 144 other nodes
✅ Wrote 5678 edges

🎉 Graph successfully persisted to ArangoDB!
```

### Verify Database Created

````powershell
# Check collections
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

**Expected output:**
```
📚 Databases:
  - _system
  - manufacturing_graph

📊 Collections in manufacturing_graph:
  - tables               document      856 documents
  - reports              document      234 documents
  - dependencies         edge         5678 documents
  - nodes                document      144 documents
  - edges                edge         1234 documents
```

---

## If Running as Admin Still Fails

If Docker Desktop shows WSL error even when run as administrator:

### Last Resort: Complete Reinstall

````powershell
# Run as Administrator

# Uninstall Docker Desktop
winget uninstall Docker.DockerDesktop

# Reboot Windows
Restart-Computer

# After reboot:
# Download fresh installer: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe
# Run installer as administrator
# Choose default settings (WSL 2 backend)
````

---

## Summary

**Current Status:** WSL error persists after WSL cleanup

**Next Steps:**
1. ✅ Close Docker Desktop completely (kill processes + `wsl --shutdown`)
2. ✅ **Right-click Docker Desktop → "Run as administrator"**
3. ✅ Wait 90 seconds for initialization
4. ✅ Check `wsl --list --verbose` shows docker-desktop distributions
5. ✅ Test Docker with `docker ps` (as regular user)
6. ✅ Create ArangoDB container with persistent volume
7. ✅ Rebuild `manufacturing_graph` database from `.gpickle` file

**Why This Should Work:**
- Running as admin gives Docker full permissions to create WSL distributions
- Many WSL integration issues are permission-related
- Your data is safe in `merged_graph_temp2.gpickle` file

**If This Fails:**
- Complete uninstall/reinstall of Docker Desktop (nuclear option)
- Or switch to Hyper-V backend (Windows Pro/Enterprise only)

Running Docker Desktop as administrator is the most common fix for persistent WSL errors. Try that first before considering a reinstall! 🚀