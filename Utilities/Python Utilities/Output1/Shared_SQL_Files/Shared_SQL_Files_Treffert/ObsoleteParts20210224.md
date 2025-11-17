# ObsoleteParts20210224

```sql
USE LIVE
GO

SELECT P.ID
, P.[STATUS]
, O.PART_ID
FROM PART P
INNER JOIN [LIVESupplemental].[dbo].[ObsoleteParts20210224] O
ON P.ID = O.PART_ID

UPDATE PART
SET [STATUS] = 'O'
FROM PART P
INNER JOIN [LIVESupplemental].[dbo].[ObsoleteParts20210224] O
ON P.ID = O.PART_ID
--> (37802 rows affected)

UPDATE PART_SITE
SET [STATUS] = 'O'
FROM PART_SITE P
INNER JOIN [LIVESupplemental].[dbo].[ObsoleteParts20210224] O
ON P.PART_ID = O.PART_ID
--> (37802 rows affected)

```