use datawarehouse
go

select * 
from LABOR_TICKET lt
where right(resource_ID, 6) <> 'review'
and exists 
	(select 1
	from work_order wo
	where lt.WORKORDER_BASE_ID = wo.BASE_ID
	and lt.WORKORDER_LOT_ID = wo.LOT_ID
	and lt.WORKORDER_SPLIT_ID = wo.SPLIT_ID
	and lt.WORKORDER_SUB_ID = wo.SUB_ID
	and lt.WORKORDER_type = wo.[TYPE]
	and wo.[status] = 'F'
	)
