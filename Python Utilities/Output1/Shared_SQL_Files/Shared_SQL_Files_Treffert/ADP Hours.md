# ADP Hours

```sql
USE LIVE
GO

SET DATEFIRST 1
SELECT CONVERT(DATE, SHIFT_DATE) AS VIS_SHIFT_DATE
	, EMPLOYEE_ID AS VIS_EMPLOYEE_ID
	, CONVERT(NVARCHAR(15), RIGHT('0000' + LT.EMPLOYEE_ID, 6)) AS VIS_EE_ID
	, SUM(CASE
		WHEN [TYPE] = 'I' AND WORKORDER_TYPE IS NULL THEN HOURS_WORKED
		ELSE 0
	END) AS VIS_INDIRECT_HOURS
	, SUM(CASE
		WHEN [TYPE] = 'S' THEN HOURS_WORKED 
		ELSE 0
	END) AS VIS_SETUP_HOURS
	, SUM(CASE
		WHEN [TYPE] = 'R' THEN HOURS_WORKED
		ELSE 0
	END) AS VIS_RUN_HOURS
	, SUM(HOURS_WORKED) AS VIS_HOURS_WORKED
	, SUM(HOURS_BREAK) AS VIS_HOURS_BREAK
	, SUM(HOURS_WORKED) + SUM(HOURS_BREAK) AS VIS_TOTAL_HOURS
FROM LIVE.dbo.LABOR_TICKET LT
WHERE LT.SHIFT_DATE >= '1/1/2019'
GROUP BY CONVERT(DATE, SHIFT_DATE)
, EMPLOYEE_ID

SELECT EE.[File Number]
	, EE.[Last Name]
	, EE.[First Name]
	, EE.[Preferred Name]
	, EE.[Position Status]
	, EE.[Location Code]
	, EE.[Location Description]
	, EE.[Home Department Code]
	, EE.[Home Department Description]
	, EE.[Reports To Name]
	, EE.[Job Title Description]
	, EE.[Job Title Code]
	, EE.[Assigned Shift Code]
	, EE.[Assigned Shift Description]
	, EE.[Job Class Code]
	, EE.[Hire Date]
	, EE.[Rehire Date]
	, EE.[Hire/Rehire Date]
	, EE.[Termination Date]
	, EE.[Termination Reason Code]
	, EE.[Termination Reason Description]
	, EE.[Status Flag 3 Code]
	, EE.[Status Flag 3 Description]
FROM [LIVESupplemental].[dbo].[ADP_EMP] EE

SET DATEFIRST 1
SELECT ADP.[File Number]
	, ADP.[Worked Department]
	, ADP.[Payroll Name]
	, ADP.[Pay Date]
	, CONVERT(NVARCHAR(4), YEAR([Pay Date])) + '-' + CONVERT(NVARCHAR(2), RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(WEEK, ADP.[Pay Date])), 2)) AS WEEKNUM
	, ADP.[Earnings Code]
	, ADP.[In Date]
	, ADP.[Time In]
	, ADP.[Out Date]
	, ADP.[Time Out]
	, ADP.[Hours]
	, CASE
		WHEN ADP.[Earnings Code] != '' THEN ADP.[Hours]
		ELSE 0
	END AS ADP_OTHER_HOURS
	, CASE
		WHEN ADP.[Earnings Code] = '' THEN ADP.[Hours]
		ELSE 0
	END AS ADP_HOURS
	, EE.SHIFT_ID
	, CASE
		WHEN S.ID = '01' THEN 8
		WHEN S.ID = '02' THEN 8
		WHEN S.ID = '03' THEN 8
		WHEN S.ID = '04' THEN 12
		WHEN S.ID = '05' THEN 10
		WHEN S.ID = '06' THEN 10
		WHEN S.ID = '07' THEN 11
		WHEN S.ID = '08' THEN 12
	END AS [SHIFT_HOURS]
FROM [LIVESupplemental].[dbo].ADP_LABOR ADP
LEFT OUTER JOIN LIVE.dbo.EMPLOYEE EE
ON CONVERT(NVARCHAR(15), RIGHT('0000' + EE.ID, 6)) = ADP.[File Number]
AND EE.ID NOT IN ('0104', '0148')
LEFT OUTER JOIN LIVE.dbo.[SHIFT] S
ON EE.SHIFT_ID = S.ID
WHERE ADP.[Hours] != 0
AND [Earnings Code] NOT IN ('FMLA', 'UNPAID', 'Time loss KOS')
order by [pay date]

```