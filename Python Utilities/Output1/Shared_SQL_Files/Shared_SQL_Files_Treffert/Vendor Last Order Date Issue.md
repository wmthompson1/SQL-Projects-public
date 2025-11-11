# Vendor Last Order Date Issue

```sql
use DataWarehouse
go

select v.id, v.name, v.last_order_date,
(select max(order_date) from purchase_order p1
where v.id = p1.vendor_id)as max_order_date
from vendor v
where v.id in
(select vendor_id from purchase_order)
and v.last_order_date != (select max(order_date) from purchase_order p1
where v.id = p1.vendor_id)
order by v.id
```