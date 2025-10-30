use live
go

select --*
	base_id,
	lot_id,
	split_id,
	sub_id,
	part_id,
	desired_qty,
	desired_want_date,
	w.[status],
	o.sequence_no,
	o.resource_id,
	o.vendor_id,
	o.STATUS_EFF_DATE,
	o.CLOSE_DATE,
	min(lt.OPERATION_SEQ_NO) as NextOp,
	min(lt.TRANSACTION_DATE) as NextTransDate
from work_order w
inner join operation o
	on  w.[type] = o.workorder_type
	and w.[base_id] = o.workorder_base_id
	and w.[lot_id] = o.workorder_lot_id
	and w.[split_id] = o.workorder_split_id
	and w.[sub_id] = o.workorder_sub_id
	and o.resource_id = 'contractor'
	and o.vendor_id in ('STAMET', 'MAPSCO', 'PACMET')
--left outer join 
--	(select 
--		lt.workorder_type,
--		lt.workorder_base_id,
--		lt.workorder_lot_id,
--		lt.workorder_split_id,
--		lt.workorder_sub_id,
--		min(lt.OPERATION_SEQ_NO) as NextOp,
--		min(TRANSACTION_DATE) as NextTransDate
--	from labor_ticket lt
--	group by 
--		lt.workorder_type,
--		lt.workorder_base_id,
--		lt.workorder_lot_id,
--		lt.workorder_split_id,
--		lt.workorder_sub_id
--	) as lt
left outer join 
	(select 
		lt.workorder_type,
		lt.workorder_base_id,
		lt.workorder_lot_id,
		lt.workorder_split_id,
		lt.workorder_sub_id,
		lt.OPERATION_SEQ_NO,
		lt.TRANSACTION_DATE
	from labor_ticket lt
	)  lt
	on	w.[type] = lt.workorder_type
	and w.[base_id] = lt.workorder_base_id
	and w.[lot_id] = lt.workorder_lot_id
	and w.[split_id] = lt.workorder_split_id
	and w.[sub_id] = lt.workorder_sub_id
	and lt.OPERATION_SEQ_NO > o.sequence_no
where
	o.status = 'C'
group by 
	base_id,
	lot_id,
	split_id,
	sub_id,
	part_id,
	desired_qty,
	desired_want_date,
	w.[status],
	o.sequence_no,
	o.resource_id,
	o.vendor_id,
	o.STATUS_EFF_DATE,
	o.CLOSE_DATE
