# ArangoDB Database Corruption Issue

Your ArangoDB instance has **corrupted or incompatible data** from an earlier version. The key error is:

```
FATAL [d9df8] {startup} column family 'Documents' is missing in database. 
if you are upgrading from an earlier alpha or beta version of ArangoDB, 
it is required to restart with a new database directory and re-import data
```

---

## Root Cause

This typically happens when:
1. **ArangoDB version mismatch** - You upgraded ArangoDB but kept old data directories
2. **Corrupted RocksDB data** - The underlying storage engine lost critical column families
3. **Alpha/beta version upgrade** - Using pre-release versions left incompatible data

---

## Solution: Clean Restart with Fresh Database

### Option 1: Reset ArangoDB Data (Recommended for Development)

````powershell
# Stop ArangoDB container
docker stop <container-name>

# Remove old data volume (WARNING: This deletes all data!)
docker volume rm <volume-name>

# Or if using bind mount, delete the data directory:
Remove-Item -Recurse -Force C:\path\to\arangodb\data

# Restart with fresh database
docker-compose up -d arangodb

# Or manual docker run:
docker run -d `
  -p 8529:8529 `
  -e ARANGO_ROOT_PASSWORD=your-password `
  --name arangodb `
  arangodb/arangodb:latest
````

### Option 2: Backup and Migrate (If You Have Important Data)

If you have data you need to preserve:

````powershell
# 1. Export data from old container (if it starts at all)
docker exec arangodb arangodump `
  --server.endpoint http+tcp://127.0.0.1:8529 `
  --server.username root `
  --server.password your-password `
  --output-directory /dump

# 2. Copy dump to host
docker cp arangodb:/dump ./arango-backup

# 3. Clean start (see Option 1)

# 4. Restore data
docker exec arangodb arangorestore `
  --server.endpoint http+tcp://127.0.0.1:8529 `
  --server.username root `
  --server.password your-password `
  --input-directory /dump
````

---

## Fix WSL Memory Mapping Warning (Optional but Recommended)

The warning about `vm.max_map_count` can cause performance issues:

````powershell
# In WSL terminal (not PowerShell):
wsl -d <your-distro> -u root bash

# Then run:
sysctl -w vm.max_map_count=512000

# Make it persistent across reboots:
echo "vm.max_map_count=512000" >> /etc/sysctl.conf
````

---

## Update Your GitHub Actions Workflow

Since you're using ArangoDB for CI/CD lineage storage, update your secrets and scripts to handle fresh database initialization:

### Update [`scripts/nx_to_arango.py`](scripts/nx_to_arango.py )

````python
import os
from arango import ArangoClient
from arango.exceptions import DatabaseCreateError

def ensure_database_exists(client, db_name: str):
    """Create database if it doesn't exist (idempotent)"""
    sys_db = client.db(
        '_system',
        username=os.getenv('ARANGO_USER', 'root'),
        password=os.getenv('ARANGO_PASSWORD')
    )
    
    if not sys_db.has_database(db_name):
        print(f"Creating database: {db_name}")
        sys_db.create_database(db_name)
    
    return client.db(
        db_name,
        username=os.getenv('ARANGO_USER', 'root'),
        password=os.getenv('ARANGO_PASSWORD')
    )

def sync_graph_to_arango(graph_file: Path, update_ground_truth: bool = False):
    """Sync NetworkX graph to ArangoDB with database creation"""
    
    client = ArangoClient(hosts=os.getenv('ARANGO_HOST', 'http://127.0.0.1:8529'))
    db_name = os.getenv('ARANGO_DB', 'sql_lineage')
    
    # Ensure database exists before connecting
    db = ensure_database_exists(client, db_name)
    
    # Rest of your existing code...
````

---

## Docker Compose Configuration (Reference)

Ensure your `docker-compose.yml` has proper volume configuration:

````yaml
services:
  arangodb:
    image: arangodb/arangodb:latest
    container_name: arangodb
    ports:
      - "8529:8529"
    environment:
      ARANGO_ROOT_PASSWORD: ${ARANGO_PASSWORD}
    volumes:
      # Named volume (recommended - survives container removal)
      - arango_data:/var/lib/arangodb3
      # OR bind mount (for backup/inspection)
      # - ./data/arangodb:/var/lib/arangodb3
    restart: unless-stopped

volumes:
  arango_data:
    driver: local
````

---

## Testing After Reset

````powershell
# 1. Verify ArangoDB is running
docker logs arangodb --tail 50

# Should see:
# INFO {startup} ArangoDB is ready for business. Have fun!

# 2. Test connection
curl http://localhost:8529/_api/version

# 3. Run lineage extraction workflow
cd Utilities\SQLMesh
python ..\..\scripts\extract_report_lineage.py
python ..\..\scripts\build_lineage_graph.py
python ..\..\scripts\nx_to_arango.py --graph-file ..\..\scripts\lineage_graph.gpickle --update-ground-truth
````

---

## Summary

**Immediate Action:**
1. Stop ArangoDB container
2. Delete data volume/directory
3. Restart with fresh database
4. Re-run lineage extraction scripts to rebuild ground truth

**Future Prevention:**
- Use **named Docker volumes** (not bind mounts) for production-like stability
- Document ArangoDB version in your README
- Add database initialization checks to scripts
- Consider backing up the graph database after major lineage updates

The good news: Since your ground truth is **derived from SQL Reports** (not manually created), you can rebuild it completely from source by re-running your GitHub Actions workflows! 🎉