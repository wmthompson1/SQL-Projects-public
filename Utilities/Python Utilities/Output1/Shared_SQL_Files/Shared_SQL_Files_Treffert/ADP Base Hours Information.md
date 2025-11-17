# ADP Base Hours Information

```sql
USE DataWarehouse
GO

SET DATEFIRST 1;

--> ADP HOURS FROM DAILY IMPORT
SELECT EE.[File Number]
	, EE.[FIRST NAME]
	, EE.[LAST NAME]
	, EE.[REPORTS TO NAME]
	, EE.[LOCATION CODE]
	, YEAR([Pay Date]) AS [YEAR]
	, DATEPART(WW, DATEADD(WEEK, DATEDIFF(WEEK, 0, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE))), -1)) AS [WEEK]
	, DATEADD(DAY, 8 - DATEPART(WEEKDAY, [Pay Date]), CAST([Pay Date] AS DATE)) [WEEKEND]
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
FROM DataWarehouse.SimpleWarehouse.ADP_LABOR HRS
LEFT OUTER JOIN  [SQL-LAB-2].LIVESupplemental.dbo.ADP_EMP EE
	ON HRS.[File Number] = EE.[FILE NUMBER]
GROUP BY EE.[File Number]
	, EE.[FIRST NAME]
	, EE.[LAST NAME]
	, EE.[REPORTS TO NAME]
	, EE.[LOCATION CODE]
	, HRS.[Pay Date]
```