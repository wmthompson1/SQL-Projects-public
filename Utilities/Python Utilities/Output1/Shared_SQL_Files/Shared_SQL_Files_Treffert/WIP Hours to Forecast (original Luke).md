# WIP Hours to Forecast (original Luke)

```sql
SELECT RESULT.[BUSINESS_UNIT]
                , RESULT.HOURS_WORKED
                , RESULT.MONTH_YEAR AS MONTH_YEAR
                , WB.BUDGET
                , CAST(ROUND(IIF(RESULT.ISPRORATED=1,(CONVERT(FLOAT,RESULT.HOURS_WORKED)/RESULT.BUDREQ1) * RESULT.BUDREQ2, CONVERT(FLOAT,RESULT.HOURS_WORKED)),0) AS DECIMAL(12,0)) - CAST(WB.BUDGET AS DECIMAL(12,2)) AS VARIANCEBUDGET
                -- PRECISION REQUIRED FOR DIVISION OF INTEGERS
                -- TEMPLATE USED FOR COPY PASTE
                , CAST(ROUND(IIF(RESULT.ISPRORATED=1,(CONVERT(FLOAT,RESULT.HOURS_WORKED)/RESULT.BUDREQ1) * RESULT.BUDREQ2, CONVERT(FLOAT,RESULT.HOURS_WORKED)),2) AS DECIMAL(12,2)) AS [RUNRATE]
FROM (SELECT INSIDE.BUSINESS_UNIT
                                , INSIDE.MONTH_YEAR
                                , SUM(INSIDE.HOURS_WORKED) AS HOURS_WORKED
                                , CAST(DATEDIFF(DAY,(EOMONTH ( GETDATE(), -1. )),GETDATE()) AS FLOAT) AS BUDREQ1
                                , CAST(DATEDIFF(DAY,(EOMONTH ( GETDATE(), -1 )),EOMONTH(GETDATE(),-0)) AS FLOAT) AS BUDREQ2
                                , CASE WHEN EOMONTH ( GETDATE(), -1 ) < INSIDE.MONTH_YEAR THEN 1 ELSE 0 END ISPRORATED
                                , EOMONTH(INSIDE.MONTH_YEAR,-0) ENDOFMONTH
                                , DATEADD(DAY,1,EOMONTH(INSIDE.MONTH_YEAR,-1)) FIRSTOFMONTH
                FROM (SELECT CASE    
                                                WHEN SR.USER_1 = 'B' THEN 'FINISH'
                                                WHEN SR.USER_1 = 'A' THEN 'FINISH'
                                                WHEN SR.USER_1 = 'M' THEN 'MANUFACTURING'
--                                               WHEN SR.SKILLS_TYPE = 'B' THEN 'FINISH'
--                                               WHEN SR.SKILLS_TYPE = 'A' THEN 'FINISH'
--                                               WHEN SR.SKILLS_TYPE = 'M' THEN 'MANUFACTURING'
                                END AS BUSINESS_UNIT
                                , LT.HOURS_WORKED AS HOURS_WORKED
                                , DATEFROMPARTS(YEAR(LT.TRANSACTION_DATE), MONTH(LT.TRANSACTION_DATE), 1) AS MONTH_YEAR
                                FROM LABOR_TICKET LT
                                INNER JOIN SHOP_RESOURCE SR
                                                ON LT.RESOURCE_ID = SR.ID
                                --             AND SR.[BUSINESS_UNIT] = WB.TYPEOF
                                WHERE LT.TRANSACTION_DATE >= '1/1/2019'
                                                AND SR.USER_1 IN ('A', 'B', 'M')
--                                                AND SR.SKILLS_TYPE IN ('A', 'B', 'M')
                                ) INSIDE
                GROUP BY INSIDE.BUSINESS_UNIT
                                , INSIDE.MONTH_YEAR
                ) AS RESULT
JOIN [WIPBUDGET] WB
                ON RESULT.MONTH_YEAR = WB.STARTDATE  
                AND RESULT.BUSINESS_UNIT = WB.TYPEOF

```