/**
Payables Data Model 1

-- looking for vouchers not yet in AP Automation
-- SQL queries to explore Payables data model relationships 
-- file path: Documentation/Data Models/Payables/Payables_Data_Model1.sql

nice work - I like how you placed @parameter is null or field = @parameter to make it optional
that will save a lot of keyboardtime.
One note, I like to add the relevant date filter for each query, I will typically set it manually for 6 month max 
so 2025-07-01 as today is 2025-12-05
-- also like the use of cte for the aging summary   
**/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results


declare @AsOfDate datetime = convert(date, '2024-01-01');
DECLARE @VendorID nvarchar(15) = NULL;  -- set to specific vendor id or NULL for all
DECLARE @SiteID nvarchar(15) = NULL;    -- set to specific site id or NULL for all
-- Date window for data extracts (defaults to 1 month up to @AsOfDate)
DECLARE @StartDate DATE = DATEADD(day, -3 , @AsOfDate);
DECLARE @EndDate DATE = getdate();
declare @topper int = 1000000;  -- set to limit rows returned, or NULL for no limit


SELECT -- top (@topper)
 POL.PURC_ORDER_ID
, POL.LINE_NO AS PO_LINE
, RL.RECEIVER_ID
, RL.LINE_NO AS RCVR_LINE
, PL.VOUCHER_ID
, PL.LINE_NO AS VCHR_LINE
, po.ORDER_DATE
-- --, pol.*
-- , -- dateadd(day, VPO.PROMISED_DATE_DAYS, VPO.ORDER_DATE) AS PROMISED_DATE
--   (case 
--         when RL.RECEIVER_ID is not null then 
--             case 
--                 when PL.VOUCHER_ID is not null then 1 
--                 else 0 
--             end
--         else 0 
--       end) AS IS_INVOICED
--       -- get payable date 
--         , COALESCE(P.POSTING_DATE, P.INVOICE_DATE) AS PAYABLE_DATE
--      -- get purchase order date
--       , PO.ORDER_DATE AS PURCHASE_ORDER_DATE

into #Results
    FROM PURC_ORDER_LINE POL
    INNER JOIN PURCHASE_ORDER PO ON POL.PURC_ORDER_ID = PO.ID
    left JOIN RECEIVER_LINE RL
        ON POL.PURC_ORDER_ID = RL.PURC_ORDER_ID
        AND POL.LINE_NO = RL.PURC_ORDER_LINE_NO AND RL.RECEIVED_QTY > 0 -- UPD 8/7

    INNER JOIN RECEIVER R  ON RL.RECEIVER_ID = R.ID

Left  Join Live.dbo.PAYABLE_LINE PL
    on PL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and PL.PURC_ORDER_LINE_NO = POL.LINE_NO
    
 left join   Live.dbo.PAYABLE P
 ON PL.VOUCHER_ID = P.VOUCHER_ID
-- Left Outer Join Live.dbo.PAYABLE P
--     on p.PURC_ORDER_ID = POL.PURC_ORDER_ID
--     and p.PURC_ORDER_LINE_NO = POL.LINE_NO
WHERE 1=1
-- and POL.PURC_ORDER_ID IN ('118367', 'B-2019PACWEL', 'B-2020PACWEL')
and PO.STATUS <> 'CANCELLED'
and po.ORDER_DATE BETWEEN @StartDate AND @EndDate
--and (COALESCE(P.POSTING_DATE, P.INVOICE_DATE) BETWEEN @StartDate AND @EndDate)
ORDER BY POL.PURC_ORDER_ID, POL.LINE_NO,  PL.VOUCHER_ID, PL.LINE_NO
          ;

--select * from #results

