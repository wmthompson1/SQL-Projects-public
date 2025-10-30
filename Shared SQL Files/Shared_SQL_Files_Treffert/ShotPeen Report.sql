USE LIVE
GO

DROP TABLE #traci1;

SELECT
	WORKORDER_BASE_ID, 
	WORKORDER_LOT_ID,
	WORKORDER_SUB_ID, 
	PART_ID, 
	l.[TRANSACTION_DATE],
	SETUP_COMPLETED, 
	EMPLOYEE_ID, 
	DEPARTMENT_ID, 
	RESOURCE_ID, 
	HOURLY_COST, 
	HOURS_WORKED, 
	HOURS_OVERALL, 
	l.ACT_LABOR_COST, 
	DESIRED_QTY, 
	wo.STATUS
INTO
	#traci1
FROM
	labor_ticket l	
INNER JOIN
	work_order wo
        on wo.[type] = l.[WORKORDER_TYPE]
		and wo.base_id = l.workorder_base_id
        and wo.[LOT_ID] = l.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = l.WORKORDER_SPLIT_ID
		and wo.[SUB_ID] = l.WORKORDER_SUB_ID
WHERE
	l.resource_ID like '%SP%'
	and l.resource_ID not like '%INSP%'
--	and datediff(day, l.[TRANSACTION_DATE], getdate()-1) <= 10
	and l.transaction_date between '2016-03-19 00:00:00.000' and '2016-03-28 23:59:59.999'
;

select * from #traci1 where workorder_lot_id <> 1 order by workorder_base_id

SELECT 
	WORKORDER_base_id, 
	desired_qty, 
	avg(hourly_cost) as AVGofHourly_Cost,
	sum(hours_worked) as SumofHours_Worked
FROM 
	#traci1
GROUP BY
	WORKORDER_base_id,
	desired_qty
ORDER BY
	WORKORDER_base_id, 
	desired_qty
;

SELECT 
	WORKORDER_base_id,
	part_id, 
--	TRANSACTION_DATE,
	desired_qty,
	AVG(hourly_cost) as AvgofHourly_Cost,
	sum(hours_worked) as SumofHours_Worked
FROM 
	#traci1
GROUP BY
	WORKORDER_base_id,
	part_id,
	desired_qty
ORDER BY
	WORKORDER_base_id,
	part_id,
	desired_qty 
;

SELECT 
	part_id, 
	desired_qty, 
	avg(hourly_cost) as AvgofHourly_Cost,
	sum(hours_worked) as SumofHours_Worked
FROM 
	#traci1
GROUP BY
	part_id, 
	desired_qty
ORDER BY
	part_id, 
	desired_qty 
;

