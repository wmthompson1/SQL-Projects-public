# SQL Receivables Analysis - Recommendation Summary

## Request
Review SQL folders and recommend SQL for receivables from July 1st.

## SQL Folders Reviewed
- `SQL_Reports/Receivable Reports/` - Primary location for receivable queries
- `SQL_Reports/Visual Enterprise Financial Reports/` - Financial reporting queries
- Existing queries analyzed:
  - BOE_receivable_comparison.sql
  - BOE_receivable_comparison_step1.sql
  - Invoice_BOELOG.sql
  - Receivable Reconciliations.sql

## Recommended SQL Queries

### 1. Basic Query: Receivables_From_July1.sql
**Use when:** You need a straightforward list of receivables from a specific date

**File:** `SQL_Reports/Receivable Reports/Receivables_From_July1.sql`

**Key Features:**
- Simple date parameter: `@StartDate = '07/01/2025'`
- Returns complete receivable details with customer information
- Includes aging analysis (Current, 31-60, 61-90, Over 90 days)
- Easy to customize for specific date ranges

**Quick Start:**
```sql
-- Change the start date to your desired date:
DECLARE @StartDate AS DATE = '07/01/2025';
DECLARE @EndDate AS DATE = GETDATE();
```

### 2. Advanced Query: Receivables_Fiscal_Year_July1.sql
**Use when:** You need fiscal year analysis or recurring monthly reports

**File:** `SQL_Reports/Receivable Reports/Receivables_Fiscal_Year_July1.sql`

**Key Features:**
- Automatically determines July 1st fiscal year start
- Fiscal month calculations (July = Month 1)
- Monthly summary views included
- Customer aging summary with multiple buckets

**Quick Start:**
```sql
-- No parameters needed - automatically uses July 1st of current fiscal year
-- Or override with specific dates:
SET @FiscalYearStart = '07/01/2025';
SET @FiscalYearEnd = '06/30/2026';
```

## Recommendation

**For most use cases:** Start with `Receivables_From_July1.sql`
- It's simpler and more straightforward
- Easy to modify dates
- Includes all essential information

**For fiscal year reporting:** Use `Receivables_Fiscal_Year_July1.sql`
- Better for recurring monthly/quarterly reports
- Automatic fiscal period calculations
- More sophisticated summary queries

## How to Use

1. **Open the SQL file** in SQL Server Management Studio or your preferred SQL client
2. **Review the date parameters** at the top of the file
3. **Modify dates if needed** (or use defaults)
4. **Execute the query** to retrieve receivables data
5. **Uncomment summary sections** if you need aggregated views

## Common Customizations

### Filter for Specific Customers
Add to WHERE clause:
```sql
AND R.CUSTOMER_ID IN ('BOE605', 'BOE609', 'BOE610')
```

### Filter for Large Invoices Only
Add to WHERE clause:
```sql
AND R.TOTAL_AMOUNT >= 10000
```

### Filter for Overdue Invoices
Add to WHERE clause:
```sql
AND DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) > 60
```

## Additional Resources

See `README_Receivables_July1.md` in the same folder for:
- Detailed field descriptions
- Schema documentation
- More customization examples
- Tips for analysis

## Support

For questions or custom reporting needs:
- Review the comprehensive documentation in `README_Receivables_July1.md`
- Examine existing patterns in `BOE_receivable_comparison.sql`
- Contact IT Data Admin team for database access or special requirements
