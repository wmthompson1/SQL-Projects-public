# CMP Parts (Char)

```sql
use datamart
go

select p.PART_ID
, PLANNER_USER_ID
, BUYER_USER_ID
, p.user_7
, wo.base_id
, wo.lot_id
from CUST_ORDER_LINE col
inner join CUSTOMER_ORDER co
on col.CUST_ORDER_ID = co.id
left outer join part_site_view p
on col.part_id = p.part_id
LEFT OUTER join DEMAND_supply_link dsl
on dsl.DEMAND_TYPE = 'CO' 
and dsl.DEMAND_BASE_ID = CO.ID
LEFT OUTER join work_order wo
on p.PART_id = wo.part_id
and wo.base_id = p.part_id
and wo.[type] = 'M'
where co.order_DATE >= '8/1/2018'
and co.CUSTOMER_ID in ('boe609', 'boe605')
AND CO.[STATUS] = 'C'
and col.part_id is not null
group by p.PART_ID
, PLANNER_USER_ID
, BUYER_USER_ID
, p.user_7
, wo.base_id
, wo.lot_id
order by p.PART_ID

```