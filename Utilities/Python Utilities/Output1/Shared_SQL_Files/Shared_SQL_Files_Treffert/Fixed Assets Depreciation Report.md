# Fixed Assets Depreciation Report

```sql
USE LIVESupplemental
GO

-- HOME > Visual Enterprise Financial Reports > FAS Depreciation
-- =============================================
-- Author: traci treffert
-- Create date : 7/30/2020
-- Description : Dataset for Fixed Asset Depreciation
-- Notes : 
--> special coding for recent additions, lump sum dep values

DECLARE @RUNDATE DATE = '3/31/2021'

; WITH CTE_BASE AS
(SELECT [Unique]
	, [GL]
	, [Location]
	, [Reference No]
	, [Description]
	, CONVERT(CHAR(10), [Acq Date], 101) AS [Acq_Date]
	, [Date IfDiff]
	, [Cost Basis]
	, [Additions]
	, [Disposed]
	, [Method]
	, CAST([Ending Cost] AS NUMERIC) as [Ending Cost]
	, ROUND(CAST([Ending Cost] AS NUMERIC), 2) AS [Acquisition_Cost]
	, CONVERT(CHAR(10), [Depreciation Start], 101) AS [Depreciation Start]
	, CONVERT(CHAR(10), [Depreciation Ending], 101) AS [Depreciation End]
	, CAST([Life] AS NUMERIC) AS [Life]
	, CAST([Life] AS NUMERIC) * 12 AS [Months]
	, IIF(LIfe = 0
		, 0
		, IIF(DATEDIFF(M, [Depreciation Start], @RUNDATE) >= CAST([Life] AS NUMERIC) * 12
			, 0
			, (CAST([Life] AS NUMERIC) * 12 - DATEDIFF(M, [Depreciation Start], @RUNDATE)) 
		)
	) AS [Months Remaining]
	, ROUND(CAST(AccumDepThru20201130 AS NUMERIC), 2) AS AccumDepThru20201130
	, ROUND(CAST(DepFor20201231 AS NUMERIC), 2) AS DepFor20201231
	, ROUND(CAST(TotalAccumDepThru2020 AS NUMERIC), 2) AS TotalAccumDepThru2020
	, IIF(Life = 0
		, 0
		, ROUND(([Ending Cost] / (CAST([Life] AS NUMERIC) * 12)), 2)
	) AS [Monthly_Depreciation]
FROM FixedAssets
) 

, CTE_DEP AS
(SELECT * 
, CASE
	WHEN [Life] = 0 THEN [Acquisition_Cost] 
	WHEN TotalAccumDepThru2020 >= [Acquisition_Cost] THEN [Acquisition_Cost]
	WHEN ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Acquisition_Cost] THEN [Acquisition_Cost]
	ELSE (DATEDIFF(MM,'12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020
END AS [Accumulated Depreciation]
, CASE
	WHEN [Life] = 0 THEN 0
	WHEN TotalAccumDepThru2020 = [Acquisition_Cost] THEN 0 
	WHEN ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Acquisition_Cost] THEN 0
	WHEN [Acquisition_Cost] - ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Monthly_Depreciation] THEN [Monthly_Depreciation]
	ELSE [Acquisition_Cost] - ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) 
END AS [Current Depreciation]		
--> AUDITING
, @RUNDATE AS RUNDATE
, (DATEDIFF(MM, '12/31/2020', @RUNDATE)) AS MONTHSINCE2020
, [Acquisition_Cost] AS [AcquisitionCost]
, ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) AS PREVDEPR
, [Acquisition_Cost] - ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) AS REMAINDER
, [Monthly_Depreciation] AS [MonthlyDepreciation] 
FROM CTE_BASE
--WHERE [UNIQUE] = '1977-1'
)

SELECT * 
, [Acquisition_Cost] - [Accumulated Depreciation] AS [REMAINING]
FROM CTE_DEP
--WHERE [UNIQUE] IN ('2016-22', '2016-23', '2016-24', '2016-26')


--, (DATEDIFF(MM, '12/31/2020', @RUNDATE)) AS MONTHSINCE2020
--, (DATEDIFF(MM, '12/31/2020', @RUNDATE)) * [Monthly_Depreciation] AS DEPRFOR2021
--, TotalAccumDepThru2020 as TotalAccDepThru2020
--, ((DATEDIFF(MM, '12/31/2020', @RUNDATE)) * [Monthly_Depreciation] + TotalAccumDepThru2020) AS TOTALDEPR
--, (((DATEDIFF(MM, '12/31/2020', @RUNDATE)) * [Monthly_Depreciation] + TotalAccumDepThru2020) 
--	- ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020)) AS CURRDEPR
--, CASE
--	WHEN [Life] = 0 THEN 0
--	WHEN TotalAccumDepThru2020 = [Acquisition_Cost] THEN 0 
----	WHEN ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Acquisition_Cost] THEN 0
--	WHEN ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Acquisition_Cost] THEN 0
--	WHEN [Acquisition_Cost] - ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020) >= [Monthly_Depreciation]  THEN [Monthly_Depreciation]
--	--ELSE (((DATEDIFF(MM, '12/31/2020', @RUNDATE)) * [Monthly_Depreciation] + TotalAccumDepThru2020) 
--	--	- ((DATEDIFF(MM, '12/31/2020', @RUNDATE) - 1) * [Monthly_Depreciation] + TotalAccumDepThru2020))
--END AS [Current Depreciation]		


select * from FixedAssets where [Ending Cost] is null
```