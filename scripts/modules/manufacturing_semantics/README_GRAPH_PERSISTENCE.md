# ArangoDB Graph Persistence - Safety Guide

**Critical Warning**: The ArangoDB graph persistence system stores the mission-critical manufacturing schema graph. Accidental deletion or corruption can break dependent systems. Follow this guide carefully.

## Table of Contents

1. [Safety Rules](#safety-rules)
2. [Graph Naming Conventions](#graph-naming-conventions)
3. [Safe Workflow Procedures](#safe-workflow-procedures)
4. [Backup Strategy](#backup-strategy)
5. [Recovery Procedures](#recovery-procedures)
6. [Verification Checklist](#verification-checklist)
7. [Quick Reference](#quick-reference)
8. [Troubleshooting](#troubleshooting)

---

## Safety Rules

### ⚠️ Critical Rules - NEVER Violate These

1. **NEVER use `overwrite=True` on production graphs without backup**
   ```python
   # ❌ DANGEROUS - No backup, no confirmation
   persistence.persist_graph(graph, name="manufacturing_schema", overwrite=True)
   
   # ✅ SAFE - Use the safe persistence script
   python 020_Entry_Point_Persist_SQLite_to_Arango.py --graph-name manufacturing_schema
   ```

2. **NEVER delete the `manufacturing_schema` graph without backup**
   - This is the production graph used by the Solder pattern
   - Always create a timestamped backup first
   - Verify backup integrity before deletion

3. **NEVER skip safety prompts in production**
   - The `--force-overwrite` flag is for testing only
   - Always use interactive mode for production changes
   - Document your decision to override safety checks

4. **ALWAYS verify graph integrity after updates**
   - Run verification script after every update
   - Check node and edge counts match expectations
   - Test a few key queries to ensure correctness

### 🟡 Best Practices

1. **Use the safe persistence workflow** (`safe_persist.ps1`)
   - Automatic backup before changes
   - Clear error messages and recovery instructions
   - Fail-safe defaults

2. **Test changes on non-production graphs first**
   - Use graph names like `manufacturing_schema_test`
   - Validate changes before applying to production
   - Keep test and production graphs separate

3. **Document all graph changes**
   - What changed and why
   - Who made the change and when
   - Backup file location for recovery

4. **Regular backups**
   - Weekly automated backups (minimum)
   - Before any schema changes (required)
   - After major data loads (recommended)

---

## Graph Naming Conventions

Clear naming prevents accidents. Follow these conventions:

### Production Graphs

- **`manufacturing_schema`** - Main production schema graph (DO NOT DELETE)
- **`manufacturing_schema_v2`** - Major version upgrade (for migration)

### Development Graphs

- **`manufacturing_schema_dev`** - Development testing
- **`manufacturing_schema_test`** - Integration testing
- **`manufacturing_schema_USERNAME`** - Personal development (e.g., `manufacturing_schema_jdoe`)

### Temporary Graphs

- **`temp_schema_YYYYMMDD`** - Temporary graphs (auto-delete after 30 days)
- **`experiment_DESCRIPTION`** - Experimental graphs (e.g., `experiment_new_edges`)

### Naming Rules

1. Use lowercase with underscores (`snake_case`)
2. Include purpose in name (`_dev`, `_test`, `_temp`)
3. Add date for temporary graphs (`_20260205`)
4. Add username for personal graphs (`_jdoe`)
5. Never reuse production names for testing

---

## Safe Workflow Procedures

### Workflow 1: Update Existing Production Graph (Recommended)

**Use this for routine schema updates**

```bash
# Step 1: Create backup
cd scripts/modules/manufacturing_semantics
python backup_arango_graph.py --graph-name manufacturing_schema

# Step 2: Run safe persistence script
python 020_Entry_Point_Persist_SQLite_to_Arango.py

# Step 3: Review safety prompt and choose action
# Option 1: Overwrite (type "DELETE manufacturing_schema" to confirm)
# Option 2: Create with different name
# Option 3: Cancel

# Step 4: Verify integrity
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py
```

**Or use the PowerShell wrapper (simplest):**

```powershell
# Automatic backup + safe persistence
.\safe_persist.ps1

# Skip backup (advanced users only)
.\safe_persist.ps1 -SkipBackup
```

### Workflow 2: Version Swap (Zero-Downtime Update)

**Use this for major schema changes requiring validation**

```bash
# Step 1: Backup current production
python backup_arango_graph.py --graph-name manufacturing_schema

# Step 2: Create new version alongside production
python 020_Entry_Point_Persist_SQLite_to_Arango.py --graph-name manufacturing_schema_v2

# Step 3: Validate new version
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py
# Manually test queries on manufacturing_schema_v2

# Step 4: Swap production (update application config)
# Update environment variable: GRAPH_NAME=manufacturing_schema_v2

# Step 5: After validation, remove old version
# (Keep as backup for 30 days before deletion)
```

### Workflow 3: Incremental Update (Advanced)

**Use this for adding edges without full rebuild**

```bash
# Step 1: Load existing graph
python -c "
from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence
import networkx as nx

config = ArangoDBConfig()
persistence = ArangoDBGraphPersistence(config)

# Load existing graph
G = persistence.load_graph('manufacturing_schema', directed=True)
nx_graph = nx.DiGraph(G)

# Add new edge
nx_graph.add_edge('table_a', 'table_b', relationship_type='references')

# Persist back (with backup!)
persistence.persist_graph(nx_graph, 'manufacturing_schema', overwrite=True)
"

# Step 2: Verify
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py
```

---

## Backup Strategy

### Automated Backups

**Setup weekly cron job (Linux/Mac):**

```bash
# Add to crontab (crontab -e)
0 2 * * 0 cd /path/to/SQL-Projects/scripts/modules/manufacturing_semantics && python backup_arango_graph.py --graph-name manufacturing_schema --output /backups/manufacturing_schema_weekly.json
```

**Setup scheduled task (Windows):**

```powershell
# Create scheduled task for weekly backup
$Action = New-ScheduledTaskAction -Execute "python" -Argument "backup_arango_graph.py --graph-name manufacturing_schema --output C:\backups\manufacturing_schema_weekly.json" -WorkingDirectory "C:\path\to\scripts\modules\manufacturing_semantics"
$Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 2AM
Register-ScheduledTask -TaskName "ArangoDB Weekly Backup" -Action $Action -Trigger $Trigger
```

### Manual Backup

**Before any schema change:**

```bash
# Quick backup with timestamp
python backup_arango_graph.py --graph-name manufacturing_schema

# Backup to specific location
python backup_arango_graph.py --graph-name manufacturing_schema --output /important/backups/schema_before_update.json

# List all graphs
python backup_arango_graph.py --list-graphs
```

### Backup Retention Policy

- **Daily backups**: Keep for 7 days
- **Weekly backups**: Keep for 4 weeks
- **Monthly backups**: Keep for 12 months
- **Pre-change backups**: Keep for 90 days
- **Major version backups**: Keep indefinitely

### Backup Storage

1. **Local storage** (development): `./backups/`
2. **Network storage** (production): `/mnt/backups/arangodb/`
3. **Cloud storage** (disaster recovery): S3/Azure Blob/GCS
4. **Version control** (small graphs): Commit backup JSON to git

---

## Recovery Procedures

### Scenario 1: Graph Accidentally Deleted

```bash
# Step 1: Find latest backup
ls -lt backups/manufacturing_schema_backup_*.json | head -1

# Step 2: Restore from backup
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_20260205_143022.json

# Step 3: Verify restoration
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py
```

### Scenario 2: Graph Corrupted (Wrong Data)

```bash
# Step 1: Identify good backup (before corruption)
ls -lt backups/

# Step 2: Restore to temporary name for verification
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_20260204_100000.json --restore-as manufacturing_schema_temp

# Step 3: Verify temp graph
# (Test queries manually)

# Step 4: Replace production graph
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_20260204_100000.json --overwrite
```

### Scenario 3: Database Connection Lost Mid-Update

```bash
# Step 1: Check ArangoDB status
curl http://localhost:8529/_api/version

# Step 2: Check if graph is in inconsistent state
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py

# Step 3: If corrupted, restore from backup
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_LATEST.json --overwrite

# Step 4: Re-run update safely
.\safe_persist.ps1
```

### Emergency Contacts

If you cannot recover the graph:

1. **Check recent backups**: `ls -lt backups/`
2. **Check git history**: Backup files may be committed
3. **Check automated backup location**: `/mnt/backups/arangodb/`
4. **Contact database admin**: They may have ArangoDB-level backups
5. **Rebuild from source**: Use SQLite database as source of truth

---

## Verification Checklist

Before declaring a graph update successful, complete this checklist:

### ✅ Pre-Update Checks

- [ ] Backup created and verified
- [ ] SQLite source database is up-to-date
- [ ] ArangoDB connection is stable
- [ ] No other users are accessing the graph
- [ ] Change request documented

### ✅ Post-Update Checks

- [ ] Run verification script successfully
  ```bash
  python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py
  ```

- [ ] Node count matches expectations
  ```python
  # Expected node count: 15-20 tables
  assert loaded_graph.number_of_nodes() >= 15
  ```

- [ ] Edge count matches expectations
  ```python
  # Expected edge count: 20-30 relationships
  assert loaded_graph.number_of_edges() >= 20
  ```

- [ ] Key metadata preserved
  ```python
  # Check node attributes
  for node, data in graph.nodes(data=True):
      assert 'label' in data
      assert 'table_type' in data
  ```

- [ ] Sample queries return expected results
  ```python
  # Test shortest path (common use case)
  path = nx.shortest_path(graph, "equipment", "supplier")
  assert len(path) > 0
  ```

- [ ] Dependent systems tested
  - [ ] Solder pattern queries work
  - [ ] NCM elevation script runs
  - [ ] Manufacturing assistant can query graph

### ✅ Documentation

- [ ] Update timestamp recorded
- [ ] Change description documented
- [ ] Backup location noted
- [ ] Verification results saved
- [ ] Incident log updated (if recovery was needed)

---

## Quick Reference

### Common Commands

```bash
# List all graphs
python backup_arango_graph.py --list-graphs

# Create backup
python backup_arango_graph.py --graph-name manufacturing_schema

# Safe persistence (interactive)
python 020_Entry_Point_Persist_SQLite_to_Arango.py

# Safe persistence with PowerShell wrapper
.\safe_persist.ps1

# Verify graph
python 020_Entry_Point_Persist_3rd_NetworkX_Arango.py

# Restore from backup
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_20260205_143022.json

# Force overwrite (testing only!)
python 020_Entry_Point_Persist_SQLite_to_Arango.py --force-overwrite
```

### Environment Variables

```bash
# ArangoDB connection
export DATABASE_HOST="http://localhost:8529"
export DATABASE_USERNAME="root"
export DATABASE_PASSWORD="your_password"
export DATABASE_NAME="networkx_graphs"

# SQLite source database
export SQLITE_PATH="hf-space-inventory-sqlgen/app_schema/manufacturing.db"
<<<<<<< HEAD
=======

## Dry-run / Test Mode Environment Variables

The safety tooling supports two environment variables to run dry-runs without contacting ArangoDB:

- **`TEST_MODE=1`**: Enables test mode — loads data from the SQLite source only and avoids connecting to production data sources.
- **`SKIP_PERSIST=1`**: Skips ArangoDB connection and persistence entirely; the scripts will print a dry-run summary and exit.

Example (local dry-run):

```bash
TEST_MODE=1 SKIP_PERSIST=1 python 020_Entry_Point_Persist_SQLite_to_Arango.py
```
>>>>>>> f46eb79804215e2f43bd2501073568c06d7a7c6c
```

### File Locations

```
scripts/modules/manufacturing_semantics/
├── 020_Entry_Point_Persist_SQLite_to_Arango.py  # Main persistence script
├── backup_arango_graph.py                        # Backup utility
├── safe_persist.ps1                              # PowerShell wrapper
├── README_GRAPH_PERSISTENCE.md                   # This file
└── backups/                                      # Backup storage (create if needed)
    └── manufacturing_schema_backup_*.json
```

### Python API Usage

```python
from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence
import networkx as nx

# Connect
config = ArangoDBConfig()
persistence = ArangoDBGraphPersistence(config)

# Load existing graph
graph = persistence.load_graph("manufacturing_schema", directed=True)

# Convert to NetworkX for manipulation
nx_graph = nx.DiGraph(graph)

# Make changes
nx_graph.add_node("new_table", label="new_table", table_type="fact")

# Persist back (use with caution!)
persistence.persist_graph(nx_graph, "manufacturing_schema", overwrite=True)
```

---

## Troubleshooting

### Issue: "Graph already exists" error

**Symptom**: Script fails with "Graph already exists" when `overwrite=False`

**Solution**:
```bash
# Use safe persistence script (recommended)
python 020_Entry_Point_Persist_SQLite_to_Arango.py

# Or manually choose different name
python 020_Entry_Point_Persist_SQLite_to_Arango.py --graph-name manufacturing_schema_v2
```

### Issue: Cannot connect to ArangoDB

**Symptom**: "Failed to connect to ArangoDB" error

**Diagnosis**:
```bash
# Check if ArangoDB is running
curl http://localhost:8529/_api/version

# Check environment variables
echo $DATABASE_HOST
echo $DATABASE_USERNAME
```

**Solution**:
```bash
# Start ArangoDB (if using Docker)
docker start arangodb

# Or start local ArangoDB service
sudo systemctl start arangodb3

# Set environment variables
export DATABASE_HOST="http://localhost:8529"
export DATABASE_USERNAME="root"
export DATABASE_PASSWORD="your_password"
```

### Issue: SQLite database not found

**Symptom**: "SQLite database not found" error

**Diagnosis**:
```bash
# Check if database exists
ls -la hf-space-inventory-sqlgen/app_schema/manufacturing.db

# Check SQLITE_PATH variable
echo $SQLITE_PATH
```

**Solution**:
```bash
# Initialize SQLite database (if missing)
cd hf-space-inventory-sqlgen
python app.py  # This creates manufacturing.db

# Or specify custom path
python 020_Entry_Point_Persist_SQLite_to_Arango.py --sqlite-path /path/to/database.db
```

### Issue: Empty schema_nodes table

**Symptom**: Script reports "schema_nodes table is empty"

**Behavior**: Script automatically infers nodes from edges

**Action**: Verify inferred nodes are correct

```python
# Manual check
import sqlite3
conn = sqlite3.connect("hf-space-inventory-sqlgen/app_schema/manufacturing.db")
cursor = conn.cursor()
cursor.execute("SELECT * FROM schema_nodes")
print(cursor.fetchall())
cursor.execute("SELECT DISTINCT from_table, to_table FROM schema_edges")
print(cursor.fetchall())
```

### Issue: Backup file too large

**Symptom**: Backup JSON is several GB

**Solution**:
```bash
# Compress backup
gzip backups/manufacturing_schema_backup_*.json

# Or use ArangoDB native dump (more efficient)
arangodump --server.endpoint tcp://localhost:8529 \
           --server.database networkx_graphs \
           --output-directory ./arangodb_dump
```

### Issue: Graph verification fails

**Symptom**: Node/edge counts don't match or metadata is missing

**Diagnosis**:
```python
# Check graph structure
from arangodb_persistence import ArangoDBConfig, ArangoDBGraphPersistence

persistence = ArangoDBGraphPersistence(ArangoDBConfig())
graph = persistence.load_graph("manufacturing_schema")

print(f"Nodes: {graph.number_of_nodes()}")
print(f"Edges: {graph.number_of_edges()}")

# Check sample node
for node, data in list(graph.nodes(data=True))[:1]:
    print(f"Node: {node}")
    print(f"Attributes: {data}")
```

**Solution**: Restore from last known good backup

```bash
python backup_arango_graph.py --restore backups/manufacturing_schema_backup_LAST_GOOD.json --overwrite
```

---

## Additional Resources

- **ArangoDB Documentation**: https://www.arangodb.com/docs/
- **NetworkX Documentation**: https://networkx.org/documentation/
- **nx-arangodb GitHub**: https://github.com/arangodb/nx-arangodb
- **NVIDIA Blog Post**: [Production-Ready Graph Analytics for NetworkX](https://developer.nvidia.com/blog/accelerated-production-ready-graph-analytics-for-networkx-users/)

---

## Change Log

| Date | Author | Change | Backup |
|------|--------|--------|--------|
| 2026-02-05 | System | Initial documentation | N/A |

---

**Remember**: When in doubt, backup first! A few minutes of backup time can save hours of recovery work.
