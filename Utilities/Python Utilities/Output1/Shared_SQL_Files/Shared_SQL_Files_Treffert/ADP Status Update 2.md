# ADP Status Update 2

```sql
use livesupplemental
go

select * from emp_adp where empid = '3374'

UPDATE emp_adp
SET [Status] = 'Leave'
WHERE empID = '3374'
```