# Receivables SQL Queries - July 1st Analysis

## Purpose
This document provides SQL queries for analyzing receivables data starting from July 1st.

## Available Queries

### 1. Receivables_From_July1.sql
**Location:** `SQL_Reports/Receivable Reports/Receivables_From_July1.sql`

**Description:** Comprehensive query to retrieve all receivable records from July 1st onwards with detailed customer and line item information.

**Features:**
- Configurable start and end dates
- Customer details (name, address, etc.)
- Invoice and line item details
- Aging bucket calculations (Current, 31-60 days, 61-90 days, Over 90 days)
- Optional summary view by customer

**Parameters:**
- `@StartDate`: Start date for the query (default: July 1, 2025)
- `@EndDate`: End date for the query (default: Current date)

**Key Fields Returned:**
- Invoice ID, Date, and Total Amount
- Customer ID, Name, and Address details
- Line item quantities and amounts
- Days since invoice (for aging analysis)
- Aging bucket classification

**Usage:**
1. Open the SQL file in SQL Server Management Studio or your preferred SQL client
2. Modify the `@StartDate` parameter to your desired start date
3. Optionally modify `@EndDate` for a specific reporting period
4. Execute the query to retrieve receivables data
5. Uncomment the summary section for a customer-level summary view

## Related Queries

### Existing Receivable Reports:
- **BOE_receivable_comparison.sql** - Boeing receivable comparison with payment history
- **BOE_receivable_comparison_step1.sql** - Step 1 of Boeing receivable comparison
- **Invoice_BOELOG.sql** - Boeing invoice log details
- **Receivable Reconciliations.sql** - Receivable reconciliation with shipped quantities

## Schema Reference

### Main Tables Used:
- **RECEIVABLE**: Invoice header information
  - Key fields: INVOICE_ID, CUSTOMER_ID, INVOICE_DATE, TOTAL_AMOUNT
  
- **RECEIVABLE_LINE**: Invoice line item details
  - Key fields: INVOICE_ID, LINE_NO, PACKLIST_ID, QTY, AMOUNT
  
- **CUSTOMER**: Customer master data
  - Key fields: ID, NAME, ADDR_1, CITY, STATE, ZIPCODE

## Tips for Analysis

1. **Date Range Analysis**: Adjust @StartDate to '07/01/2025' for current fiscal year starting July 1st
2. **Customer Focus**: Add WHERE clause filter for specific customers (e.g., `AND R.CUSTOMER_ID = 'BOE605'`)
3. **Aging Analysis**: Use the AGING_BUCKET field to identify overdue receivables
4. **Amount Filtering**: Add minimum amount filters for materiality (e.g., `AND R.TOTAL_AMOUNT >= 1000`)

## Modifications for Common Use Cases

### Filter by Customer Type (e.g., Boeing customers):
```sql
AND (
    R.CUSTOMER_ID LIKE 'BOE%'
    OR R.CUSTOMER_ID IN ('BOE605', 'BOE609', 'BOE610', 'BOEPOP', 'BOETRN')
)
```

### Include Only Outstanding Invoices:
```sql
AND R.INVOICE_ID NOT IN (
    SELECT INVOICE_ID FROM PAYMENT_HISTORY WHERE PAYMENT_STATUS = 'PAID'
)
```

### Group by Month:
```sql
SELECT 
    YEAR(R.INVOICE_DATE) AS Invoice_Year,
    MONTH(R.INVOICE_DATE) AS Invoice_Month,
    COUNT(*) AS Invoice_Count,
    SUM(R.TOTAL_AMOUNT) AS Total_Amount
FROM RECEIVABLE R
WHERE R.INVOICE_DATE >= @StartDate
GROUP BY YEAR(R.INVOICE_DATE), MONTH(R.INVOICE_DATE)
ORDER BY Invoice_Year, Invoice_Month;
```

## Support
For questions or modifications, refer to the repository README or contact the IT Data Admin team.
