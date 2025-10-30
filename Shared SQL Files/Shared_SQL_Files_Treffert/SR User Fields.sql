USE DataWarehouse
GO

SELECT ID
	, [DESCRIPTION]
	, USER_4 AS SUPERVISOR
	, USER_5 AS FACILITY
	, USER_6 AS DEPARTMENT
	, USER_7 AS PROCESS
	, USER_8 AS REPTDEPT
FROM SHOP_RESOURCE
WHERE ([STATUS] IS NULL OR [STATUS] != 'O')
ORDER BY USER_8
	, ID


SELECT O.WORKORDER_BASE_ID
, O.WORKORDER_LOT_ID
, O.WORKORDER_SPLIT_ID
, O.WORKORDER_SUB_ID
, O.WORKORDER_TYPE
, O.SEQUENCE_NO
, O.RESOURCE_ID
, O.OPERATION_TYPE
, O.[STATUS]
, WO.[STATUS]
FROM WORK_ORDER WO
INNER JOIN OPERATION O
ON WO.BASE_ID = O.WORKORDER_BASE_ID
AND WO.LOT_ID = O.WORKORDER_LOT_ID
AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
AND WO.SUB_ID = O.WORKORDER_SUB_ID
AND WO.[TYPE] = O.WORKORDER_TYPE
--WHERE O.RESOURCE_ID IN ('abrburr', 'cncmill', 'cncmill-4', 'handburr', 'hot joggle', 'outreach', 'OUT-review', 'Programming', 'PROGS', 'review', 'SouthAUB-boepkg', 'Stores', 'tablesaw', 'tooling')
WHERE O.RESOURCE_ID IN ('abrburr', 'B1F1-ANO-BORIC', 'B1F1-CHCNV-1000', 'B1F1-CHCNV-1200', 'B1F1-CHCNV-600', 'B1F1-CH-EMU', 'B1F1-ETCH', 'B1F1-POLISH', 'B1F1-RACK', 'B1F1-REVIEW', 'B1F1-SHIP', 'B1F1-SULF', 'B1F1-UNRACK', 'BAL-FINALinsp', 'BAL-handburr', 'BAL-insp', 'BAL-MFGinsp', 'BAL-ovenPrime', 'BAL-pkg', 'BAL-pm', 'BAL-polish', 'BAL-pri', 'BAL-sand', 'BAL-setup', 'BAL-ship', 'BAL-takedown', 'BAL-tc', 'boltboard', 'cncmill', 'cncmill-4', 'handburr', 'hot joggle', 'outreach', 'OUT-review', 'Programming', 'PROGS', 'review', 'SouthAUB-boepkg', 'Stores', 'tablesaw', 'tooling')
AND WO.[STATUS] NOT IN ('C', 'X')
AND WO.[TYPE] IN ('M', 'W')