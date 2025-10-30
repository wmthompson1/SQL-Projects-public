
/*
update oper_type_binary foundation table from temp table and to uppercase
*/

SELECT OTB.OPERATION_TYPE_ID,
	  UPPER(CAST(CAST(CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX)) AS VARBINARY(MAX)) AS NVARCHAR(MAX))) AS SPECS,
	  CAST(UPPER(CAST(CAST(CAST(T.FUTURE_OPERATION_TEXT_LEFT AS  NVARCHAR(MAX)) AS VARBINARY(MAX)) AS NVARCHAR(MAX))) AS VARBINARY(MAX)) AS SPECS2
FROM   OPER_TYPE_BINARY OTB
	  INNER JOIN LIVESUPPLEMENTAL.[DBO].[RES_OP_TYPE_WITH_BINARY_20180815$] T
		ON OTB.OPERATION_TYPE_ID = T.OPERATION_TYPE_ID
		   AND T.[DO_NOT_USE] = 'NO'
WHERE  (CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX)) <> 'No Change'
	   AND CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX)) IS NOT NULL)
	   --and otb.operation_type_id = 'averify-shim'; --896


--select * from  oper_type_binary
--where operation_type_id = 'F22.25-7800'

BEGIN TRANSACTION;
UPDATE OTB
SET OTB.BITS = CAST(CAST(UPPER(CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX))) AS VARBINARY(MAX)) AS IMAGE)
FROM OPER_TYPE_BINARY OTB
INNER JOIN LIVESUPPLEMENTAL.[DBO].[RES_OP_TYPE_WITH_BINARY_20180815$] T
	ON OTB.OPERATION_TYPE_ID = T.OPERATION_TYPE_ID
	AND T.[DO_NOT_USE] = 'NO'
WHERE (CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX)) <> 'No Change'
AND CAST(T.FUTURE_OPERATION_TEXT_LEFT AS NVARCHAR(MAX)) IS NOT NULL)
	  -- and otb.operation_type_id = 'averify-shim'
	  ; --
--COMMIT TRANSACTION;
--ROLLBACK TRANSACTION;

--Delete BINSPCHEM,INSPCHEM operation_type from all masters
/*
SELECT WORKORDER_BASE_ID
	, WORKORDER_LOT_ID
	, WORKORDER_SUB_ID
	, WORKORDER_SPLIT_ID
	, WORKORDER_TYPE
	, SEQUENCE_NO
	, OPERATION_TYPE
INTO #T1
FROM OPERATION O
WHERE WORKORDER_TYPE = 'M'
AND OPERATION_TYPE IN ('INSPCHEM','BINSPCHEM')
*/

BEGIN TRANSACTION;
DELETE OB
FROM OPERATION_BINARY OB
INNER JOIN #T1 T
	ON OB.WORKORDER_TYPE = T.WORKORDER_TYPE
	AND OB.WORKORDER_BASE_ID = T.WORKORDER_BASE_ID
	AND OB.WORKORDER_LOT_ID = T.WORKORDER_LOT_ID
	AND OB.WORKORDER_SPLIT_ID = T.WORKORDER_SPLIT_ID
	AND OB.WORKORDER_SUB_ID = T.WORKORDER_SUB_ID
	AND OB.SEQUENCE_NO = T.SEQUENCE_NO;

--COMMIT TRANSACTION;
--ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
DELETE O
FROM OPERATION O
INNER JOIN #T1
	ON O.WORKORDER_TYPE = T.WORKORDER_TYPE
	AND O.WORKORDER_BASE_ID = T.WORKORDER_BASE_ID
	AND O.WORKORDER_LOT_ID = T.WORKORDER_LOT_ID
	AND O.WORKORDER_SPLIT_ID = T.WORKORDER_SPLIT_ID
	AND O.WORKORDER_SUB_ID = T.WORKORDER_SUB_ID
	AND O.SEQUENCE_NO = T.SEQUENCE_NO; 

