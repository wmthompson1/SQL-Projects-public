use live
go

WITH CTE_PART
AS 
(SELECT DOCUMENT_ID 
FROM user_def_fields udf
WHERE STRING_VAL = 'TITANIUM'
)

SELECT
	cpe.CUSTOMER_ID 
	, cpe.customer_part_id
	, wo.[status]
	, dbo.sfnWONUMFormat(wo.base_id, wo.lot_id,  wo.split_id,  wo.sub_id) as JOB
	, p.buyer_user_id as Buyer_Code
	, wo.Part_ID
	, wo.desired_qty as Qty
	, wo.create_date Start_Date
	, [dbo].[sfn_current_operation](o.workorder_type, o.workorder_base_id, o.workorder_lot_id,  o.workorder_split_id,  o.workorder_sub_id) as Curr_Op
	, CASE 
		WHEN o.resource_id ='REVIEW' then o.operation_type
		when o.RESOURCE_ID = 'ANM-Review' then o.operation_type
		when o.RESOURCE_ID = 'AUB-Review' then o.operation_type
		when o.RESOURCE_ID = 'BAL-Review' then o.operation_type
		when o.resource_id = 'STORES' THEN o.OPERATION_TYPE
		when o.resource_id = 'ANM-STORES' THEN o.OPERATION_TYPE
		when o.RESOURCE_ID = 'contractor' then isnull(o.service_id, 'no contractor') + ' (contractor)' 
		WHEN wo.STATUS IN ('F','U') THEN 'No Operations'
		ELSE o.resource_id
	END  as Curr_Resource
	, isnull(e.FIRST_NAME,'') +' ' + isnull(e.last_name,'')  as Operator
	, wo.desired_want_date as WO_Due_Date
	, lt.TRANSACTION_DATE as Last_Clock_Date
	, DATEDIFF(day,Getdate(),isnull(lt.transaction_date, wo.create_date)) as wait
	, Case 
		when wo.BASE_ID is null  then 'Not Received'
		when wo.status in ('F', 'U')  then 'Not released'
		when wo.status = 'C'  then 'Shipped'
		when wo.status = 'X'  then 'Cancelled'
		when wo.status = 'R'  then isnull([dbo].[sfn_remaining_operations](o.workorder_type, o.workorder_base_id, o.workorder_lot_id,  o.workorder_split_id,  o.workorder_sub_id),'At packaging')  
	END as Remaining_Ops
FROM work_order wo
inner join part p
	on p.id = wo.part_id
inner join CTE_PART CTE
	on CTE.document_id = p.id
inner join CUST_PRICE_EFFECT cpe
	on wo.part_id = cpe.PART_ID
--	and cpe.CUSTOMER_ID = 'BOEPOP'
LEFT OUTER JOIN DEMAND_SUPPLY_LINK DSL             
	ON Wo.BASE_ID = DSL.SUPPLY_BASE_ID 
	AND Wo.LOT_ID = DSL.SUPPLY_LOT_ID 
	AND Wo.SPLIT_ID = DSL.SUPPLY_SPLIT_ID 
	AND Wo.SUB_ID = DSL.SUPPLY_SUB_ID 
	AND Wo.TYPE = 'W'
	AND DSL.DEMAND_TYPE = 'CO' 
	AND DSL.SUPPLY_TYPE = 'WO'
	AND DSL.DEMAND_SEQ_NO = 1 
LEFT OUTER JOIN CUST_ORDER_LINE COL
	on  DSL.DEMAND_BASE_ID =  col.CUST_ORDER_ID 
	AND DSL.DEMAND_SEQ_NO = COL.LINE_NO 
left outer join customer_order co
	on col.CUST_ORDER_ID = co.id
--	and co.CUSTOMER_ID = 'BOEPOP'
left outer join operation o 
	on O.WORKORDER_TYPE = wo.TYPE 
	AND O.WORKORDER_BASE_ID = wo.BASE_ID 
	AND O.WORKORDER_LOT_ID = wo.LOT_ID 
	AND O.WORKORDER_SPLIT_ID = wo.SPLIT_ID 
	AND O.WORKORDER_SUB_ID = wo.SUB_ID 
	and o.SEQUENCE_NO =  [dbo].[sfn_current_operation](o.workorder_type, o.workorder_base_id, o.workorder_lot_id,  o.workorder_split_id,  o.workorder_sub_id)
left outer join
	(SELECT * 
	FROM LABOR_TICKET l
	WHERE EXISTS (SELECT 
			WORKORDER_TYPE
			, WORKORDER_BASE_ID
			, WORKORDER_LOT_ID
			, WORKORDER_SPLIT_ID
			, WORKORDER_SUB_ID
			, OPERATION_SEQ_NO
			, MAX(TRANSACTION_DATE) MAX_TRANDATE
		FROM LABOR_TICKET
		WHERE TRANSACTION_DATE > GETDATE() - 365
		GROUP BY 
		WORKORDER_TYPE
			, WORKORDER_BASE_ID
			, WORKORDER_LOT_ID
			, WORKORDER_SPLIT_ID
			, WORKORDER_SUB_ID
			, OPERATION_SEQ_NO
		HAVING 
			WORKORDER_TYPE = l.WORKORDER_TYPE
			AND WORKORDER_BASE_ID = l.WORKORDER_BASE_ID
			AND WORKORDER_LOT_ID = l.WORKORDER_LOT_ID
			AND WORKORDER_SUB_ID = l.WORKORDER_SUB_ID
			AND WORKORDER_SPLIT_ID = l.WORKORDER_SPLIT_ID
			AND MAX(TRANSACTION_DATE) = l.TRANSACTION_DATE
			AND MAX(CLOCK_IN) = l.CLOCK_IN
		)
	AND TRANSACTION_DATE > GETDATE() - 365
	) lt 
	on lt.WORKORDER_TYPE = wo.TYPE 
	AND lt.WORKORDER_BASE_ID = wo.BASE_ID 
	AND lt.WORKORDER_LOT_ID = wo.LOT_ID 
	AND lt.WORKORDER_SPLIT_ID = wo.SPLIT_ID 
	AND lt.WORKORDER_SUB_ID = wo.SUB_ID 
	and lt.OPERATION_SEQ_NO =  [dbo].[ufn_GetLastOpLaborTicketFromWO](wo.type, wo.base_id, wo.lot_id,  wo.split_id,  wo.sub_id)
left outer join employee e
on lt.EMPLOYEE_ID = e.id
WHERE 
	Wo.TYPE = 'W'
	AND wo.status NOT IN ('C', 'X')
