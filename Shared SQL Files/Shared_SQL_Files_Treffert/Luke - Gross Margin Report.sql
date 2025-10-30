Use DataWarehouse
go

declare @startdate datetime = '1/1/2019';

with cte_uniq_COs as
(select distinct it.cust_order_id
, it.cust_order_line_no
, ti.trace_id
, ti.part_id
from INVENTORY_TRANS it
left outer join demand_supply_link dsl
on dsl.DEMAND_TYPE = 'CO'
and dsl.DEMAND_BASE_ID = it.cust_order_id  
and dsl.DEMAND_SEQ_NO = it.cust_order_line_no
left outer join cust_order_line col
on it.cust_order_id = col.cust_order_id
and it.cust_order_line_no = col.line_no
left outer join trace_inv_trans ti
on it.transaction_id = ti.transaction_id
where it.cust_order_id is not null 
and it.transaction_date >= '1/1/2019'
and dsl.demand_type is null
and ti.TRACE_ID is not null
)
select * from cte_uniq_COs 

,

--cte_linked as
---- linked orders
--(Select 'linked' as [type]
--, Rl.PACKLIST_ID
--,col.CUST_ORDER_ID
--,col.LINE_NO
--,co.CUSTOMER_ID
--, col.LINE_STATUS as Ship_Short
--, col.ORDER_QTY as COL_Order_Qty
--, col.TOTAL_SHIPPED_QTY
----Shipped Qty
--, rl.qty as Rec_Qty
--, wo.DESIRED_QTY
--, col.UNIT_PRICE
----Ship Revenue
--, rl.amount as Rec_Amount
----Sales Amount
--, col.TOTAL_AMT_ordered
--, col.TOTAL_AMT_SHIPPED
--, col.PART_ID
----Cust_Part_ID
--, col.MISC_REFERENCE
----,T.TRACE_ID
--, wo.BASE_ID
--, wo.lot_ID
--, wo.split_ID
--, wo.SUB_ID
--,wo.ACT_BURDEN_COST
--,wo.ACT_LABOR_COST
--,wo.ACT_MATERIAL_COST
--,wo.ACT_SERVICE_COST
--,Wo.act_Burden_Cost + wo.act_Material_Cost + WO.Act_Labor_Cost + wo.act_Service_Cost as 'WO Total Cost'
----,lt.TRANSACTION_ID as LT_Transaction_ID
--,lt.OPERATION_SEQ_NO
----,lt.GOOD_QTY
----,lt.BAD_QTY
--,lt.RESOURCE_ID
----,lt.[DESCRIPTION]
--, o.ACT_ATL_LAB_COST
--, o.ACT_ATL_BUR_COST
--, o.ACT_ATL_SER_COST
--, o.ACT_ATL_LAB_COST + o.ACT_ATL_BUR_COST + o.ACT_ATL_SER_COST as Total_Ops_Costs
--, sum(lt.HOURS_WORKED) as Total_Hrs_Worked

--From LABOR_TICKET LT
--left Outer Join WORK_ORDER wo
--              on wo.BASE_ID = lt.WORKORDER_BASE_ID
--              and wo.LOT_ID = lt.WORKORDER_LOT_ID
--              and wo.SPLIT_ID = lt.WORKORDER_SPLIT_ID
--              and wo.SUB_ID = lt.WORKORDER_SUB_ID
--			  and wo.CREATE_DATE >= @startdate
--left Outer Join operation o
--            on wo.BASE_ID = o.WORKORDER_BASE_ID
--            and wo.LOT_ID = o.WORKORDER_LOT_ID
--            and wo.SPLIT_ID = o.WORKORDER_SPLIT_ID
--            and wo.SUB_ID = o.WORKORDER_SUB_ID
--			and lt.OPERATION_SEQ_NO = o.SEQUENCE_NO
--	left outer join DEMAND_supply_link dsl
--		on dsl.SUPPLY_TYPE = 'WO' 
--		and dsl.SUPPLY_BASE_ID = wo.base_id
--		and dsl.SUPPLY_LOT_ID = wo.lot_id
--		and dsl.SUPPLY_SPLIT_ID = wo.split_id
--		and dsl.SUPPLY_SUB_ID = wo.sub_id 
--     --  Left Outer Join TRACE_INV_TRANS  T
--     --         on (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID   
--					--AND WO.SPLIT_ID = '0')
--			  -- or (t.trace_id = wo.BASE_ID + '-' + wo.sub_id + '/' + wo.LOT_ID      
--					--AND WO.SPLIT_ID = '0')
--			  -- or (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '/' + wo.sub_id      
--					--AND WO.SPLIT_ID = '0')
--			  -- or (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '.' + wo.split_id    
--					--AND WO.SUB_ID = '0')
--     --  Left outer join INVENTORY_TRANS IT
--     --         on it.TRANSACTION_ID = t.TRANSACTION_ID
--       Left Outer Join CUST_ORDER_LINE col
--              --on col.CUST_ORDER_ID = it.CUST_ORDER_ID
--              --and col.LINE_NO = it.CUST_ORDER_LINE_NO
--			on dsl.DEMAND_TYPE = 'CO'
--			and dsl.DEMAND_BASE_ID = col.cust_order_id  
--			and dsl.DEMAND_SEQ_NO = col.line_no
--       left outer join customer_order co
--              on col.CUST_ORDER_ID = co.id
--       Left Outer Join RECEIVABLE_LINE RL
--              on rl.CUST_ORDER_ID = col.CUST_ORDER_ID
--              and rl.CUST_ORDER_LINE_NO = col.LINE_NO
--       left outer join RECEIVABLE R
--              on rl.invoice_id = r.invoice_id
--where rl.packlist_id is not null
----Where col.LAST_SHIPPED_DATE > @startdate
----and lt.TRANSACTION_DATE >= @startdate
--group by 'linked'
--, Rl.PACKLIST_ID
--,col.CUST_ORDER_ID
--,col.LINE_NO
--,co.CUSTOMER_ID
--, col.LINE_STATUS 
--, col.ORDER_QTY 
--, col.TOTAL_SHIPPED_QTY
----Shipped Qty
--, rl.qty 
--, wo.DESIRED_QTY
--, col.UNIT_PRICE
----Ship Revenue
--, rl.amount 
----Sales Amount
--, col.TOTAL_AMT_ordered
--, col.TOTAL_AMT_SHIPPED
--, col.PART_ID
----Cust_Part_ID
--, col.MISC_REFERENCE
----,T.TRACE_ID
--, wo.BASE_ID
--, wo.lot_ID
--, wo.split_ID
--, wo.SUB_ID
--,wo.ACT_BURDEN_COST
--,wo.ACT_LABOR_COST
--,wo.ACT_MATERIAL_COST
--,wo.ACT_SERVICE_COST
----,lt.TRANSACTION_ID as LT_Transaction_ID
--,lt.OPERATION_SEQ_NO
----,lt.GOOD_QTY
----,lt.BAD_QTY
--,lt.RESOURCE_ID
----,lt.[DESCRIPTION]
--, o.ACT_ATL_LAB_COST
--, o.ACT_ATL_BUR_COST
--, o.ACT_ATL_SER_COST
----order by col.CUST_ORDER_ID
----	, col.line_no
----	, wo.base_id
----	, wo.lot_id
----	, wo.split_id
----	, wo.sub_id
----	, lt.OPERATION_SEQ_NO
--),

