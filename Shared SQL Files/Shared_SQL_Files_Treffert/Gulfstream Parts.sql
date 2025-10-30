use live
go

--select * from customer where [name] like 'A & G%'

select CO.CUSTOMER_ID
, CO.ID
, CO.DESIRED_SHIP_DATE
, WO.DESIRED_RLS_DATE
, WO.BASE_ID
, WO.LOT_ID
, WO.SPLIT_ID
, WO.SUB_ID
, WO.[STATUS]
, WO.PART_ID

from customer_order co
inner join DEMAND_supply_link dsl
on dsl.DEMAND_TYPE = 'CO'
and dsl.DEMAND_BASE_ID = co.id  
inner join work_order wo
on dsl.SUPPLY_TYPE = 'WO' 
and dsl.SUPPLY_BASE_ID = wo.base_id
and dsl.SUPPLY_LOT_ID = wo.lot_id
and dsl.SUPPLY_SPLIT_ID = wo.split_id
and dsl.SUPPLY_SUB_ID = wo.sub_id 
where customer_id in ('A&GMAC', 'IMAINC', 'GCMNOR')
and DESIRED_SHIP_DATE >= '1/1/2018'
and left(wo.part_id, 3) in ('60P', '72P')
--and exists
--	(select 1
--	from operation o
--	where o.WORKORDER_BASE_ID = wo.BASE_ID
--	and o.WORKORDER_LOT_ID = wo.LOT_ID
--	and o.WORKORDER_SPLIT_ID = wo.SPLIT_ID
--	and o.WORKORDER_SUB_ID = wo.SUB_ID
--	and o.WORKORDER_TYPE = wo.[type]
--	and o.RESOURCE_ID in ('AUB-msp', 'AUB-sp', 'BAL-sp', 'msp', 'sp')
--	and o.[status] = 'C'
--	)
ORDER BY CO.ID


--select * from LIVESupplemental.dbo.ResourceID_Assignments where Resource_Description like '%shot%'
--select * from part where  left(id, 3) in ('60P', '72P')