use live
go

select 
	year(SHIPPED_DATE) as [Year],
	datename(mm, SHIPPED_DATE) as [Month],
	[location],
	sum(shipped_qty) as ShipQty
from
(select 
	co.customer_id,
	col.cust_order_id,
	col.line_no as COLine,
	s.[status],
	s.SHIPPED_DATE,
	s.PACKLIST_ID,
	sl.LINE_NO as ShipLine,
	sl.SHIPPED_QTY,
	wo.base_id,
	wo.lot_id,
	wo.sub_id,
--	[location],
	case
		when [location] is Null then 'Auburn South'
		else [location]
	end as [Location]
from 
	customer_order co
inner join
	cust_order_line col
	on col.cust_order_id = co.id
	and col.part_id is not null
left outer join 
	SHIPPER_LINE sl
	on col.cust_order_id = sl.cust_order_id 
	and col.line_no = sl.CUST_ORDER_LINE_NO
inner join 
	shipper s
	on s.PACKLIST_ID = sl.PACKLIST_ID
left outer join 
	DEMAND_supply_link dsl
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id 
	and dsl.DEMAND_SEQ_NO = col.line_no
left outer JOIN
	(select
		BASE_ID,
		LOT_ID,
		SPLIT_ID,
		SUB_ID,
		max(SEQUENCE_NO) as OpSeqNo
	from	  work_order wo
	INNER JOIN 
		OPERATION O
			ON wo.TYPE = O.WORKORDER_TYPE
			AND wo.BASE_ID = O.WORKORDER_BASE_ID
			AND wo.LOT_ID = O.WORKORDER_LOT_ID
			AND wo.SPLIT_ID = O.WORKORDER_SPLIT_ID
			AND wo.SUB_ID = O.WORKORDER_SUB_ID
	group by 	   
		wo.BASE_ID,
		wo.LOT_ID,
		wo.SPLIT_ID,
		wo.SUB_ID
	) as wo
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id 
left outer JOIN 
	OPERATION O
		ON O.WORKORDER_TYPE = 'W'
		AND wo.BASE_ID = O.WORKORDER_BASE_ID
		AND wo.LOT_ID = O.WORKORDER_LOT_ID
		AND wo.SPLIT_ID = O.WORKORDER_SPLIT_ID
		AND wo.SUB_ID = O.WORKORDER_SUB_ID
		AND wo.OpSeqNo = O.Sequence_No
left outer join 
	LIVESupplemental.dbo.ResourceID_Assignments ra
	on o.RESOURCE_ID = ra.RESOURCE_ID
--where 
--	s.shipped_date >= '1/1/2017'
)  Initial
group by
	year(SHIPPED_DATE),
	datename(mm, SHIPPED_DATE),
	[location]