---
-- unlinked orders
---
cte_unlinked as
(Select 'unlinked' as [type]
, Rl.PACKLIST_ID
,col.CUST_ORDER_ID
,col.LINE_NO
,co.CUSTOMER_ID
, col.LINE_STATUS as Ship_Short
, col.ORDER_QTY as COL_Order_Qty
, col.TOTAL_SHIPPED_QTY
--Shipped Qty
, rl.qty as Rec_Qty
, wo.DESIRED_QTY
, col.UNIT_PRICE
--Ship Revenue
, rl.amount as Rec_Amount
--Sales Amount
, col.TOTAL_AMT_ordered
, col.TOTAL_AMT_SHIPPED
, col.PART_ID
--Cust_Part_ID
, col.MISC_REFERENCE
--,T.TRACE_ID
, wo.BASE_ID
, wo.lot_ID
, wo.split_ID
, wo.SUB_ID
,wo.ACT_BURDEN_COST
,wo.ACT_LABOR_COST
,wo.ACT_MATERIAL_COST
,wo.ACT_SERVICE_COST
,Wo.act_Burden_Cost + wo.act_Material_Cost + WO.Act_Labor_Cost + wo.act_Service_Cost as 'WO Total Cost'
--,lt.TRANSACTION_ID as LT_Transaction_ID
,lt.OPERATION_SEQ_NO
--,lt.GOOD_QTY
--,lt.BAD_QTY
,lt.RESOURCE_ID
--,lt.[DESCRIPTION]
, o.ACT_ATL_LAB_COST
, o.ACT_ATL_BUR_COST
, o.ACT_ATL_SER_COST
, o.ACT_ATL_LAB_COST + o.ACT_ATL_BUR_COST + o.ACT_ATL_SER_COST as Total_Ops_Costs
, sum(lt.HOURS_WORKED) as Total_Hrs_Worked
from cte_uniq_COs u
left outer join WORK_ORDER wo
              on u.part_id = wo.part_id
			  and ((u.trace_id = wo.BASE_ID + '/' + wo.LOT_ID   
					AND WO.SPLIT_ID = '0')
			  -- or (u.trace_id = wo.BASE_ID + '-' + wo.sub_id + '/' + wo.LOT_ID      
					--AND WO.SPLIT_ID = '0')
			  -- or (u.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '/' + wo.sub_id      
					--AND WO.SPLIT_ID = '0')
			  -- or (u.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '.' + wo.split_id    
					--AND WO.SUB_ID = '0')
					)
--left outer join DEMAND_supply_link dsl
--		on dsl.SUPPLY_TYPE = 'WO' 
--		and dsl.SUPPLY_BASE_ID = wo.base_id
--		and dsl.SUPPLY_LOT_ID = wo.lot_id
--		and dsl.SUPPLY_SPLIT_ID = wo.split_id
--		and dsl.SUPPLY_SUB_ID = wo.sub_id 
left Outer Join LABOR_TICKET LT
              on wo.BASE_ID = lt.WORKORDER_BASE_ID
              and wo.LOT_ID = lt.WORKORDER_LOT_ID
              and wo.SPLIT_ID = lt.WORKORDER_SPLIT_ID
              and wo.SUB_ID = lt.WORKORDER_SUB_ID
			  and lt.transaction_DATE >= @startdate
left Outer Join operation o
            on wo.BASE_ID = o.WORKORDER_BASE_ID
            and wo.LOT_ID = o.WORKORDER_LOT_ID
            and wo.SPLIT_ID = o.WORKORDER_SPLIT_ID
            and wo.SUB_ID = o.WORKORDER_SUB_ID
			and lt.OPERATION_SEQ_NO = o.SEQUENCE_NO
--       Left outer join INVENTORY_TRANS IT
--            on wo.[type] = it.WORKORDER_TYPE
--			and wo.BASE_ID = it.WORKORDER_BASE_ID
--            and wo.LOT_ID = it.WORKORDER_LOT_ID
--            and wo.SPLIT_ID = it.WORKORDER_SPLIT_ID
--            and wo.SUB_ID = it.WORKORDER_SUB_ID
--			and o.SEQuence_NO = it.OPERATION_SEQ_NO
--       Left Outer Join TRACE_INV_TRANS  T
----              on it.TRANSACTION_ID = t.TRANSACTION_ID
--              on (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID   
--					AND WO.SPLIT_ID = '0')
--			   or (t.trace_id = wo.BASE_ID + '-' + wo.sub_id + '/' + wo.LOT_ID      
--					AND WO.SPLIT_ID = '0')
--			   or (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '/' + wo.sub_id      
--					AND WO.SPLIT_ID = '0')
--			   or (t.trace_id = wo.BASE_ID + '/' + wo.LOT_ID + '.' + wo.split_id    
--					AND WO.SUB_ID = '0')
       Left Outer Join CUST_ORDER_LINE col
              on col.CUST_ORDER_ID = u.CUST_ORDER_ID
              and col.LINE_NO = u.CUST_ORDER_LINE_NO
			--on dsl.DEMAND_TYPE = 'CO'
			--and dsl.DEMAND_BASE_ID = col.cust_order_id  
			--and dsl.DEMAND_SEQ_NO = col.line_no
       left outer join customer_order co
              on col.CUST_ORDER_ID = co.id
       Left Outer Join RECEIVABLE_LINE RL
              on rl.CUST_ORDER_ID = col.CUST_ORDER_ID
              and rl.CUST_ORDER_LINE_NO = col.LINE_NO
       left outer join RECEIVABLE R
              on rl.invoice_id = r.invoice_id
--where rl.packlist_id is not null
--and dsl.supply_type is null
--Where col.LAST_SHIPPED_DATE > @startdate
--and lt.TRANSACTION_DATE >= @startdate
group by Rl.PACKLIST_ID
	,col.CUST_ORDER_ID
	,col.LINE_NO
	,co.CUSTOMER_ID
	, col.LINE_STATUS 
	, col.ORDER_QTY 
	, col.TOTAL_SHIPPED_QTY
	--Shipped Qty
	, rl.qty 
	, wo.DESIRED_QTY
	, col.UNIT_PRICE
	--Ship Revenue
	, rl.amount 
	--Sales Amount
	, col.TOTAL_AMT_ordered
	, col.TOTAL_AMT_SHIPPED
	, col.PART_ID
	--Cust_Part_ID
	, col.MISC_REFERENCE
	--,T.TRACE_ID
	, wo.BASE_ID
	, wo.lot_ID
	, wo.split_ID
	, wo.SUB_ID
	,wo.ACT_BURDEN_COST
	,wo.ACT_LABOR_COST
	,wo.ACT_MATERIAL_COST
	,wo.ACT_SERVICE_COST
	--,lt.TRANSACTION_ID as LT_Transaction_ID
	,lt.OPERATION_SEQ_NO
	--,lt.GOOD_QTY
	--,lt.BAD_QTY
	,lt.RESOURCE_ID
	--,lt.[DESCRIPTION]
	, o.ACT_ATL_LAB_COST
	, o.ACT_ATL_BUR_COST
	, o.ACT_ATL_SER_COST
--order by col.CUST_ORDER_ID
--	, col.line_no
--	, wo.base_id
--	, wo.lot_id
--	, wo.split_id
--	, wo.sub_id
--	, lt.OPERATION_SEQ_NO
)

