# Customer Rep Updates

```sql
use LIVESupplemental
go

select *
from customer_reps
where salesrep_id= 'Terry'
--where id like ('jwd%')
--or id like ('ulv%')

/*
insert into customer_reps
values ('SPECOR', 'Spearman Corporation', 'Terry', 'Y', NULL, 'added 8/24/2016 per email (tlt)', 'AubNorth')

update customer_reps
set Salesrep_id = 'Tracy',
Comments = Comments + '; changed per 8/22/2016 email from Tracy Tomyn'
where ID in ('JWDMAC', 'ULVFOR')
*/
```