# USP listing

```sql
select * 
from live.information_schema.routines 
where routine_type = 'PROCEDURE'
--and routine_definition like '%binary%'
and left(routine_name,3) = 'usp'
```