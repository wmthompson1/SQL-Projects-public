the complete workflow from new model to production deployment. 

---

## Complete SQLMesh Workflow:  New Model to Production

### **Phase 1: Create the Source Data (Faux Production)**

#### Step 1.1: Create CSV seed file
```csv name=seeds/inventory_transactions.csv
transaction_id,item_id,transaction_type,quantity,transaction_date,warehouse_id
1,101,INBOUND,50,2026-01-01 08:00:00,WH01
2,102,INBOUND,30,2026-01-01 09:00:00,WH01
3,101,OUTBOUND,10,2026-01-02 10:00:00,WH01
4,103,INBOUND,25,2026-01-02 11:00:00,WH02
5,102,OUTBOUND,5,2026-01-03 14:00:00,WH01
```

#### Step 1.2: Load CSV into DuckDB (production simulation)

**Option A: Python script**
```python name=load_inventory_data.py
import duckdb
import pandas as pd

# Connect to your local database
conn = duckdb.connect('local. db')

# Read CSV
df = pd.read_csv('seeds/inventory_transactions. csv')

# Create table from CSV
conn.execute("""
    CREATE TABLE IF NOT EXISTS inventory_transactions AS 
    SELECT * FROM df
""")

# Verify
result = conn.execute("SELECT COUNT(*) FROM inventory_transactions").fetchone()
print(f"✓ Loaded {result[0]} rows into inventory_transactions")

conn.close()
```

Run it: 
```bash
python load_inventory_data.py
```

**Option B: DuckDB CLI**
```bash
duckdb local.db
```
```sql
CREATE TABLE inventory_transactions AS 
SELECT * FROM read_csv_auto('seeds/inventory_transactions.csv');

SELECT * FROM inventory_transactions LIMIT 5;
. exit
```

#### Step 1.3: Verify source data
```bash
sqlmesh --paths . fetchdf "SELECT * FROM inventory_transactions LIMIT 5"
```

---

### **Phase 2: Create SQLMesh Model**

#### Step 2.1: Create model file
```sql name=models/inventory_summary.sql
MODEL (
  name inventory_summary,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column transaction_date
  ),
  start '2026-01-01',
  cron '@daily',
  grain (item_id, ds)
);

SELECT 
  item_id,
  DATE_TRUNC('day', transaction_date) AS ds,
  SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE 0 END) AS total_inbound,
  SUM(CASE WHEN transaction_type = 'OUTBOUND' THEN quantity ELSE 0 END) AS total_outbound,
  SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE -quantity END) AS net_quantity,
  COUNT(*) AS transaction_count
FROM inventory_transactions
WHERE 
  transaction_date BETWEEN @start_date AND @end_date
GROUP BY 
  item_id,
  DATE_TRUNC('day', transaction_date)
```

#### Step 2.2: Add tests (optional but recommended)
```yaml name=tests/test_inventory_summary.yaml
test_inventory_summary:
  model: inventory_summary
  inputs:
    inventory_transactions:
      - transaction_id: 1
        item_id: 101
        transaction_type: INBOUND
        quantity:  50
        transaction_date:  2026-01-01 08:00:00
        warehouse_id: WH01
      - transaction_id: 2
        item_id: 101
        transaction_type: OUTBOUND
        quantity: 10
        transaction_date: 2026-01-01 10:00:00
        warehouse_id: WH01
  outputs:
    query: 
      - item_id: 101
        ds: 2026-01-01
        total_inbound: 50
        total_outbound:  10
        net_quantity:  40
        transaction_count:  2
```

---

### **Phase 3: Local Development & Testing**

#### Step 3.1: Validate the model
```bash
# Check model is recognized
sqlmesh --paths . info

# See the compiled SQL
sqlmesh --paths .  render inventory_summary
```

#### Step 3.2: Run tests
```bash
sqlmesh --paths . test
```

#### Step 3.3: Create dev environment and preview
```bash
# Create/update dev environment
sqlmesh --paths . plan dev

# Review the plan output: 
# - New models to add
# - Data backfill requirements
# - Breaking vs non-breaking changes

# Apply when ready (or use --auto-apply)
```

#### Step 3.4: Query dev environment
```bash
# Query your new model in dev
sqlmesh --paths .  fetchdf "SELECT * FROM default__dev.inventory_summary ORDER BY ds, item_id"

# Compare with source data
sqlmesh --paths .  fetchdf "SELECT item_id, transaction_type, quantity, transaction_date FROM inventory_transactions ORDER BY transaction_date"
```

---

### **Phase 4: Git & Pull Request**

#### Step 4.1: Create feature branch
```bash
git checkout -b feature/add-inventory-summary-model
```

#### Step 4.2: Commit your changes
```bash
git add models/inventory_summary.sql
git add tests/test_inventory_summary. yaml
git add seeds/inventory_transactions.csv
git add load_inventory_data.py  # if you created one

git commit -m "Add inventory_summary model

- Created incremental model for daily inventory aggregation
- Added test coverage for inventory transactions
- Includes sample data seed for testing"
```