--COMMIT TRANSACTION;
--ROLLBACK TRANSACTION;
	 
*/

/**********************************************************************
/*  Delete AVERIFY, BVERIFY operation_type from all masters
/**********************************************************************
/*
SELECT WORKORDER_BASE_ID,
	  WORKORDER_LOT_ID,
	  WORKORDER_SUB_ID,
	  WORKORDER_SPLIT_ID,
	  WORKORDER_TYPE,
	  SEQUENCE_NO,
	  OPERATION_TYPE
INTO LIVESUPPLEMENTAL.DBO.OPTYPE_AVERIFY_DELETED_OPS_20180815$
FROM   OPERATION O
WHERE  WORKORDER_TYPE = 'M'
	  AND OPERATION_TYPE IN('AVERIFY','BVERIFY');  --6171
*/

--SELECT * FROM LIVESUPPLEMENTAL.DBO.OPTYPE_AVERIFY_DELETED_OPS_20180815$ 
BEGIN TRANSACTION;
DELETE OB
FROM OPERATION_BINARY OB
	INNER JOIN LIVESUPPLEMENTAL.DBO.OPTYPE_AVERIFY_DELETED_OPS_20180815$ T
	   ON OB.WORKORDER_TYPE = T.WORKORDER_TYPE
		 AND OB.WORKORDER_BASE_ID = T.WORKORDER_BASE_ID
		 AND OB.WORKORDER_LOT_ID = T.WORKORDER_LOT_ID
		 AND OB.WORKORDER_SPLIT_ID = T.WORKORDER_SPLIT_ID
		 AND OB.WORKORDER_SUB_ID = T.WORKORDER_SUB_ID
		 AND OB.SEQUENCE_NO = T.SEQUENCE_NO;  --4220   00:00:10
--COMMIT TRANSACTION;
--ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
DELETE O
FROM OPERATION O
	INNER JOIN LIVESUPPLEMENTAL.DBO.OPTYPE_AVERIFY_DELETED_OPS_20180815$ T
	   ON O.WORKORDER_TYPE = T.WORKORDER_TYPE
		 AND O.WORKORDER_BASE_ID = T.WORKORDER_BASE_ID
		 AND O.WORKORDER_LOT_ID = T.WORKORDER_LOT_ID
		 AND O.WORKORDER_SPLIT_ID = T.WORKORDER_SPLIT_ID
		 AND O.WORKORDER_SUB_ID = T.WORKORDER_SUB_ID
		 AND O.SEQUENCE_NO = T.SEQUENCE_NO; --6171  00:00:08

COMMIT TRANSACTION;
ROLLBACK TRANSACTION;
	 
*/




