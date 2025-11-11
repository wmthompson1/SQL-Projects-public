# Inventory Issues (20191024 William)

```sql
use live
go 

select i.transaction_id
, i.transaction_date
, i.part_id
, i.qty
, i.[type]
, i.[class]
, case
	when Type = 'I' and Class = 'R' then 1
	when Type = 'O' and Class = 'I' then -1
	when Type = 'O' and Class = 'A' then -1
	when Type = 'I' and Class = 'A' then 1
	when Type = 'I' and Class = 'I' then 1
	when Type = 'O' and Class = 'R' then -1
	else 0
end * i.qty as inv_qty
, ti.qty as trace_qty
, ti.trace_id
from inventory_trans i
left outer join trace_inv_trans ti
on i.transaction_id = ti.transaction_id

where i.part_id = '140T2101-1079'
order by transaction_id

/*

select * from inventory_trans where transaction_id = '2414534'
select * from trace_inv_trans where transaction_id = '2414534'

select * from trace_inv_trans where part_id = '70507P-0500 X 8.5 X 36.3' and trace_id = '113945/1'
select * from trace_inv_trans where part_id = '70507P-0500 X 8.5 X 36.3'

select i.part_id
, i.transaction_id 
, i.warehouse_id
, i.location_id
, i.user_id
, t.qty
, i.qty
, t.trace_id
from inventory_trans i
full outer join trace_inv_trans t
on t.transaction_id = i.transaction_id
where t.part_id = '70507P-0500 X 8.5 X 36.3'
order by i.transaction_id

select * from inventory_trans i
left outer join trace_inv_trans t
on t.transaction_id = i.transaction_id
where i.part_id = '140T2101-1079'
and t.transaction_id is null

select * from trace where part_id = '70507P-0500 X 8.5 X 36.3'
select case
	when Type = 'I' and Class = 'R' then 1
	when Type = 'O' and Class = 'I' then -1
	when Type = 'O' and Class = 'A' then -1
	when Type = 'I' and Class = 'A' then 1
	when Type = 'I' and Class = 'I' then 1
	when Type = 'O' and Class = 'R' then -1
	else 0
end * qty as inv_qty
, *
from inventory_trans where part_id = '70507P-0500 X 8.5 X 36.3'
select * from trace_inv_trans where part_id = '70507P-0500 X 8.5 X 36.3'

update trace
set out_qty = 133,
in_qty = 190
where part_id = '6AL4V-080' 
and id = '88058/1'
*/
```