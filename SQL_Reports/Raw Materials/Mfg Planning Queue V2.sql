/*    [SQL-LAB-1].[LIVE]    */
-- VISUAL ENTERPRISE > CUSTOMER SERVICE REPORTS > BOEING REPORTS > Mfg Planning Queue
DECLARE @days_out AS INT 
set @days_out = 7


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

/*********************************************************
  TEMP TABLES FOR UDF fields and raw material inventory
**********************************************************/
IF OBJECT_ID('tempdb..#FAI_COMPLETE') IS NOT NULL DROP TABLE #FAI_COMPLETE
IF OBJECT_ID('tempdb..#FAI_INITIALS') IS NOT NULL DROP TABLE #FAI_INITIALS
IF OBJECT_ID('tempdb..#FAI_DATE') IS NOT NULL DROP TABLE #FAI_DATE
IF OBJECT_ID('tempdb..#RAW_MATERIAL') IS NOT NULL DROP TABLE #RAW_MATERIAL
IF OBJECT_ID('tempdb..#PLANNING_QUEUE') IS NOT NULL DROP TABLE #PLANNING_QUEUE

    SELECT * 
    INTO #FAI_COMPLETE
    FROM [SQL-LAB-2].[LIVE].dbo.USER_DEF_FIELDS UDF
    WHERE PROGRAM_ID = 'VMMFGWIN_WO'
        AND UDF.ID = 'UDF-0000086' AND LABEL IS NULL
    --SELECT * FROM #FAI_COMPLETE

    SELECT * 
    INTO #FAI_INITIALS
    FROM [SQL-LAB-2].[LIVE].dbo.USER_DEF_FIELDS UDF
    WHERE PROGRAM_ID = 'VMMFGWIN_WO'
        AND UDF.ID = 'UDF-0000087'AND LABEL IS NULL
    --SELECT * FROM #FAI_INITIALS

    SELECT * 
    INTO #FAI_DATE
    FROM [SQL-LAB-2].[LIVE].dbo.USER_DEF_FIELDS UDF
    WHERE PROGRAM_ID = 'VMMFGWIN_WO' AND UDF.ID = 'UDF-0000088'
        AND LABEL IS NULL
    --SELECT * FROM #FAI_DATE

    CREATE TABLE #RAW_MATERIAL (WO varchar(48), LOT nvarchar(2), SPLIT nvarchar(2), PART_ID varchar(48),
        REQ_QTY decimal(18,2), available decimal(18,2), remainder decimal(18,2), ISSUED_QTY decimal(18,2),
        QTY_ON_HAND decimal(18,2), QTY_IN_DEMAND decimal(18,2), CREATE_DATE datetime)
    
    INSERT INTO #RAW_MATERIAL
    SELECT a.WORKORDER_BASE_ID, a.WORKORDER_LOT_ID, a.WORKORDER_SPLIT_ID, a.PART_ID, a.CALC_QTY, 
        iif(a.CALC_QTY <= b.QTY_ON_HAND, 0, 1) as 'available', iif(b.QTY_IN_DEMAND <= b.QTY_ON_HAND, 0, 1) as 'remainder', 
        a.ISSUED_QTY, b.QTY_ON_HAND, b.QTY_IN_DEMAND, GETDATE()  
        FROM [SQL-LAB-1].[LIVE].dbo.REQUIREMENT a WITH (NOLOCK) INNER JOIN [SQL-LAB-1].[LIVE].dbo.PART b WITH (NOLOCK) 
        on a.PART_ID = b.ID  inner join [SQL-LAB-1].[LIVE].dbo.WORK_ORDER c WITH (NOLOCK) ON 
        a.WORKORDER_BASE_ID = c.BASE_ID and a.WORKORDER_LOT_ID = c.LOT_ID and a.WORKORDER_SPLIT_ID = c.SPLIT_ID
        inner join (select WORKORDER_BASE_ID as 'WO', WORKORDER_LOT_ID as 'LOT', WORKORDER_SPLIT_ID as 'split', min(OPERATION_SEQ_NO) as 'OP_SEQ_NO' 
        from [SQL-LAB-1].[LIVE].dbo.REQUIREMENT  WITH (NOLOCK) group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID) d ON 
        a.WORKORDER_BASE_ID = d.WO and a.WORKORDER_LOT_ID = d.LOT and a.WORKORDER_SPLIT_ID = d.split and a.OPERATION_SEQ_NO = d.OP_SEQ_NO
        where c.STATUS not in ('X', 'C') --and a.WORKORDER_BASE_ID = '1743119'
    --SELECT * FROM #RAW_MATERIAL
    

    /*****  FINAL INSERT to Main query  ***********************************************/
    CREATE TABLE #PLANNING_QUEUE ( BASE_ID varchar(48), RM_READY varchar(9), LOT_ID nvarchar(2), SUB_ID nvarchar(2), SPLIT_ID nvarchar(2), 
        WONUM varchar(48), PART_ID varchar(48), STATUS varchar(2), DESIRED_WANT_DATE datetime, CREATE_DATE datetime, TYPE varchar(2),
        WAITINGFOR varchar(48), BUYER_USER_ID varchar(48), DESIRED_QTY decimal(18,2), PLANNER_USER_ID varchar(48), RESOURCE_ID varchar(48), 
        DESIRED_RLS_DATE datetime, PLANNING_LEADTIME int, OPERATION_TYPE varchar(48), ENGINEERED_BY varchar(24) null, COMMODITY_CODE varchar(24) null, 
        REMAINING_OPS varchar(max) null, WONOTEALL varchar(max) null, RUNDATE datetime, IS_FAI_COMPLETE int null, QEA_EMPID varchar(48) null, 
        FAI_APPV_DATE datetime null, EXP_FLT varchar(120) null )
    
    INSERT INTO #PLANNING_QUEUE
    SELECT WO.BASE_ID
    ,(SELECT iif(sum(available) = 0, 'YES', 'NO') as 'available' FROM #RAW_MATERIAL r WHERE WO.BASE_ID = r.WO
     and WO.LOT_ID = r.LOT and WO.SPLIT_ID = r.SPLIT) AS 'RM_READY'  /*  evaluate inventory into WO */
    , WO.LOT_ID
    , WO.SUB_ID
    , WO.SPLIT_ID
    , dbo.sfnWONUMFormat(wo.BASE_ID, wo.LOT_ID, wo.SPLIT_ID, wo.SUB_ID) AS WONUM
    , WO.PART_ID
    , WO.[STATUS]
    , WO.DESIRED_WANT_DATE
    , WO.CREATE_DATE
    , WO.[TYPE]
    , CASE WHEN WO.[STATUS] = N'U' THEN N'ON HOLD'
        WHEN [dbo].[sfn_remaining_operations](WO.TYPE,WO.BASE_ID,WO.LOT_ID,WO.SPLIT_ID,WO.SUB_ID) IS NULL
            AND O.OPERATION_TYPE = N'REVIEW'
            THEN N'FLT BOM'
        WHEN --P.PLANNER_USER_ID = 'MRP' 
            EXISTS
            (SELECT 1
            FROM LIVESupplemental.dbo.PLANNER_USER_ID_ReportSettings EX
            WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
            AND REPORT_NAME = N'Mfg Planning Queue'
            AND REPORT_SECTION = N'MRP'
            )
            AND O.OPERATION_TYPE = N'REVIEW' THEN N'REPEAT PLAN'
        WHEN O.OPERATION_TYPE LIKE N'%-REVIEW' THEN N'FLT PR'
        WHEN --P.PLANNER_USER_ID = 'NEW'
            EXISTS
            (SELECT 1
            FROM LIVESupplemental.dbo.PLANNER_USER_ID_ReportSettings EX
            WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
            AND REPORT_NAME = N'Mfg Planning Queue'
            AND REPORT_SECTION = N'NEW'
            )
            AND O.OPERATION_TYPE = N'REVIEW' THEN N'FLT PLAN'
        WHEN EXISTS
            (SELECT 1 FROM OPERATION o 
            WHERE EXISTS
                (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
                WHERE s.Resource_ID = o.RESOURCE_ID
                AND s.Report_Name = N'Mfg Planning Queue'
                AND s.Report_Section = N'FLT PLAN Resources'
                )
                AND o.WORKORDER_BASE_ID = wo.BASE_ID
                AND o.WORKORDER_LOT_ID = wo.LOT_ID
                AND o.WORKORDER_SPLIT_ID = wo.SPLIT_ID
                AND o.WORKORDER_SUB_ID = wo.SUB_ID
                AND o.WORKORDER_TYPE = wo.[TYPE]
            )
            AND O.OPERATION_TYPE = N'REVIEW'
            THEN N'FLT PLAN'
        ELSE N'_blank'
    END AS WAITINGFOR
    , P.BUYER_USER_ID
    , WO.DESIRED_QTY
    , P.PLANNER_USER_ID
    , O.RESOURCE_ID
    , WO.DESIRED_RLS_DATE
    , P.PLANNING_LEADTIME
    , O.OPERATION_TYPE
    , WO.ENGINEERED_BY
    , P.COMMODITY_CODE
    , [dbo].[SFN_REMAINING_OPERATIONS](WO.TYPE,WO.BASE_ID,WO.LOT_ID,WO.SPLIT_ID,WO.SUB_ID) AS REMAINING_OPS
    , REPLACE(REPLACE(CONVERT( NVARCHAR,A.CREATE_DATE,100)+' '+CAST(CAST(A.NOTE AS VARBINARY(MAX)) AS NVARCHAR(MAX)),CHAR(10),' '),CHAR(13),' ') AS WONOTEALL
    , GETDATE() AS RUNDATE
    , (SELECT BOOL_VAL FROM #FAI_COMPLETE UDF
         WHERE 'M'+'~'+ WO.PART_ID +'~0~0~0' = UDF.DOCUMENT_ID
       ) AS IS_FAI_COMPLETE
    , (SELECT STRING_VAL FROM #FAI_INITIALS UDF
       WHERE 'M'+'~'+ WO.PART_ID +'~0~0~0' = UDF.DOCUMENT_ID) AS QEA_EMPID
    , (SELECT DATE_VAL FROM #FAI_DATE UDF
        WHERE 'M'+'~'+ WO.PART_ID +'~0~0~0' = UDF.DOCUMENT_ID) AS FAI_APPV_DATE
    , wods.[EXP/FLT]
    
