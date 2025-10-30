use live
go

select * from labor_ticket lt
where employee_id = 2992 and TRANSACTION_DATE >= '5/16/2018' and TRANSACTION_DATE < '5/17/2018' order by clock_in

/*

delete from labor_ticket where employee_id = 2992 and transaction_id in (15411881, 15411885, 15411886, 15412255, 15412256, 15412258, 15412573, 15412608, 15413060, 15413463, 15413521, 15413646, 15413684)

*/