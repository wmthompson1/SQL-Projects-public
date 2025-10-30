use live
go

select base_id, lot_id, split_id, sub_id, 
from work_order wo
inner join labor_ticket lt
on  lt.workorder_base_id = wo.base_id
and lt.workorder_lot_id = wo.lot_id
and lt.workorder_split_id = wo.split_id
and lt.workorder_sub_id = wo.sub_id
and wo.[type] = 'W'
where part_id like '%rework%'

union

select *
from work_order wo
inner join labor_ticket lt
on  lt.workorder_base_id = wo.base_id
and lt.workorder_lot_id = wo.lot_id
and lt.workorder_split_id = wo.split_id
and lt.workorder_sub_id = wo.sub_id
and wo.[type] = 'W'
where base_id like '%R%'
