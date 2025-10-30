use live
go

select 
	o.workorder_base_id,
	o.workorder_lot_id,
	o.workorder_split_id,
	o.workorder_sub_id,
	o.SEQUENCE_NO,
	o.RESOURCE_ID,
	lt.CLOCK_IN,
	lt.CLOCK_OUT,
	lt.hours_worked,
	lt.EMPLOYEE_ID,
	ee.first_name,
	ee.last_name

from operation o 
left outer join labor_ticket lt
on o.workorder_type = lt.WORKORDER_TYPE
and o.workorder_base_id = lt.workorder_base_id
and o.workorder_lot_id = lt.workorder_lot_id
and o.workorder_split_id = lt.workorder_split_id
and o.workorder_sub_id = lt.workorder_sub_id
left outer join employee ee
on lt.EMPLOYEE_ID = ee.id
where
lt.TRANSACTION_DATE >= '9/8/2017'
and lt.TRANSACTION_DATE <= '9/11/2017'
and o.resource_id in ('AUB-mask', 'AUB-Mask-Cargo')

--select * from LIVESupplemental.dbo.ResourceID_Assignments where Resource_ID like '%mask%'