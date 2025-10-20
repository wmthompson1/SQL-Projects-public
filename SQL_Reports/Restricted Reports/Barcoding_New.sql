--DECLARE @WeekEnding = '2025-04-20', @EMP VARCHAR(12) = '000157'

  /****** Script for ADP Hrs Worked and MAIN QUERY ******/
SELECT A.[File Number], B.[First Name], B.[Last Name], A.[Worked Department] AS 'Department', 
    B.[Reports To Name] AS 'Supervisor', SUM(A.[Hours]) AS 'ADP Hrs Worked', 
    IIF(LT.Visual_HRS_W IS NULL, 0, LT.Visual_HRS_W) AS 'Visual_HRS_W',
    IIF(CMP.CMP_Hrs IS NULL, 0, CMP.CMP_Hrs) AS 'CMP_Hrs',
    CASE
        WHEN SUM(A.[Hours]) = 0 THEN 0
        ELSE IIF(LT.Visual_HRS_W IS NULL, 0, LT.Visual_HRS_W/SUM(A.[Hours]))
    END AS 'Barcode_Perctg',
    CASE 
        WHEN LT.Visual_HRS_W IS NULL THEN 0
        WHEN LT.Visual_HRS_W = 0 THEN 0
        ELSE IIF(CMP.CMP_Hrs IS NULL, 0, CMP.CMP_Hrs) / LT.Visual_HRS_W
    END AS 'CMP_Perctg',
    DATEPART(WEEK, DATEADD(DAY, -1, A.[Pay Date])) as 'Week_BC', 
    CONVERT(VARCHAR(12), DATEADD(DAY, 8 - 
        DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date])
    ), 23) AS 'WEEKENDING',
    DATEADD(DAY, 8 - 
        DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date])
    ) AS 'WEEKENDING_2_DT'
FROM [LIVESupplemental].[dbo].[ADP_Labor] A  /****** Script for ADP Hrs Worked  ******/
INNER JOIN [LIVESupplemental].[dbo].[ADP_EMP] B ON A.[File Number] = B.[File Number]

/****** JOIN for VISUAL Hrs Worked  ******/
LEFT JOIN (    
    SELECT SUM(HOURS_WORKED) AS 'Visual_HRS_W', RIGHT('00000'+EMPLOYEE_ID, 6) as 'File_Number_LT', 
        CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, TRANSACTION_DATE)), DATEADD(DAY, -1, TRANSACTION_DATE)
        ), 23) AS 'WEEKENDING'
    FROM  [LIVE].[dbo].[LABOR_TICKET] WHERE TYPE IN ('R', 'S') AND TRANSACTION_DATE >= '2025-01-01' 
    /* 
        AND CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, TRANSACTION_DATE)), DATEADD(DAY, -1, TRANSACTION_DATE)
        ), 23) = @WeekEnding
    */
    GROUP BY RIGHT('00000'+EMPLOYEE_ID, 6), 
        CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, TRANSACTION_DATE)), DATEADD(DAY, -1, TRANSACTION_DATE)
        ), 23)
) LT ON A.[File Number] = LT.File_Number_LT AND 
    LT.WEEKENDING = DATEADD(DAY, 8 - DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date]))

/****** JOIN for CMP Hrs Worked  ******/
LEFT JOIN(
    SELECT SUM(L.HOURS_WORKED) AS 'CMP_Hrs', RIGHT('00000'+L.EMPLOYEE_ID, 6) as 'File_Number_CMP', 
        CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, L.TRANSACTION_DATE)), DATEADD(DAY, -1, L.TRANSACTION_DATE)
        ), 23) AS 'WeekEnding_CMP'
    FROM  [LIVE].[dbo].[LABOR_TICKET] L
    WHERE L.TYPE IN ('R', 'S') AND L.TRANSACTION_DATE >= '2025-01-01' 
        /*
            AND CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, L.TRANSACTION_DATE)), DATEADD(DAY, -1, L.TRANSACTION_DATE)
            ), 23) = @WeekEnding
        */
        AND L.WORKORDER_BASE_ID IN (
            SELECT DISTINCT D.SUPPLY_BASE_ID FROM [LIVE].[dbo].[DEMAND_SUPPLY_LINK] D WITH (NOLOCK)
            INNER JOIN LIVE.dbo.CUSTOMER_ORDER CO ON D.DEMAND_BASE_ID = CO.ID
            WHERE SUPPLY_TYPE = 'WO' AND DEMAND_TYPE = 'CO' AND CO.CUSTOMER_ID = 'BOE609'
        )
    GROUP BY RIGHT('00000'+EMPLOYEE_ID, 6),
        CONVERT(VARCHAR(12), DATEADD(DAY, 8 
            - DATEPART(WEEKDAY, DATEADD(DAY, -1, L.TRANSACTION_DATE)), DATEADD(DAY, -1, L.TRANSACTION_DATE)
        ), 23)
) CMP ON A.[File Number] = CMP.File_Number_CMP AND 
    CMP.WeekEnding_CMP = DATEADD(DAY, 8 - DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date]))

