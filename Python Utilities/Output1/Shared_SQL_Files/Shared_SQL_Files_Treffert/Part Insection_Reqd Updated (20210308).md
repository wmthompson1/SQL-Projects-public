# Part Insection_Reqd Updated (20210308)

```sql
/*
In another effort to clean up the data in part maintenance, We would like to have all active parts that are marked 
receiving inspection with a commodity code of CFM-Details, CFM-Raw Material, CFM-Standards to have the receiving 
inspection box un-checked.

CFM means customer furnished material, meaning we do not pay for the part and the customer is responsible for traceability 
and part conformity. We should not have them go through receiving inspection que even if we do have a $0 PO issued.

Please let me know if you have any questions.
*/

SELECT ID
, COMMODITY_CODE
, INSPECTION_REQD
INTO #T1
FROM PART
WHERE COMMODITY_CODE IN ('CFM-Details', 'CFM-Raw Matl', 'CFM-Standards') --LIKE 'CFM%'
AND INSPECTION_REQD != 'N'

UPDATE PART
SET INSPECTION_REQD = 'N'
FROM PART P
INNER JOIN #T1 T
ON P.ID = T.ID

UPDATE PART_SITE
SET INSPECTION_REQD = 'N'
FROM PART_SITE P
INNER JOIN #T1 T
ON P.PART_ID = T.ID

SELECT ID
, COMMODITY_CODE
, INSPECTION_REQD
FROM PART
WHERE COMMODITY_CODE IN ('CFM-Details', 'CFM-Raw Matl', 'CFM-Standards') --LIKE 'CFM%'
AND INSPECTION_REQD != 'N'

```