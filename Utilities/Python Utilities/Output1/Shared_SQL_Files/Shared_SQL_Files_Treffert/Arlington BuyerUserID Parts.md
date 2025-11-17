# Arlington BuyerUserID Parts

```sql
use live
go

select distinct co.customer_id, p.id, buyer_user_id
from part p
inner join work_order wo
on p.id = wo.part_id
inner join DEMAND_supply_link dsl
on dsl.SUPPLY_TYPE = 'WO' 
and dsl.SUPPLY_BASE_ID = wo.base_id
and dsl.SUPPLY_LOT_ID = wo.lot_id
and dsl.SUPPLY_SPLIT_ID = wo.split_id
and dsl.SUPPLY_SUB_ID = wo.sub_id 
inner join customer_order co
on dsl.DEMAND_TYPE = 'CO'
and dsl.DEMAND_BASE_ID = co.id  
where p.buyer_user_id like '%arl%'
order by co.customer_id, p.id




```