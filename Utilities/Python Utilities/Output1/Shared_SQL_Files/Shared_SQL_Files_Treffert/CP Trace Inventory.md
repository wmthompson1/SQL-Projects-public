# CP Trace Inventory

```sql
use live
go

select p.id, p.[description], p.qty_on_hand, t.id, in_qty, out_qty, in_qty - out_qty as QtyAvail, comments
--, t.*
from part p 
--inner join TRACE_INV_TRANS t
inner join TRACE t
on p.id = t.part_id
where planner_user_id like '%CP'
and in_qty - out_qty <> 0
order by p.id, t.CREATE_DATE
```