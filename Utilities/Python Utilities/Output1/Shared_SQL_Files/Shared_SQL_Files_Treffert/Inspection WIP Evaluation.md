# Inspection WIP Evaluation

```sql
Use 				
Live 				
Go				
				
				
Select				
	wo.PART_ID			
	,wo.BASE_ID			
	,wo.LOT_ID			
	,wo.SPLIT_ID			
	,wo.SUB_ID			
	,wo.DESIRED_QTY			
	,wo.RECEIVED_QTY			
	,wo.CREATE_DATE			
	,lt.OPERATION_SEQ_NO			
	,lt.RESOURCE_ID			
	,lt.TRANSACTION_DATE			
	,co.CUSTOMER_ID			
	,lt.ACT_CLOCK_IN			
	,lt.HOURS_WORKED			
	,e.FIRST_NAME			
	,e.LAST_NAME			
				
				
				
from work_order wo				
inner join DEMAND_supply_link dsl				
                on dsl.SUPPLY_TYPE = 'WO' 				
                and dsl.SUPPLY_BASE_ID = wo.base_id				
                and dsl.SUPPLY_LOT_ID = wo.lot_id				
                and dsl.SUPPLY_SPLIT_ID = wo.split_id				
                and dsl.SUPPLY_SUB_ID = wo.sub_id 				
inner join customer_order co				
                on dsl.DEMAND_TYPE = 'CO'				
                and dsl.DEMAND_BASE_ID = co.id  				
Inner Join LABOR_TICKET as lt				
				on wo.BASE_ID = lt.WORKORDER_BASE_ID
				and wo.LOT_ID = lt.WORKORDER_LOT_ID
				and wo.SPLIT_ID = lt.WORKORDER_SPLIT_ID
				and wo.SUB_ID = lt.WORKORDER_SUB_ID 
left outer Join [dbo].[SHOP_RESOURCE] as sr                          				
                           on lt.RESOURCE_ID = sr.ID				
Inner Join [dbo].[EMPLOYEE]	as e			
				on lt.EMPLOYEE_ID = e.ID
				
				
Where				
	lt.ACT_CLOCK_IN > '8/1/2017'			

```