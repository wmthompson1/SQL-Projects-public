use live 
go

/*
select * from PART where id = '453W3432-1'

select * from PART_SITE where part_id = '453W3432-1'

select * from PART_LOCATION where part_id = '453W3432-1'

select * from PART_WAREHOUSE where part_id = '453W3432-1'

select * from INVENTORY_BALANCE where part_id = '453W3432-1'

select * from INVENTORY_TRANS where part_id = '453W3432-1'

select * from TRACE_INV_TRANS where part_id = '453W3432-1'

select * from TRACE_HISTORY where part_id = '453W3432-1'

select * from trace where id = '101904/1'
*/

select 

	p.id
	, p.[description]
	, pl.WAREHOUSE_ID
	, pl.LOCATION_ID
	, pw.AVAILABLE_QTY
	, pw.UNAVAILABLE_QTY
	, ti.TRACE_ID
	, ti.QTY

	-- *
	--p.id
	--, p.[description]
	--, p.QTY_ON_HAND
	--, p.QTY_AVAILABLE_ISS
	--, p.QTY_AVAILABLE_MRP
	--, p.QTY_ON_ORDER
	--, p.QTY_IN_DEMAND
	--, ps.QTY_ON_HAND
	--, ps.QTY_AVAILABLE_ISS
	--, ps.QTY_AVAILABLE_MRP
	--, ps.QTY_ON_ORDER
	--, ps.QTY_IN_DEMAND
	--, pl.WAREHOUSE_ID
	--, pl.LOCATION_ID
	--, pl.QTY
	--, pl.[STATUS]
	--, pl.LOCKED
	--, pw.AVAILABLE_QTY
	--, pw.UNAVAILABLE_QTY
	--, ib.POSTING_DATE
	--, ib.TRANSACTION_ID
	--, ib.QTY
	--, ib.FLAG
	--, it.WORKORDER_TYPE
	--, it.WORKORDER_BASE_ID
	--, it.WORKORDER_LOT_ID
	--, it.WORKORDER_SPLIT_ID
	--, it.WORKORDER_SUB_ID
	--, it.OPERATION_SEQ_NO
	--, it.PURC_ORDER_ID
	--, it.PURC_ORDER_LINE_NO
	--, it.[TYPE]
	--, it.CLASS
	--, it.QTY
	--, it.COSTED_QTY
	--, it.TRANSACTION_DATE
	--, it.[DESCRIPTION]
	--, it.ADJ_REASON_ID
	--, ti.TRACE_ID
	--, ti.QTY
	--, t.OUT_QTY
	--, t.IN_QTY
	--, t.DISP_IN_QTY
	--, t.DISP_OUT_QTY
	--, t.UNAVAILABLE_QTY

from PART p
left outer join PART_SITE ps
	on  p.id = ps.part_id
left outer join PART_LOCATION pl
	on  p.id = pl.part_id
left outer join PART_WAREHOUSE pw
	on  p.id = pw.part_id
	and pl.warehouse_id = pw.warehouse_id
--left outer join INVENTORY_BALANCE ib
--	on  p.id = ib.part_id
left outer join INVENTORY_TRANS it
	on  p.id = it.part_id
	and pl.warehouse_id = it.warehouse_id
	and pl.location_id = it.location_id
	and pw.warehouse_id = it.warehouse_id
left outer join TRACE_INV_TRANS ti
	on  p.id = ti.part_id
	and it.transaction_id = ti.transaction_id
left outer join TRACE t
	on  ti.trace_id = t.id
--left outer join TRACE_HISTORY th
--	on  p.id = th.part_id
--	and it.transaction_id = ti.transaction_id
where p.id = '417T6511-1'
--and t.id = '101904/1'
and it.transaction_date = '11/22/2017'

group by 
	p.id
	, p.[description]
	, pl.WAREHOUSE_ID
	, pl.LOCATION_ID
	, pw.AVAILABLE_QTY
	, pw.UNAVAILABLE_QTY
	, ti.TRACE_ID



/*



use live
go

select id, qty_on_hand
from part p
where id in ('453W3432-1')

select part_id, qty_on_hand
from part_site p
where part_id in ('453W3432-1')

select part_id, warehouse_id, location_id, qty
from part_location p
where part_id in ('453W3432-1')

select * from part_warehouse where part_id in ('453W3432-1')


/*
update part 
set qty_on_hand = 2
where id = '143t5352-28'

update part_site 
set qty_on_hand = 2
where part_id = '143t5352-28'

update part_location 
set qty = 2
where part_id = '143t5352-28'
and warehouse_id = 'FGA'
and location_id = 'A3E'

update trace
set OUT_QTY = 11
where id = '1175469/1/0'
*/

select * from TRACE_INV_TRANS where TRACE_ID = '1175469/1/0'

select * from trace where id = '1397490/1/0'

select * from trace where part_id = '185A1621-21'

select *
from inventory_trans it
left outer join
	trace_inv_trans t
	on it.transaction_id = t.transaction_id
where it.part_id = '185A1621-21'


select --*
	part_id, transaction_id, [type], class, qty, warehouse_id, location_id, workorder_base_id, workorder_lot_id, cust_order_id,
	cust_order_line_no, purc_order_id, purc_order_line_no
from inventory_trans
where part_id = '453w3313-2'
--and transaction_id in ('1979288', '1979287')
order by transaction_date


/*
select *
--	part_id, transaction_id, [type], class, qty, warehouse_id, location_id, workorder_base_id, workorder_lot_id, cust_order_id,
--	cust_order_line_no, purc_order_id, purc_order_line_no
from INVENTORY_TRANS_GOOD
where part_id = '453w3313-2'
--and transaction_id in ('1979288', '1979287')
order by transaction_date
*/

select --* 
	part_id, transaction_id, qty, posting_date
from INVENTORY_BALANCE
where part_id = '453w3313-2'
order by posting_date

select --* 
	part_id, CREATE_DATE, id, out_qty, in_qty, unavailable_qty
from TRACE
where part_id = '453w3313-2'
order by CREATE_DATE

select * 
from TRACE_INV_TRANS
where part_id = '453w3313-2'

select p.id, p.[DESCRIPTION], l.WAREHOUSE_ID, l.location_ID, p.QTY_ON_HAND as Part, ps.QTY_ON_HAND as PartSite, pl.QTY as PartLoc, t.traceqty
from part p
left outer join part_site ps
	on p.id = ps.part_id
left outer join
	(select part_id, sum(qty) as QTY
	from part_location pl
	where qty <> 0
	group by part_id
	) pl
	on p.id = pl.part_id
left outer join 
	(select 
		part_ID, 
		sum(IN_QTY) - sum(OUT_QTY) as TraceQTY
	from trace t
	group by part_id
	) t
	on p.id = t.part_id
left outer join
	part_location l
	on p.id = l.part_id
where 
(	p.qty_on_hand <> ps.qty_on_hand
	or p.qty_on_hand <> pl.qty
	or 	pl.qty <> ps.qty_on_hand
	or 	p.qty_on_hand <> t.traceqty
	or 	ps.qty_on_hand <> t.traceqty
	or warehouse_id <> 'Shipping'
)
-- p.id = '143T5352-30'
order by p.id
--select * from part_location where part_id = '143T5352-30'

*/