FROM WORK_ORDER WO
INNER JOIN OPERATION O
    ON WO.[TYPE] = O.WORKORDER_TYPE
    AND WO.BASE_ID = O.WORKORDER_BASE_ID
    AND WO.LOT_ID = O.WORKORDER_LOT_ID
    AND WO.SUB_ID = O.WORKORDER_SUB_ID
    AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
    AND dbo.sfn_current_operation(WO.TYPE,WO.BASE_ID,WO.LOT_ID,WO.SUB_ID,WO.SPLIT_ID) = O.SEQUENCE_NO
    AND O.OPERATION_TYPE NOT IN (N'QP-NI', N'QP-REVIEW')

INNER JOIN PART_SITE_VIEW P  ON WO.PART_ID = P.PART_ID AND P.SITE_ID = N'SK01'

LEFT OUTER JOIN (SELECT N.* FROM NOTATION N
        JOIN (SELECT N.OWNER_ID, MAX(CREATE_DATE) AS MAXDATE
                FROM NOTATION N WHERE [TYPE] = N'E' GROUP BY N.OWNER_ID
             ) NMAX ON NMAX.OWNER_ID = N.OWNER_ID
                AND NMAX.MAXDATE = N.CREATE_DATE
    ) AS A ON A.OWNER_ID = WO.BASE_ID + N'/' + WO.LOT_ID
