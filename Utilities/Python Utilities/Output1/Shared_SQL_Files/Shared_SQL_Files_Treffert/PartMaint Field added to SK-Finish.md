# PartMaint Field added to SK-Finish

```sql
use live
go

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT PROGRAM_ID
, id
--, DOCUMENT_ID
, count(*)

  FROM [LIVE].[dbo].[USER_DEF_FIELDS]
  where program_id like 'VMPRTMNT'

  group by PROGRAM_ID
, id
--, DOCUMENT_ID

select * FROM [LIVE].[dbo].[USER_DEF_FIELDS] where id = 'UDF-0000099'

select * from part where id = '421Z6410-4203'

--tab_id = 'sk-finish'

--insert into [LIVE].[dbo].[USER_DEF_FIELDS] values
--('VMPRTMNT', 'UDF-0000098', NULL, NULL, NULL, 'Topcoat 2', 5, NULL, 0, 'SK-Finish', NULL, 95, 0, NULL, 0.000000, 0, NULL)
--id = 'UDF-0000099'
```