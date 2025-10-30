/*
I'd like a report of all parts that have had no inventory transactions. 
No criteria except the CREATE DATE < 1/1/2019 with the following output:

 Part ID
 Description
 Commodity Code
 Planner ID
 Buyer ID
 Part Create Date

I have a feeling this list might be long. Are you able to delete parts if I provide the spreadsheet? If not, I can delete them manually, but I don't want to. And no hurry on this, just trying to cleanup the database.
 Thank you,
 Ann
*/

SELECT P.ID AS Part_ID
, P.[Description]
--, P.[STATUS]
, P.Commodity_Code
, P.Planner_USER_ID
, P.Buyer_USER_ID
, P.Create_Date
, I.TRANSACTION_ID
, WO.BASE_ID
, WO.LOT_ID
, WO.SPLIT_ID
, WO.SUB_ID
, WO.[TYPE]
FROM PART P
LEFT OUTER JOIN WORK_ORDER WO
ON P.ID = WO.PART_ID
LEFT OUTER JOIN INVENTORY_TRANS I
ON P.ID = I.PART_ID
WHERE I.TRANSACTION_ID IS NULL
AND P.CREATE_DATE < '1/1/2019'
AND P.[STATUS] = 'A'
--AND WO.[TYPE] = 'M'

--SELECT TOP 10 * FROM INVENTORY_TRANS ORDER BY TRANSACTION_DATE DESC