with filter_files as(
SELECT 
      F.SECTION
    --, P.PNO AS 'PO'
    , F.COMPANYID AS 'VENDOR_ID'
    , F.DOCNO AS 'DOC'
    , F.[FILENAME] AS 'FILE_NAME'
    , F.DDATE AS 'UPLOAD_DATE'
    , F.[VOUCHER#]
    , F.ID
FROM [sql-lab-1].dbrms.[dbo].[tblFiles] F

-- join #results re
-- on p.PNO = re.PURC_ORDER_ID
-- and F.[VOUCHER#] = re.VOUCHER_ID
WHERE 1=1
   and F.SECTION = 'INVOICE'

  AND F.[VOUCHER#] IS NULL
--     -- AND F.ID  >= '3202'
And F.ID >= '178539'
)  
select 
      F.SECTION
    , P.PNO AS 'PO'
    , F.VENDOR_ID
    , F.DOC
    , F.FILE_NAME
    , F.UPLOAD_DATE
    , F.[VOUCHER#]
    , F.ID

from filter_files F
LEFT JOIN [sql-lab-1].dbrms.[dbo].[tblPO] P
ON P.FILEID = F.ID

  and p.pno in (select PURC_ORDER_ID from #results group by PURC_ORDER_ID)
;   

-- SELECT 
--       F.SECTION, count(*) AS RECORD_COUNT
-- FROM [sql-lab-1].dbrms.[dbo].[tblFiles] F
-- LEFT JOIN [sql-lab-1].dbrms.[dbo].[tblPO] P
-- ON P.FILEID = F.ID
-- -- join #results re
-- -- on p.PNO = re.PURC_ORDER_ID
-- -- and F.[VOUCHER#] = re.VOUCHER_ID
-- WHERE 1=1
--   --  and F.SECTION = 'INVOICE'
--   and p.pno in (select distinct PURC_ORDER_ID from #results)
--   --   AND F.[VOUCHER#] IS NULL
-- -- --     -- AND F.ID  >= '3202'
-- -- And F.ID >= '178539'
-- group by f.section
-- order by f.section


    --  - Invoice-level extract with aging buckets
    -- -- Parameters: reuse `@AsOfDate`, `@SiteID`, `@VendorID` declared above in this file.
    -- -- (Set @AsOfDate manually for the desired lookback window, e.g. '2025-07-01')
    --  Assumptions:
    --  - Main invoice header table: Live.dbo.PAYABLE (alias P)
    --  - Invoice lines: Live.dbo.PAYABLE_LINE (alias PL)
    --  - Distributions: Live.dbo.PAYABLE_DIST (alias PD)
    --  - Payments: Live.dbo.CASH_DISBURSEMENT (alias CD) and
    --      Live.dbo.CASH_DISBURSE_LINE (alias CDL) which link to vouchers
    --  - Vendor master: Live.dbo.VENDOR (alias V)
    --  - Aging base uses @AsOfDate and POSTING_DATE (falls back to INVOICE_DATE)
    --  - Adjust field names if your Live schema uses different column names.
    --  ------------------------------------------------------------------ */



-- -- AP Aging Summary (vendor-level aggregates)
-- ;WITH InvoiceBalances AS (
--     SELECT top (@topper)
--         P.VOUCHER_ID,
--         P.VENDOR_ID,
--         P.SITE_ID,
--         (P.TOTAL_AMOUNT - ISNULL(P.PAID_AMOUNT,0)) AS BALANCE,
--         DATEDIFF(day, COALESCE(P.POSTING_DATE, P.INVOICE_DATE), @AsOfDate) AS DAYS_PAST_BASE
--     FROM Live.dbo.PAYABLE P
--     WHERE (P.TOTAL_AMOUNT - ISNULL(P.PAID_AMOUNT,0)) <> 0
--         AND (@SiteID IS NULL OR P.SITE_ID = @SiteID)
--         AND (@VendorID IS NULL OR P.VENDOR_ID = @VendorID)
--         AND (COALESCE(P.POSTING_DATE, P.INVOICE_DATE) BETWEEN @StartDate AND @EndDate)
-- )
-- SELECT
--     I.VENDOR_ID,
--     V.NAME AS VENDOR_NAME,
--     SUM(I.BALANCE) AS TOTAL_OUTSTANDING,
--     SUM(CASE WHEN I.DAYS_PAST_BASE <= 30 THEN I.BALANCE ELSE 0 END) AS BUCKET_0_30,
--     SUM(CASE WHEN I.DAYS_PAST_BASE BETWEEN 31 AND 60 THEN I.BALANCE ELSE 0 END) AS BUCKET_31_60,
--     SUM(CASE WHEN I.DAYS_PAST_BASE BETWEEN 61 AND 90 THEN I.BALANCE ELSE 0 END) AS BUCKET_61_90,
--     SUM(CASE WHEN I.DAYS_PAST_BASE > 90 THEN I.BALANCE ELSE 0 END) AS BUCKET_OVER_90
-- FROM InvoiceBalances I
-- LEFT JOIN Live.dbo.VENDOR V ON I.VENDOR_ID = V.ID
-- GROUP BY I.VENDOR_ID, V.NAME
-- ORDER BY TOTAL_OUTSTANDING DESC;

-- -- cash disbursements applied to vouchers
-- SELECT
--     CD.BANK_ACCOUNT_ID,
--     CD.CONTROL_NO,
--     CD.CHECK_NO,
--     CD.CHECK_DATE,
--     CD.AMOUNT AS PAYMENT_AMOUNT,
--     CDL.VOUCHER_ID,
--     CDL.AMOUNT AS APPLIED_AMOUNT,
--     P.VENDOR_ID,
--     V.NAME AS VENDOR_NAME

-- FROM Live.dbo.CASH_DISBURSEMENT CD
-- INNER JOIN Live.dbo.CASH_DISBURSE_LINE CDL
--     ON CD.BANK_ACCOUNT_ID = CDL.BANK_ACCOUNT_ID
--     AND CD.CONTROL_NO = CDL.CONTROL_NO
-- LEFT JOIN Live.dbo.PAYABLE P ON CDL.VOUCHER_ID = P.VOUCHER_ID
-- LEFT JOIN Live.dbo.VENDOR V ON P.VENDOR_ID = V.ID
-- WHERE (@SiteID IS NULL OR CD.SITE_ID = @SiteID)
--     AND (@VendorID IS NULL OR P.VENDOR_ID = @VendorID)
--     AND (CD.CHECK_DATE BETWEEN @StartDate AND @EndDate)
-- ORDER BY CD.CHECK_DATE DESC, CD.BANK_ACCOUNT_ID, CD.CONTROL_NO;

-- -- Vendor statement extract: invoices and payments with running balance
-- -- Parameters: reuse `@AsOfDate`, `@SiteID`, `@VendorID` declared above in this file.
-- -- (Set @AsOfDate manually for the desired lookback window, e.g. '2025-07-01')
-- -- Assumptions:     
-- --  - Main invoice header table: Live.dbo.PAYABLE (alias P)
-- --  - Payments: Live.dbo.CASH_DISBURSEMENT (alias CD) and Live.dbo.CASH_DISBURSE_LINE (alias CDL)   
-- --  - Vendor master: Live.dbo.VENDOR (alias V)
-- --  - Adjust field names if your Live schema uses different column names.
-- DECLARE @StmtVendorID NVARCHAR(15) = @VendorID; -- set the vendor id or override
-- IF @StmtVendorID IS NOT NULL
-- BEGIN
--     ;WITH Invoices AS (
--         SELECT
--             P.VOUCHER_ID AS ActivityID,
--             P.VENDOR_ID,
--             P.POSTING_DATE AS ActivityDate,
--             'INVOICE' AS ActivityType,
--             P.TOTAL_AMOUNT AS Amount,
--             ISNULL(P.PAID_AMOUNT,0) AS PaidToDate,
--             (P.TOTAL_AMOUNT - ISNULL(P.PAID_AMOUNT,0)) AS BalanceChange,
--             P.INVOICE_ID AS Reference
--         FROM Live.dbo.PAYABLE P
--         WHERE P.VENDOR_ID = @StmtVendorID
--             AND (COALESCE(P.POSTING_DATE, P.INVOICE_DATE) BETWEEN @StartDate AND @EndDate)
--     ),
--     Payments AS (
--         SELECT
--             CDL.VOUCHER_ID AS ActivityID,
--             P.VENDOR_ID,
--             CD.CHECK_DATE AS ActivityDate,
--             'PAYMENT' AS ActivityType,
--             -CDL.AMOUNT AS Amount, -- negative to reduce balance
--             0 AS PaidToDate,
--             -CDL.AMOUNT AS BalanceChange,
--             CD.CHECK_NO AS Reference
--         FROM Live.dbo.CASH_DISBURSE_LINE CDL
--         INNER JOIN Live.dbo.CASH_DISBURSEMENT CD
--             ON CDL.BANK_ACCOUNT_ID = CD.BANK_ACCOUNT_ID
--             AND CDL.CONTROL_NO = CD.CONTROL_NO
--         LEFT JOIN Live.dbo.PAYABLE P ON CDL.VOUCHER_ID = P.VOUCHER_ID
--                 WHERE P.VENDOR_ID = @StmtVendorID
--                     AND (CD.CHECK_DATE BETWEEN @StartDate AND @EndDate)
--     ),
--     Activity AS (
--         SELECT * FROM Invoices
--         UNION ALL
--         SELECT * FROM Payments
--     )
--     SELECT
--         A.ActivityDate,
--         A.ActivityType,
--         A.Reference,
--         A.Amount,
--         SUM(A.BalanceChange) OVER (ORDER BY A.ActivityDate, A.ActivityType ROWS UNBOUNDED PRECEDING) AS RUNNING_BALANCE
--     FROM Activity A
--     ORDER BY A.ActivityDate, A.ActivityType;
-- END
-- ELSE
-- BEGIN
--     PRINT 'Set @VendorID (or @StmtVendorID) before running vendor statement.';
-- END


-- /* ------------------------------------------------------------------
--      Batched example for large result-sets
--      - Use when the full join pulls many rows; processes data in batches
--      - Adjust @BatchSize and key columns for your environment
-- ------------------------------------------------------------------ */
-- -- Example: batch the PO -> Payable join into a temp table
-- DECLARE @BatchSize INT = 5000;
-- IF OBJECT_ID('tempdb..#po_batch') IS NOT NULL DROP TABLE #po_batch;
-- CREATE TABLE #po_batch (
--     rownum BIGINT PRIMARY KEY,
--     PURC_ORDER_ID NVARCHAR(50),
--     PO_LINE INT,
--     RECEIVER_ID NVARCHAR(50),
--     RCVR_LINE INT,
--     VOUCHER_ID NVARCHAR(50),
--     VCHR_LINE INT,
--     IS_INVOICED INT,
--     PAYABLE_DATE DATETIME,
--     PURCHASE_ORDER_DATE DATETIME
-- );

-- ;WITH cte_source AS (
--     SELECT
--         POL.PURC_ORDER_ID,
--         POL.LINE_NO AS PO_LINE,
--         RL.RECEIVER_ID,
--         RL.LINE_NO AS RCVR_LINE,
--         PL.VOUCHER_ID,
--         PL.LINE_NO AS VCHR_LINE,
--         sum(case when RL.RECEIVER_ID is not null then case when PL.VOUCHER_ID is not null then 1 else 0 end else 0 end) OVER (PARTITION BY POL.PURC_ORDER_ID, POL.LINE_NO) AS IS_INVOICED,
--         max(P.POSTING_DATE) OVER (PARTITION BY POL.PURC_ORDER_ID, POL.LINE_NO) AS PAYABLE_DATE,
--         max(VPO.ORDER_DATE) OVER (PARTITION BY POL.PURC_ORDER_ID, POL.LINE_NO) AS PURCHASE_ORDER_DATE,
--         ROW_NUMBER() OVER (ORDER BY POL.PURC_ORDER_ID, POL.LINE_NO) AS rn
--     FROM Live.dbo.PURC_ORDER_LINE POL
--     LEFT JOIN Live.dbo.PURCHASE_ORDER VPO ON VPO.ID = POL.PURC_ORDER_ID
--     LEFT JOIN Live.dbo.RECEIVER_LINE RL ON RL.PURC_ORDER_ID = POL.PURC_ORDER_ID AND RL.PURC_ORDER_LINE_NO = POL.LINE_NO
--     LEFT JOIN Live.dbo.PAYABLE_LINE PL ON PL.PURC_ORDER_ID = POL.PURC_ORDER_ID AND PL.PURC_ORDER_LINE_NO = POL.LINE_NO
--     LEFT JOIN Live.dbo.PAYABLE P ON PL.PURC_ORDER_ID = POL.PURC_ORDER_ID AND PL.PURC_ORDER_LINE_NO = POL.LINE_NO
--     WHERE VPO.STATUS <> 'CANCELLED'
--         AND (COALESCE(P.POSTING_DATE, P.INVOICE_DATE) BETWEEN @StartDate AND @EndDate)
-- )
-- INSERT INTO #po_batch
-- SELECT rn, PURC_ORDER_ID, PO_LINE, RECEIVER_ID, RCVR_LINE, VOUCHER_ID, VCHR_LINE, IS_INVOICED, PAYABLE_DATE, PURCHASE_ORDER_DATE
-- FROM cte_source
-- WHERE rn BETWEEN 1 AND @BatchSize;

-- -- Process batches iteratively (example loop)
-- DECLARE @MaxRN BIGINT = (SELECT MAX(rn) FROM #po_batch);
-- DECLARE @CurrStart BIGINT = @BatchSize + 1;
-- WHILE @CurrStart <= (SELECT ISNULL(MAX(rn),0) FROM cte_source)
-- BEGIN
--     INSERT INTO #po_batch
--     SELECT rn, PURC_ORDER_ID, PO_LINE, RECEIVER_ID, RCVR_LINE, VOUCHER_ID, VCHR_LINE, IS_INVOICED, PAYABLE_DATE, PURCHASE_ORDER_DATE
--     FROM cte_source
--     WHERE rn BETWEEN @CurrStart AND (@CurrStart + @BatchSize - 1);

--     SET @CurrStart = @CurrStart + @BatchSize;
-- END

-- -- Final select from temp table (or further processing)
-- SELECT * FROM #po_batch ORDER BY PURC_ORDER_ID, PO_LINE;

-- IF OBJECT_ID('tempdb..#po_batch') IS NOT NULL DROP TABLE #po_batch;