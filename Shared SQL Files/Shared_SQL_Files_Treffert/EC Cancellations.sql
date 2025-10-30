use live
go

select * from ec where id = 'ec-00963'
select * from EC_HISTORY where ec_id = 'ec-00963'
select * from EC_LINE where ec_id = 'ec-00963'
select * from EC_REQUEST where ec_id = 'ec-00963'
select * from EC_TYPES where ec_id = 'ec-00963'

select * from TASK where ec_id = 'ec-00963'
select status, count(*) from TASK group by status



select status, count(*) from ec group by status

/*
update ec
set [status] = 'I'
where id = 'EC-00963'

update task
set status = 'C'
where task_no = '1185'
and seq_no = '5'

*/