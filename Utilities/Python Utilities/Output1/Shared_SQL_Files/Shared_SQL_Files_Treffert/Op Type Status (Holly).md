# Op Type Status (Holly)

```sql
use DataWarehouse
go

select wo.base_id
, wo.part_id
, wo.[status]
, o.RESOURCE_ID
, o.OPERATION_TYPE
, o.[STATUS]
from work_order wo
inner join operation o
on o.workorder_type = wo.[type]
and o.workorder_base_id = wo.base_id
and o.workorder_lot_id = wo.lot_id
and o.workorder_split_id = wo.split_id
and o.workorder_sub_id = wo.sub_id
where wo.base_id in ('1589274', '1589276', '1589461', '1591277', '1591278', '1591279', '1592906', '1593598', '1594275', '1595057', '1596727', '1598123', '1598184')
and o.OPERATION_TYPE = 'F17.48A'
```