--select * from cte_linked
--union all
select * from cte_unlinked
order by CUST_ORDER_ID
	, line_no
	, base_id
	, lot_id
	, split_id
	, sub_id
	, OPERATION_SEQ_NO

/*
select * from CUST_ORDER_LINE col
	inner join customer_order co
		on col.CUST_ORDER_ID = co.id
	left outer join DEMAND_supply_link dsl
			on dsl.DEMAND_TYPE = 'CO'
			and dsl.DEMAND_BASE_ID = col.cust_order_id  
			and dsl.DEMAND_SEQ_NO = col.line_no
where co.CREATE_DATE >= '1/1/2019'
and dsl.SUPPLY_BASE_ID is null
and col.MISC_REFERENCE not like '%charge%'

use live
go
select * from labor_ticket where workorder_base_id = '1575724' and workorder_lot_id = 1
select * from labor_ticket where transaction_id = 17823496

with cte_uniq_COs
select distinct it.cust_order_id
, it.cust_order_line_no
, ti.trace_id
from INVENTORY_TRANS it
left outer join demand_supply_link dsl
on dsl.DEMAND_TYPE = 'CO'
and dsl.DEMAND_BASE_ID = it.cust_order_id  
and dsl.DEMAND_SEQ_NO = it.cust_order_line_no
left outer join cust_order_line col
on it.cust_order_id = col.cust_order_id
and it.cust_order_line_no = col.line_no
left outer join trace_inv_trans ti
on it.transaction_id = ti.transaction_id
where it.cust_order_id is not null 
and it.transaction_date >= '1/1/2019'
and dsl.demand_type is null

select * from inventory_trans where cust_order_Id = '395008'
select * from trace_inv_trans where transaction_id = '2576292'

*/
