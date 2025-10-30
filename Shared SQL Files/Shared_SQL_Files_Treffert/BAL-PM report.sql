use live
go

SELECT
	l.TRANSACTION_DATE, 
	l.[WORKORDER_BASE_ID],
	l.[WORKORDER_LOT_ID],
	l.[WORKORDER_SPLIT_ID],
	l.[WORKORDER_SUB_ID],
	wo.PART_ID,
	desired_qty as WOQty,
	--l.[EMPLOYEE_ID],
	--e.[FIRST_NAME],
	--e.[LAST_NAME],
	l.[CLOCK_IN],
	l.[CLOCK_OUT],
	l.[HOURS_WORKED],
	l.[OPERATION_SEQ_NO],
	l.RESOURCE_ID,
	[OPERATION_TYPE],
	specs
FROM 	live.dbo.LABOR_TICKET l
INNER JOIN 
	operation o
		ON l.workorder_type = O.workorder_type
		and l.workorder_base_id = O.workorder_base_id
		AND l.workorder_lot_id = O.workorder_lot_id
		AND l.workorder_split_id = O.workorder_split_id
		AND l.workorder_SUB_ID = O.WORKORDER_SUB_ID    
		AND l.[OPERATION_SEQ_NO] = O.[SEQUENCE_NO]
INNER JOIN 
	[dbo].[SKILL_OPERATION_BINARY] SOB
		ON l.workorder_type = SOB.workorder_type
		and l.workorder_base_id = SOB.workorder_base_id
		AND l.workorder_lot_id = SOB.workorder_lot_id
		AND l.workorder_split_id = SOB.workorder_split_id
		AND l.workorder_SUB_ID = SOB.WORKORDER_SUB_ID    
		AND l.[OPERATION_SEQ_NO] = SOB.[SEQUENCE_NO]
LEFT OUTER JOIN 
	LIVESupplemental.dbo.resourceID_assignments RA
		ON O.RESOURCE_ID = RA.RESOURCE_ID
LEFT OUTER JOIN 
	EMPLOYEE e
		on e.[ID] = l.[EMPLOYEE_ID]
inner join work_order wo
		ON l.workorder_type = wo.type
		and l.workorder_base_id = wo.base_id
		AND l.workorder_lot_id = wo.lot_id
		AND l.workorder_split_id = wo.split_id
		AND l.workorder_SUB_ID = wo.SUB_ID    
WHERE 
	l.RESOURCE_ID like 'BAL-PM%'
	and l.TRANSACTION_DATE >= '8/15/2016'
	--(e.id in ('155','685')
	--and l.TRANSACTION_DATE between '04/24/2016 00:00:00' and '04/25/2016 00:00:00') 
	--or
	--(e.id = '685'
	--and l.TRANSACTION_DATE between '04/25/2016 00:00:00' and '04/26/2016 00:00:00')
order by
	--l.[EMPLOYEE_ID],
	--l.[CLOCK_IN],
	l.[WORKORDER_BASE_ID],
	l.[WORKORDER_LOT_ID],
	l.[WORKORDER_SPLIT_ID],
	l.[WORKORDER_SUB_ID],
	l.[OPERATION_SEQ_NO],
	l.RESOURCE_ID

