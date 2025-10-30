use live
go

select p.id, p.DESCRIPTION, p.user_7, wo.type, base_id, lot_id, planner_user_id, SEQUENCE_NO, o.resource_id, operation_type, ot.description
from part p
inner join work_order wo
	on p.id = wo.part_id
inner join operation o
	on wo.[type] = o.[workorder_type]
	and wo.[base_id] = o.[workorder_base_id]
	and wo.[lot_id] = o.[workorder_lot_id]
	and wo.[split_id] = o.[workorder_split_id]
	and wo.[sub_id] = o.[workorder_sub_id]
inner join operation_type ot
	on o.OPERATION_TYPE = ot.id
where 
	(right(left(p.id,4),1) in ('W', 'Z'))
	and wo.type = 'M'
	and (ot.DESCRIPTION like 'bms%10-20%' or ot.description like 'bac%5793%')
	and planner_user_id in ('NEW', 'PLAN', 'MRP', '609M', '609MOE')
order by p.id

