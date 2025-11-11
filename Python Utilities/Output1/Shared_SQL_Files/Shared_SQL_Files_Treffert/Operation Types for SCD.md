# Operation Types for SCD

```sql
use live
go

select ot.id, ot.[description], resource_id, scd.*
from OPERATION_TYPE ot
left outer join 
	SKILLS_CERT_DESC scd
	on ot.id = scd.OP_TYPE
--where scd.op_type is null
order by resource_id, op_type desc

select op_type, count(*)
from SKILLS_CERT_DESC scd
group by op_type
having count(*) > 1
order by op_type

select * from SKILLS_CERT_DESC
where op_type in ('F19.42', 'F21.27-26373', 'F22.06-7327', 'F22.06-9029', 'SRF2.90C')
order by op_type

select ot.id, ot.[description], resource_id, scd.*
from OPERATION_TYPE ot
left outer join 
	SKILLS_CERT_DESC scd
	on ot.id = scd.OP_TYPE
where scd.op_type is null
order by resource_id, op_type desc

select ot.id, ot.[description], resource_id, scd.*
from OPERATION_TYPE ot
right outer join 
	SKILLS_CERT_DESC scd
	on ot.id = scd.OP_TYPE
where ot.id is null
order by resource_id, op_type desc

select * from operation_type where id = 'MIL-C-85285 TI'
```