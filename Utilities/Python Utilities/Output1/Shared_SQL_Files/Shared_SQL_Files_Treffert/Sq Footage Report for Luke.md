# Sq Footage Report for Luke

```sql
use live 
go

--		AND UDF.ID = 'UDF-0000026'  -- part maint surface_area
--		AND UDF.ID = 'UDF-0000037'  -- part maint length
--		AND UDF.ID = 'UDF-0000038'  -- part maint width
--		AND UDF.ID = 'UDF-0000039'  -- part maint thickness

--drop table #traci1
--drop table #traci2
--drop table #traci3

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

select * from #traci2

SELECT
	co.ID,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	W.SUB_ID,
	W.[status] as WOStatus,
	W.part_id,
	CONVERT(VARCHAR(10),W.create_date,110) as WOCreateDate,
	W.DESIRED_QTY,
	o.sequence_no,
	o.resource_id,
	CONVERT(VARCHAR(10),isnull(min(LT.TRANSACTION_DATE),w.create_date),110) as [FirstLaborDate],
	year(isnull(min(LT.TRANSACTION_DATE),w.create_date)) as [FirstLaborYear],
	month(isnull(min(LT.TRANSACTION_DATE),w.create_date)) as [FirstLaborMonth],
	case	
		when month(isnull(min(LT.TRANSACTION_DATE),w.create_date)) in ('1', '2', '3')  then 'Q1'
		when month(isnull(min(LT.TRANSACTION_DATE),w.create_date)) in ('4', '5', '6')  then 'Q2'
		when month(isnull(min(LT.TRANSACTION_DATE),w.create_date)) in ('7', '8', '9')  then 'Q3'
		else 'Q4'
	end as FirstLaborQtr,
	SUM(W.DESIRED_QTY * t2.SurfaceArea) as PartSurfaceArea, 
	SUM(W.DESIRED_QTY * t2.SurfaceArea) + ISNULL(
		(
			SELECT 
				SUM(CP.DESIRED_QTY * t2.SurfaceArea) AS Expr1
			FROM 
				dbo.CO_PRODUCT AS CP
			INNER JOIN 
				#traci2 AS t2
					ON CP.PART_ID = t2.Part_ID
			WHERE
				(CP.WORKORDER_TYPE = 'W')
				AND (CP.WORKORDER_BASE_ID = W.BASE_ID)
				AND (CP.WORKORDER_LOT_ID = W.LOT_ID)
				AND (CP.WORKORDER_SPLIT_ID = W.SPLIT_ID)
		), 0) AS TotalSurfaceArea
INTO
	#traci3
--select *
FROM 
	dbo.WORK_ORDER AS W

LEFT OUTER JOIN
	DBO.OPERATION O
		ON W.TYPE             = O.WORKORDER_TYPE
		AND W.BASE_ID          = O.WORKORDER_BASE_ID
		AND W.LOT_ID           = O.WORKORDER_LOT_ID
		AND W.SPLIT_ID         = O.WORKORDER_SPLIT_ID
		AND W.SUB_ID           = O.WORKORDER_SUB_ID
		and o.RESOURCE_ID in ('AUB-1000', 'AUB-600', 'AUB-alo', 'AUB-ano', 'AUB-boric', 'AUB-chemstrip', 
								'AUB-emu', 'AUB-etch', 'AUB-PENetch', 'AUB-TurcoClean', 'BAL-sulf', 
								'BAL-1000', 'BAL-600', 'BAL-alo', 'BAL-ano', 'BAL-boric', 'BAL-chemstrip', 
								'BAL-emu', 'BAL-etch', 'BAL-PENetch', 'sulf')

LEFT OUTER JOIN 
	LABOR_TICKET LT
		ON O.WORKORDER_TYPE       = LT.WORKORDER_TYPE
		AND O.WORKORDER_BASE_ID    = LT.WORKORDER_BASE_ID
		AND O.WORKORDER_LOT_ID     = LT.WORKORDER_LOT_ID
		AND O.WORKORDER_SPLIT_ID   = LT.WORKORDER_SPLIT_ID
		AND O.WORKORDER_SUB_ID     = LT.WORKORDER_SUB_ID
		and o.sequence_no = lt.[OPERATION_SEQ_NO]
		AND LT.TRANSACTION_DATE >= '1/1/2012'

left outer JOIN 
	DEMAND_SUPPLY_LINK  dsl
		on  w.[BASE_ID] = dsl.[SUPPLY_BASE_ID]
		and w.[LOT_ID] = dsl.[SUPPLY_LOT_ID]
		and w.[SPLIT_ID] = dsl.[SUPPLY_SPLIT_ID]
		and w.[SUB_ID] = dsl.[SUPPLY_SUB_ID]
		and w.[PART_ID] = dsl.[SUPPLY_PART_ID]

LEFT OUTER JOIN
	CUSTOMER_ORDER co
		on dsl.[DEMAND_BASE_ID] = co.ID
		and dsl.[DEMAND_TYPE] = 'CO'

--LEFT OUTER JOIN
--	CUST_ORDER_LINE col
----		on co.ID = col.CUST_ORDER_ID
--		on  col.[CUST_ORDER_ID] = dsl.[DEMAND_BASE_ID]
--		and col.[LINE_NO] = dsl.[DEMAND_SEQ_NO]
--		and col.[part_id] = dsl.[DEMAND_PART_ID]

LEFT OUTER JOIN 
	#traci2 AS t2
		ON W.PART_ID = t2.Part_ID
WHERE
	(W.TYPE = 'W')
	AND (W.SUB_ID = 0)
	and o.status in ('r', 'c')
	and w.create_date >= '1/1/2012'
	--and w.base_id = '1256758R'
	--and o.SEQUENCE_NO = '300'
GROUP BY 
	co.ID,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	W.SUB_ID,
	W.[status],
	W.part_id,
	W.create_date,
	W.DESIRED_QTY,
	o.sequence_no,
	o.resource_id
ORDER BY 
	W.BASE_ID,
	W.Part_ID,
	o.sequence_no

SELECT
	FirstLaborYear,
	FirstLaborMonth,
	FirstLaborQtr,
	Resource_ID,
	sum(TotalSurfaceArea) as SurfaceArea
FROM
	#traci3

GROUP BY
	FirstLaborYear,
	FirstLaborMonth,
	FirstLaborQtr,
	Resource_ID
ORDER BY
	FirstLaborYear,
	FirstLaborMonth,
	FirstLaborQtr,
	Resource_ID

select part_id, count(*) from #traci3 where TotalSurfaceArea = '0.00' group by part_id order by part_id
select part_id, [FirstLaborYear], count(*) from #traci3 where TotalSurfaceArea = '0.00' group by part_id, [FirstLaborYear] order by part_id

drop table #traci4

select * from #traci3

select distinct base_id, lot_id, split_id, sub_id, part_id, wocreatedate, firstlabordate, firstlaboryear, totalsurfacearea 
into #traci4
from #traci3
where totalsurfacearea = '0'

select * from #traci4


select * from #traci4
where base_id = '309806'

select *
from 
(
  select part_id, FirstLaborYear, Count(*) as TotalCount
  from #traci4
  where TotalSurfaceArea = '0.00'
  group by part_id, [FirstLaborYear] 
) src
pivot
(
  sum(TotalCount)
  for FirstLaborYear in ([2012], [2013], [2014], [2015], [2016])
) piv;


select * from work_order where part_id = '453T1291-903'
select * from #traci3 where part_id = '453T1291-903'
```