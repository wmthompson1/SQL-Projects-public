# CommCode Updates

```sql
use live
go

select planner_user_id, commodity_code, count(*)
from part
where left(planner_user_id,3) = 'FIN'
group by planner_user_id, commodity_code

--select * from SK_PLANNER_USER_ID

/*
update part
set commodity_code = 'End Item'
where left(planner_user_id,3) = 'FIN'
and commodity_code is null
*/
```