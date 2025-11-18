-- =============================================================================
-- SQL Query: Receivables from July 1st
-- Purpose: Retrieve all receivable records starting from July 1st of the current year
-- Location: Visual Enterprise Financial Reports > Receivable Reports
-- =============================================================================

-- Declare date parameters
-- Modify these dates as needed for your reporting period
DECLARE @StartDate AS DATE = '07/01/2025';  -- July 1st start date
DECLARE @EndDate AS DATE = GETDATE();        -- Current date (can be modified to specific end date)

-- Main Query: Retrieve receivables with customer and line item details
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
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 30 THEN 'Current'
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 60 THEN '31-60 Days'
        WHEN DATEDIFF(DAY, R.INVOICE_DATE, GETDATE()) <= 90 THEN '61-90 Days'
        ELSE 'Over 90 Days'
    END AS AGING_BUCKET

FROM RECEIVABLE R
    INNER JOIN RECEIVABLE_LINE RL
        ON R.INVOICE_ID = RL.INVOICE_ID
    INNER JOIN CUSTOMER C
        ON C.ID = R.CUSTOMER_ID

WHERE R.INVOICE_DATE >= @StartDate
    AND R.INVOICE_DATE <= @EndDate

ORDER BY 
    R.INVOICE_DATE DESC,
    R.CUSTOMER_ID,
    R.INVOICE_ID,
    RL.LINE_NO;

-- =============================================================================
-- Summary Query: Receivables Summary by Customer
-- =============================================================================

-- Uncomment the section below to get a summary view by customer

/*
SELECT 
    R.CUSTOMER_ID,
    C.NAME AS CUSTOMER_NAME,
    COUNT(DISTINCT R.INVOICE_ID) AS INVOICE_COUNT,
    SUM(R.TOTAL_AMOUNT) AS TOTAL_RECEIVABLES,
    MIN(R.INVOICE_DATE) AS EARLIEST_INVOICE,
    MAX(R.INVOICE_DATE) AS LATEST_INVOICE,
    AVG(DATEDIFF(DAY, R.INVOICE_DATE, GETDATE())) AS AVG_DAYS_OUTSTANDING
FROM RECEIVABLE R
    INNER JOIN CUSTOMER C
        ON C.ID = R.CUSTOMER_ID
WHERE R.INVOICE_DATE >= @StartDate
    AND R.INVOICE_DATE <= @EndDate
GROUP BY 
    R.CUSTOMER_ID,
    C.NAME
ORDER BY 
    TOTAL_RECEIVABLES DESC;
*/

-- =============================================================================
-- Notes:
-- 1. Adjust @StartDate to match your desired start date (currently set to July 1, 2025)
-- 2. @EndDate defaults to current date but can be set to a specific end date
-- 3. The main query includes aging bucket calculations for receivables aging analysis
-- 4. Uncomment the summary query section for a high-level customer summary view
-- 5. Results include both invoice headers and line item details
-- =============================================================================
