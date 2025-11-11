# Engineer Report

```sql
use live
go

select 
	o.workorder_base_id,
	o.workorder_lot_id,
	o.workorder_sub_id,
	o.SEQUENCE_NO,
	o.RESOURCE_ID,
	o.status,
	o.STATUS_EFF_DATE,
	o.*
from 
	OPERATION o
where
	[WORKORDER_BASE_ID] = '1359334'
--	[WORKORDER_BASE_ID] = '1357435'
--	[WORKORDER_BASE_ID] = '1328192'
--	[WORKORDER_BASE_ID] = '1346457'
--	[WORKORDER_BASE_ID] = '1335933'
order by 
	o.STATUS_EFF_DATE


select 
	o.workorder_base_id + '-' +	o.workorder_sub_id + '/' +o.workorder_lot_id as [WorkOrder - Sub / Lot],
	wo.part_id,
	o.SEQUENCE_NO,
	o.RESOURCE_ID,
	o.status,
	convert(varchar(11), o.STATUS_EFF_DATE, 121) as StatusDate,
	convert(varchar(11), o.close_date, 121) as CloseDate
from 
	[dbo].[OPERATION] o
inner join 
	(
	select 
		workorder_base_id, 
		workorder_lot_id,
		max(STATUS_EFF_DATE) as LastOpDate
	from 
		OPERATION
	where
		[status] = 'C'
--		STATUS_EFF_DATE > getdate() - 7

--		and [WORKORDER_BASE_ID] = '1348328'
		and [WORKORDER_BASE_ID] = '1359334'
	group by
		workorder_base_id, 
		workorder_lot_id
	) o2
		on o.workorder_base_id = o2.workorder_base_id 
		and o.workorder_lot_id = o2.workorder_lot_id
		and o.STATUS_EFF_DATE = o2.LastOpDate
inner join 
	work_order wo
		on wo.[TYPE] = o.[WORKORDER_TYPE]
		and wo.[BASE_ID] = o.[WORKORDER_BASE_ID]
		and wo.[LOT_ID] = o.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = o.[WORKORDER_SPLIT_ID]
		and wo.[SUB_ID] = o.[WORKORDER_SUB_ID]
		and wo.[TYPE] = 'W'
		and wo.[status] = 'R'
--where 
--	o.STATUS_EFF_DATE > getdate() - 7
--	and wo.BASE_ID = '1295553'
order by 
	o.workorder_base_id, 
	o.workorder_lot_id
```