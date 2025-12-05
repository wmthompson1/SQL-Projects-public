-- file path: Shared SQL Files/Shared_SQL_Files_Treffert/AP App Receiver to Voucher Information.sql


--DECLARE @POID NVARCHAR(10) = '143708'
--SELECT * 
--From dbRMS.dbo.Tblfiles F
--Left Outer Join dbRMS.dbo.tblPO PO
--    on PO.fileID = F.id
--Where F.Section in ('Invoice', 'Pack Slip')
--and PO.pNo = @POID

; WITH CTE_PACKSLIP AS
(SELECT PO.pNo, F.* 
From dbRMS.dbo.Tblfiles F
Left Outer Join dbRMS.dbo.tblPO PO
    on PO.fileID = F.id
Where F.Section in ('Pack Slip')
)

, CTE_INVOICE AS
(SELECT PO.pNo, F.* 
From dbRMS.dbo.Tblfiles F
Left Outer Join dbRMS.dbo.tblPO PO
    on PO.fileID = F.id
Where F.Section in ('Invoice')
)

, CTE_MERGE AS
(SELECT P.pNo
, P.Receiver#
, I.Voucher# AS INV_VOUCHER
FROM CTE_PACKSLIP P
LEFT OUTER JOIN CTE_INVOICE I
ON P.pNo = I.pNo
)

, CTE_VISUAL AS
(SELECT POL.PURC_ORDER_ID
--, POL.LINE_NO AS PO_LINE
--, RL.RECEIVER_ID
--, RL.LINE_NO AS RCVR_LINE
, PL.VOUCHER_ID
--, PL.LINE_NO AS VCHR_LINE
FROM Live.dbo.PURC_ORDER_LINE POL
Left Outer JOin Live.dbo.PURCHASE_ORDER VPO
     on VPO.ID = POL.PURC_ORDER_ID
Left Outer Join Live.dbo.RECEIVER_LINE RL
    on RL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and RL.PURC_ORDER_LINE_NO = POL.LINE_NO
Left Outer Join Live.dbo.RECEIVER R
    on RL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and RL.PURC_ORDER_LINE_NO = POL.LINE_NO
Left Outer Join Live.dbo.PAYABLE_LINE PL
    on PL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and PL.PURC_ORDER_LINE_NO = POL.LINE_NO
Left Outer Join Live.dbo.PAYABLE P
    on PL.PURC_ORDER_ID = POL.PURC_ORDER_ID
    and PL.PURC_ORDER_LINE_NO = POL.LINE_NO
GROUP BY POL.PURC_ORDER_ID
, POL.LINE_NO
, RL.RECEIVER_ID
, RL.LINE_NO 
, PL.VOUCHER_ID
, PL.LINE_NO 
) 

SELECT pNo
, APP.Receiver#
, APP.INV_VOUCHER
, VOUCHER_ID
FROM CTE_MERGE APP
LEFT OUTER JOIN CTE_VISUAL VIS
ON VIS.PURC_ORDER_ID = APP.pNo
Where APP.INV_VOUCHER IS NULL
AND APP.Receiver# IS NOT NULL
GROUP BY pNo
, APP.Receiver#
, VOUCHER_ID
, APP.INV_VOUCHER