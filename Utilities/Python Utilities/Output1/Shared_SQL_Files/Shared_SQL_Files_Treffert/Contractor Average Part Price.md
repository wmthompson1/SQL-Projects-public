# Contractor Average Part Price

```sql
use live
go

select --*
    vendor_ID,
    part_id, 
    avg(unit_price) as AvgPerPart
from purc_order_line pol
inner join purchase_order po
on pol.PURC_ORDER_ID = po.id
where (po.vendor_id = 'QUAMAC' or po.vendor_id = 'LKPREC')
    and order_date >= '1/1/2016'
    and part_id is not null
group by 
    vendor_ID,
    part_id 
order by 
    vendor_ID,
    part_id



```