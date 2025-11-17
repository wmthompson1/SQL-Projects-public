# Operation User Layout (20210730)

```sql
use DataWarehouse
go

select top 10000 *
from operation 
where user_10 is not null
order by close_date desc

select user_1, count(*) from operation where user_1 is not null and close_date >= '1/1/2020' group by user_1 order by user_1
select user_2, count(*) from operation where user_2 is not null and close_date >= '1/1/2020'  group by user_2 order by user_2
select user_3, count(*) from operation where user_3 is not null  and close_date >= '1/1/2020' group by user_3 order by user_3
select user_4, count(*) from operation where user_4 is not null  and close_date >= '1/1/2020' group by user_4 order by user_4
select user_5, count(*) from operation where user_5 is not null  and close_date >= '1/1/2020' group by user_5 order by user_5
select user_6, count(*) from operation where user_6 is not null  and close_date >= '1/1/2020' group by user_6 order by user_6
select user_7, count(*) from operation where user_7 is not null  and close_date >= '1/1/2020' group by user_7 order by user_7
select user_8, count(*) from operation where user_8 is not null  and close_date >= '1/1/2020' group by user_8 order by user_8
select user_9, count(*) from operation where user_9 is not null  and close_date >= '1/1/2020' group by user_9 order by user_9

select workorder_base_id
, workorder_lot_id
, workorder_split_id
, workorder_sub_id
, SEQUENCE_NO, 
user_1,
user_2,
user_3,
user_4,
user_5,
user_6,
user_7,
user_8,
user_9, 
user_10
from operation
where close_date >= '1/1/2020'
and coalesce(user_10, user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, '') != ''
and workorder_type = 'w'
```