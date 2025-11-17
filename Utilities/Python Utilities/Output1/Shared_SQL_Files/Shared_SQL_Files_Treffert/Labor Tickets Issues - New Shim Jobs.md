# Labor Tickets Issues - New Shim Jobs

```sql
use live
go

select CO.CUSTOMER_ID
	, CO.ID
	, LT.WORKORDER_BASE_ID
	, LT.WORKORDER_LOT_ID
	, LT.WORKORDER_SPLIT_ID
	, LT.WORKORDER_SUB_ID
	, WO.PART_ID
	, LT.OPERATION_SEQ_NO
	, LT.TRANSACTION_ID
	, LT.TYPE
	, LT.SETUP_COMPLETED
	, LT.EMPLOYEE_ID
	, LT.DEPARTMENT_ID
	, LT.RESOURCE_ID
	, LT.HOURLY_COST
	, LT.CLOCK_IN
	, LT.CLOCK_OUT
	, LT.HOURS_WORKED
	, LT.TRANSACTION_DATE
	, LT.USER_ID
	, LT.ACT_CLOCK_IN
	, LT.ACT_CLOCK_OUT
	, LT.UNADJ_CLOCK_IN
	, LT.UNADJ_CLOCK_OUT
from labor_ticket lt
inner join work_order wo
	on lt.WORKORDER_BASE_ID = wo.BASE_ID
	and lt.WORKORDER_LOT_ID = wo.LOT_ID
	and lt.WORKORDER_split_ID = wo.split_ID
	and lt.WORKORDER_sub_ID = wo.sub_ID
	and lt.WORKORDER_type = wo.[type]
LEFT OUTER join DEMAND_supply_link dsl
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id 
LEFT OUTER join customer_order co
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id  
where hours_worked < 0.02
	and clock_in >= '2/22/2018'
	and workorder_base_id is not null
```