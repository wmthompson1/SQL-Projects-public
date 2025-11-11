# WO Freeze

```sql
use live
go

--drop table #t1

select part_id, base_id, lot_id, SUB_ID, SPLIT_ID, [type]
into #t1
from work_order
where part_id in ('113T1110-17', '113T1110-18', '113T1110-21', '113T1110-22', '113T1110-501', '113T1110-502', '113T1110-503', '113T1110-504', '113T1141-21', '113T1141-22', '113T1141-25', '113T1141-26', '113T1141-501', '113T1141-502')
and type = 'M'

select *
from work_order
where part_id in ('113T1110-17', '113T1110-18', '113T1110-21', '113T1110-22', '113T1110-501', '113T1110-502', '113T1110-503', '113T1110-504', '113T1141-21', '113T1141-22', '113T1141-25', '113T1141-26', '113T1141-501', '113T1141-502')
and type = 'M'


select wb.*
from WORKORDER_BINARY wb
inner join #t1 t
on  t.[type] = wb.WORKORDER_type
and t.base_id = wb.WORKORDER_BASE_ID
and t.lot_id = wb.WORKORDER_lot_ID
and t.split_id = wb.WORKORDER_split_ID
and t.sub_id = wb.WORKORDER_sub_ID

select o.*
from operation o
inner join #t1 t
on  t.[type] = o.WORKORDER_type
and t.base_id = o.WORKORDER_BASE_ID
and t.lot_id = o.WORKORDER_lot_ID
and t.split_id = o.WORKORDER_split_ID
and t.sub_id = o.WORKORDER_sub_ID

select o.*
from OPERATION_BINARY o
inner join #t1 t
on  t.[type] = o.WORKORDER_type
and t.base_id = o.WORKORDER_BASE_ID
and t.lot_id = o.WORKORDER_lot_ID
and t.split_id = o.WORKORDER_split_ID
and t.sub_id = o.WORKORDER_sub_ID

select distinct ot.*
from OPERATION_TYPE ot
inner join operation o
on o.OPERATION_TYPE = ot.id
inner join #t1 t
on  t.[type] = o.WORKORDER_type
and t.base_id = o.WORKORDER_BASE_ID
and t.lot_id = o.WORKORDER_lot_ID
and t.split_id = o.WORKORDER_split_ID
and t.sub_id = o.WORKORDER_sub_ID

select ob.*
from OPER_TYPE_BINARY ob
inner join 
	(select distinct id
	from OPERATION_TYPE ot
	inner join operation o
	on o.OPERATION_TYPE = ot.id
	inner join #t1 t
	on  t.[type] = o.WORKORDER_type
	and t.base_id = o.WORKORDER_BASE_ID
	and t.lot_id = o.WORKORDER_lot_ID
	and t.split_id = o.WORKORDER_split_ID
	and t.sub_id = o.WORKORDER_sub_ID
	) a
	on a.id = ob.OPERATION_TYPE_ID


----select r.*
----from requirement r
----inner join #t1 t
----on  t.[type] = r.WORKORDER_type
----and t.base_id = r.WORKORDER_BASE_ID
----and t.lot_id = r.WORKORDER_lot_ID
----and t.split_id = r.WORKORDER_split_ID
----and t.sub_id = r.WORKORDER_sub_ID

----select r.*
----from REQUIREMENT_BINARY r
----inner join #t1 t
----on  t.[type] = r.WORKORDER_type
----and t.base_id = r.WORKORDER_BASE_ID
----and t.lot_id = r.WORKORDER_lot_ID
----and t.split_id = r.WORKORDER_split_ID
----and t.sub_id = r.WORKORDER_sub_ID

select distinct p.*
from part p
inner join #t1 t
on  t.part_id = p.id

select distinct p.*
from part_site p
inner join #t1 t
on  t.part_id = p.part_id

----select p.*
----from part_binary p
----inner join #t1 t
----on  t.part_id = p.part_id



```