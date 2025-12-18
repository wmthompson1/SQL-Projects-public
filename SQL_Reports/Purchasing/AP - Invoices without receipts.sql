---

-- 02 APA Invoice Without Voucher Join Visual
-- AP App
-- Invoices without receipts
/**
Payables Data Model 1

-- looking for vouchers not yet in AP Automation
-- SQL queries to explore Payables data model relationships 
-- file path: Documentation/Data Models/Payables/Payables_Data_Model1.sql

**Common pitfalls / repo findings**
- `INVOICE_NO` appears in some reports and older queries — authoritative schema uses `INVOICE_ID`. Review each occurrence before bulk replacing.
- Some custom reports map `P.VOUCHER_ID = P.INVOICE_ID` for specific integrations (TMX); treat these as exceptions.

** payables_invoice_voucher_flow **
would you extract help file informaion on Invoice_id in payable perspective, from schema payable.Invoice_id and receiver_line.Invoice_id. 
this information can be placed in payables_invoice_voucher_flow

see Documentation/Data Models/Payables/payables_invoice_voucher_flow.md
**/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results


declare @AsOfDate datetime = convert(date, '2025-01-01');
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
        AND POL.LINE_NO = RL.PURC_ORDER_LINE_NO 
		AND RL.RECEIVED_QTY > 0 -- UPD 8/7

    LEFT JOIN RECEIVER R  ON RL.RECEIVER_ID = R.ID

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
--AND PL.VOUCHER_ID IS NULL
ORDER BY POL.PURC_ORDER_ID, POL.LINE_NO,  PL.VOUCHER_ID, PL.LINE_NO
          ;

---select * from #results;

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
), APA AS (
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
), norm as (
SELECT
-- 1 -----------------------------------------------
    PO.VENDOR_ID,              --3 
    po.ORDER_DATE,
    POL.PURC_ORDER_ID,
    RL.RECEIVER_ID,
    RL.LINE_NO AS RCVR_LINE,
    -- RL.INVOICE_ID AS RCVR_INVOICE,
    P.VOUCHER_ID,
    P.INVOICE_ID AS PAYABLE_INVOICE,
    PL.LINE_NO AS PAYABLE_LINE_NO,
    PL.AMOUNT,
  -- 2 -----------------------------------------------
      pol.DESIRED_RECV_DATE -- 8.
    , POL.COMMODITY_CODE
    , UD.STRING_VAL AS CONTROLLED
    , V.USER_6 as SUPPLIER_TYPE
    , POL.PART_ID
    , PART.PLANNER_USER_ID
    , V.user_7 as PRODUCT_TYPE

  --APA.*
    , APA.SECTION
    , APA.PO
    , APA.VENDOR_ID apa_VENDOR_ID
    , APA.DOC
    , APA.FILE_NAME
    , APA.UPLOAD_DATE
    , APA.[VOUCHER#] APA_VOUCHER_ID
    , APA.ID

-- purchase_order_flow
FROM PURC_ORDER_LINE POL
INNER JOIN PURCHASE_ORDER PO ON POL.PURC_ORDER_ID = PO.ID

-- purchase_order_flow -- > receiver_flow
left JOIN RECEIVER_LINE RL
ON POL.PURC_ORDER_ID = RL.PURC_ORDER_ID
AND POL.LINE_NO = RL.PURC_ORDER_LINE_NO 
AND RL.RECEIVED_QTY > 0 -- UPD 8/7

left JOIN.PART 
ON PART.ID = POL.PART_ID

JOIN VENDOR V
ON PO.VENDOR_ID = V.ID
and PO.VENDOR_ID != 'TMXDIV'

LEFT JOIN USER_DEF_FIELDS UD 
ON POL.PART_ID = UD.DOCUMENT_ID 
AND UD.ID = 'UDF-0000082' AND UD.PROGRAM_ID = 'VMPRTMNT'

-- purchase_order_flow  -- > receiver_flow -- > payable_flow (via voucher)
left JOIN Live.dbo.PAYABLE_LINE PL
  ON PL.RECEIVER_ID = RL.RECEIVER_ID
  AND PL.RECEIVER_LINE_NO = RL.LINE_NO

LEFT JOIN Live.dbo.PAYABLE P
  ON PL.VOUCHER_ID = P.VOUCHER_ID

  -- purchase_order_flow  -- > receiver_flow -- > payable_flow (via voucher) -- > AP Automation App
left JOIN APA ON
APA.DOC = P.INVOICE_ID
WHERE 1=1 
and RL.INVOICE_ID IS NULL
AND po.ORDER_DATE BETWEEN @StartDate AND @EndDate
)
select top 5000 * 
from norm
WHERE PAYABLE_INVOICE IS NULL
and RECEIVER_ID is null


