use live
go
       
select *
from
(Select
       i.WORKORDER_BASE_ID
       ,i.WORKORDER_LOT_ID
       ,i.WORKORDER_SPLIT_ID
       ,i.WORKORDER_SUB_ID
--       ,TRANSACTION_DATE
--       ,i.[TYPE]
       ,i.WAREHOUSE_ID
       ,i.PART_ID
      --,i.QTY
	  , r.UNIT_MATERIAL_COST
	   ,sum(
	   case
			when type = 'I' then QTY
			when type = 'O' then QTY * (-1)
		end
		) Issued
	  , r.calc_qty
	  , r.issued_qty
	   ,sum(
	   case
			when type = 'I' then i.ACT_MATERIAL_COST
			when type = 'O' then i.ACT_MATERIAL_COST * (-1)
		end
		) ACT_MATERIAL_COST
	  , r.ACT_MATERIAL_COST as rACT_MATERIAL_COST
	  ,sum(
	   case
			when type = 'I' then i.ACT_LABOR_COST
			when type = 'O' then i.ACT_LABOR_COST * (-1)
		end
		) ACT_LABOR_COST
	  , r.ACT_labor_COST as rACT_labor_COST
	   ,sum(
	   case
			when type = 'I' then i.ACT_BURDEN_COST
			when type = 'O' then i.ACT_BURDEN_COST * (-1)
		end
		) ACT_BURDEN_COST
	  , r.ACT_BURDEN_COST as rACT_burden_COST
	   ,sum(
	   case
			when type = 'I' then i.ACT_SERVICE_COST
			when type = 'O' then i.ACT_SERVICE_COST * (-1)
		end
		) ACT_SERVICE_COST
	   	, r.ACT_SERVICE_COST as rACT_service_COST
		--, i.ACT_MATERIAL_COST
	   --, i.ACT_LABOR_COST
	   --, i.ACT_BURDEN_COST
	   --, i.ACT_SERVICE_COST
--		, r.*
From 
       [dbo].[INVENTORY_TRANS] i
inner join 
		TRACE_INV_TRANS t
		on 
		and r.part_id = t.part_id


inner join
	requirement r
		on r.workorder_base_id = i.workorder_base_id
		and r.workorder_lot_id = i.workorder_lot_id
		and r.workorder_split_id = i.workorder_split_id
		and r.workorder_sub_id = i.workorder_sub_id
		and r.part_id = i.part_id


Where
       TRANSACTION_DATE > '1/1/2017'
       and i.WORKORDER_BASE_ID <> 'Null'
       and i.WAREHOUSE_ID = 'Auburn Mtl Cage'
group by 
       i.WORKORDER_BASE_ID
       ,i.WORKORDER_LOT_ID
       ,i.WORKORDER_SPLIT_ID
       ,i.WORKORDER_SUB_ID
       ,i.WAREHOUSE_ID
       ,i.PART_ID
	   , r.ACT_MATERIAL_COST, r.ACT_LABOR_COST, r.ACT_BURDEN_COST, r.ACT_SERVICE_COST , r.UNIT_MATERIAL_COST	  , r.calc_qty
	  , r.issued_qty
) A
where issued + issued_qty <> 0
order by 
       WORKORDER_BASE_ID
       ,WORKORDER_LOT_ID
       ,WORKORDER_SPLIT_ID
       ,WORKORDER_SUB_ID
--       ,TRANSACTION_DATE


Select
       i.WORKORDER_BASE_ID
       ,i.WORKORDER_LOT_ID
       ,i.WORKORDER_SPLIT_ID
       ,i.WORKORDER_SUB_ID
       ,TRANSACTION_DATE
       ,i.[TYPE]
       ,i.WAREHOUSE_ID
       ,i.PART_ID
      ,i.QTY
		, i.ACT_MATERIAL_COST
	   , i.ACT_LABOR_COST
	   , i.ACT_BURDEN_COST
	   , i.ACT_SERVICE_COST
--		, r.*
From 
       [dbo].[INVENTORY_TRANS] i
inner join
	requirement r
		on r.workorder_base_id = i.workorder_base_id
		and r.workorder_lot_id = i.workorder_lot_id
		and r.workorder_split_id = i.workorder_split_id
		and r.workorder_sub_id = i.workorder_sub_id
		and r.part_id = i.part_id


Where
       TRANSACTION_DATE > '1/1/2017'
       and i.WORKORDER_BASE_ID <> 'Null'
       and i.WAREHOUSE_ID = 'Auburn Mtl Cage'
		and i.workorder_base_id = '1359826'
--		and TRANSACTION_ID = '1359826'

--group by 
--       i.WORKORDER_BASE_ID
--       ,i.WORKORDER_LOT_ID
--       ,i.WORKORDER_SPLIT_ID
--       ,i.WORKORDER_SUB_ID
--       ,i.WAREHOUSE_ID
--       ,i.PART_ID
--	   , r.ACT_MATERIAL_COST, r.ACT_LABOR_COST, r.ACT_BURDEN_COST, r.ACT_SERVICE_COST , r.UNIT_MATERIAL_COST	  , r.calc_qty
--	  , r.issued_qty

order by 
       i.WORKORDER_BASE_ID
       ,i.WORKORDER_LOT_ID
       ,i.WORKORDER_SPLIT_ID
       ,i.WORKORDER_SUB_ID
--       ,TRANSACTION_DATE