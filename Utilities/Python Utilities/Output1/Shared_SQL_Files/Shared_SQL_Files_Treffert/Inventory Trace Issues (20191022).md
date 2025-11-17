# Inventory Trace Issues (20191022)

```sql
use live
go

select pl.part_id
, pl.warehouse_id
, pl.location_id 
, pl.qty as loc_qty
, pl.[status]
, t.id
, t.in_qty - t.out_qty as trace_qty
from part_location pl
left outer join trace t
on pl.part_id = t.part_id
where pl.part_id in ('146T0045-14','146T0395-159','20243C-071 CMPN','255T4840-19','417N6021-5','6AL4V-080','70507P-0500 X 8.5 X 36.3','70507P-0750 X 4.00 X 10.25','BACN11G3D1CM','BACR10AK10C','BACS21DX1B','BACS53B1ES1','BACW10BX2CK','BACW10CT6CU','BACW10EG6CK','MS20426AD3-3-5D','SAM203-13')
and t.in_qty > t.out_qty
order by part_id

/*
select * from cust_order_line col
inner join customer_order co
on co.id = col.CUST_ORDER_ID
where part_id = 'SAM203-13' 
order by co.order_date
*/
```