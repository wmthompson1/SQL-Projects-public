# Mfg Locked Planning Queue

```sql
-- Visual Enterprise Reports >  Manufacturing Reports > Mfg Locked Planning Queue
--DECLARE @DAYS AS INT
--SET @DAYS=7
--DECLARE @WAITINGFOR AS NVARCHAR(30)
--SET @WAITINGFOR = 'MFG-MRP'
;
WITH CTE_EC_MASTERS
AS 
(
SELECT EL.EC_ID,
       EL.LINE_NO, 
      EL.TYPE, 
       EL.WO_TYPE, 
      EL.WO_BASE_ID, 
      EL.WO_LOT_ID, 
      EL.WO_SPLIT_ID, 
      EC.CREATE_DATE, 
      CASE WHEN CAST(DATEDIFF(second, EC.CREATE_DATE,  GETDATE()) / 60 / 60 / 24 / 30 / 12 AS NVARCHAR(50)) >= 2
           THEN 'Red'
          WHEN CAST(DATEDIFF(second, EC.CREATE_DATE,  GETDATE()) / 60 / 60 / 24 / 30 / 12 AS NVARCHAR(50)) < 2 
           THEN 'Green'
      END AS YEARCHECK_COLOR
FROM EC
    INNER JOIN EC_LINE EL
       ON EC.ID = EL.EC_ID
       AND EL.STATUS NOT IN ('C', 'X')
       AND EL.WO_TYPE = 'M'
       )

SELECT WO.BASE_ID,
      WO.LOT_ID,
      WO.SUB_ID,
      WO.SPLIT_ID,
      dbo.sfnWONUMFormat(wo.BASE_ID, wo.LOT_ID, wo.SPLIT_ID, wo.SUB_ID) AS WONUM,
      WO.PART_ID,
      WO.[TYPE],
      CASE WHEN EXISTS
             (SELECT 1 FROM OPERATION o 
              WHERE EXISTS
                   (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
                   WHERE s.Resource_ID = o.RESOURCE_ID
                   AND s.Report_Name = N'Mfg Locked Planning Queue'
                   AND s.Report_Section = N'LOCKED PLAN Resources'
                   )
              AND o.WORKORDER_BASE_ID = wo.BASE_ID
              AND o.WORKORDER_LOT_ID = wo.LOT_ID
               AND o.WORKORDER_SPLIT_ID = wo.SPLIT_ID
              AND o.WORKORDER_SUB_ID = wo.SUB_ID
              AND o.WORKORDER_TYPE = wo.TYPE
            )
        THEN N'Locked Plan'
        ELSE N'_blank'
    END AS WAITINGFOR,
     P.BUYER_USER_ID, 
     WO.DESIRED_QTY,
     P.PLANNER_USER_ID,
     O.RESOURCE_ID, 
       WO.DESIRED_RLS_DATE,
      WO.DESIRED_WANT_DATE,
      WO.STATUS, 
      WO.ENGINEERED_BY,
--     O.OPERATION_TYPE,
     P.COMMODITY_CODE,
    --, [dbo].[SFN_REMAINING_OPERATIONS](WO.TYPE,WO.BASE_ID,WO.LOT_ID,WO.SPLIT_ID,WO.SUB_ID) AS REMAINING_OPS
     REPLACE(REPLACE(CONVERT( NVARCHAR,A.CREATE_DATE,100)+' '+CAST(CAST(A.NOTE AS VARBINARY(MAX)) AS NVARCHAR(MAX)),CHAR(10),' '),CHAR(13),' ') AS WONOTEALL,
    -- GETDATE() AS RUNDATE, 
     ECL.EC_ID,
     ECl.CREATE_DATE AS EC_CREATE_DATE,
    --  ECL.LINE_NO, 
     ECL.YEARCHECK_COLOR
FROM WORK_ORDER WO
INNER JOIN OPERATION O
    ON WO.[TYPE] = O.WORKORDER_TYPE
    AND WO.BASE_ID = O.WORKORDER_BASE_ID
    AND WO.LOT_ID = O.WORKORDER_LOT_ID
    AND WO.SUB_ID = O.WORKORDER_SUB_ID
    AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
    AND dbo.sfn_current_operation(WO.TYPE,WO.BASE_ID,WO.LOT_ID,WO.SUB_ID,WO.SPLIT_ID) = O.SEQUENCE_NO
    AND O.OPERATION_TYPE NOT IN (N'QP-NI', N'QP-REVIEW')
INNER JOIN PART_SITE_VIEW P
    ON WO.PART_ID = P.PART_ID
    AND P.SITE_ID = N'SK01'
INNER JOIN CTE_EC_MASTERS ECL
 ON ECL.WO_BASE_ID = WO.PART_ID 
 LEFT OUTER JOIN EC 
 ON EC.ID = ECL.EC_ID
LEFT OUTER JOIN
    (SELECT N.*
    FROM NOTATION N
    JOIN
        (SELECT N.OWNER_ID
            , MAX(CREATE_DATE) AS MAXDATE
        FROM NOTATION N
        WHERE [TYPE] = N'E'
        GROUP BY N.OWNER_ID
        ) NMAX
        ON NMAX.OWNER_ID = N.OWNER_ID
        AND NMAX.MAXDATE = N.CREATE_DATE
    ) AS A
    ON A.OWNER_ID = WO.BASE_ID + N'/' + WO.LOT_ID
WHERE WO.[TYPE] = N'W'
    AND WO.[STATUS] IN (N'F')
    AND DATEDIFF(DAY,DESIRED_RLS_DATE, GETDATE())>= @DAYS
    AND P.PLANNER_USER_ID IN (@WAITINGFOR )
    AND EXISTS
        (SELECT 1
        FROM LIVESupplemental.dbo.PLANNER_USER_ID_ReportSettings EX
        WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
            AND REPORT_NAME = N'Mfg Locked Planning Queue'
        )
     --AND O.RESOURCE_ID = 'P2M1-REVIEWCM'  -- replace by following when loaded.
    AND EXISTS
        (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
        WHERE s.Report_Name = N'Mfg Locked Planning Queue'
            AND s.Report_Section = N'LOCKED PLAN Resources'
            AND s.Resource_ID = O.RESOURCE_ID
        )

```