/**********************************************************************
/**********************************************************************
/**********************************************************************
STOPPED HERE 8/1/2018



/**********************************************************************
update masters operation type binary to uppercase

select o.Operation_Type, 
	  --OTr.[Op Type Description] , 
   --    otr.[new RESOURCE ID],  
	  o.OPERATION_TYPE,
	  upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX))) AS specs ,
	  cast(upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)))AS varbinary(MAX)) as specs2
from dbo.OPERATION_BINARY ob
inner join operation o
  on o.[WORKORDER_TYPE] = ob.WORKORDER_TYPE
 and o.[WORKORDER_BASE_ID] = ob.WORKORDER_BASE_ID
 and o.[WORKORDER_LOT_ID] = ob.WORKORDER_LOT_ID
 and o.[WORKORDER_SPLIT_ID] = ob.WORKORDER_SPLIT_ID
 and o.[WORKORDER_SUB_ID] = ob.WORKORDER_SUB_ID
 and o.[SEQUENCE_NO] = ob.SEQUENCE_NO
and ob.type = 'D'
--inner join LIVESupplemental.dbo.RES_OP_TYPE_WITH_BINARY_20180726$ otr
--    on o.OPERATION_TYPE = otr.[Operation Type ID]
  --  WHERE o.workorder_type = 'M'
   WHERE O.WORKORDER_BASE_ID IN ('1517994', '1517993')
     --and  OTR.business_unit = 'MFG'
    --and  (OTr.[Op Type Description] <> 'DO NOT USE'
    --or otr.[Op Type Description] is null) 
    --AND OTR.DoNotUse = 'NO'
    --AND OTR.[delete line for duplicate] = 'no'
    --AND EXISTS (SELECT 1 FROM  LIVE.DBO.OPER_TYPE_BINARY OtB
    --            WHERE OtB.OPERATION_TYPE_ID = otr.[Operation Type ID]) -- 120181

 BEGIN TRANSACTION;
 UPDATE OB
 SET OB.BITS = cast(upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)))AS varbinary(MAX))
 from dbo.OPERATION_BINARY ob
inner join operation o
  on o.[WORKORDER_TYPE] = ob.WORKORDER_TYPE
 and o.[WORKORDER_BASE_ID] = ob.WORKORDER_BASE_ID
 and o.[WORKORDER_LOT_ID] = ob.WORKORDER_LOT_ID
 and o.[WORKORDER_SPLIT_ID] = ob.WORKORDER_SPLIT_ID
 and o.[WORKORDER_SUB_ID] = ob.WORKORDER_SUB_ID
 and o.[SEQUENCE_NO] = ob.SEQUENCE_NO
and ob.type = 'D'
   WHERE o.workorder_type = 'M' -
   WHERE O.WORKORDER_BASE_ID IN ('1517994', '1517993')
    --COMMIT TRANSACTION; 
    --ROLLBACK TRANSACTION;

/**********************************************************************
update masters operation type binary to uppercase
*/ 


*/ 


SELECT OT.id, 
	  ot.DESCRIPTION, 
       ot.RESOURCE_ID,  
       upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX))) AS specs ,
	  cast(upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)))AS varbinary(MAX)) as specs2
 FROM LIVE.DBO.OPER_TYPE_BINARY OB
 INNER JOIN LIVE.DBO.OPERATION_TYPE OT
 ON OT.ID = OB.OPERATION_TYPE_ID
 inner join [dbo].[RES_OP_TYPE_WITH_BINARY_20180726$] otr
  on  ot.id = otr.[Operation Type ID]
where business_unit = 'MFG'
and [FUTURE OPERATION TEXT (LEFT)] = 'NO CHANGE'
and  OT.DESCRIPTION <> 'DO NOT USE' -- 116


BEGIN TRANSACTION;
UPDATE  OB
SET BITS = cast(upper(CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)))AS varbinary(MAX))
from LIVE.DBO.OPER_TYPE_BINARY OB
 INNER JOIN LIVE.DBO.OPERATION_TYPE OT
 ON OT.ID = OB.OPERATION_TYPE_ID
 inner join [dbo].[RES_OP_TYPE_WITH_BINARY_20180726$] otr
  on  ot.id = otr.[Operation Type ID]
where business_unit = 'MFG'
and [FUTURE OPERATION TEXT (LEFT)] = 'NO CHANGE'
and  OT.DESCRIPTION <> 'DO NOT USE' -- 116
--COMMIT TRANSACTION;
--ROLLBACK TRANSACTION;

--ADD carriage return back in
/*
*/

SELECT OTB.OPERATION_TYPE_id, 
       upper(CAST(CAST(oTB.BITS AS varbinary(MAX)) AS nvarchar(MAX))) AS specs ,
	  cast(upper(CAST(CAST(oTb.BITS AS varbinary(MAX)) AS nvarchar(MAX)))AS varbinary(MAX)) as specs2
   from OPER_TYPE_BINARY OtB
inner join LIVESUPPLEMENTAL.[dbo].[RES_OP_TYPE_WITH_BINARY_20180815$] otr
  on  OtB.OPERATION_TYPE_ID = otr.OPERATION_TYPE_ID
