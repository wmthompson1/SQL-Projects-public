use live
go

select 
	wo.base_id, 
	wo.lot_id, 
	wo.split_id, 
	wo.sub_id, 
	wo.part_id, 
	wo.DESIRED_RLS_DATE, 
	wo.DESIRED_QTY, 
	r.part_id,
	i.part_id,
	i.type,
	i.class,
	i.qty,
	i.TRANSACTION_DATE


from work_order wo
left outer join REQUIREMENT r
	on  wo.type = 'w'
	and wo.base_id = r.workorder_base_id
	and wo.lot_id = r.workorder_lot_id
	and wo.sub_id = r.workorder_sub_id
	and wo.split_id = r.workorder_split_id
left outer join inventory_trans i
	on  wo.type = 'w'
	and wo.base_id = i.workorder_base_id
	and wo.lot_id = i.workorder_lot_id
	and wo.sub_id = i.workorder_sub_id
	and wo.split_id = i.workorder_split_id
	and isnull(r.part_id, wo.part_id) = i.part_id
where 
	wo.type = 'w'
	and DATEDIFF(m,wo.DESIRED_RLS_DATE,getdate()) <= 6
order by base_id, lot_id, wo.part_id

/*
select * from TRACE_INV_TRANS where TRANSACTION_ID = '1949838'
select * from INVentory_TRANS where TRANSACTION_ID = '1949838'

*/