use DataWarehouse
go

select wo.part_id
	, o.WORKORDER_BASE_ID
	, o.WORKORDER_lot_ID
	, o.SEQUENCE_NO
	, o.RESOURCE_ID
	, o.operation_type
	, p.user_7
	, p.BUYER_USER_ID
from work_order wo
inner join operation o
	on wo.BASE_ID = o.workorder_BASE_ID
	and wo.lot_ID = o.workorder_lot_ID
	and wo.split_ID = o.workorder_split_ID
	and wo.sub_ID = o.workorder_sub_ID
	and wo.[type] = o.workorder_type
inner join part p
	on p.id = wo.part_id
where wo.[type] = @TYPE
and wo.part_id like @PARTID
and o.OPERATION_TYPE = @OPTYPE
 

