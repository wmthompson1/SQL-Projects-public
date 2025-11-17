# ABC_Code Cycle Count Update

```sql
use live
go

/*
update part
set abc_code = NULL
where abc_code is not null

update part_site 
set abc_code = NULL
where abc_code is not null

update part
set abc_code = 'K'
where id in ('68A810552-1001', '232A4443-3', '866Z9010-2', '313W2821-991', '866Z9010-33', '413A5004-27')

update part_site 
set abc_code = 'K'
where part_id in ('68A810552-1001', '232A4443-3', '866Z9010-2', '313W2821-991', '866Z9010-33', '413A5004-27')


*/

select * from part where abc_code = 'P'

select abc_code, count(*) from part group by abc_code

select abc_code, count(*) from part_site group by abc_code

select id, p.abc_code, ps.abc_code as ps_code
from part p
left outer join part_site ps
on p.id = ps.part_id
where p.abc_code <> ps.abc_code
```