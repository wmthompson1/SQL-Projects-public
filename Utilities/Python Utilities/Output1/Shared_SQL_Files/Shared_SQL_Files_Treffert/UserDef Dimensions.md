# UserDef Dimensions

```sql
--		AND UDF.ID = 'UDF-0000026'  -- part maint surface_area
--		AND UDF.ID = 'UDF-0000037'  -- part maint length
--		AND UDF.ID = 'UDF-0000038'  -- part maint width
--		AND UDF.ID = 'UDF-0000039'  -- part maint thickness

use live 
go

--drop table #traci0
--drop table #traci1
--drop table #traci2

--select *
----into #traci0
--from 
--(
--  select [DOCUMENT_ID], [ID], NUMBER_VAL
--  from USER_DEF_FIELDS
--  where PROGRAM_ID = 'VMPRTMNT' 
--		AND ID in ('UDF-0000026','UDF-0000037','UDF-0000038','UDF-0000039')
--) src
--pivot
--(
--  avg(NUMBER_VAL)
--  for [ID] in ([UDF-0000026], [UDF-0000037], [UDF-0000038], [UDF-0000039])
--) piv;


--select *
--from USER_DEF_FIELDS
--where PROGRAM_ID = 'VMPRTMNT' 
--	AND [DOCUMENT_ID] = '-142U911'



SELECT
	ID AS Part_ID,
	(
	SELECT
		ISNULL(PUD.NUMBER_VAL, 0) AS Expr1
	FROM
		dbo.PART AS P1 
	LEFT OUTER JOIN
		dbo.USER_DEF_FIELDS AS PUD 
			ON P1.ID = PUD.DOCUMENT_ID 
			AND PUD.PROGRAM_ID = 'VMPRTMNT' 
			AND PUD.ID = 'UDF-0000037'
	WHERE
		(P1.ID = p.ID)
	) AS [Length],
	(
	SELECT
		ISNULL(PUD.NUMBER_VAL, 0) AS Expr1
	FROM
		dbo.PART AS P1 
	LEFT OUTER JOIN
		dbo.USER_DEF_FIELDS AS PUD 
			ON P1.ID = PUD.DOCUMENT_ID 
			AND PUD.PROGRAM_ID = 'VMPRTMNT' 
			AND PUD.ID = 'UDF-0000038'
	WHERE
		(P1.ID = p.ID)
	) AS [Width],
	(
	SELECT
		ISNULL(PUD.NUMBER_VAL, 0) AS Expr1
	FROM
		dbo.PART AS P1 
	LEFT OUTER JOIN
		dbo.USER_DEF_FIELDS AS PUD 
			ON P1.ID = PUD.DOCUMENT_ID 
			AND PUD.PROGRAM_ID = 'VMPRTMNT' 
			AND PUD.ID = 'UDF-0000039'
	WHERE
		(P1.ID = p.ID)
	) AS [Thickness],
	(
	SELECT
		ISNULL(PUD.NUMBER_VAL, 0) AS Expr1
	FROM
		dbo.PART AS P1 
	LEFT OUTER JOIN
		dbo.USER_DEF_FIELDS AS PUD 
			ON P1.ID = PUD.DOCUMENT_ID 
			AND PUD.PROGRAM_ID = 'VMPRTMNT' 
			AND PUD.ID = 'UDF-0000026'
	WHERE
		(P1.ID = p.ID)
	) AS [Entered_SA]
INTO
	#traci1
FROM         
	dbo.PART AS p

select 
	*,
	(([Length] * [Width] *2) + ([Length] * [Thickness] *2) + ([Width] * [Thickness] *2)) as [Calculated_SA],
	case
		when (([Length] * [Width] *2) + ([Length] * [Thickness] *2) + ([Width] * [Thickness] *2)) = 0 then [Entered_SA]
		else (([Length] * [Width] *2) + ([Length] * [Thickness] *2) + ([Width] * [Thickness] *2))
	end as SurfaceArea
INTO 
	#traci2
from 
	#traci1
order by 
	part_id

select *
from #traci2


```