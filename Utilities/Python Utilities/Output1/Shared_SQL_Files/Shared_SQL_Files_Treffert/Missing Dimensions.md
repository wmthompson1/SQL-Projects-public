# Missing Dimensions

```sql
use live
go

select --* 
	p.id
	, p.[description]
	, udf26.number_val as SurfaceArea 
	, udf35.string_val as MaterialType
	, udf36.string_val as Alloy
	, udf37.number_val as [Length]
	, udf38.number_val as [Width]
	, udf39.number_val as [Thickness]
	, udf40.number_val as [ITAR]
from part p
inner join work_order wo
	on  p.id = wo.part_id
	and DATEDIFF(year, close_date, GETDATE()) <= 2
left outer join 
	USER_DEF_FIELDS udf26
	on  p.id = udf26.document_id
	and udf26.program_id = 'VMPRTMNT'
	and udf26.id = 'UDF-0000026'
left outer join 
	USER_DEF_FIELDS udf35
	on  p.id = udf35.document_id
	and udf35.program_id = 'VMPRTMNT'
	and udf35.id = 'UDF-0000035'
left outer join 
	USER_DEF_FIELDS udf36
	on  p.id = udf36.document_id
	and udf36.program_id = 'VMPRTMNT'
	and udf36.id = 'UDF-0000036'
left outer join 
	USER_DEF_FIELDS udf37
	on  p.id = udf37.document_id
	and udf37.program_id = 'VMPRTMNT'
	and udf37.id = 'UDF-0000037'
left outer join 
	USER_DEF_FIELDS udf38
	on  p.id = udf38.document_id
	and udf38.program_id = 'VMPRTMNT'
	and udf38.id = 'UDF-0000038'
left outer join 
	USER_DEF_FIELDS udf39
	on  p.id = udf39.document_id
	and udf39.program_id = 'VMPRTMNT'
	and udf39.id = 'UDF-0000039'
left outer join 
	USER_DEF_FIELDS udf40
	on  p.id = udf40.document_id
	and udf40.program_id = 'VMPRTMNT'
	and udf40.id = 'UDF-0000040'
where 
	udf37.number_val is null
	or udf38.number_val is null
	or udf39.number_val is null

group by
	p.id
	, p.[description]
	, udf26.number_val
	, udf35.string_val
	, udf36.string_val
	, udf37.number_val
	, udf38.number_val
	, udf39.number_val
	, udf40.number_val

```