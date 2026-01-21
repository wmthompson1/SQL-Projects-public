The warning is telling you that PowerShell won't send credentials over HTTP (unencrypted) by default for security reasons. Since you're using `http://localhost:8529` (not HTTPS), you need to explicitly allow it.

## Solution: Add `-AllowUnencryptedAuthentication`

````powershell
# Method 2: Using PowerShell credential (more secure)
$securePassword = ConvertTo-SecureString "your-password" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ("root", $securePassword)

Invoke-WebRequest -Uri "http://localhost:8529/_api/version" `
  -Credential $credential `
  -AllowUnencryptedAuthentication `
  -UseBasicParsing
````

**Note:** This is safe for localhost connections since the traffic never leaves your machine. For production environments, you should use HTTPS.

---

## Alternative: Use Basic Auth Header (simpler for localhost)

````powershell
# Simpler method for localhost testing
$user = "root"
$pass = "your-password"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${user}:${pass}"))

Invoke-WebRequest -Uri "http://localhost:8529/_api/version" `
  -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} `
  -UseBasicParsing
````

This method doesn't trigger the warning because you're manually constructing the Authorization header instead of using `-Credential`.

---

## Store in Documentation

Since you're documenting ArangoDB usage, update your file:

````markdown
## ArangoDB Usage

### Local Connection Testing

**Method 1: Basic Authentication (Recommended for localhost)**
```powershell
$user = "root"
$pass = "your-password"  # Replace with your actual password
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${user}:${pass}"))

Invoke-WebRequest -Uri "http://localhost:8529/_api/version" `
  -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} `
  -UseBasicParsing
```

**Method 2: PSCredential (More secure, requires AllowUnencryptedAuthentication for HTTP)**
```powershell
$securePassword = ConvertTo-SecureString "your-password" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ("root", $securePassword)

Invoke-WebRequest -Uri "http://localhost:8529/_api/version" `
  -Credential $credential `
  -AllowUnencryptedAuthentication `
  -UseBasicParsing
```

**Expected Response:**
```json
{
  "server": "arango",
  "license": "community",
  "version": "3.11.x"
}
```

### Python Connection

```python
import os
from arango import ArangoClient

client = ArangoClient(hosts='http://127.0.0.1:8529')

# Connect to _system database
sys_db = client.db(
    '_system',
    username='root',
    password=os.getenv('ARANGO_PASSWORD', 'your-password')
)

# Test connection
print(f"✅ Connected to ArangoDB version: {sys_db.version()}")
```

### Environment Variables

Store credentials in `.env` file (following [Documentation/Policies/ENV-Handling.md](../../Policies/ENV-Handling.md)):

```
ARANGO_HOST=http://127.0.0.1:8529
ARANGO_USER=root
ARANGO_PASSWORD=your-password
ARANGO_DB=sql_lineage
```

**Never commit `.env` to Git** - it's already in `.gitignore`.

### Common Operations

**Create Database:**
```python
from arango import ArangoClient

client = ArangoClient(hosts='http://127.0.0.1:8529')
sys_db = client.db('_system', username='root', password='your-password')

if not sys_db.has_database('sql_lineage'):
    sys_db.create_database('sql_lineage')
    print("✅ Database created")
```

**Create Collections:**
```python
db = client.db('sql_lineage', username='root', password='your-password')

# Document collections
if not db.has_collection('reports'):
    db.create_collection('reports')

if not db.has_collection('tables'):
    db.create_collection('tables')

# Edge collection (for relationships)
if not db.has_collection('dependencies'):
    db.create_collection('dependencies', edge=True)
```

### Web Interface

Access ArangoDB Web UI:
- URL: http://localhost:8529
- Username: `root`
- Password: [your password]
- Database: `_system` (for admin) or `sql_lineage` (for lineage data)

### Docker Container Management

```powershell
# Start container
docker start ArangoDB

# Stop container
docker stop ArangoDB

# View logs
docker logs ArangoDB --tail 50

# Check status
docker ps --filter "name=ArangoDB"

# Recreate container with volume
docker stop ArangoDB && docker rm ArangoDB
docker volume create arango_data
docker run -d `
  --name ArangoDB `
  -p 8529:8529 `
  -e ARANGO_ROOT_PASSWORD=your-password `
  -v arango_data:/var/lib/arangodb3 `
  arangodb/arangodb:latest
```

### Troubleshooting

**401 Unauthorized Error:**
- Verify password is correct
- Use `-AllowUnencryptedAuthentication` with `-Credential` method
- Or use Basic Auth header method (no warning)

**Connection Refused:**
- Check container is running: `docker ps`
- Verify port mapping: `docker port ArangoDB`
- Check logs: `docker logs ArangoDB`

**Database Corruption:**
- Stop container: `docker stop ArangoDB`
- Remove container: `docker rm ArangoDB`
- Recreate with fresh data (see Docker commands above)
- Rebuild ground truth from SQL Reports (see [scripts/](../../../scripts/))
````

---

## Next Steps

1. ✅ **Test connection** with `-AllowUnencryptedAuthentication`
2. ✅ **Store credentials** in .env file (see ENV-Handling.md)
3. ✅ **Rebuild ground truth** from SQL Reports:

````powershell
# Set environment variables
$env:ARANGO_HOST = "http://127.0.0.1:8529"
$env:ARANGO_USER = "root"
$env:ARANGO_PASSWORD = "your-password"
$env:ARANGO_DB = "sql_lineage"

# Extract lineage and sync to ArangoDB
python scripts\extract_report_lineage.py
python scripts\build_lineage_graph.py
python scripts\nx_to_arango.py --graph-file scripts\lineage_graph.gpickle --update-ground-truth
````

Once the connection test succeeds, you're ready to proceed with the GitHub Actions workflows for automated lineage extraction!