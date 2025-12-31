# Schema DDL Reference

This folder contains authoritative database schema DDL (Data Definition Language) files extracted from the LIVE database. These CREATE TABLE scripts serve as the foundational reference for all data model work.

## Quick Navigation

### By Data Model
- **[Payables](PAYABLES_TABLES.md)** - Complete reference for AP/Payables tables
- **[Receivables](RECEIVABLES_TABLES.md)** - Complete reference for AR/Receivables tables

### Full Schema Reference
- **[TABLE_INDEX.md](TABLE_INDEX.md)** - Alphabetical table→file mapping for all 1100+ tables
- **[Tables/](Tables/)** - Individual DDL files for each table

## Folder Structure

```
Documentation/Schema/
├── README.md                    # This file
├── TABLE_INDEX.md               # Alphabetical table→file mapping
├── PAYABLES_TABLES.md           # Payables-specific table reference
├── RECEIVABLES_TABLES.md        # Receivables-specific table reference
├── Tables/                      # All DDL files
│   ├── dbo.PAYABLE.sql
│   ├── dbo.RECEIVABLE.sql
│   └── ... (1100+ .sql files)
└── generate_table_index.ps1     # Script to regenerate TABLE_INDEX.md
```

## File Naming Conventions

All DDL files follow the pattern: `dbo.{TABLE_NAME}.sql`

Examples:
- `dbo.PAYABLE.sql` - PAYABLE table definition
- `dbo.CUSTOMER_ORDER.sql` - CUSTOMER_ORDER table definition
- `dbo.INVENTORY_TRANS.sql` - INVENTORY_TRANS table definition

## Schema Maintenance

### Regenerating the Table Index

After adding or updating DDL files in the Tables/ folder, regenerate the index:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -Command "& 'Documentation/Schema/generate_table_index.ps1'"
```

This updates `TABLE_INDEX.md` with the current list of tables.

### Schema Extraction Source

These DDL files were extracted from the LIVE database using the schema-extract tool. For details on the extraction process, see:
- `Documentation/Data Models/ddl/schema-extract/README.md`

## Common Table Patterns

Many business processes in the ERP system follow a three-tier pattern:

### Header → Line → Distribution

**Example: Payables**
- `PAYABLE` (header) - Invoice header with vendor, dates, totals
- `PAYABLE_LINE` (line items) - Individual line items on the invoice
- `PAYABLE_DIST` (GL distribution) - Accounting entries for the payable

**Example: Receivables**
- `RECEIVABLE` (header) - Invoice header with customer, dates, totals
- `RECEIVABLE_LINE` (line items) - Individual line items on the invoice
- `RECEIVABLE_DIST` (GL distribution) - Accounting entries for the receivable

**Example: Inventory**
- `INVENTORY_TRANS` (transaction) - Material movement record
- `INV_TRANS_DIST` (GL distribution) - Accounting impact of the movement

### Order → Shipment/Receipt → Invoice

**Purchasing Flow:**
- `PURCHASE_ORDER` → `PURC_ORDER_LINE`
- `RECEIVER` → `RECEIVER_LINE` (goods receipt)
- `PAYABLE` → `PAYABLE_LINE` (vendor invoice)

**Sales Flow:**
- `CUSTOMER_ORDER` → `CUST_ORDER_LINE`
- `SHIPPER` → `SHIPPER_LINE` (goods shipment/packlist)
- `RECEIVABLE` → `RECEIVABLE_LINE` (customer invoice)

## Related Documentation

### Data Models
- **[Payables Data Models](../Data%20Models/Payables/)** - Query examples and analysis
- **[Receivables Data Models](../Data%20Models/Receivables/)** - Query examples and analysis
- **[Inventory Transactions](../Data%20Models/Inventory_Transactions/)** - Inventory analysis

### Schema Extraction
- **[Schema Extract Tool](../Data%20Models/ddl/schema-extract/)** - Tool documentation and scripts

## Foreign Key Relationships

All DDL files include:
- Primary key constraints (`PK_*`)
- Foreign key constraints (`FKEY*` or `FK_*`)
- Column data types and defaults
- Identity columns (auto-incrementing)

Example foreign keys from PAYABLE_LINE:
```sql
ALTER TABLE [dbo].[PAYABLE_LINE] ADD CONSTRAINT [FKEY0223] 
  FOREIGN KEY ([VOUCHER_ID]) REFERENCES [dbo].[PAYABLE]([VOUCHER_ID]);
```

Use these relationships to understand:
- Valid join paths between tables
- Data integrity constraints
- Referential dependencies

## Key Tables by Functional Area

### Financials
- `ACCOUNT`, `ACCOUNTING_ENTITY` - Chart of accounts
- `FINANCIAL_PERIOD`, `FINANCIAL_CALENDAR` - Fiscal periods
- `JOURNAL_BATCH`, `GJ`, `GJ_LINE` - General journal entries

### Payables (AP)
- `PAYABLE`, `PAYABLE_LINE`, `PAYABLE_DIST` - Vendor invoices
- `RECEIVER`, `RECEIVER_LINE` - Goods receipts
- `CASH_DISBURSE_LINE` - Payment transactions
- See [PAYABLES_TABLES.md](PAYABLES_TABLES.md) for complete list

### Receivables (AR)
- `RECEIVABLE`, `RECEIVABLE_LINE`, `RECEIVABLE_DIST` - Customer invoices
- `SHIPPER`, `SHIPPER_LINE` - Shipments/packlists
- `CASH_RECEIPT_LINE` - Payment receipts
- See [RECEIVABLES_TABLES.md](RECEIVABLES_TABLES.md) for complete list

### Inventory
- `INVENTORY_TRANS`, `INV_TRANS_DIST` - Material movements
- `PART`, `PART_SITE` - Part master data
- `LOCATION`, `WAREHOUSE` - Storage locations

### Procurement
- `PURCHASE_ORDER`, `PURC_ORDER_LINE` - Purchase orders
- `VENDOR`, `VENDOR_PART` - Supplier master
- `PURC_REQUISITION`, `PURC_REQ_LINE` - Purchase requests

### Sales & Distribution
- `CUSTOMER_ORDER`, `CUST_ORDER_LINE` - Sales orders
- `CUSTOMER`, `SHIPTO_ADDRESS` - Customer master
- `QUOTE`, `QUOTE_LINE` - Sales quotes

### Manufacturing
- `WORK_ORDER` - Production orders
- `OPERATION` - Routing operations
- `REQUIREMENT` - Material requirements (BOM)

## Notes & Best Practices

1. **Use schema reference first** - Before writing queries, check the DDL to understand:
   - Available columns and data types
   - Primary and foreign key relationships
   - NULL constraints and defaults

2. **Follow established join patterns** - Use foreign keys to guide your JOINs rather than guessing relationships

3. **Understand grain differences**:
   - Headers (PAYABLE, RECEIVABLE) = one row per document
   - Lines (PAYABLE_LINE) = multiple rows per document
   - Distributions (*_DIST) = multiple accounting entries per line or document

4. **Watch for NULL foreign keys** - Some relationships are optional:
   - `RECEIVER_LINE.INVOICE_ID` is often NULL (not yet invoiced)
   - `PAYABLE_LINE.RECEIVER_ID` may be NULL (non-PO invoices)

5. **Currency considerations** - Many tables have both:
   - Transaction currency amounts
   - Base/native currency amounts (for reporting)

## Support & Questions

For questions about:
- **Schema content** - Review table DDL files or contact database team
- **Data models** - See query examples in `Documentation/Data Models/`
- **Schema extraction** - See `Documentation/Data Models/ddl/schema-extract/`
