# GAMPS Operation Type WOs (Holly)

```sql
use DataWarehouse
go

select wo.base_id
, wo.lot_id
, wo.SPLIT_ID
, wo.SUB_ID
, wo.[status] as WOStatus
, o.SEQUENCE_NO
, o.RESOURCE_ID
, o.OPERATION_TYPE
, o.[status] as OpStatus

, max(lt.transaction_date) as transaction_date
from operation o
--inner join labor_ticket lt
left outer join labor_ticket lt
on lt.workorder_base_id = o.workorder_base_id
and lt.workorder_lot_id = o.workorder_lot_id
and lt.workorder_split_id = o.workorder_split_id
and lt.workorder_sub_id = o.workorder_sub_id
and lt.workorder_type = o.workorder_type
--and lt.OPERATION_SEQ_NO = o.SEQUENCE_NO
inner join WORK_ORDER wo
on wo.base_id = o.workorder_base_id
and wo.lot_id = o.workorder_lot_id
and wo.split_id = o.workorder_split_id
and wo.sub_id = o.workorder_sub_id
and wo.[type] = o.workorder_type

where OPERATION_TYPE in ('GAMPS6201', 'GAMPS6201T')
and lt.TRANSACTION_DATE >= '1/1/2019'
--and wo.[STATUS] = 'C'
group by wo.base_id
, wo.lot_id
, wo.SPLIT_ID
, wo.SUB_ID
, wo.[status]
, o.SEQUENCE_NO
, o.RESOURCE_ID
, o.OPERATION_TYPE
, o.[status] 

order by TRANSACTION_DATE

-- only one work order since 8/5/2019 completed (1585056/1)
```