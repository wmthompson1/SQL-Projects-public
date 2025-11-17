# Duplicate Voucher Check

```sql
/**********************************************************************************************
Description:  Duplicate Voucher Check
Sample:
Date      Modified By      Change Description
---------- ------------------ ------------------------------------------------------------
08/21/2025    Luke        Query
Ticket 1075            Posted Report - William

Luke Garrison
To: helpdesk@skillsinc.org
Aug 21
Anyone, Active
Can you please publish an SSRS Report in the Finance folder titled "Duplicate Voucher Check". Below is the query for the report.

**********************************************************************************************/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET DEADLOCK_PRIORITY LOW;

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results;

WITH ReceiverCounts AS (
SELECT
Concat(Receiver_ID, '-', RECEIVER_LINE_NO, '-', QTY) AS UniqueReceiver,
COUNT(DISTINCT Voucher_ID) AS VoucherCount
FROM Payable_line
WHERE Receiver_ID IS NOT NULL

GROUP BY Receiver_ID, RECEIVER_LINE_NO, QTY
HAVING COUNT(*) > 1
)

SELECT
P.VENDOR_ID,
PL.VOUCHER_ID,
PL.PURC_ORDER_ID,
PL.PURC_ORDER_LINE_NO,
PL.AMOUNT,
PL.RECEIVER_ID,
PL.RECEIVER_LINE_NO
--Concat(PL.Receiver_ID, '-', PL.RECEIVER_LINE_NO, '-', PL.QTY) AS 'Unique'
FROM Payable P
LEFT OUTER JOIN Payable_line PL ON PL.Voucher_ID = P.Voucher_ID
INNER JOIN ReceiverCounts RC
ON RC.UniqueReceiver = Concat(PL.Receiver_ID, '-', PL.RECEIVER_LINE_NO, '-', PL.QTY)
WHERE
Month(P.POSTING_DATE) >= Month(Getdate())
and Year(P.POSTING_DATE) >= Year(Getdate())
AND PL.Receiver_ID IS NOT NULL
ORDER BY RC.VoucherCount DESC, PL.VOUCHER_ID;

```