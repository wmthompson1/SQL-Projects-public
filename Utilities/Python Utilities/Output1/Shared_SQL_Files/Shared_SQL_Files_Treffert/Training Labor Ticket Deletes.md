# Training Labor Ticket Deletes

```sql
use test
go

select *
from	   labor_ticket lt
where 
    datediff(dd,clock_in,getdate()) <= 180
    and employee_id not in ('1433', '1498', '1694', '1828', '2104', '1140', '1252', '1004', '1067', '1165', '1082', '157', '902', '342', '1914', '2568', '120')
order by clock_in asc


select o.*
from
    labor_ticket lt
inner join 
    operation o
	   on lt.workorder_type = o.workorder_type
	   and lt.workorder_base_id = o.workorder_base_id
	   and lt.workorder_lot_id = o.workorder_lot_id
	   and lt.workorder_split_id = o.workorder_split_id
	   and lt.workorder_sub_id = o.workorder_sub_id
	   and lt.operation_seq_no = o.sequence_no
where 
    datediff(dd,clock_in,getdate()) <= 180
    and employee_id not in ('1433', '1498', '1694', '1828', '2104', '1140', '1252', '1004', '1067', '1165', '1082', '157', '902', '342', '1914', '2568', '120')
    and [status] = 'C'
order by clock_in asc


/*
update operation
set [status] = 'R'
where rowid in
(select o.rowid
    from
	   labor_ticket lt
    inner join 
	   operation o
		  on lt.workorder_type = o.workorder_type
		  and lt.workorder_base_id = o.workorder_base_id
		  and lt.workorder_lot_id = o.workorder_lot_id
		  and lt.workorder_split_id = o.workorder_split_id
		  and lt.workorder_sub_id = o.workorder_sub_id
		  and lt.operation_seq_no = o.sequence_no
    where 
	   datediff(dd,clock_in,getdate()) <= 180
	   and employee_id not in ('1433', '1498', '1694', '1828', '2104', '1140', '1252', '1004', '1067', '1165', '1082', '157', '902', '342', '1914', '2568', '120')
	   and [status] = 'C'
    )
;
delete from labor_ticket
where 
    datediff(dd,clock_in,getdate()) <= 180
    and employee_id not in ('1433', '1498', '1694', '1828', '2104', '1140', '1252', '1004', '1067', '1165', '1082', '157', '902', '342', '1914', '2568', '120')


*/
```