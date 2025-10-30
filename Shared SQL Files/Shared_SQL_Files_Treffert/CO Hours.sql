use DataWarehouse
go

select co.CUSTOMER_ID
, CO.ID
, COL.LINE_NO
, P.PLANNER_USER_ID
, P.BUYER_USER_ID
, COL.PART_ID
, WO.BASE_ID
, WO.LOT_ID
, WO.SPLIT_ID
, WO.SUB_ID
, LT.OPERATION_SEQ_NO
, LT.HOURS_WORKED
from cust_order_line col
inner join customer_order co
	on co.id = col.CUST_ORDER_ID
inner join part p
	on p.id = COL.part_id
inner join DEMAND_supply_link dsl
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id  
	and dsl.DEMAND_SEQ_NO = col.LINE_NO
inner join work_order wo
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id 
inner join labor_ticket lt
	on lt.WORKORDER_TYPE = 'W' 
	and lt.WORKORDER_BASE_ID = wo.base_id
	and lt.WORKORDER_LOT_ID = wo.lot_id
	and lt.WORKORDER_SPLIT_ID = wo.split_id
	and lt.WORKORDER_SUB_ID = wo.sub_id 
where CO.ORDER_DATE >= '12/1/2018'


