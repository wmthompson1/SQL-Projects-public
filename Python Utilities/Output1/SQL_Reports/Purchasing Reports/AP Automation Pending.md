# AP Automation Pending

```sql
-- AP Invoice Upload Tracking Report
-- Visual Enterprise Reports > Purchasing Reports > AP Invoice Upload Status
-- This report identifies invoices uploaded to AP app but not yet processed in Visual Manufacturing

-- Optional date range parameters
DECLARE @StartDate DATE = DATEADD(MONTH, -3, GETDATE()); -- Last 3 months
DECLARE @EndDate DATE = GETDATE();

-- Optional filters
DECLARE @VendorFilter NVARCHAR(50) = NULL; -- e.g., 'VENDOR%' for specific vendor pattern
DECLARE @POFilter NVARCHAR(50) = NULL; -- e.g., 'PO123%' for specific PO pattern

-- Main query to identify problematic invoices
WITH APInvoicesNotInVisual AS (
    SELECT 
        -- AP Application invoice data (adjust table/column names based on your AP system)
        API.INVOICE_ID,
        API.INVOICE_NUMBER,
        API.VENDOR_ID,
        API.VENDOR_NAME,
        API.INVOICE_DATE,
        API.INVOICE_AMOUNT,
        API.PO_NUMBER,
        API.UPLOAD_DATE,
        API.UPLOAD_USER_ID,
        API.STATUS as AP_STATUS,
        API.GL_ACCOUNT,
        
        -- Check if voucher exists in Visual
        APV.ID as VOUCHER_ID,
        APV.VOUCHER_NO,
        APV.STATUS as VOUCHER_STATUS,
        APV.CREATE_DATE as VOUCHER_CREATE_DATE,
        
        -- Check if PO exists in Visual
        PO.ID as PO_ID,
        PO.STATUS as PO_STATUS,
        PO.VENDOR_ID as PO_VENDOR_ID,
        PO.CREATE_DATE as PO_CREATE_DATE,
        
        -- Check if receiver exists in Visual
        REC.ID as RECEIVER_ID,
        REC.RECV_DATE,
        REC.STATUS as RECEIVER_STATUS,
        
        -- Categorize the issue
        CASE 
            WHEN APV.ID IS NULL AND PO.ID IS NULL THEN 'No Voucher, No PO in Visual'
            WHEN APV.ID IS NULL AND PO.ID IS NOT NULL AND REC.ID IS NULL THEN 'No Voucher, PO Exists, No Receiver'
            WHEN APV.ID IS NULL AND PO.ID IS NOT NULL AND REC.ID IS NOT NULL THEN 'No Voucher, PO and Receiver Exist'
            WHEN APV.ID IS NULL AND PO.ID IS NULL AND API.PO_NUMBER IS NOT NULL THEN 'No Voucher, PO# in AP but PO Missing in Visual'
            ELSE 'Other'
        END as ISSUE_CATEGORY,
        
        -- Days since upload
        DATEDIFF(DAY, API.UPLOAD_DATE, GETDATE()) as DAYS_SINCE_UPLOAD,
        
        -- Risk indicators
        CASE 
            WHEN DATEDIFF(DAY, API.UPLOAD_DATE, GETDATE()) > 30 THEN 'High Risk - Over 30 Days'
            WHEN DATEDIFF(DAY, API.UPLOAD_DATE, GETDATE()) > 14 THEN 'Medium Risk - Over 14 Days'
            WHEN DATEDIFF(DAY, API.UPLOAD_DATE, GETDATE()) > 7 THEN 'Low Risk - Over 7 Days'
            ELSE 'Recent - Within 7 Days'
        END as RISK_LEVEL
        
    FROM [AP_APPLICATION_DB].[dbo].[INVOICES] API WITH (NOLOCK) -- Adjust database/table name
    
    -- Left join to check if voucher exists in Visual
    LEFT JOIN AP_VOUCHER APV WITH (NOLOCK) 
        ON API.INVOICE_NUMBER = APV.INVOICE_NO 
        AND API.VENDOR_ID = APV.VENDOR_ID
    
    -- Left join to check if PO exists in Visual
    LEFT JOIN PURCHASE_ORDER PO WITH (NOLOCK) 
        ON API.PO_NUMBER = PO.ID
    
    -- Left join to check if receiver exists for the PO
    LEFT JOIN RECEIVER REC WITH (NOLOCK) 
        ON PO.ID = REC.PURCHASE_ORDER_ID
        AND REC.STATUS NOT IN ('X', 'C') -- Exclude cancelled/closed receivers
    
    WHERE 
        -- Focus on invoices uploaded to AP but with issues in Visual
        API.UPLOAD_DATE BETWEEN @StartDate AND @EndDate
        AND API.STATUS IN ('UPLOADED', 'PENDING', 'READY_FOR_PROCESSING') -- Adjust status values
        
        -- Main criteria: Voucher is null (not entered into Visual)
        AND APV.ID IS NULL
        
        -- Optional filters
        AND (@VendorFilter IS NULL OR API.VENDOR_ID LIKE @VendorFilter)
        AND (@POFilter IS NULL OR API.PO_NUMBER LIKE @POFilter)
),

-- Get PO line details for invoices tied to POs
POLineDetails AS (
    SELECT 
        API.INVOICE_ID,
        API.PO_NUMBER,
        POL.PART_ID,
        POL.USER_ORDER_QTY,
        POL.UNIT_PRICE,
        POL.TOTAL_AMT_ORDERED,
        POL.DESIRED_RECV_DATE,
        P.[DESCRIPTION] as PART_DESCRIPTION,
        
        -- Check received quantities
        SUM(ISNULL(RL.QTY_RECEIVED, 0)) as QTY_RECEIVED,
        SUM(ISNULL(RL.QTY_RECEIVED, 0) * POL.UNIT_PRICE) as VALUE_RECEIVED,
        
        -- Outstanding quantities
        POL.USER_ORDER_QTY - SUM(ISNULL(RL.QTY_RECEIVED, 0)) as QTY_OUTSTANDING,
        (POL.USER_ORDER_QTY - SUM(ISNULL(RL.QTY_RECEIVED, 0))) * POL.UNIT_PRICE as VALUE_OUTSTANDING
        
    FROM APInvoicesNotInVisual API
    INNER JOIN PURCHASE_ORDER_LINE POL WITH (NOLOCK) ON API.PO_NUMBER = POL.PURCHASE_ORDER_ID
    LEFT JOIN PART P WITH (NOLOCK) ON POL.PART_ID = P.ID
    LEFT JOIN RECEIVER_LINE RL WITH (NOLOCK) ON POL.PURCHASE_ORDER_ID = RL.PURCHASE_ORDER_ID 
        AND POL.PART_ID = RL.PART_ID
    WHERE API.PO_NUMBER IS NOT NULL
    GROUP BY 
        API.INVOICE_ID, API.PO_NUMBER, POL.PART_ID, POL.USER_ORDER_QTY, 
        POL.UNIT_PRICE, POL.TOTAL_AMT_ORDERED, POL.DESIRED_RECV_DATE, P.[DESCRIPTION]
)

-- Main result set: Invoices needing attention
SELECT 
    API.INVOICE_ID,
    API.INVOICE_NUMBER,
    API.VENDOR_ID,
    API.VENDOR_NAME,
    API.INVOICE_DATE,
    API.INVOICE_AMOUNT,
    API.PO_NUMBER,
    API.UPLOAD_DATE,
    API.UPLOAD_USER_ID,
    API.AP_STATUS,
    API.DAYS_SINCE_UPLOAD,
    API.RISK_LEVEL,
    API.ISSUE_CATEGORY,
    
    -- Visual system status
    API.VOUCHER_ID,
    API.VOUCHER_NO,
    API.VOUCHER_STATUS,
    API.PO_ID,
    API.PO_STATUS,
    API.PO_VENDOR_ID,
    API.RECEIVER_ID,
    API.RECV_DATE,
    API.RECEIVER_STATUS,
    
    -- PO details (if applicable)
    CASE 
        WHEN API.PO_NUMBER IS NOT NULL THEN 
            (SELECT COUNT(*) FROM POLineDetails POD WHERE POD.INVOICE_ID = API.INVOICE_ID)
        ELSE 0
    END as PO_LINE_COUNT,
    
    CASE 
        WHEN API.PO_NUMBER IS NOT NULL THEN 
            (SELECT SUM(POD.VALUE_OUTSTANDING) FROM POLineDetails POD WHERE POD.INVOICE_ID = API.INVOICE_ID)
        ELSE 0
    END as PO_VALUE_OUTSTANDING,
    
    -- Action needed
    CASE 
        WHEN API.PO_NUMBER IS NOT NULL AND API.RECEIVER_ID IS NULL THEN 'Create Receiver First, Then Voucher'
        WHEN API.PO_NUMBER IS NOT NULL AND API.RECEIVER_ID IS NOT NULL THEN 'Create Voucher'
        WHEN API.PO_NUMBER IS NULL THEN 'Create Non-PO Voucher'
        ELSE 'Review Required'
    END as RECOMMENDED_ACTION,
    
    -- Reference dates
    @StartDate as REPORT_START_DATE,
    @EndDate as REPORT_END_DATE

FROM APInvoicesNotInVisual API

ORDER BY 
    API.RISK_LEVEL DESC,
    API.DAYS_SINCE_UPLOAD DESC,
    API.INVOICE_AMOUNT DESC;

-- Summary by issue category
SELECT 
    'SUMMARY BY ISSUE CATEGORY' as SUMMARY_TYPE,
    API.ISSUE_CATEGORY,
    COUNT(*) as INVOICE_COUNT,
    SUM(API.INVOICE_AMOUNT) as TOTAL_AMOUNT,
    AVG(API.INVOICE_AMOUNT) as AVG_AMOUNT,
    MIN(API.DAYS_SINCE_UPLOAD) as MIN_DAYS_OLD,
    MAX(API.DAYS_SINCE_UPLOAD) as MAX_DAYS_OLD,
    AVG(API.DAYS_SINCE_UPLOAD) as AVG_DAYS_OLD
FROM APInvoicesNotInVisual API
GROUP BY API.ISSUE_CATEGORY
ORDER BY TOTAL_AMOUNT DESC;

-- Summary by risk level
SELECT 
    'SUMMARY BY RISK LEVEL' as SUMMARY_TYPE,
    API.RISK_LEVEL,
    COUNT(*) as INVOICE_COUNT,
    SUM(API.INVOICE_AMOUNT) as TOTAL_AMOUNT,
    AVG(API.INVOICE_AMOUNT) as AVG_AMOUNT,
    MIN(API.DAYS_SINCE_UPLOAD) as MIN_DAYS_OLD,
    MAX(API.DAYS_SINCE_UPLOAD) as MAX_DAYS_OLD
FROM APInvoicesNotInVisual API
GROUP BY API.RISK_LEVEL
ORDER BY 
    CASE API.RISK_LEVEL 
        WHEN 'High Risk - Over 30 Days' THEN 1
        WHEN 'Medium Risk - Over 14 Days' THEN 2
        WHEN 'Low Risk - Over 7 Days' THEN 3
        WHEN 'Recent - Within 7 Days' THEN 4
    END;

-- Summary by vendor (top 10 by count)
SELECT TOP 10
    'SUMMARY BY VENDOR' as SUMMARY_TYPE,
    API.VENDOR_ID,
    API.VENDOR_NAME,
    COUNT(*) as INVOICE_COUNT,
    SUM(API.INVOICE_AMOUNT) as TOTAL_AMOUNT,
    AVG(API.DAYS_SINCE_UPLOAD) as AVG_DAYS_OLD
FROM APInvoicesNotInVisual API
GROUP BY API.VENDOR_ID, API.VENDOR_NAME
ORDER BY INVOICE_COUNT DESC;

-- PO Line Details for invoices tied to POs (separate result set)
SELECT 
    'PO LINE DETAILS' as DETAIL_TYPE,
    POD.INVOICE_ID,
    API.INVOICE_NUMBER,
    POD.PO_NUMBER,
    POD.PART_ID,
    POD.PART_DESCRIPTION,
    POD.USER_ORDER_QTY,
    POD.QTY_RECEIVED,
    POD.QTY_OUTSTANDING,
    POD.UNIT_PRICE,
    POD.TOTAL_AMT_ORDERED,
    POD.VALUE_RECEIVED,
    POD.VALUE_OUTSTANDING,
    POD.DESIRED_RECV_DATE,
    
    -- Receiving status
    CASE 
        WHEN POD.QTY_OUTSTANDING <= 0 THEN 'Fully Received'
        WHEN POD.QTY_RECEIVED > 0 THEN 'Partially Received'
        ELSE 'Not Received'
    END as RECEIVING_STATUS
    
FROM POLineDetails POD
INNER JOIN APInvoicesNotInVisual API ON POD.INVOICE_ID = API.INVOICE_ID
ORDER BY POD.INVOICE_ID, POD.PO_NUMBER, POD.PART_ID;
```