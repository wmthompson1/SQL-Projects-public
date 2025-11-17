# CustomerReps

```sql
select ROWID, c.id, c.name
from LIVE.dbo.customer c
-- 672 rows

select id, count(id)
from LIVESupplemental.dbo.customer_reps
group by id
having count(id) > 1
order by id
/*
DAMAR	2
FIRWOR	2
LIGHTH	2
ORIIND	2
PIOIND	2
PROVAIL	2
ROYMFG	2
*/

select *
from LIVESupplemental.dbo.customer_reps
where id in ('DAMAR', 'FIRWOR', 'LIGHTH', 'ORIIND', 'PIOIND', 'PROVAIL', 'ROYMFG')

select *
from LIVE.dbo.customer
where id in ('DAMAR', 'FIRWOR', 'LIGHTH', 'ORIIND', 'PIOIND', 'PROVAIL', 'ROYMFG')

select *
from LIVESupplemental.dbo.customer_reps
WHERE [SALESREP_ID]='NULL'
--354 rows

/*
UPDATE LIVESupplemental.dbo.customer_reps
SET [SALESREP_ID] = NULL
WHERE [SALESREP_ID]='NULL';
*/

select ROWID, c.id, c.name, c.active_flag, c.[SALESREP_ID], r.[SALESREP_ID], [ShowInList], [Comments]
from LIVE.dbo.customer c
left join LIVESupplemental.dbo.customer_reps r
--on r.id is null
on r.id = c.id
where (r.id is null
or c.[SALESREP_ID] <> r.[SALESREP_ID])
--and active_flag = 'y'
order by c.id
-- 119 rows

select ROWID, c.id, c.name, c.active_flag, c.[SALESREP_ID], r.[SALESREP_ID] as [RepName], [ShowInList], [Comments]
into #t1
from LIVE.dbo.customer c
left join LIVESupplemental.dbo.customer_reps r
--on r.id is null
on r.id = c.id
where (r.id is null
or c.[SALESREP_ID] <> r.[SALESREP_ID])
and active_flag = 'y'
and c.rowid not in ('1041', '469', '1059', '1039', '1051') 
order by r.[SALESREP_ID], c.[SALESREP_ID]
-- 74 rows



drop table #t1

```