# GitHub Copilot Instructions for SQL-Projects

This repository contains SQL reports, data models, and utilities for a manufacturing ERP (Visual Manufacturing) running on SQL Server. The codebase primarily supports business intelligence reporting, database schema documentation, and data analysis workflows.

## Code Standards

### Required Commands
```bash
# Python environment setup (required for all Python work)
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
.\.venv\Scripts\Activate.ps1  # Windows PowerShell

# Install dependencies
pip install -r requirements.txt  # Core dependencies
pip install -r requirements-dev.txt  # Development dependencies

# Testing
python -m pytest  # Run Python tests
python test_client.py --base-url http://localhost:7860  # Test HF Space app

# PowerShell scripts (use pwsh for cross-platform)
pwsh ./Documentation/Schema/generate_table_index.ps1  # Regenerate schema index
pwsh ./Documentation/Schema/ddl-extract/extract-schema.ps1  # Extract schema from SQL Server
```

### Development Guidelines
1. **Always use fully-qualified table names** in SQL: `Live.dbo.TABLE_NAME`
2. **Virtual environments required** for Python work - never install to system Python
3. **Never commit secrets** - `.env` files are gitignored
4. **Follow existing patterns** - review similar files before creating new ones
5. **Document schema changes** - update DDL files and regenerate table index

## Architecture Overview

