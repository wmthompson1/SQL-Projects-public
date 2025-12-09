/**
file path: Documentation/Data Models/Payables/Payables_Data_Model2.sql
Payables Data Model 2
-- SQL queries to explore Payables data model relationships 
-- file path: Documentation/Data Models/Payables/Payables_Data_Model1.sql

nice work - I like how you placed @parameter is null or field = @parameter to make it optional
that will save a lot of keyboardtime.
One note, I like to add the relevant date filter for each query, I will typically set it manually for 6 month max 
so 2025-07-01 as today is 2025-12-05
-- also like the use of cte for the aging summary   
**/

declare @AsOfDate datetime = convert(date, '2025-12-01');
DECLARE @VendorID nvarchar(15) = NULL;  -- set to specific vendor id or NULL for all
DECLARE @SiteID nvarchar(15) = NULL;    -- set to specific site id or NULL for all
-- Date window for data extracts (defaults to 1 month up to @AsOfDate)
DECLARE @StartDate DATE = DATEADD(day, -3 , @AsOfDate);
DECLARE @EndDate DATE = @AsOfDate;
declare @topper int = 1000;  -- set to limit rows returned, or NULL for no limit


SELECT top (@topper)
 POL.PURC_ORDER_ID
, POL.LINE_NO AS PO_LINE
, RL.RECEIVER_ID
, RL.LINE_NO AS RCVR_LINE
, PL.VOUCHER_ID
, PL.LINE_NO AS VCHR_LINE
-- --, pol.*
-- , -- dateadd(day, VPO.PROMISED_DATE_DAYS, VPO.ORDER_DATE) AS PROMISED_DATE
--    (case 
--         when RL.RECEIVER_ID is not null then 
--             case 
--                 when PL.VOUCHER_ID is not null then 1 
--                 else 0 
--             end
--         else 0 
--       end) AS IS_INVOICED
--       -- get payable date 
--         ,  (P.POSTING_DATE) AS PAYABLE_DATE
--      -- get purchase order date
--       ,  (VPO.ORDER_DATE) AS PURCHASE_ORDER_DATE

FROM Live.dbo.PURC_ORDER_LINE POL
JOin Live.dbo.PURCHASE_ORDER VPO
     on VPO.ID = POL.PURC_ORDER_ID
Join Live.dbo.RECEIVER_LINE RL
    on RL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and RL.PURC_ORDER_LINE_NO = POL.LINE_NO
Join Live.dbo.RECEIVER R
    on RL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and RL.PURC_ORDER_LINE_NO = POL.LINE_NO
-- Left Outer Join Live.dbo.PAYABLE_LINE PL
--     on PL.PURC_ORDER_ID = POL.PURC_ORDER_ID
--     and PL.PURC_ORDER_LINE_NO = POL.LINE_NO
-- Left Outer Join Live.dbo.PAYABLE P
--     on PL.PURC_ORDER_ID = POL.PURC_ORDER_ID
--     and PL.PURC_ORDER_LINE_NO = POL.LINE_NO
WHERE 1=1
-- and POL.PURC_ORDER_ID IN ('118367', 'B-2019PACWEL', 'B-2020PACWEL')
and VPO.STATUS <> 'CANCELLED'
and (COALESCE(P.POSTING_DATE, P.INVOICE_DATE) BETWEEN @StartDate AND @EndDate)
-- GROUP BY POL.PURC_ORDER_ID, POL.LINE_NO,
--          RL.RECEIVER_ID,
--          RL.LINE_NO,
--          PL.VOUCHER_ID,
--          PL.LINE_NO
ORDER BY POL.PURC_ORDER_ID, POL.LINE_NO
         ;

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
