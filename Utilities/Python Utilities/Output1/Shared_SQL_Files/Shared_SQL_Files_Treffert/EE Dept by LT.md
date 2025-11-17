# EE Dept by LT

```sql
use DataWarehouse
go

select cast(DATEADD(day, -1*(DATEPART(WEEKDAY, lt.clock_in)-2), lt.clock_in) as DATE) as WeekStart
, lt.employee_id
--, sum(hours_worked)
, sr.user_2
from LABOR_TICKET_SMALL lt
left outer join SHOP_RESOURCE_SITE sr
on lt.RESOURCE_ID = sr.resource_id
where lt.TRANSACTION_DATE >= '1/1/2019'
and lt.[TYPE] = 'R'
and employee_id = '1034'
group by cast(DATEADD(day, -1*(DATEPART(WEEKDAY, lt.clock_in)-2), lt.clock_in) as DATE)
, lt.employee_id
, sr.user_2
order by lt.employee_id
, cast(DATEADD(day, -1*(DATEPART(WEEKDAY, lt.clock_in)-2), lt.clock_in) as DATE)
, sr.user_2

select empid, [Job Title] from LIVESupplemental.dbo.emp_adp where empID = '1704'
```