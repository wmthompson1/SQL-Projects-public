use LIVE
go

select 
	w.base_id, 
	w.lot_id, 
	w.split_id, 
	w.sub_id, 
	w.DESIRED_QTY,
	w.[status],
	w.part_id,
	o.SEQUENCE_NO,
	o.resource_id,
	o.service_id,
	o.OPERATION_TYPE,
	ra.dept,
	lt.employee_id,
	lt.UNADJ_CLOCK_IN,
	lt.UNADJ_CLOCK_out,
	lt.HOURS_WORKED,
	lt.ACT_LABOR_COST, 
	lt.ACT_BURDEN_COST
from	   
	WORK_ORDER W
inner JOIN 
	(select distinct
		w2.BASE_ID,
		w2.LOT_ID,
		w2.split_ID,
		w2.SUB_ID
	from work_order w2
	INNER JOIN 
		OPERATION O
		ON  w2.TYPE = 'W'
		AND w2.BASE_ID = O.WORKORDER_BASE_ID
		AND w2.LOT_ID = O.WORKORDER_LOT_ID
		AND w2.SPLIT_ID = O.WORKORDER_SPLIT_ID
		AND w2.SUB_ID = O.WORKORDER_SUB_ID
		AND (
			(o.resource_id = 'AUB-solgel' and o.OPERATION_TYPE in ('F17.48A', 'F17.48B', 'F17.52A', 'F17.52B', 'F17.55A', 'F17.55B', 'F17.54A', 'F17.54B'))
			or 
			(o.resource_ID = 'contractor' and o.service_id = '5753M2+SG+PR')
			)
	--left outer join
	--	service_binary sb
	--	on o.service_id = sb.service_id
	--	and CAST(CAST(BITS AS varbinary(8000)) AS varchar(8000)) like '%sol%gel%'
	) w2
	ON  W.TYPE = 'w'
	AND W.BASE_ID = w2.BASE_ID
	AND W.LOT_ID = w2.LOT_ID
	AND W.SPLIT_ID = w2.SPLIT_ID
	AND W.Sub_ID = w2.sub_ID
inner JOIN 
	OPERATION O
	ON W.TYPE = O.WORKORDER_TYPE
	AND W.BASE_ID = O.WORKORDER_BASE_ID
	AND W.LOT_ID = O.WORKORDER_LOT_ID
	AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND W.SUB_ID = O.WORKORDER_SUB_ID
INNER JOIN
	LIVESupplemental.dbo.ResourceID_Assignments ra
	on ra.Resource_ID = o.Resource_ID
left outer JOIN
	LABOR_TICKET LT
	ON LT.WORKORDER_TYPE = O.WORKORDER_TYPE
	AND LT.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID
	AND LT.WORKORDER_LOT_ID = O.WORKORDER_LOT_ID
	AND LT.WORKORDER_SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND LT.WORKORDER_SUB_ID = O.WORKORDER_SUB_ID
	AND LT.OPERATION_SEQ_NO = O.SEQUENCE_NO

where
	w.TYPE = 'W'
	and w.status not in ('C', 'X')
	and (
		(ra.resource_id = 'aub-solgel' and o.OPERATION_TYPE in ('F17.48A', 'F17.48B', 'F17.52A', 'F17.52B', 'F17.55A', 'F17.55B', 'F17.54A', 'F17.54B'))
		or 
		(ra.resource_ID = 'contractor' and o.service_id = '5753M2+SG+PR')
		)
order by 
	base_id,
	lot_id,
	sub_id,
	o.SEQUENCE_NO
	