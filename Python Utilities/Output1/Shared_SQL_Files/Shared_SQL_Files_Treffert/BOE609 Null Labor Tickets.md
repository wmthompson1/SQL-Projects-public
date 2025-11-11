# BOE609 Null Labor Tickets

```sql
use live 
go

Select
       W.Base_ID
       ,w.Lot_ID
       ,W.split_ID
       ,W.Sub_ID
       ,w.Part_ID
       ,w.[status]
       ,o.SEQUENCE_NO
       ,o.resource_ID
       ,lt.Hours_Worked
       ,co.CUSTOMER_ID
--     ,lt.*  
 
From
       [dbo].[WORK_ORDER] as W
left outer join operation o
              on o.[WORKORDER_BASE_ID] = w.base_ID
              and o.workorder_Lot_ID = W.Lot_ID
              and o.Workorder_Split_ID = W.split_ID
              and o.Workorder_Sub_ID = w.Sub_ID
              and o.Workorder_type = w.[type]
left join [dbo].[LABOR_TICKET] as LT
              on lt.[WORKORDER_BASE_ID] = w.base_ID
              and lt.workorder_Lot_ID = W.Lot_ID
              and lt.Workorder_Split_ID = W.split_ID
              and lt.Workorder_Sub_ID = w.Sub_ID
              and lt.Workorder_type = w.[type]
              and lt.OPERATION_SEQ_NO = o.SEQUENCE_NO
left join DEMAND_SUPPLY_LINK as DS
              on Ds.supply_BASE_ID = w.Base_ID
              and ds.supply_LOT_ID = w.lot_ID
              and ds.supply_SPLIT_ID = w.split_ID
              and ds.supply_sub_ID = w.sub_ID
              and ds.supply_TYPE = 'WO'
left join CUSTOMER_ORDER as co
              on co.ID = ds.demand_BASE_ID
              and ds.demand_TYPE = 'CO'
left join CUST_ORDER_LINE as COL
              on col.CUST_ORDER_ID = co.ID
 
Where
       CO.CUSTOMER_ID = 'BOE609'
       and 
       w.[type] = 'W'
       and 
       lt.HOURS_WORKED is null
       and 
       w.HARD_RELEASE_DATE >= '1/1/2016'
       and
       w.STATUS not like 'X'
       and
       w.status not like 'f'
          and
          o.RESOURCE_ID in ('AUB-1000', 'AUB-600', 'Aub-alo', 'Aub-ano', 'Aub-boric', 'Clean', 'etch', 'AUB-etch', 'AUB-emu')
 
order by
       o.resource_ID

```