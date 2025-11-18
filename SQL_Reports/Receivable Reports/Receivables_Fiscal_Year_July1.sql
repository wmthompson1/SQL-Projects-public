-- =============================================================================
-- SQL Query: Receivables from July 1st (Current Fiscal Year)
-- Purpose: Retrieve receivables for fiscal year starting July 1st of current year
-- Location: Visual Enterprise Financial Reports > Receivable Reports
-- =============================================================================

-- Automatically calculate July 1st of the current fiscal year
-- If today is before July 1st, use previous year's July 1st
-- If today is on or after July 1st, use current year's July 1st
DECLARE @FiscalYearStart AS DATE;
DECLARE @FiscalYearEnd AS DATE;
DECLARE @CurrentYear AS INT = YEAR(GETDATE());
DECLARE @CurrentMonth AS INT = MONTH(GETDATE());

-- Determine fiscal year start (July 1st)
IF @CurrentMonth < 7
BEGIN
    -- Before July, so fiscal year started last year
    SET @FiscalYearStart = DATEFROMPARTS(@CurrentYear - 1, 7, 1);
    SET @FiscalYearEnd = DATEFROMPARTS(@CurrentYear, 6, 30);
END
ELSE
BEGIN
    -- July or later, so fiscal year started this year
    SET @FiscalYearStart = DATEFROMPARTS(@CurrentYear, 7, 1);
    SET @FiscalYearEnd = DATEFROMPARTS(@CurrentYear + 1, 6, 30);
END

-- Optional: Override with specific dates if needed
-- Uncomment and modify these lines for custom date ranges:
-- SET @FiscalYearStart = '07/01/2025';
-- SET @FiscalYearEnd = '06/30/2026';

-- Display fiscal year dates for verification
SELECT 
    @FiscalYearStart AS Fiscal_Year_Start,
    @FiscalYearEnd AS Fiscal_Year_End,
    DATEDIFF(DAY, @FiscalYearStart, GETDATE()) AS Days_Into_Fiscal_Year;

-- =============================================================================
-- Main Query: Receivables for Current Fiscal Year
-- =============================================================================

SELECT 
    -- Invoice Information
    R.INVOICE_ID,
    R.INVOICE_DATE,
    R.CREATE_DATE,
    R.PRINTED_DATE,
    R.TOTAL_AMOUNT AS INVOICE_TOTAL,
    
    -- Customer Information
    R.CUSTOMER_ID,
    C.NAME AS CUSTOMER_NAME,
    C.ADDR_1 AS CUSTOMER_ADDRESS_1,
    C.ADDR_2 AS CUSTOMER_ADDRESS_2,
    C.CITY AS CUSTOMER_CITY,
    C.STATE AS CUSTOMER_STATE,
    C.ZIPCODE AS CUSTOMER_ZIPCODE,
    
    -- Line Item Details
    RL.LINE_NO,
    RL.PACKLIST_ID,
    RL.CUST_ORDER_ID,
    RL.CUST_ORDER_LINE_NO,
    RL.QTY AS QUANTITY,
    RL.AMOUNT AS LINE_AMOUNT,
    CASE 
        WHEN RL.QTY > 0 THEN CONVERT(DECIMAL(10,2), RL.AMOUNT / RL.QTY)
        ELSE 0 
    END AS UNIT_PRICE,
    RL.REFERENCE,
    
    -- Calculated Fields
    DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) AS DAYS_SINCE_INVOICE,
    CASE 
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 30 THEN 'Current (0-30 days)'
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 60 THEN '31-60 Days'
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 90 THEN '61-90 Days'
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 120 THEN '91-120 Days'
        ELSE 'Over 120 Days'
    END AS AGING_BUCKET,
    
    -- Fiscal Period
    YEAR(R.INVOICE_DATE) AS FISCAL_YEAR,
    CASE 
        WHEN MONTH(R.INVOICE_DATE) >= 7 THEN MONTH(R.INVOICE_DATE) - 6
        ELSE MONTH(R.INVOICE_DATE) + 6
    END AS FISCAL_MONTH,
    DATENAME(MONTH, R.INVOICE_DATE) AS MONTH_NAME

FROM RECEIVABLE R
    INNER JOIN RECEIVABLE_LINE RL
        ON R.INVOICE_ID = RL.INVOICE_ID
    INNER JOIN CUSTOMER C
        ON C.ID = R.CUSTOMER_ID