where otr.business_unit = 'FIN'
AND OTR.Do_Not_Use = 'NO'
AND OTR.FUTURE_OPERATION_TEXT_LEFT <> 'NO CHANGE'
AND CAST(CAST(oTb.BITS AS varbinary(MAX)) AS nvarchar(MAX)) NOT LIKE '%'+CHAR(13)+'%'  


BEGIN TRANSACTION;
update OtB
set bits =CAST(REPLACE(CAST(CAST(bits AS VARBINARY(max)) AS nvarchar(max)),CHAR(10), -- START OF NEW INFORMATION
CHAR(13)+char(10)) AS VARBINARY(max))
   from OPER_TYPE_BINARY OtB
inner join LIVESUPPLEMENTAL.[dbo].[RES_OP_TYPE_WITH_BINARY_20180815$] otr
  on  OtB.OPERATION_TYPE_ID = otr.OPERATION_TYPE_ID
where otr.business_unit = 'FIN'
AND OTR.Do_Not_Use = 'NO'
AND OTR.FUTURE_OPERATION_TEXT_LEFT <> 'NO CHANGE'
AND CAST(CAST(oTb.BITS AS varbinary(MAX)) AS nvarchar(MAX)) NOT LIKE '%'+CHAR(13)+'%' 
commit transaction;


-- ADD Carriage return back into contractor ops


use live
go

--SELECT POS = patindex('%'+CHAR(13)+CHAR(10)+'%',convert(CAST(CAST(ob.bits AS VARBINARY(max)) AS nvarchar(max)),' '+CHAR(13)+CHAR(10))))
--            --FROM (select col = convert(CAST(CAST(ob.bits AS VARBINARY(max)) AS nvarchar(max)),' '+CHAR(13)+CHAR(10))) a

----select CAST(CAST(bits AS VARBINARY(max)) AS nvarchar(max)),CHAR(13)+CHAR(10)+CHAR(13)))
--from operation_binary ob
--inner join operation o
--on o.workorder_type = ob.workorder_type
-- and o.workorder_base_id = ob.workorder_base_id
-- and o.workorder_lot_id = ob.workorder_lot_id
-- and o.workorder_sub_id = ob.workorder_sub_id
-- and o.WORKORDER_SPLIT_ID = ob.workorder_split_id
-- and o.sequence_no = ob.sequence_no
--  and ob.type = 'D'
--inner join [LIVESupplemental].dbo.[master_contractor_ops_20180705$] s
-- on o.workorder_type = 'M'
-- and o.workorder_base_id = s.part_id
-- and o.workorder_lot_id = s.lot_id
-- and o.workorder_sub_id = '0'
-- and o.WORKORDER_SPLIT_ID = '0'
-- and o.sequence_no = s.sequence_no
--where o.resource_id = 'contractor' 
--and o.workorder_type = 'M'

UPDATE OB
set bits =
CAST(REPLACE(CAST(CAST(bits AS VARBINARY(max)) AS nvarchar(max)),CHAR(10)+CHAR(13)+CHAR(10), -- START OF NEW INFORMATION
'') AS VARBINARY(max)) 
from operation_binary ob
inner join operation o
on o.workorder_type = ob.workorder_type
 and o.workorder_base_id = ob.workorder_base_id
 and o.workorder_lot_id = ob.workorder_lot_id
 and o.workorder_sub_id = ob.workorder_sub_id
 and o.WORKORDER_SPLIT_ID = ob.workorder_split_id
 and o.sequence_no = ob.sequence_no
  and ob.type = 'D'
inner join [LIVESupplemental].dbo.[master_contractor_ops_20180705$] s
 on o.workorder_type = 'M'
 and o.workorder_base_id = s.part_id
 and o.workorder_lot_id = s.lot_id
 and o.workorder_sub_id = '0'
 and o.WORKORDER_SPLIT_ID = '0'
 and o.sequence_no = s.sequence_no
where o.resource_id = 'contractor' 
and o.workorder_type = 'M'  --3872
 -- and   o.workorder_base_id = '113U0104-2'
-- and o.sequence_no = '110'
