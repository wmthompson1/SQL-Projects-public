# DSL WO

```sql
use DataWarehouse
go

select wo.base_id
, wo.lot_id
, wo.split_id
, wo.sub_id
, wo.status
, DSL.SUPPLY_BASE_ID

from work_order wo
inner join DEMAND_supply_link dsl
on dsl.demand_BASE_ID = wo.base_id
and dsl.demand_LOT_ID = wo.lot_id
and dsl.demand_SPLIT_ID = wo.split_id
and dsl.demand_SUB_ID = wo.sub_id 
inner join purchase_order po
on dsl.SUPPLY_TYPE = 'CO' 
and dsl.SUPPLY_BASE_ID = po.id
where WO.BASE_ID = '1499536'
```