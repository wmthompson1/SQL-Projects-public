# Global Updates of Binary Field Check

```sql
use live
go

select *
from LIVESupplemental.dbo.ResourceID_Assignments
where resource_id like '%etch%'
	or resource_id like '%Pen%'


select operation_type, count(*)
from operation o
where  o.RESOURCE_ID in ('AUB-etch', 'AUB-pen', 'AUB-PENetch', 'BAL-etch', 'BAL-pen', 'BAL-PENetch')
	and o.workorder_type = 'M'
group by operation_type
order by operation_type


select ob.workorder_base_id, ob.workorder_lot_id, ob.workorder_split_id, ob.workorder_sub_id, 
	CAST(CAST(BITS as varbinary(max)) as varchar(max)) as specs
from OPERATION_BINARY ob
where exists 
	(select 1
		from work_order wo
	where 
	wo.[type] = ob.workorder_type
	and wo.base_id = ob.workorder_base_id
	and wo.lot_id = ob.workorder_lot_id
	and wo.split_id = ob.workorder_split_id
	and wo.sub_id = ob.workorder_sub_id
	and wo.[type] = 'M'
	)
and exists	
	(select 1
	from operation o
	where  
	ob.workorder_type = o.workorder_type
	and ob.workorder_base_id = o.workorder_base_id
	and ob.workorder_lot_id = o.workorder_lot_id
	and ob.workorder_split_id = o.workorder_split_id
	and ob.workorder_sub_id = o.workorder_sub_id
	and o.SEQUENCE_NO = ob.SEQUENCE_NO
	and o.OPERATION_TYPE in ('30907A', '30907B')
	and o.RESOURCE_ID in ('AUB-etch', 'AUB-pen', 'AUB-PENetch', 'BAL-etch', 'BAL-pen', 'BAL-PENetch')
	)
	--and	CAST(CAST(ob.BITS as varbinary(max)) as varchar(max)) like '%Pre-penetrant clean%'


```