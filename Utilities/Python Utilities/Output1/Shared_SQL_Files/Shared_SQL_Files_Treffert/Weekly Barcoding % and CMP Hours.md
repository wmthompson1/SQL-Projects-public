# Weekly Barcoding % and CMP Hours

```sql
USE LIVE
GO

DECLARE @STARTDATE DATE = '11/9/2020'
, @ENDDATE DATE = '11/16/2020'

SET DATEFIRST 1;
--> ADP HOURS FROM DAILY IMPORT
; WITH CTE_LABOR AS 
(SELECT [File Number]
	, YEAR([Pay Date]) AS [YEAR]
	, DATEPART(WW, DATEADD(WEEK, DATEDIFF(WEEK, 0, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE))), -1)) AS [WEEK]
	, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE)) AS [WEEKEND]
	, [Worked Department]
	, [Pay Date]
	, SUM(CASE
		WHEN [Earnings Code] = '' THEN [Hours]
		WHEN [Earnings Code] = 'HOLIDAY' THEN [Hours]
		ELSE 0
	END) AS [ADP_WORK_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'SICK' THEN [Hours]
		ELSE 0
	END) AS [ADP_SICK_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'VACATION' THEN [Hours]
		ELSE 0
	END) AS [ADP_VAC_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'HOLIDAY' THEN [Hours]
		ELSE 0
	END) AS [ADP_HOL_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'JURY' THEN [Hours]
		ELSE 0
	END) AS [ADP_JURY_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'BEREAV' THEN [Hours]
		ELSE 0
	END) AS [ADP_BEREAV_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'WORKERSCOMP' THEN [Hours]
		ELSE 0
	END) AS [ADP_WC_TIME]
	, SUM(CASE
		WHEN [Earnings Code] = 'Time loss KOS' THEN [Hours]
		ELSE 0
	END) AS [ADP_KOS_TIME]
	, SUM(CASE
		WHEN [Earnings Code] IN ('ABSENT', 'FMLA', 'Unpaid') THEN 0
		ELSE [Hours]
	END) AS [ADP_TOTAL_HOURS]
FROM LIVESupplemental.dbo.ADP_LABOR 
WHERE [Pay Date] >= @STARTDATE
AND [Pay Date] < @ENDDATE
GROUP BY [File Number]
	, YEAR([Pay Date]) 
	, DATEPART(WW, DATEADD(WEEK, DATEDIFF(WEEK, 0, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE))), -1))
	, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE))
	, [Worked Department]
	, [Pay Date]
)
--SELECT * FROM CTE_LABOR WHERE [File Number] = '001914'

, CTE_LT AS
(SELECT EMPLOYEE_ID
	, CONVERT(DATE, CLOCK_IN) AS CLOCK_DATE
	, CASE
		WHEN CO.CUSTOMER_ID = 'BOE609' THEN 'CMP'
		ELSE 'OTHER'
	END AS CUSTOMER
	, SUM(HOURS_WORKED) AS HOURS_WORKED
FROM LIVE.dbo.LABOR_TICKET LT
Left Outer Join [LIVE].[dbo].DEMAND_SUPPLY_LINK DSL
	on LT.WORKORDER_BASE_ID = DSL.SUPPLY_BASE_ID
	and LT.WORKORDER_LOT_ID = DSL.SUPPLY_LOT_ID
	and LT.WORKORDER_SUB_ID = DSL.SUPPLY_SUB_ID
	and LT.WORKORDER_SPLIT_ID = DSL.SUPPLY_SPLIT_ID
	and DSL.SUPPLY_TYPE = 'WO'
Left Outer Join [Live].[dbo].CUSTOMER_ORDER CO
	on CO.ID = DSL.DEMAND_BASE_ID 
WHERE CLOCK_IN >= @STARTDATE
AND CLOCK_IN < @ENDDATE
AND LT.WORKORDER_BASE_ID != ''
GROUP BY EMPLOYEE_ID
	, CONVERT(DATE, CLOCK_IN)
	, CASE
		WHEN CO.CUSTOMER_ID = 'BOE609' THEN 'CMP'
		ELSE 'OTHER'
	END
)
--SELECT * FROM CTE_LT WHERE [EMPLOYEE_ID] = '1377'

--SELECT * From CTE_LABOR L WHERE [file number] = '001377'

Select L.[File Number]
, E.[First Name]
, E.[Last Name]
, L.[Worked Department]
, E.[Reports To Name]
, SUM(L.[ADP_WORK_TIME]) AS 'ADP_Hours_Worked'
, ISNULL(SUM(CMP.Hours_Worked), 0) AS 'CMP_Direct_Hours'
, (ISNULL(SUM(CMP.Hours_Worked), 0) / Sum(L.[ADP_WORK_TIME])) AS 'CMP_Barcoding_%'
, ISNULL(SUM(LT.Hours_Worked), 0) AS 'OTHER_Direct_Hours'
, (ISNULL(SUM(LT.Hours_Worked), 0) / Sum(L.[ADP_WORK_TIME])) AS 'OTHER_Barcoding_%'
, ISNULL(SUM(LT.Hours_Worked), 0) + ISNULL(SUM(CMP.Hours_Worked), 0) AS 'TOTAL_Direct_Hours'
, (ISNULL(SUM(LT.Hours_Worked), 0) + ISNULL(SUM(CMP.Hours_Worked), 0)) / Sum(L.[ADP_WORK_TIME]) AS 'TOTAL_Barcoding_%'
From CTE_LABOR L
Left Outer Join CTE_LT CMP
	ON CONVERT(NVARCHAR(15), RIGHT('0000' + CMP.EMPLOYEE_ID, 6)) = L.[File Number]
	AND L.[Pay Date] = CMP.CLOCK_DATE
	AND CMP.CUSTOMER = 'CMP'
Left Outer Join CTE_LT LT
	ON CONVERT(NVARCHAR(15), RIGHT('0000' + LT.EMPLOYEE_ID, 6)) = L.[File Number]
	AND L.[Pay Date] = LT.CLOCK_DATE
	AND LT.CUSTOMER = 'OTHER'
Left Outer Join LIVESupplemental.dbo.ADP_EMP E
	on E.[File Number] = L.[File Number]
WHERE L.[ADP_WORK_TIME] > 0
GROUP BY L.[File Number]
	, E.[First Name]
	, E.[Last Name]
	, L.[Worked Department]
	, E.[Reports To Name]
ORDER BY L.[File Number]

```