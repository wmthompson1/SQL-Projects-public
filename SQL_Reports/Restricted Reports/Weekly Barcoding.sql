SELECT DATEPART(WEEK, a.[Pay Date])-1 as 'Week', 
    FORMAT(DATEADD(week, DATEDIFF(week, -1, a.[Pay Date]), -1), 'MM-dd-yyyy') AS 'WEEKENDING', 
    a.[File Number], a.[Payroll Name] as 'Name', b.[Reports To Name], a.[Worked Department] as 'Direct/Indirect',
    b.[Job Title Description], b.[Position Status], sum(a.Hours) as 'Hours_ADP', l.Visual_Hours_Worked,
    l.Visual_Hours_Worked / sum(a.Hours) as 'Percentage'
FROM ADP_Labor a WITH (NOLOCK)
INNER JOIN LIVESupplemental.dbo.ADP_EMP b  WITH (NOLOCK) on a.[FILE NUMBER] = b.[File Number]
INNER JOIN ( SELECT DATEPART(WEEK, CLOCK_IN)-1 as 'Week', RIGHT('00000'+EMPLOYEE_ID, 6) as 'File_Number_LT', SUM(HOURS_WORKED) as 'Visual_Hours_Worked',
        FORMAT(DATEADD(week, DATEDIFF(week, -1, CLOCK_IN), -1), 'MM-dd-yyyy') as 'Week_Ending'
    FROM [LIVE].[dbo].[LABOR_TICKET] 
    WHERE DATEPART(WEEK, CLOCK_IN) >= DATEPART(WEEK, GETDATE())-5 AND DATEPART(YEAR, CLOCK_IN) = DATEPART(YEAR, GETDATE())
        AND HOURS_WORKED > 0 and UNADJ_CLOCK_OUT is not null and WORKORDER_BASE_ID IS NOT NULL
    GROUP BY DATEPART(WEEK, CLOCK_IN)-1, RIGHT('00000'+EMPLOYEE_ID, 6), FORMAT(DATEADD(week, DATEDIFF(week, -1, CLOCK_IN), -1), 'MM-dd-yyyy')
) l on a.[File Number] = l.File_Number_LT and FORMAT(DATEADD(week, DATEDIFF(week, -1, a.[Pay Date]), -1), 'MM-dd-yyyy') = l.Week_Ending

WHERE DATEPART(YEAR, [Pay Date]) = DATEPART(YEAR, GETDATE()) AND DATEPART(WEEK, [Pay Date]) >= DATEPART(WEEK, GETDATE()) -4
    AND b.[Position Status] = 'Active'
and len(a.[Earnings Code]) < 1
GROUP BY  DATEPART(WEEK, a.[Pay Date])-1, a.[File Number], a.[Payroll Name], b.[Reports To Name], a.[Worked Department],
    b.[Job Title Description], b.[Position Status], FORMAT(DATEADD(week, DATEDIFF(week, -1, a.[Pay Date]), -1), 'MM-dd-yyyy')
    , l.Visual_Hours_Worked
ORDER BY DATEPART(WEEK, a.[Pay Date])-1, a.[File Number]