WHERE LEN(A.[Earnings Code]) = 0 --A.[File Number] = @EMP AND
GROUP BY A.[File Number], B.[First Name], B.[Last Name], A.[Worked Department], 
    B.[Reports To Name], DATEPART(WEEK, DATEADD(DAY, -1, A.[Pay Date])), Visual_HRS_W, CMP.CMP_Hrs,
    DATEADD(DAY, 8 - DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date]))


/*
SELECT A.[File Number], B.[First Name], B.[Last Name], A.[Worked Department] AS 'Department', 
    B.[Reports To Name] AS 'Supervisor', SUM(A.[Hours]) AS 'ADP Hrs Worked', 
    IIF(LT.Visual_HRS_W IS NULL, 0, LT.Visual_HRS_W) AS 'Visual_HRS_W',
    IIF(LT.Visual_HRS_W IS NULL, 0, LT.Visual_HRS_W/SUM(A.[Hours])) AS 'Barcode_%',
    DATEPART(WEEK, DATEADD(DAY, -1, A.[Pay Date])) as 'Week_BC', 
    DATEADD(DAY, 8 - 
        DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date])
    ) AS 'WEEKENDING'
FROM [LIVESupplemental].[dbo].[ADP_Labor] A
INNER JOIN [LIVESupplemental].[dbo].[ADP_EMP] B ON A.[File Number] = B.[File Number]
LEFT JOIN (    
    SELECT SUM(HOURS_WORKED) AS 'Visual_HRS_W', RIGHT('00000'+EMPLOYEE_ID, 6) as 'File_Number_LT', 
    CONVERT(VARCHAR(12), DATEADD(DAY, 8 
        - DATEPART(WEEKDAY, DATEADD(DAY, -1, TRANSACTION_DATE)), DATEADD(DAY, -1, TRANSACTION_DATE)
    ), 23) AS 'WEEKENDING'
    FROM  [LIVE].[dbo].[LABOR_TICKET] 
    WHERE TRANSACTION_DATE >= '2025-01-01' AND TYPE IN ('R', 'S')
    GROUP BY RIGHT('00000'+EMPLOYEE_ID, 6), 
    CONVERT(VARCHAR(12), DATEADD(DAY, 8 
        - DATEPART(WEEKDAY, DATEADD(DAY, -1, TRANSACTION_DATE)), DATEADD(DAY, -1, TRANSACTION_DATE)
    ), 23)
) LT ON A.[File Number] = LT.File_Number_LT AND 
    LT.WEEKENDING = DATEADD(DAY, 8 - DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date]))
WHERE LEN(A.[Earnings Code]) = 0 
    /* AND A.[File Number] = @EMP AND
    DATEADD(DAY, 8 - 
        DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date])
    ) = @DATE
    */
GROUP BY A.[File Number], B.[First Name], B.[Last Name], A.[Worked Department], 
    B.[Reports To Name], DATEPART(WEEK, DATEADD(DAY, -1, A.[Pay Date])), Visual_HRS_W,
    DATEADD(DAY, 8 - DATEPART(WEEKDAY, DATEADD(DAY, -1, A.[Pay Date])), DATEADD(DAY, -1, A.[Pay Date]))
*/