LEFt OUTER JOIN [SQL-LAB-2].LIVESupplemental.dbo.WODS_output wods ON WO.BASE_ID = wods.BASE_ID and WO.LOT_ID = wods.LOT_ID
    and WO.SPLIT_ID = wods.SPLIT_ID and WO.SUB_ID = wods.SUB_ID

WHERE WO.[TYPE] = N'W'
    AND WO.[STATUS] IN (N'F', N'R', N'U')
    AND EXISTS
        (SELECT 1
        FROM LIVESupplemental.dbo.PLANNER_USER_ID_ReportSettings EX
        WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
            AND REPORT_NAME = N'Mfg Planning Queue'
        )
    AND EXISTS
        (SELECT 1 FROM LIVESupplemental.dbo.ResourceID_ReportSettings s
            WHERE s.Report_Name = N'Mfg Planning Queue'
            AND s.Report_Section = N'REVIEW Resources' AND s.Resource_ID = O.RESOURCE_ID
        )
AND WO.DESIRED_RLS_DATE < GETDATE()+ @days_out --and WO.BASE_ID = '1743119'




/***********************    Main Query (apply last filter and shorting)       **********************************/

SELECT * FROM #PLANNING_QUEUE order by RM_READY desc, EXP_FLT desc, DESIRED_RLS_DATE asc
