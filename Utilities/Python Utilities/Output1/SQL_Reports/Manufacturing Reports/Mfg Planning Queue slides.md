# Mfg Planning Queue slides

```sql
-- VISUAL ENTERPRISE > CUSTOMER SERVICE REPORTS > BOEING REPORTS > Mfg Planning Queue slides
DECLARE @waiting_for NVARCHAR(MAX) = N'FLT PLAN'

SELECT TOP 19 CASE
        WHEN WO.STATUS = 'U' THEN 'ON HOLD'
        WHEN [dbo].[sfn_remaining_operations](WO.TYPE, WO.BASE_ID, WO.LOT_ID, WO.SPLIT_ID, WO.SUB_ID) IS NULL
            AND O.OPERATION_TYPE = 'REVIEW'
            THEN 'FLT BOM'
--        WHEN P.PLANNER_USER_ID = 'MRP'
        WHEN EXISTS        
            (SELECT 1    
            FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings EX    
            WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID    
                AND REPORT_NAME = 'Mfg Planning Queue slides'
                AND REPORT_SECTION = 'MRP'            
            )
            AND O.OPERATION_TYPE = 'REVIEW'
            THEN 'REPEAT PLAN'
        WHEN O.OPERATION_TYPE LIKE '%-REVIEW' THEN 'FLT PR'
--        WHEN P.PLANNER_USER_ID = 'NEW' 
        WHEN EXISTS        
            (SELECT 1    
            FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings EX    
            WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID    
                AND REPORT_NAME = 'Mfg Planning Queue slides'
                AND REPORT_SECTION = 'NEW'            
            )
            AND O.OPERATION_TYPE = 'REVIEW'
            THEN 'FLT PLAN'
        WHEN EXISTS
            (SELECT 1 FROM OPERATION oo 
            WHERE EXISTS
                (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
                WHERE s.Resource_ID = oo.RESOURCE_ID
                    AND s.Report_Name = 'Mfg Planning Queue slides'
                    AND s.Report_Section = 'FLT PLAN Resources'
                )
            AND oo.WORKORDER_BASE_ID = wo.BASE_ID
            AND oo.WORKORDER_LOT_ID = wo.LOT_ID
            AND oo.WORKORDER_SPLIT_ID = wo.SPLIT_ID
            AND oo.WORKORDER_SUB_ID = wo.SUB_ID
            AND oo.WORKORDER_TYPE = wo.TYPE
            AND O.OPERATION_TYPE = 'REVIEW'
            AND oO.SEQUENCE_NO > o.SEQUENCE_NO
            ) THEN 'FLT PLAN'
        ELSE '_blank'
    END AS WAITINGFOR
    , WO.PART_ID
    , WO.BASE_ID
    , WO.DESIRED_RLS_DATE
    , WO.DESIRED_WANT_DATE
    , O.RESOURCE_ID AS CURRENT_OP
    , [dbo].[sfn_remaining_operations](WO.TYPE, WO.BASE_ID, WO.LOT_ID, WO.SPLIT_ID, WO.SUB_ID) AS REMAINING_OPS
    , REPLACE(REPLACE(CONVERT(VARCHAR, A.CREATE_DATE, 100)+ ' ' + CAST(CAST(A.NOTE AS VARBINARY(MAX)) AS NVARCHAR(MAX)), CHAR(10),' '), CHAR(13),' ') AS WONOTEALL
    , PLANNER_USER_ID
    , OPERATION_TYPE
    , RESOURCE_ID
FROM WORK_ORDER WO
INNER JOIN OPERATION O
    ON WO.TYPE = O.WORKORDER_TYPE
    AND WO.BASE_ID = O.WORKORDER_BASE_ID
    AND WO.LOT_ID = O.WORKORDER_LOT_ID
    AND WO.SUB_ID = O.WORKORDER_SUB_ID
    AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
    AND CONVERT(VARCHAR(3), dbo.sfn_current_operation(WO.TYPE, WO.BASE_ID, WO.LOT_ID, WO.SUB_ID, WO.SPLIT_ID)) = O.SEQUENCE_NO
    AND O.OPERATION_TYPE NOT IN ('QP-NI', 'QP-REVIEW')
INNER JOIN PART P
    ON WO.PART_ID = P.ID
LEFT OUTER JOIN
    (SELECT N.*
    FROM NOTATION N
    JOIN
        (SELECT N.OWNER_ID
            , MAX(CREATE_DATE) AS MAXDATE
        FROM   NOTATION N
        WHERE  TYPE = 'E'
        GROUP BY N.OWNER_ID
        ) NMAX
        ON NMAX.OWNER_ID = N.OWNER_ID
        AND NMAX.MAXDATE = N.CREATE_DATE
    ) AS A
    ON A.OWNER_ID = WO.BASE_ID + '/' + WO.LOT_ID
WHERE WO.[TYPE] = 'W'
    AND WO.[STATUS] IN ('F','R','U')
    AND EXISTS
        (SELECT 1 
        FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
        WHERE s.Report_Name = 'Mfg Planning Queue Slides'
            AND s.Report_Section = 'REVIEW Resources'
            AND o.RESOURCE_ID = s.Resource_ID
        )
--        AND P.PLANNER_USER_ID IN ('MRP','NEW','PLAN','TOOL','TTO')
    AND EXISTS        
        (SELECT 1    
        FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings EX    
        WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID    
            AND REPORT_NAME = 'Mfg Planning Queue slides'
            AND REPORT_SECTION = 'ALL'            
        )
        AND REPLACE(CASE
            WHEN WO.[STATUS] = 'U' THEN 'ON HOLD'
            WHEN [dbo].[sfn_remaining_operations](WO.TYPE, WO.BASE_ID, WO.LOT_ID, WO.SPLIT_ID, WO.SUB_ID) IS NULL
                AND O.OPERATION_TYPE = 'REVIEW' THEN 'FLT BOM'
            WHEN P.PLANNER_USER_ID = 'MRP'
                AND O.OPERATION_TYPE = 'REVIEW'
                THEN 'REPEAT PLAN'
            WHEN O.OPERATION_TYPE LIKE '%-REVIEW' THEN 'FLT PR'
            WHEN EXISTS
                (SELECT 1 
                FROM OPERATION oo 
                WHERE EXISTS
                    (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
                    WHERE s.Resource_ID = oo.RESOURCE_ID
                        AND s.Report_Name = 'Mfg Planning Queue slides'
                        AND s.Report_Section = 'FLT PLAN Resources'
                    )
                    AND oo.WORKORDER_BASE_ID = wo.BASE_ID
                    AND oo.WORKORDER_LOT_ID = wo.LOT_ID
                    AND oo.WORKORDER_SPLIT_ID = wo.SPLIT_ID
                    AND oo.WORKORDER_SUB_ID = wo.SUB_ID
                    AND oo.WORKORDER_TYPE = wo.TYPE
                    AND O.OPERATION_TYPE = 'REVIEW'
                    AND oO.SEQUENCE_NO > o.SEQUENCE_NO
                ) THEN 'FLT PLAN'
            WHEN P.PLANNER_USER_ID = 'NEW'
                AND O.OPERATION_TYPE = 'REVIEW'
                THEN 'FLT PLAN'
            ELSE '_blank'
            END,', ',';') = @waiting_for
ORDER BY WO.DESIRED_WANT_DATE 

```