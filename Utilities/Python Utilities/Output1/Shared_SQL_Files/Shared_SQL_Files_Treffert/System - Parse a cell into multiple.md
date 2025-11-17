# System - Parse a cell into multiple

```sql
USE LIVE
GO
 
DECLARE @delimiter VARCHAR(50) = '~'  -- <=== Here, you can change the delimiter.

; WITH CTE AS
(SELECT UDF.DOCUMENT_ID
	, CAST('<M>' + REPLACE(UDF.DOCUMENT_ID, @delimiter, '</M><M>') + '</M>' AS XML) AS [DOCUMENT XML]
	, CONVERT(VARCHAR(12), CONVERT(SMALLINT, NUMBER_VAL)) AS [NUM_VALUE]
FROM USER_DEF_FIELDS UDF
WHERE UDF.PROGRAM_ID = 'VMMFGWIN_OP'
AND UDF.ID = 'UDF-0000089'             
AND UDF.DOCUMENT_ID LIKE 'M~%'
AND CONVERT(VARCHAR(12), CONVERT(SMALLINT, NUMBER_VAL)) != 0
)

SELECT DOCUMENT_ID
--	, [DOCUMENT XML]
	, [DOCUMENT XML].value('/M[1]', 'varchar(1)') AS [TYPE]
	, [DOCUMENT XML].value('/M[2]', 'varchar(15)') AS [BASE]
	, [DOCUMENT XML].value('/M[3]', 'varchar(5)') AS [LOT]
	, [DOCUMENT XML].value('/M[4]', 'varchar(5)') AS [SPLIT]
	, [DOCUMENT XML].value('/M[5]', 'varchar(5)') AS [SUB]
	, [DOCUMENT XML].value('/M[6]', 'varchar(5)') AS [SEQNO]
	, [NUM_VALUE]
FROM CTE 
GO

```