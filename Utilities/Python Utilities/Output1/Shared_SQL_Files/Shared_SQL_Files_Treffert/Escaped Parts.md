# Escaped Parts

```sql
USE LIVE
GO

SELECT 
wo.part_id, p.[description], wo.base_id, wo.sub_id, wo.lot_id, wo.split_id, wo.desired_qty, o.sequence_no, o.RESOURCE_ID, l.TRANSACTION_DATE

--*
FROM 
    OPERATION o
inner join 
    work_order wo
	   on wo.[TYPE] = 'W'
	   and o.WORKORDER_base_id = wo.base_id
	   and o.WORKORDER_sub_id = wo.sub_id
	   and o.WORKORDER_lot_id = wo.lot_id
	   and o.WORKORDER_split_id = wo.split_id
left outer join 
    co_product cp
	   on cp.WORKORDER_TYPE = 'W'
	   and cp.WORKORDER_base_id = wo.base_id
	   and cp.WORKORDER_sub_id = wo.sub_id
	   and cp.WORKORDER_lot_id = wo.lot_id
	   and cp.WORKORDER_split_id = wo.split_id
inner join 
    part p
	   on wo.part_id = p.id
inner join
    labor_ticket l
	   on o.WORKORDER_TYPE = 'W'
	   and l.WORKORDER_base_id = wo.base_id
	   and l.WORKORDER_sub_id = wo.sub_id
	   and l.WORKORDER_lot_id = wo.lot_id
	   and l.WORKORDER_split_id = wo.split_id
	   and l.[OPERATION_SEQ_NO] = o.sequence_no 
WHERE 
    o.RESOURCE_ID = 'bal-pm'
    AND l.[TRANSACTION_DATE] >= '6/4/2016 00:00:00'
    AND l.[TRANSACTION_DATE] < '6/10/2016'
    AND o.[STATUS] IN ('C','R')
    and cp.WORKORDER_BASE_ID is null
    and wo.DESIRED_QTY = 1

```