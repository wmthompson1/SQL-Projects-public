# WO DSL CO Packlist Joins

```sql
use live 
go

SELECT 
	*
	--co.id as COID,
	--col.line_no as COL,
	--w.base_ID,
	--w.lot_ID,
	--w.split_ID,
	--w.sub_ID,
	--w.part_id,
	--trt.trace_id,
	--trt.transaction_id,
	--w.CREATE_DATE,
	--s.SHIPPED_DATE,
	--col.order_qty,
	--w.desired_qty,
	--trt.[QTY],
	--sum(sl.[USER_SHIPPED_QTY]) as UserShippedQty,
	--sum(sl.[SHIPPED_QTY]) as ShippedQty
FROM 
	dbo.WORK_ORDER AS W

left outer JOIN 
	DEMAND_SUPPLY_LINK  dsl
		on  w.[BASE_ID] = dsl.[SUPPLY_BASE_ID]
		and w.[LOT_ID] = dsl.[SUPPLY_LOT_ID]
		and w.[SPLIT_ID] = dsl.[SUPPLY_SPLIT_ID]
		and w.[SUB_ID] = dsl.[SUPPLY_SUB_ID]
		and w.[PART_ID] = dsl.[SUPPLY_PART_ID]
		and dsl.[supply_type] = 'WO'

--LEFT OUTER JOIN 
----INNER JOIN
--	CUSTOMER_ORDER co
--		on dsl.[demand_BASE_ID] = co.ID
--		and dsl.[demand_type] = 'CO'

--LEFT OUTER JOIN 
----INNER JOIN
--	CUST_ORDER_line col
--		on co.ID = col.cust_order_id
--		and w.part_id = col.part_id
--		and col.[LINE_NO] = dsl.[DEMAND_SEQ_NO]

--LEFT OUTER JOIN 
----INNER JOIN
--	[SHIPPER] s
--		on  co.ID = s.[CUST_ORDER_ID]
----		and shipped_date between '4/18/2016 00:00:00' and '4/24/2016 11:59:59'

--LEFT OUTER JOIN 
----INNER JOIN
--	[SHIPPER_line] sl
--		on  co.ID = sl.[CUST_ORDER_ID]
--		and col.[LINE_NO] = sl.[CUST_ORDER_LINE_NO]
--		and s.packlist_id = sl.packlist_id
----		and shipped_date between '4/18/2016 00:00:00' and '4/24/2016 11:59:59'

--LEFT OUTER JOIN 
----INNER JOIN 
--	TRACE_INV_TRANS AS TRT
--		ON TRT.TRACE_ID = W.BASE_ID + '/' + W.LOT_ID + '/' + W.SUB_ID
--		and SL.TRANSACTION_ID = TRT.TRANSACTION_ID
--		and w.part_id = trt.part_id

WHERE
	(W.TYPE = 'W')
	AND (W.SUB_ID = 0)
--	and w.create_date >= '1/1/2015'
--	and co.id = '306985' or w.base_id = '1369165' -- or w.part_id = '143T5925-72'
	and w.part_id = '213T7450-43'

--GROUP BY
--	co.id,
--	col.line_no,
--	w.base_ID,
--	w.lot_ID,
--	w.split_ID,
--	w.sub_ID,
--	w.part_id,
--	trt.trace_id,
--	trt.transaction_id,
--	w.CREATE_DATE,
--	s.SHIPPED_DATE,
--	col.order_qty,
--	w.desired_qty,
--	trt.[QTY]
--ORDER BY 
--	co.id,
--	col.line_no,
--	w.base_ID,
--	w.lot_ID,
--	w.split_ID,
--	w.sub_ID,
--	w.part_id,
--	trt.trace_id,
--	trt.transaction_id,
--	w.CREATE_DATE,
--	s.SHIPPED_DATE,
--	col.order_qty,
--	w.desired_qty,
--	trt.[QTY]



--select	*
--from	shipper_line
--where	cust_order_id like '%306985%'
--order by cust_order_line_no

--select	*
--from	TRACE_INV_TRANS
--where	trace_id like '%1369165%'

```