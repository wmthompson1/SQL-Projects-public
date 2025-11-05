use live
go

select OT.* 
from operation_type ot
inner join operation o
on ot.RESOURCE_ID = o.RESOURCE_ID
inner join OPERATION_BINARY ob
on ob.WORKORDER_BASE_ID = o.WORKORDER_BASE_ID
and ob.WORKORDER_lot_ID = o.WORKORDER_lot_ID
and ob.WORKORDER_split_ID = o.WORKORDER_split_ID
and ob.WORKORDER_sub_ID = o.WORKORDER_sub_ID
and ob.WORKORDER_type = o.WORKORDER_type
where ot.id like '02GN089'

select * from SKILL_OP_TYPE_BINARY 
where specs like '%PROCESS IAW SKF_520%' and operation_type_id like '02GN089'