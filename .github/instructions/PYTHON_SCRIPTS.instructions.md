---
applyTo: "**/scripts/**/*.py"
---

# Python Scripts Guidelines

## Critical Rules for Python Scripts

Python scripts in this repository primarily handle schema management, graph operations, and data analysis workflows.

## Environment Setup

### Virtual Environment (REQUIRED)
```bash
# Create and activate virtual environment
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
.\.venv\Scripts\Activate.ps1  # Windows PowerShell

# Install dependencies
pip install -r requirements.txt
```

**NEVER** install packages to system Python. Always use a virtual environment.

## Common Patterns

### ArangoDB Connections
```python
from arango import ArangoClient
from dotenv import load_dotenv
import os

load_dotenv()  # Load from .env file

client = ArangoClient(hosts=os.getenv('ARANGO_HOST', 'http://127.0.0.1:8529'))
db = client.db(
    os.getenv('ARANGO_DB', '_system'),
    username=os.getenv('ARANGO_USER', 'dev_user'),
    password=os.getenv('ARANGO_PASSWORD', '')
)
```

### NetworkX Graph Operations
```python
import networkx as nx
import pickle

# Load graph
with open('graph_file.gpickle', 'rb') as f:
    G = nx.read_gpickle(f)

# Save graph
with open('graph_file.gpickle', 'wb') as f:
    nx.write_gpickle(G, f)
```

### SQL Server Connections (when needed)
```python
import pyodbc

# Use Windows integrated auth when possible
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=sql-lab-1;"
    "DATABASE=LIVE;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)
conn = pyodbc.connect(conn_str)
```

## Security Best Practices

1. **Environment Variables**: Use `.env` files for credentials (never commit!)
2. **Load from .env**: Always use `python-dotenv` to load environment variables
3. **Default Values**: Provide sensible defaults for optional settings
4. **No Hardcoded Secrets**: Never hardcode passwords, API keys, or connection strings

## File Organization

- **scripts/**: General purpose scripts and utilities
- **scripts/modules/**: Reusable Python modules
- **scripts/test_runner/**: Test scripts and validation
- **hf-space-inventory-sqlgen/**: HuggingFace Space application

## Error Handling

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

try:
    # Your code here
    pass
except Exception as e:
    logger.error(f"Error occurred: {e}", exc_info=True)
    raise
```

## Testing

- Use `pytest` for unit tests
- Keep test files near the code they test
- Use descriptive test names: `test_<function>_<scenario>_<expected_result>`

## Dependencies

- Prefer standard library when possible
- Document any new dependencies in requirements.txt
- Pin versions for reproducibility: `package>=X.Y.Z`