### Core Components
- **SQL_Reports/**: Production SSRS paginated reports organized by business domain (Finance, Manufacturing, Shipping, etc.)
- **Documentation/Data Models/**: Authoritative schema documentation with extracted DDL and domain-specific flow documents
- **hf-space-inventory-sqlgen/**: FastAPI + Gradio application for natural language to SQL conversion (deployable to Hugging Face Spaces)
- **schema/**: SQLite-based semantic layer with ground-truth SQL query templates organized by category
- **scripts/**: Python utilities for graph-based schema management using NetworkX and ArangoDB

### Data Flow Patterns
1. **Schema Extract → Documentation**: PowerShell scripts extract live schema DDLs from `sql-lab-1` server to `Documentation/Data Models/ddl/schema-extract/output/`
2. **Graph Persistence**: NetworkX graph models (`.gpickle`) → ArangoDB for schema relationships and query optimization
3. **SQL Generation**: Natural language → SQL templates via MCP-compliant API endpoints

## Database & Schema Conventions

### Connection Patterns
- **Primary Database**: SQL Server instance `sql-lab-1` with databases `LIVE` (ERP) and `LIVEAccounting` (GL)
- **Schema Prefix**: Always qualify tables: `Live.dbo.TABLE_NAME` or `LIVE.dbo.TABLE_NAME` (case-insensitive)
- **Authentication**: Prefer Windows integrated auth; use `-UseIntegratedAuth` switch (NOT a string parameter) for PowerShell scripts
- **SSL/Certificate Issues**: Add `-TrustServerCertificate` switch if encountering SPN/SSL errors

### Data Model Documentation Structure
Key reference documents follow naming pattern `{domain}_{concept}_flow.md`:
- [Documentation/Data Models/Payables/payables_invoice_voucher_flow.md](../Documentation/Data Models/Payables/payables_invoice_voucher_flow.md) - Invoice/voucher relationships
- [Documentation/Data Models/Inventory_Transactions/Document_Hierarchy_Map.md](../Documentation/Data Models/Inventory_Transactions/Document_Hierarchy_Map.md) - Transaction flow hierarchies

**Critical**: When working with data models under `Documentation/Data Models/Inventory_Transactions/`, follow rules in [.github/instructions/INVENTORY_QUERIES.instructions.md](instructions/INVENTORY_QUERIES.instructions.md) - inventory queries span multiple related tables, not single tables.

### Common Join Patterns
```sql
-- Receiver to Payable (PO-based matching) - prefer this over invoice number matching
FROM Live.dbo.RECEIVER_LINE RL
JOIN Live.dbo.PAYABLE_LINE PL 
  ON PL.RECEIVER_ID = RL.RECEIVER_ID AND PL.RECEIVER_LINE_NO = RL.LINE_NO
JOIN Live.dbo.PAYABLE P ON PL.VOUCHER_ID = P.VOUCHER_ID

-- Invoice number matching (use cautiously - include vendor filter)
-- Note: RECEIVER_LINE.INVOICE_ID is NVARCHAR(15), PAYABLE.INVOICE_ID is NVARCHAR(20)
WHERE P.INVOICE_ID = CAST(RL.INVOICE_ID AS NVARCHAR(20)) AND P.VENDOR_ID = @VendorID
```

## Development Workflows

### Python Environment Setup
Developers use local virtual environments; managers run scripts with system Python.

```powershell
# Create and activate .venv (from repo root)
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r "Utilities\Powershell Utilities\requirements.txt"
```

Policy: [Documentation/Policies/VirtualEnv.md](../Documentation/Policies/VirtualEnv.md)

### Schema Extraction Workflow
Extract authoritative DDLs from live database (requires network access to `sql-lab-1`):

```powershell
.\Documentation\Schema\ddl-extract\extract-schema.ps1 `
  -ServerInstance 'sql-lab-1' `
  -Databases 'LIVE','LIVEAccounting' `
  -OutputDir '.\Documentation\Schema\ddl-extract\output' `
  -UseIntegratedAuth -TrustServerCertificate

# Filter specific tables
-TableFilter 'PAYABLE*','RECEIVER*'
```

**IMPORTANT**: `-UseIntegratedAuth` is a switch (no value), not a string parameter.

### ArangoDB Graph Persistence
Persist NetworkX schema graphs to ArangoDB for relationship queries:

```powershell
python .\scripts\nx_to_arango.py --graph-file .\scripts\merged_graph_temp2.gpickle --create-user
```

- ArangoDB runs locally at http://127.0.0.1:8529
- Connection config: Use `.env` file (repo root preferred) or `scripts/.env` - see [Documentation/Policies/ENV-Handling.md](../Documentation/Policies/ENV-Handling.md)
- Never commit `.env` files (already in `.gitignore`)

### Running HF Space Inventory SQL Generator
FastAPI + Gradio app for natural language SQL generation:

```bash
cd hf-space-inventory-sqlgen
python app.py  # Starts FastAPI + Gradio on port 7860
```

- SQLite database auto-initialized from `schema/schema_sqlite.sql`
- MCP endpoints: `/mcp/discover`, `/mcp/tools/generate_sql`, `/mcp/tools/get_schema`
- Ground-truth SQL templates: `schema/queries/{category}.sql` with `schema/queries/index.json` for categorization

## File Organization & Conventions

### Documentation Structure
```
Documentation/
├── Schema/                   # ✅ Centralized schema documentation
│   ├── Tables/               # Authoritative DDL files
│   ├── Data_Models/          # ✅ Domain-specific flow documentation
│   │   ├── Payables/
│   │   ├── Inventory_Transactions/
│   │   └── Work_Orders/
│   └── ddl-extract/          # ✅ Schema extraction tooling
├── Policies/
└── Help-md/
```

### Schema Documentation Conventions
- **DDL Files** (`Documentation/Schema/Tables/`): CREATE TABLE scripts
- **Data Models** (`Documentation/Schema/Data_Models/`): Business flow docs
- **Extraction Tools** (`Documentation/Schema/ddl-extract/`): PowerShell extraction scripts

**Schema Extraction Workflow:**
```powershell
# ✅ UPDATED PATH
.\Documentation\Schema\ddl-extract\extract-schema.ps1 `
  -ServerInstance 'sql-lab-1' `
  -Databases 'LIVE','LIVEAccounting' `
  -OutputDir '.\Documentation\Schema\ddl-extract\output' `
  -UseIntegratedAuth -TrustServerCertificate
```

### Report SQL Files
- Location: `SQL_Reports/{Domain}/{ReportName}.sql`
- Often reference stored procedures: `sp_ssrs_*`, `usp_SSRS_*`
- Always use fully-qualified table names: `Live.dbo.TABLE`

### Documentation Structure
```
Documentation/
├── Data Models/           # Domain-specific data flow docs
│   ├── Payables/
│   ├── Receivables/
│   ├── Inventory_Transactions/
│   ├── Work_Orders/
│   └── ddl/              # Extracted schema DDLs
│       └── schema-extract/
│           └── output/
│               ├── LIVE/
│               └── LIVEAccounting/
├── Policies/             # ENV handling, virtual env, credentials
└── Schema/               # Centralized DDL reference (alternative location)
    └── Tables/           # Individual CREATE TABLE scripts
```

### Collaboration Files
- [Collaboration/GETTING_STARTED.md](../Collaboration/GETTING_STARTED.md) - GitHub onboarding for non-technical users
- [Collaboration/Business_Glossary/README.md](../Collaboration/Business_Glossary/README.md) - Business term definitions
- Templates: `Collaboration/Templates/{decision,meeting-notes,proposal}-template.md`

## Key Patterns & Conventions

### PowerShell Script Invocation
- Use `pwsh` (PowerShell Core) for cross-platform compatibility
- Repo provides helper scripts in `Utilities/Powershell Utilities/`
- Common utilities: `venv_setup.ps1`, `Copy_RDL_to_XML.ps1` (for SSRS report diffing)

### SQL Data Type Handling
Watch for type mismatches in joins:
- Invoice IDs: `PAYABLE.INVOICE_ID` (NVARCHAR(20)) vs `RECEIVER_LINE.INVOICE_ID` (NVARCHAR(15))
- Always cast to wider type: `CAST(RL.INVOICE_ID AS NVARCHAR(20))`
- Dates: Use `datetime` type; avoid string comparisons

### SSRS Report Management
- Reports stored as `.rdl` files under `SQL_Reports/` and `Server/SSRS_Master/`
- Version comparison workflow: Copy `.rdl` to `.xml` for diffing (see `Utilities/Powershell Utilities/Copy_RDL_to_XML.ps1`)
- Report metadata queries use `ReportServer.dbo.Catalog` table

## External Integrations

### Hugging Face Spaces
The `hf-space-inventory-sqlgen/` app is deployable to Hugging Face:
1. Create new Space with Gradio SDK
2. Upload all files from `hf-space-inventory-sqlgen/`
3. Space auto-deploys with FastAPI + Gradio interface

### GitBook Documentation
Public documentation site: https://skills-inc.gitbook.io/sql-semantics/

## Security & Credentials

- **Never commit secrets**: `.env` files are gitignored
- **Credential Hierarchy**: Integrated auth > interactive prompt (`-PromptForSqlCredential`) > plaintext args
- **Secret Rotation**: Follow incident response in [Documentation/Policies/ENV-Handling.md](../Documentation/Policies/ENV-Handling.md)
- **Dev User Pattern**: Use dedicated ArangoDB dev user (not root) for local development

## Common Pitfalls

1. **Switch vs String Parameters**: `-UseIntegratedAuth` is a switch (no value), NOT `-UseIntegratedAuth 'true'`
2. **Schema Qualification**: Always use `Live.dbo.TABLE` - unqualified table references fail in cross-database queries
3. **Receiver-to-Payable Matching**: Join via `PAYABLE_LINE` using receiver IDs, not invoice numbers (invoice numbers are often NULL in `RECEIVER_LINE.INVOICE_ID`)
4. **Virtual Env Activation**: Use `.venv\Scripts\Activate.ps1` (PowerShell) not `activate.bat` (cmd.exe)
5. **ArangoDB Node Keys**: NetworkX node IDs must be normalized to valid Arango `_key` format (no special chars)

## Testing & Validation

- **SQL Queries**: Test against `Live` database with date filters to limit result sets
- **Schema Changes**: Regenerate table index after DDL updates: `pwsh Documentation/Schema/generate_table_index.ps1`
- **Python Scripts**: Validate imports before execution - use workspace `.venv` to avoid missing package errors

## Reference Links

- Repository: https://github.com/Skills-Inc-Org/SQL-Projects
- SQL Reports folder: https://github.com/Skills-Inc-Org/SQL-Projects/tree/main/SQL_Reports
- GitBook: https://skills-inc.gitbook.io/sql-semantics/
- Hugging Face Spaces: https://huggingface.co/spaces
