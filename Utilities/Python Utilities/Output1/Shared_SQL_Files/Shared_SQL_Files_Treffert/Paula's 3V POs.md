# Paula's 3V POs

```sql
use live
go

select 
--po.ID, po.VENDOR_ID, po.ORDER_DATE, po.DESIRED_RECV_DATE, po.BUYER, po.SHIPTO_ID, pol.part_id, pol.user_order_qty, pol.order_qty
distinct po.VENDOR_ID, pol.part_id
from purchase_order po
inner join purc_order_line pol
on pol.purc_order_id = po.id
where vendor_id like'%LKPREC%'
and order_date >= '9/1/2012'


select * from vendor where name like 'locke%'
```