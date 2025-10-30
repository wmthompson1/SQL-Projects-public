use datamart
go

select wo.base_id
, wo.lot_id
, wo.split_id
, wo.sub_id
, wo.[status]
, p.part_id
, wo.DESIRED_QTY
, co.id as Customer_Order
, co.[status]
, o.sequence_no
, o.resource_id
, lt.hours_worked
, lt.employee_id
from work_order wo
left outer join part_site_view p
	on p.part_id = wo.part_id
left outer join operation o
	on wo.base_id = o.workorder_base_id
	and wo.lot_id = o.workorder_lot_id
	and wo.split_id = o.workorder_split_id
	and wo.sub_id = o.workorder_sub_id
	and wo.[type] = o.workorder_type
left outer join labor_ticket lt
	on wo.base_id = lt.workorder_base_id
	and wo.lot_id = lt.workorder_lot_id
	and wo.split_id = lt.workorder_split_id
	and wo.sub_id = lt.workorder_sub_id
	and wo.[type] = lt.workorder_type
	and o.sequence_no = lt.OPERATION_SEQ_NO
left outer join DEMAND_supply_link dsl
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id 
left outer join customer_order co
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id  
left outer join cust_order_line col
	on co.id = col.cust_order_id


where wo.CREATE_DATE >= '10/1/2018'
and (p.part_id like '453A1610%' or p.part_id like '453A2610%')


--lect * from part where id = '453A1610-106'