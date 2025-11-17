# Work Order Counts

```sql
use live
go

select o.workorder_base_id, o.workorder_lot_id, o.workorder_split_id, o.workorder_sub_id, skills_type, max(SEQUENCE_NO) as SeqNo
from operation o
inner join labor_ticket lt
on o.workorder_base_id = lt.workorder_base_id
and o.workorder_lot_id = lt.workorder_lot_id 
and o.workorder_split_id = lt.workorder_split_id 
and o.workorder_sub_id = lt.workorder_sub_id 
and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
inner join shop_resource sr
on o.resource_id = sr.id
where lt.transaction_date >= '4/3/2017'
and lt.transaction_date < '4/4/2017'
group by o.workorder_base_id, o.workorder_lot_id, o.workorder_split_id, o.workorder_sub_id, skills_type
order by o.workorder_base_id, o.workorder_lot_id, o.workorder_split_id, o.workorder_sub_id, skills_type
```