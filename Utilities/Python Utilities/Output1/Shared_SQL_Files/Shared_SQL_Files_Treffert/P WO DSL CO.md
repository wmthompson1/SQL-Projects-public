# P WO DSL CO

```sql
use live
go

select co.id, co.status, wo.base_id, wo.status, p.id
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
where p.id like '%airbus%'
order by co.id




```