#### Step 4.3: Push to GitHub
```bash
git push origin feature/add-inventory-summary-model
```

#### Step 4.4: Create Pull Request
1. Go to your GitHub repository
2. Click "Compare & pull request"
3. Fill in PR description: 

```markdown
## Summary
Add new `inventory_summary` model to aggregate daily inventory transactions

## Changes
- ✨ New model:  `inventory_summary` (incremental by time range)
- ✅ Added unit tests
- 📊 Sample data seed included

## Testing
- [x] Local tests pass (`sqlmesh test`)
- [x] Dev environment validated (`sqlmesh plan dev`)
- [x] Query results verified

## Model Details
- **Type**: Incremental by time range
- **Grain**: `item_id`, `ds` (daily)
- **Source**: `inventory_transactions`
- **Metrics**: inbound, outbound, net quantity, transaction count
```

---

### **Phase 5: GitHub Actions CI/CD**

#### Step 5.1: GitHub Action runs automatically

Your workflow (`.github/workflows/sqlmesh. yml`) triggers on PR: 

```yaml
on:
  pull_request: 
    types: [opened, synchronize, reopened]

jobs:
  sqlmesh-preview:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name:  Install dependencies
        run: |
          pip install sqlmesh duckdb pandas
      
      - name: Load test data
        run: python load_inventory_data.py
      
      - name: Run SQLMesh tests
        run: sqlmesh --paths . test
      
      - name: Plan changes in PR environment
        run: sqlmesh --paths . plan pr_${{ github.event.pull_request.number }} --auto-apply
```

#### Step 5.2: Review CI results
- Check that tests pass ✅
- Review plan output in Actions logs
- Verify no unexpected changes

---

### **Phase 6: Code Review & Merge**

#### Step 6.1: Team review
- Reviewers check the model logic
- Validate test coverage
- Confirm data quality expectations

#### Step 6.2: Merge to main
Click "Merge pull request" on GitHub

---

### **Phase 7: Production Deployment**

#### Step 7.1: GitHub Action deploys to prod

Your workflow triggers on push to main:

```yaml
on:
  push: 
    branches: [main]

jobs:
  sqlmesh-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name:  Setup Python
        uses: actions/setup-python@v4
        with:
          python-version:  '3.11'
      
      - name: Install dependencies
        run: pip install sqlmesh
      
      # Connect to your actual production database here
      # (You'd configure this with secrets/connection strings)
      
      - name: Deploy to production
        run: sqlmesh --paths . plan prod --auto-apply
```

#### Step 7.2: Verify production deployment
```bash
# Locally verify prod (if you have access)
sqlmesh --paths . --gateway production fetchdf "SELECT * FROM inventory_summary LIMIT 10"
```

---

### **Phase 8: Ongoing Updates**

When you need to modify the model:

1. **Create new branch**:  `git checkout -b feature/update-inventory-summary`
2. **Modify model**: Edit `models/inventory_summary.sql`
3. **Test locally**: `sqlmesh plan dev`
4. **Commit & PR**: Same process as above
5. **SQLMesh handles versioning**: It will create a new version with hash suffix
6. **Zero-downtime deployment**: Old version stays until new one is validated

---

## Quick Reference Commands

```bash
# Development cycle
sqlmesh --paths . info                    # Validate
sqlmesh --paths . render <model>          # Preview SQL
sqlmesh --paths . test                    # Run tests
sqlmesh --paths .  plan dev                # Preview changes
sqlmesh --paths . fetchdf "SELECT ..."    # Query results

# Git workflow
git checkout -b feature/new-model
git add models/
git commit -m "Add new model"
git push origin feature/new-model

# CI/CD (automated in GitHub Actions)
sqlmesh plan pr_123 --auto-apply          # PR preview
sqlmesh plan prod --auto-apply            # Production deploy
```

---

## Complete Example Workflow Script

Here's a shell script for the complete local workflow:

```bash name=new_model_workflow.sh
#!/bin/bash
set -e

MODEL_NAME="inventory_summary"
BRANCH_NAME="feature/add-${MODEL_NAME}-model"

echo "🚀 Starting new model workflow for:  ${MODEL_NAME}"

# 1. Load source data
echo "📊 Loading source data..."
python load_inventory_data.py

# 2. Validate model
echo "✅ Validating model..."
sqlmesh --paths . info

# 3. Run tests
echo "🧪 Running tests..."
sqlmesh --paths . test

# 4. Create dev environment
echo "🔨 Creating dev environment..."
sqlmesh --paths . plan dev --auto-apply

# 5. Query results
echo "📈 Querying results..."
sqlmesh --paths . fetchdf "SELECT * FROM default__dev.${MODEL_NAME} LIMIT 5"

# 6. Git workflow
echo "📝 Creating feature branch..."
git checkout -b ${BRANCH_NAME}
git add models/${MODEL_NAME}.sql tests/
git commit -m "Add ${MODEL_NAME} model"

echo "✨ Done! Next steps:"
echo "  1. Review the changes"
echo "  2. Push:  git push origin ${BRANCH_NAME}"
echo "  3. Create PR on GitHub"
```

---

