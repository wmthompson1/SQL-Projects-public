# Holly Report OpSeqNums

```sql
use datawarehouse
go

--drop table LIVESupplemental.dbo.Holly

select * from LIVESupplemental.dbo.Hollyn

select h.*
, RESOURCE_ID
, OPERATION_TYPE
from LIVESupplemental.dbo.Holly h
left outer join operation o
on h.base_id = o.workorder_base_id
and cast(h.lot_id as nvarchar) = o.workorder_lot_id
and cast(h.opseqno as nvarchar) = o.SEQUENCE_NO
order by h.base_id, h.opseqno

select * from work_order where BASE_ID = '1579827A'
```