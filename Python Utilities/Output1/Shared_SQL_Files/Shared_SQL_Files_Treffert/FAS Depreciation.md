# FAS Depreciation

```sql
USE LIVESupplemental
GO

--1322-201906 / 1338


DECLARE @RUNDATE DATE = '7/31/2020'

-- HOME > Visual Enterprise Financial Reports > FAS Depreciation
-- =============================================
-- Author: traci treffret
-- Create date : 7/30/2020
-- Description : Dataset for Fixed Asset Depreciation
-- Notes : 
--> special coding for recent additions, lump sum dep values

SELECT @RUNDATE 
	, [Unique]
	, [Status]
	, [System number]
	, [Company Asset Number]
	, [Description]
	, [In Service Date]
	, [Acquisition Value]
	, [Asset Life Years]
	, CONVERT(FLOAT, [Asset Life Years]) * 12 AS [Asset Life Months]
	, [G/L Expense Account No] AS [Expense Account]
--	, EOMONTH(DATEADD(YEAR, CONVERT(FLOAT, [Asset Life Years]), [In Service Date])) AS [Final Depreciation Date]
	, EOMONTH(DATEADD(MONTH, [Asset Life Years] * 12, [In Service Date])) AS [Final Depreciation Date]
	, CASE
--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 6/30/2020
		WHEN [Unique] IN ('20-202002', '20-202003', '20-202004', '20-202005', '20-202006', '20-202007', '20-202008', '20-202009', '20-202010', '20-202012', '20-202014', '20-202015', '20-202016', '20-202017', '20-202018', '20-202019', '20-202020', '20-202021', '20-202022', '20-202023', '20-202024', '20-202025', '20-202026', '20-202027', '20-202028') AND @RUNDATE < '6/30/2020' 
			THEN 0
		WHEN [Unique] IN ('20-202002', '20-202003', '20-202004', '20-202005', '20-202006', '20-202007', '20-202008', '20-202009', '20-202010', '20-202012', '20-202014', '20-202015', '20-202016', '20-202017', '20-202018', '20-202019', '20-202020', '20-202021', '20-202022', '20-202023', '20-202024', '20-202025', '20-202026', '20-202027', '20-202028') AND @RUNDATE = '6/30/2020' 
			THEN [Accumulated Dep] -- Accum only, no monthly added 
--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 7/30/2020
		WHEN [Unique] IN ('20-202029', '20-202030', '20-202031', '20-202032', '20-202033', '20-202034') AND @RUNDATE < '7/31/2020' 
			THEN 0
		WHEN [Unique] IN ('20-202029', '20-202030', '20-202031', '20-202032', '20-202033', '20-202034') AND @RUNDATE = '7/31/2020' 
--			THEN [Accumulated Dep] + [Acquisition Value] / (CONVERT(FLOAT, [Asset Life Years]) * 12)
			THEN [Accumulated Dep] + [Acquisition Value] / ([Asset Life Years] * 12)
		WHEN @RUNDATE <= [IN SERVICE DATE] THEN 0
		WHEN EOMONTH(DATEADD(MONTH, [Asset Life Years] * 12, [In Service Date])) >= @RUNDATE
			THEN [Acquisition Value] / ([Asset Life Years] * 12)
		ELSE 0
	END AS [Depreciation This Run]

	, CASE
--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 6/30/2020
		WHEN [Unique] IN ('20-202002', '20-202003', '20-202004', '20-202005', '20-202006', '20-202007', '20-202008', '20-202009', '20-202010', '20-202012', '20-202014', '20-202015', '20-202016', '20-202017', '20-202018', '20-202019', '20-202020', '20-202021', '20-202022', '20-202023', '20-202024', '20-202025', '20-202026', '20-202027', '20-202028') AND @RUNDATE <= '6/30/2020' 
			THEN 0
--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 7/30/2020
		WHEN [Unique] IN ('20-202029', '20-202030', '20-202031', '20-202032', '20-202033', '20-202034') AND @RUNDATE <= '7/31/2020' 
			THEN 0
		WHEN @RUNDATE <= [IN SERVICE DATE] THEN 0
		WHEN EOMONTH(DATEADD(MONTH, [Asset Life Years] * 12, [In Service Date])) >= @RUNDATE
			THEN (CONVERT(INTEGER, DATEDIFF(MONTH, [In Service Date], DATEADD(MONTH, -1, @RUNDATE))) * [Acquisition Value]) / ([Asset Life Years] * 12)
		ELSE [Acquisition Value]
	END AS [Accumulate Depreciation]
FROM LIVESupplemental.dbo.[FixedAssets]
WHERE [STATUS] IN (@STATUS)


SELECT [Expense Account]
, SUM([Depreciation This Run])
FROM 
	(SELECT [G/L Expense Account No] AS [Expense Account]
		, CASE
	--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 6/30/2020
			WHEN [Unique] IN ('20-202002', '20-202003', '20-202004', '20-202005', '20-202006', '20-202007', '20-202008', '20-202009', '20-202010', '20-202012', '20-202014', '20-202015', '20-202016', '20-202017', '20-202018', '20-202019', '20-202020', '20-202021', '20-202022', '20-202023', '20-202024', '20-202025', '20-202026', '20-202027', '20-202028') AND @RUNDATE < '6/30/2020' 
				THEN 0
			WHEN [Unique] IN ('20-202002', '20-202003', '20-202004', '20-202005', '20-202006', '20-202007', '20-202008', '20-202009', '20-202010', '20-202012', '20-202014', '20-202015', '20-202016', '20-202017', '20-202018', '20-202019', '20-202020', '20-202021', '20-202022', '20-202023', '20-202024', '20-202025', '20-202026', '20-202027', '20-202028') AND @RUNDATE = '6/30/2020' 
				THEN [Accumulated Dep] -- Accum only, no monthly added 
	--> FOUND ASSETS, NO DEPRECIATION RECORDED BEFORE 7/30/2020
			WHEN [Unique] IN ('20-202029', '20-202030', '20-202031', '20-202032', '20-202033', '20-202034') AND @RUNDATE < '7/31/2020' 
				THEN 0
			WHEN [Unique] IN ('20-202029', '20-202030', '20-202031', '20-202032', '20-202033', '20-202034') AND @RUNDATE = '7/31/2020' 
	--			THEN [Accumulated Dep] + [Acquisition Value] / (CONVERT(FLOAT, [Asset Life Years]) * 12)
				THEN [Accumulated Dep] + [Acquisition Value] / ([Asset Life Years] * 12)
			WHEN @RUNDATE <= [IN SERVICE DATE] THEN 0
			WHEN EOMONTH(DATEADD(MONTH, [Asset Life Years] * 12, [In Service Date])) >= @RUNDATE
				THEN [Acquisition Value] / ([Asset Life Years] * 12)
			ELSE 0
		END AS [Depreciation This Run]
	FROM LIVESupplemental.dbo.[FixedAssets]
	) X
GROUP BY [Expense Account]
ORDER BY [Expense Account]
```