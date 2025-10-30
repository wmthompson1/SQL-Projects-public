use live
go

select 
	ee.id,
	ee.first_name,
	ee.last_name,
	adp.[job title],
	[Dept Code],
	[reports to],
	[location],
	[shift],
	lasttransdate
from
	employee ee
inner join 
	LIVESupplemental.dbo.emp_adp adp
	on ee.id = adp.empID
inner join 
	(select employee_id, max(transaction_date) as LastTransDate
	from labor_ticket lt
	where transaction_date > '1/1/2016'
	group by employee_id
	)  lt
	on ee.id = lt.employee_id
where 
	ee.active = 'Y'
	and [dept code] <> '960000'
	and ee.id in 
		(select 
			distinct lt.employee_id
		from labor_ticket lt
		inner join 
			operation o
			on o.workorder_base_id = lt.workorder_base_id
			and o.workorder_lot_id = lt.workorder_lot_id
			and o.workorder_split_id = lt.workorder_split_id
			and o.workorder_sub_id = lt.workorder_sub_id
			and o.workorder_type = lt.workorder_type
			and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
		inner join 
			LIVESupplemental.dbo.ResourceID_Assignments ra
			on ra.resource_id = o.resource_id
		where
			ra.dept like '%Paint%'
			and lt.transaction_date >= '1/1/2016'
		)

order by 
	lasttransdate, ee.last_name


select *
--	lt.employee_id, o.resource_id, sum(hours_worked)
from labor_ticket lt
inner join 
	operation o
	on o.workorder_base_id = lt.workorder_base_id
	and o.workorder_lot_id = lt.workorder_lot_id
	and o.workorder_split_id = lt.workorder_split_id
	and o.workorder_sub_id = lt.workorder_sub_id
	and o.workorder_type = lt.workorder_type
	and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
inner join 
	LIVESupplemental.dbo.ResourceID_Assignments ra
	on ra.resource_id = o.resource_id
where
	ra.dept like '%Paint%'
	and lt.transaction_date >= '1/1/2016'
	and lt.employee_id = '1080'
group by lt.employee_id, o.resource_id
order by lt.employee_id, o.resource_id