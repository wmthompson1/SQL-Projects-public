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