WHERE R.INVOICE_DATE >= @FiscalYearStart
    AND R.INVOICE_DATE <= GETDATE()  -- Only include invoices up to today

ORDER BY 
    R.INVOICE_DATE DESC,
    R.CUSTOMER_ID,
    R.INVOICE_ID,
    RL.LINE_NO;

-- =============================================================================
-- Summary Query: Monthly Receivables for Fiscal Year
-- =============================================================================

/*
SELECT 
    CASE 
        WHEN MONTH(R.INVOICE_DATE) >= 7 THEN YEAR(R.INVOICE_DATE)
        ELSE YEAR(R.INVOICE_DATE) - 1
    END AS FISCAL_YEAR,
    CASE 
        WHEN MONTH(R.INVOICE_DATE) >= 7 THEN MONTH(R.INVOICE_DATE) - 6
        ELSE MONTH(R.INVOICE_DATE) + 6
    END AS FISCAL_MONTH,
    DATENAME(MONTH, R.INVOICE_DATE) AS MONTH_NAME,
    COUNT(DISTINCT R.INVOICE_ID) AS INVOICE_COUNT,
    COUNT(DISTINCT R.CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    SUM(R.TOTAL_AMOUNT) AS TOTAL_AMOUNT,
    AVG(R.TOTAL_AMOUNT) AS AVERAGE_INVOICE_AMOUNT,
    MIN(R.INVOICE_DATE) AS FIRST_INVOICE_DATE,
    MAX(R.INVOICE_DATE) AS LAST_INVOICE_DATE
FROM RECEIVABLE R
WHERE R.INVOICE_DATE >= @FiscalYearStart
    AND R.INVOICE_DATE <= GETDATE()
GROUP BY 
    CASE 
        WHEN MONTH(R.INVOICE_DATE) >= 7 THEN YEAR(R.INVOICE_DATE)
        ELSE YEAR(R.INVOICE_DATE) - 1
    END,
    CASE 
        WHEN MONTH(R.INVOICE_DATE) >= 7 THEN MONTH(R.INVOICE_DATE) - 6
        ELSE MONTH(R.INVOICE_DATE) + 6
    END,
    DATENAME(MONTH, R.INVOICE_DATE)
ORDER BY 
    FISCAL_YEAR,
    FISCAL_MONTH;
*/

-- =============================================================================
-- Summary Query: Customer Receivables Summary
-- =============================================================================

/*
SELECT 
    R.CUSTOMER_ID,
    C.NAME AS CUSTOMER_NAME,
    C.CITY,
    C.STATE,
    COUNT(DISTINCT R.INVOICE_ID) AS INVOICE_COUNT,
    SUM(RL.AMOUNT) AS TOTAL_RECEIVABLES,
    MIN(R.INVOICE_DATE) AS FIRST_INVOICE,
    MAX(R.INVOICE_DATE) AS LAST_INVOICE,
    AVG(DATEDIFF(DAY, R.INVOICE_DATE, GETDATE())) AS AVG_DAYS_OUTSTANDING,
    SUM(CASE WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 30 THEN RL.AMOUNT ELSE 0 END) AS CURRENT_0_30,
    SUM(CASE WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) BETWEEN 31 AND 60 THEN RL.AMOUNT ELSE 0 END) AS AGED_31_60,
    SUM(CASE WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) BETWEEN 61 AND 90 THEN RL.AMOUNT ELSE 0 END) AS AGED_61_90,
    SUM(CASE WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) > 90 THEN RL.AMOUNT ELSE 0 END) AS AGED_OVER_90
FROM RECEIVABLE R
    INNER JOIN RECEIVABLE_LINE RL
        ON R.INVOICE_ID = RL.INVOICE_ID
    INNER JOIN CUSTOMER C
        ON C.ID = R.CUSTOMER_ID
WHERE R.INVOICE_DATE >= @FiscalYearStart
    AND R.INVOICE_DATE <= GETDATE()
GROUP BY 
    R.CUSTOMER_ID,
    C.NAME,
    C.CITY,
    C.STATE
ORDER BY 
    TOTAL_RECEIVABLES DESC;
*/

-- =============================================================================
-- Notes:
-- 1. This query automatically determines July 1st of the current fiscal year
-- 2. Fiscal year logic: July 1st to June 30th
-- 3. Includes fiscal month calculations (July = Month 1, June = Month 12)
-- 4. Uncomment summary queries for aggregate views
-- 5. Aging buckets help identify collection priorities
-- =============================================================================
