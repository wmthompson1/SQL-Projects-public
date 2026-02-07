---
applyTo: "**/SQL_Reports/**/*.sql"
---

# SQL Report Query Guidelines

## Critical Rules for SQL Reports

All SQL reports in this repository are production SSRS (SQL Server Reporting Services) paginated reports used in a manufacturing ERP environment.

## SQL Coding Standards

### Table Naming
- **ALWAYS** use fully-qualified table names: `Live.dbo.TABLE_NAME` or `LIVEAccounting.dbo.TABLE_NAME`
- **NEVER** use unqualified table references (e.g., just `TABLE_NAME`)
- Database names are case-insensitive: `Live` = `LIVE`, `LIVEAccounting` = `LIVEACCOUNTING`

### Data Type Handling
- **Invoice IDs**: Cast appropriately when joining
  - `PAYABLE.INVOICE_ID` is `NVARCHAR(20)`
  - `RECEIVER_LINE.INVOICE_ID` is `NVARCHAR(15)`
  - Use: `CAST(RL.INVOICE_ID AS NVARCHAR(20))`
- **Dates**: Use `datetime` type, avoid string comparisons
- **Numeric precision**: Be aware of `decimal`, `numeric`, `float` differences

### Join Patterns
```sql
-- Preferred: Receiver to Payable via line items
FROM Live.dbo.RECEIVER_LINE RL
JOIN Live.dbo.PAYABLE_LINE PL 
  ON PL.RECEIVER_ID = RL.RECEIVER_ID 
  AND PL.RECEIVER_LINE_NO = RL.LINE_NO
JOIN Live.dbo.PAYABLE P ON PL.VOUCHER_ID = P.VOUCHER_ID

-- Use cautiously: Invoice number matching (include vendor filter)
WHERE P.INVOICE_ID = CAST(RL.INVOICE_ID AS NVARCHAR(20)) 
  AND P.VENDOR_ID = @VendorID
```

### Performance Considerations
- Use `WITH (NOLOCK)` only when appropriate for reporting
- Filter on indexed columns when possible
- Add date range filters to limit result sets
- Consider using stored procedures for complex logic (prefix: `sp_ssrs_*` or `usp_SSRS_*`)

## Report Organization

Reports are organized by business domain:
- Finance, Manufacturing, Shipping, Quality, etc.
- Follow existing folder structure when adding new reports
- Include meaningful report names and descriptions

## Testing

- Test queries against `Live` database with date filters
- Verify parameter handling and default values
- Check for proper handling of NULL values
- Validate data type conversions
