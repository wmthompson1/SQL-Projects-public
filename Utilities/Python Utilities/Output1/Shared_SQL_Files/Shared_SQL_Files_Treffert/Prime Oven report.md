# Prime Oven report

```sql
use live
go

--select distinct resource_id from operation where (resource_id like '%pri%') or (resource_id like '%oven%') or (resource_id like '%tc%')
/*
resource_id:
	AUB-oven1
	AUB-pri
	BAL-oven
	BAL-pri
	pri - could be at Ballard too

	AUB-tc', 'BAL-tc', 'tc'
*/

--DROP TABLE #traci1

SELECT 
	o.WORKORDER_BASE_ID, 
	o.WORKORDER_LOT_ID, 
	o.WORKORDER_SUB_ID, 
	O.SEQUENCE_NO,
	o.Resource_ID,
	LEAD(o.Resource_ID,1, NULL) OVER (PARTITION BY o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID, o.WORKORDER_SUB_ID ORDER BY SEQUENCE_NO) LeadValue1,
	LEAD(o.Resource_ID,2, NULL) OVER (PARTITION BY o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID, o.WORKORDER_SUB_ID ORDER BY SEQUENCE_NO) LeadValue2,
	LEAD(o.Resource_ID,3, NULL) OVER (PARTITION BY o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID, o.WORKORDER_SUB_ID ORDER BY SEQUENCE_NO) LeadValue3
INTO
	#traci1
FROM 
	work_order wo
INNER JOIN
	operation o
		on wo.[type] = o.[WORKORDER_TYPE]
		and wo.base_id = o.workorder_base_id
		and wo.[LOT_ID] = o.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = o.WORKORDER_SPLIT_ID
		and wo.[SUB_ID] = o.WORKORDER_SUB_ID
WHERE 
	wo.[status] = 'R'
	and wo.[type] = 'W'
GROUP BY
	o.WORKORDER_BASE_ID, 
	o.WORKORDER_LOT_ID, 
	o.WORKORDER_SUB_ID,
	O.SEQUENCE_NO,
	o.Resource_ID
ORDER BY 
	o.WORKORDER_BASE_ID, 
	o.WORKORDER_LOT_ID, 
	o.WORKORDER_SUB_ID,
	O.SEQUENCE_NO,
	o.Resource_ID
--(7857 row(s) affected)

SELECT 
	wo.base_id,
	wo.[LOT_ID],
	wo.[SUB_ID],
	wo.part_id,
	l.[CURRENT_LOCATION] as OriginalLocation,
	substring(wo.[ENGINEERED_BY],CHARINDEX('/', wo.[ENGINEERED_BY], 1)+1, 5) as WOEngineer,
	pl.name,
	o.SEQUENCE_NO, 
	o.RESOURCE_ID
FROM 
	work_order wo
INNER JOIN
	(
	SELECT
		WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SUB_ID, SEQUENCE_NO, RESOURCE_ID  
	FROM
		OPERATION O
	WHERE
		RESOURCE_ID in ('AUB-pri', 'BAL-pri', 'pri')
	) AS O
		ON (O.WORKORDER_BASE_ID = wo.base_id
		AND O.WORKORDER_Lot_ID = wo.lot_id 
		AND O.WORKORDER_sub_ID = wo.sub_id)
INNER JOIN
	[SKILLS_WO_OPS_OPEN_LOC] l
		ON (wo.BASE_ID = l.base_id
		AND wO.Lot_ID = l.lot_id 
		AND wO.sub_ID = l.sub_id
		and previous_location = 'None')
LEFT OUTER JOIN 
	LiveSupplemental.dbo.Planners pl
		ON SUBSTRING(Wo.ENGINEERED_BY, CHARINDEX(pl.Filter_String, Wo.ENGINEERED_BY), LEN(Wo.ENGINEERED_BY)) = pl.Filter_String
where wo.base_id not in 
	(
	SELECT 
		workorder_base_id
	FROM
		#traci1 t
	WHERE
		t.RESOURCE_ID in ('AUB-pri', 'BAL-pri', 'pri')
		AND t.LEADVALUE1  in ('AUB-oven1', 'BAL-oven')
		and t.LEADVALUE2   in ('AUB-pri', 'BAL-pri', 'pri')
		AND t.LEADVALUE3  in ('AUB-oven1', 'BAL-oven')
	)
	and wo.[status] = 'R'
	and wo.[type] = 'W'
ORDER BY
	base_id
--(1272 row(s) affected)

--select * from #traci1 where workorder_base_id = '1295553'
--select * from [SKILLS_WO_OPS_OPEN_LOC] where base_id = '1313977'

SELECT 
	wo.base_id,
	wo.[LOT_ID],
	wo.[SUB_ID],
	wo.part_id,
	l.[CURRENT_LOCATION] as OriginalLocation,
	substring(wo.[ENGINEERED_BY],CHARINDEX('/', wo.[ENGINEERED_BY], 1)+1, 5) as WOEngineer,
	pl.name,
	o.SEQUENCE_NO, 
	o.RESOURCE_ID
FROM 
	work_order wo
INNER JOIN
	(
	SELECT
		WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SUB_ID, SEQUENCE_NO, RESOURCE_ID  
	FROM
		OPERATION O
	WHERE
		RESOURCE_ID in ('AUB-tc', 'BAL-tc', 'tc')
	) AS O
		ON (O.WORKORDER_BASE_ID = wo.base_id
		AND O.WORKORDER_Lot_ID = wo.lot_id 
		AND O.WORKORDER_sub_ID = wo.sub_id)
INNER JOIN
	[SKILLS_WO_OPS_OPEN_LOC] l
		ON (wo.BASE_ID = l.base_id
		AND wO.Lot_ID = l.lot_id 
		AND wO.sub_ID = l.sub_id
		and previous_location = 'None')
LEFT OUTER JOIN 
	LiveSupplemental.dbo.Planners pl
		ON SUBSTRING(Wo.ENGINEERED_BY, CHARINDEX(pl.Filter_String, Wo.ENGINEERED_BY), LEN(Wo.ENGINEERED_BY)) = pl.Filter_String
WHERE wo.base_id not in 
	(
	SELECT 
		workorder_base_id
	FROM
		#traci1 t
	WHERE
		t.RESOURCE_ID in ('AUB-tc', 'BAL-tc', 'tc')
		AND t.LEADVALUE1 in ('AUB-oven1', 'BAL-oven')
	)
	and wo.[status] = 'R'
	and wo.[type] = 'W'
ORDER BY
	base_id

select * from #traci1 where RESOURCE_ID in ('AUB-tc', 'BAL-tc', 'tc')
```