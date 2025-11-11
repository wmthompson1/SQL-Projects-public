# Bill of Material Availability

```sql

-- C:\bbb\20201021 Ann - Raw Materials Availability\
-- C:\bbb\20201021 Ann - Raw Materials Availability\Raw materials availability.sql
-- C:\bbb\20201021 Ann - Raw Materials Availability\Raw materials availability.1 Report.sql
-- C:\bbb\20201021 Ann - Raw Materials Availability\Raw materials availability.3 Test Plan 3.sql
-- C:\bbb\20201021 Ann - Raw Materials Availability\Raw materials availability.41 IN TEST.sql
-- C:\bbb\20201021 Ann - Raw Materials Availability\Raw materials availability.52 PRODUCTION.sql
-- 10:55
--VISUAL ENTERPRISE REPORTS-->INVENTORY REPORTS-->BILL OF MATERIAL AVAILABILITY

/**********************************************************************************************
Description:     Materials Availability Report
Dependency:         Report depends on dataset in workorder folder for customer drop down.    

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
3/7/2020    Vivian Elia            Vivian had created, and began testing, pre-Covid19
10/23/2020    William Thompson    Assigned myself to the project.
10/23/2020    William Thompson    Remaining ops

TESTER:
IF OBJECT_ID('tempdb..#Tester') IS NOT NULL DROP TABLE #Tester

SELECT
 Resource_ID
 into #Tester
FROM (VALUES

('P2M2-RLSMTL-CMP')
,('P2M1-RLSMTL') 
,('P2M1-KIT-FG')
,('P2M2-KIT-CMP')
,('P3M1-KIT')
,('P3M1-KIT-CMP')
    
    ) AS sub 
    (Resource_ID )

Test Plan 3:  

1632251/1
1633121/1
1635796-2/1
1636225/1
1637578-2/1
1637861-1/1
1637914-3/1
1638038-2/1
1638063-2/1
1638064-2/1


SELECT        Abbr2 AS PLANT, FullName2 AS PLANT_NAME
FROM            [sql-lab-1].LIVESupplemental.dbo.Plant_Names

**********************************************************************************************/





SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW



IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results
IF OBJECT_ID('tempdb..#Customer') IS NOT NULL DROP TABLE #Customer
 
IF OBJECT_ID('tempdb..#wods') IS NOT NULL DROP TABLE #wods
IF OBJECT_ID('tempdb..#test_curr_op') IS NOT NULL DROP TABLE #test_curr_op

IF OBJECT_ID('tempdb..#TMP_CTE_WO') IS NOT NULL DROP TABLE #TMP_CTE_WO
IF OBJECT_ID('tempdb..#TMP_RPT_AVAIL_CALC') IS NOT NULL DROP TABLE #TMP_RPT_AVAIL_CALC
IF OBJECT_ID('tempdb..#StatusX') IS NOT NULL DROP TABLE #StatusX
IF OBJECT_ID('tempdb..#final1') IS NOT NULL DROP TABLE #final1
--IF OBJECT_ID('tempdb..#temp1') IS NOT NULL DROP TABLE #temp1
IF OBJECT_ID('tempdb..#temp2') IS NOT NULL DROP TABLE #temp2

-- select * from #temp1

------ Test Header Starts -----------------------------------------
--DECLARE @CUSTOMER AS NVARCHAR(15)
--SET @CUSTOMER = 'BOE609'
--SET @CUSTOMER = NULL
--DECLARE @WO_STATUS AS NVARCHAR(1)
--SET @WO_STATUS = 'R'
--DECLARE @PLANT AS NVARCHAR(2)
--SET @PLANT = 'P2'
--SET @PLANT = NULL
--declare @testID nvarchar(30) = null -- '1633121/1' -- '1632251/1'  -- '1623437/1'
--declare @Resource_ID NVARCHAR(30) = 'P2M1-RLSMTL'
------ Test header ends ///////////////////////////////////////////


IF OBJECT_ID('tempdb..#Resource') IS NOT NULL DROP TABLE #Resource


---- Customer drop down troubleshoot ~~ -------------------------------------------
---- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------------------->
---- CUSTOMER CUSTOMER CUSTOMER CUSTOMER CUSTOMER CUSTOMER 
---- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------------------->

--SET NOCOUNT ON;

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET DEADLOCK_PRIORITY LOW

---- DROP TABLE #WORK_ORDER

--IF OBJECT_ID('tempdb..#WORK_ORDER_DROP_DOWN') IS NOT NULL DROP TABLE #WORK_ORDER_DROP_DOWN
--IF OBJECT_ID('tempdb..#CUSTOMER_DROP_DOWN') IS NOT NULL DROP TABLE #CUSTOMER_DROP_DOWN

--SELECT *
--  INTO #WORK_ORDER_DROP_DOWN 
--FROM dbo.WORK_ORDER wo (NOLOCK)
--WHERE EXISTS(
--        SELECT 1 FROM dbo.WORK_ORDER wo2 (NOLOCK)
--        WHERE (
--            wo2.[TYPE] = wo.[TYPE]
--            AND wo2.[BASE_ID] = wo.[BASE_ID]
--            AND wo2.[LOT_ID] = wo.[LOT_ID]
--            AND wo2.[SPLIT_ID] = wo.[SPLIT_ID]
--            AND wo2.[SUB_ID] = wo.[SUB_ID]
     

--        AND wo2.[STATUS] IN (N'R', N'F', N'U')
--        AND wo2.[TYPE] = N'W'
--        ))

--CREATE CLUSTERED INDEX CIDX_WO2 ON #WORK_ORDER_DROP_DOWN
--(
--        [BASE_ID]
--        ,[LOT_ID]
--        ,[SPLIT_ID]
--        ,[SUB_ID]
--        ,[TYPE]

--)

--CREATE NONCLUSTERED INDEX NCIDX_WO2 ON #WORK_ORDER_DROP_DOWN
--([STATUS]) INCLUDE(PART_ID)


---- 1 derived union with customer table  ------------------------------------------------------------
--;WITH Calc_Cust
--as (
--    SELECT 

--         'Cust ID parsed from buyer' Descr
--        ,CUSTOMER_ID2 = IIF(
--        (CASE WHEN
--                ( dsl.DEMAND_BASE_ID IS NULL
--                AND dsl.DEMAND_SEQ_NO IS NULL
--                AND dsl.DEMAND_TYPE IS NULL ) THEN
--                'Unlinked'
--                END) 
        
--             = 'unlinked' and nullif(ltrim(rtrim(co.customer_id)),'') is null  -- version 2 coalesce
--                        , iif(ISNUMERIC(SUBSTRING(p.buyer_user_id,4,1) ) = 1
--                            ,'BOEPOP'
--                            , SUBSTRING(p.buyer_user_id,4, 6 )
--                        )
--                        ,CO.customer_ID)

--        -- ~~ xx
--        ,CUSTOMER_ID = IIF(
--        (CASE WHEN
--                ( dsl.DEMAND_BASE_ID IS NULL
--                AND dsl.DEMAND_SEQ_NO IS NULL
--                AND dsl.DEMAND_TYPE IS NULL ) THEN
--                'Unlinked'
--                END) 
        
--             = 'unlinked' and nullif(ltrim(rtrim(co.customer_id)),'') is null  -- version 2
--                        , iif(ISNUMERIC(SUBSTRING(EndItemPart.buyer_user_id,4,1) ) = 1
--                            ,'BOEPOP'

--                            ,SUBSTRING(EndItemPart.buyer_user_id,4, 6 )
--                        )
--                        ,CO.customer_ID)
                        
    
--    FROM #WORK_ORDER_DROP_DOWN wo2
--    JOIN WORK_ORDER wo
--            ON wo2.[TYPE] = wo.[TYPE]
--            AND wo2.[BASE_ID] = wo.[BASE_ID]
--            AND wo2.[LOT_ID] = wo.[LOT_ID]
--            AND wo2.[SPLIT_ID] = wo.[SPLIT_ID]
--            AND wo2.[SUB_ID] = wo.[SUB_ID]
--    JOIN #WORK_ORDER_DROP_DOWN EndItem
--            ON EndItem.[TYPE] = wo.[TYPE]
--            AND EndItem.[BASE_ID] = wo.[BASE_ID]
--            AND EndItem.[LOT_ID] = wo.[LOT_ID]
--            AND EndItem.[SPLIT_ID] = wo.[SPLIT_ID]
--            AND EndItem.[SUB_ID] = '0'

--        LEFT JOIN WORKORDER_BINARY wb
--            ON wb.WORKORDER_BASE_ID = wo.BASE_ID
--                AND wb.WORKORDER_LOT_ID = wo.LOT_ID
--                AND wb.WORKORDER_SPLIT_ID = wo.SPLIT_ID
--                AND wb.WORKORDER_SUB_ID = wo.SUB_ID
--                AND wb.WORKORDER_TYPE = wo.[TYPE] 
--        LEFT JOIN DEMAND_SUPPLY_LINK dsl
--            ON dsl.SUPPLY_BASE_ID = wo.BASE_ID
--                AND dsl.SUPPLY_LOT_ID = wo.LOT_ID
--                AND dsl.SUPPLY_SPLIT_ID = wo.SPLIT_ID
--                --AND dsl.SUPPLY_SUB_ID = wo.SUB_ID  --MUST OMIT FOR LEGS AND REWORKS
--        LEFT JOIN CUST_ORDER_LINE col
--            ON col.CUST_ORDER_ID = dsl.DEMAND_BASE_ID
--                AND col.LINE_NO = dsl.DEMAND_SEQ_NO
--                AND dsl.DEMAND_TYPE = N'CO'
--        LEFT JOIN CUSTOMER_ORDER co
--            ON co.ID = col.CUST_ORDER_ID

--        JOIN PART_SITE_VIEW p 
--            ON p.PART_ID = wo.PART_ID
--                AND p.SITE_ID = N'SK01'
--        left JOIN PART_SITE_VIEW EndItemPart
--            ON EndItemPart.PART_ID = EndItem.PART_ID
--                AND EndItemPart.SITE_ID = N'SK01'
--                AND EndItemPart.PART_ID <> 'REWORK MFG'
--        LEFT JOIN LIVESupplemental.dbo.SK_CUST_SPECIFIC_PARTS cp
--            ON cp.PART_ID = p.PART_ID
--    WHERE wo.[STATUS] IN (N'R', N'F', N'U')
--        AND wo.[TYPE] = N'W'

--), Derived AS (
--SELECT Customer_ID = COALESCE(CUSTOMER_ID2, CUSTOMER_ID) 
--FROM Calc_Cust
--GROUP BY
--COALESCE(CUSTOMER_ID2, CUSTOMER_ID)
--)
--SELECT 

--   customer_ID CUST_ID, Customer_ID CustName
--   INTO #CUSTOMER_DROP_DOWN
--FROM Derived where customer_id not in (select c2.id FROM CUSTOMER c2)

--UNION

--SELECT '_Blank' AS CUST_ID, '_Blank ' AS CustName 
--UNION
--SELECT ISNULL(ID, '_Blank') AS CUST_ID, ISNULL(ID, '_Blank') +' - '+ NAME AS CustName
--FROM CUSTOMER c
--WHERE ACTIVE_FLAG = 'Y'
--ORDER BY 1;

---- 2 ~~ -------------------------------------------
---- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/////////////////////////////
---- CUSTOMER CUSTOMER CUSTOMER CUSTOMER CUSTOMER CUSTOMER SELECT * FROM #CUSTOMER_DROP_DOWN
---- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@////////////////////////////

SELECT
 Resource_ID
 into #Resource
FROM (VALUES

('P2M2-RLSMTL-CMP')
,('P2M1-RLSMTL') 
,('P2M1-KIT-FG')
,('P2M2-KIT-CMP')
,('P3M1-KIT')
,('P3M1-KIT-CMP')
    
    ) AS sub 
    (Resource_ID )

-- Status in test

SELECT
 StatusX
 into #StatusX
FROM (VALUES

 ('f')
,('r') 
,('u')
    
    ) AS sub 
    (StatusX )

-- SELECT * FROM #statusX

SELECT
      WO.TYPE,
       WO.BASE_ID, 
      WO.LOT_ID, 
      WO.SPLIT_ID,
      WO.SUB_ID, 
      dbo.sfnWONUMFormat(wo.BASE_ID, wo.LOT_ID, wo.SPLIT_ID, wo.SUB_ID) AS WONUM,
      WO.STATUS,
      WO.DESIRED_QTY, 
      WO.PART_ID,
      ISNULL(WO.DESIRED_RLS_DATE, 
           (SELECT WO1.DESIRED_RLS_DATE 
              FROM WORK_ORDER WO1
              WHERE wo.BASE_ID    = WO1.BASE_ID
              AND wo.LOT_ID    = WO1.LOT_ID
              AND wo.SPLIT_ID    = WO1.SPLIT_ID
              AND WO1.SUB_ID = '0'
              AND WO.TYPE        = WO1.TYPE)
            ) AS DESIRED_RLS_DATE, 
      ISNULL(WO.DESIRED_WANT_DATE, 
           (SELECT WO1.DESIRED_WANT_DATE 
              FROM WORK_ORDER WO1
              WHERE wo.BASE_ID    = WO1.BASE_ID
              AND wo.LOT_ID    = WO1.LOT_ID
              AND wo.SPLIT_ID    = WO1.SPLIT_ID
              AND WO1.SUB_ID = '0'
              AND WO.TYPE        = WO1.TYPE)
            ) AS DESIRED_WANT_DATE

        , ISNULL(dbo.sfn_remaining_operations(wo.[TYPE], wo.BASE_ID, wo.LOT_ID, wo.SPLIT_ID, wo.SUB_ID), N'No Remaining Operations') remaining_operations

        ,CurrentOperation = [dbo].[sfn_current_operation] (wo.type
         ,wo.base_id, wo.lot_id
         , wo.split_id, wo.sub_id)
INTO #TMP_CTE_WO
  FROM WORK_ORDER WO
 WHERE WO.TYPE = N'W'
   AND WO.STATUS in -- (@WO_STATUS)
   (select * from #StatusX)
   
-- SELECT * from #tmp_cte_wo where wonum = '1632251/1'

SELECT       
     ZEROx10 = '00000' + '00000' 
    ,ZEROx15 = '00000' + '00000' + '00000'   
    ,ZEROx20 = '00000' + '00000' + '00000' + '00000' 
      ,  DESIRED_RLS_DATE AS WO_Release_Date 
      , DESIRED_WANT_DATE AS WO_Due_Date
      , DESIRED_QTY AS WO_Qty
      , WO_PART_ID  AS WO_Part_ID
      , A.EndItem_Part_id
      , ISNULL(CUSTOMER_VIA_BUYER, '_blank') AS CUST_VIA_BUYER
      , WP_DESCRIPTION AS WO_DESCRIPTION
      , BUYER_USER_ID AS WO_BUYER_ID 
      , WONUM AS WO_NUM--WO# (include sub & split)
      , SEQUENCE_NO AS WO_OP_NUM --WO Op#
      , PIECE_NO -- Piece #
      , RQ_PART_ID AS BOM_Part_ID
      , RQP_DESCRIPTION AS BOM_Item_Description
      , RTOTAL AS Qty_Reqd
      , QTY_AVAILABLE_ISS AS Qty_Available
      , USAGE_UM -- U/M 
      , CASE WHEN QTY_AVAILABLE_ISS >= RTOTAL
         THEN 'YES'
         ELSE 'NO'
      END AS In_Stock 
      ,  CUST_ORDER_ID 
      , LEFT(RESOURCE_ID,2) AS PLANT
      , PRIMARY_LOC_ID AS Primary_Loc
      , WO_STATUS
    -- William Thompson updated 10/23
    , A.RESOURCE_ID
    , A.SEQUENCE_NO
    , A.remaining_operations
    ,IsService -- if remaining operations contain service
    , A.WONUM
    , A.CurrentOperation
    , A.customer_id_x
    , A.dslType
    , A.BUYER_USER_ID
    , customer_ID
    , EndItem_Part_buyer_user_id
    into #results
--INTO #TMP_RPT_AVAIL_CALC
  FROM (
       SELECT 
              o.RESOURCE_ID
            , o.SEQUENCE_NO
            , RQ.PART_ID            AS    RQ_PART_ID
            , P.DESCRIPTION         AS    RQP_DESCRIPTION
            , P.COMMODITY_CODE
            , P.PLANNER_USER_ID
            , P.BUYER_USER_ID
            , CASE WHEN ISNUMERIC(SUBSTRING(P.BUYER_USER_ID,4,3)) = 1 
                  THEN 'BOEPOP'
                  ELSE SUBSTRING(P.BUYER_USER_ID, 4,6) 
                END  AS CUSTOMER_VIA_BUYER
            , ISNULL(P.PRIMARY_LOC_ID,'') AS PRIMARY_LOC_ID
            , RQ.CALC_QTY
            --, SUM(RQ.CALC_QTY) OVER(PARTITION BY RQ.PART_ID  ORDER BY RQ.PART_ID, WO.DESIRED_WANT_DATE) AS RTOTAL
            , SUM(RQ.CALC_QTY) OVER(PARTITION BY RQ.PART_ID  ORDER BY RQ.PART_ID, WO.DESIRED_RLS_DATE) AS RTOTAL
            , WO.PART_ID            AS WO_PART_ID
            , WO.WONUM
            , WO.DESIRED_RLS_DATE
            , WO.DESIRED_WANT_DATE
            , WO.DESIRED_QTY
            , P.QTY_AVAILABLE_ISS
            , WO.BASE_ID
        --    , DSL.DEMAND_BASE_ID    AS CUST_ORDER_ID 
            , WP.DESCRIPTION        AS WP_DESCRIPTION
            , RQ.PIECE_NO
            , RQ.QTY_PER 
            , RQ.USAGE_UM
            , RQ.ISSUED_QTY
            , WO.STATUS AS WO_STATUS
            ,IsService = iif((CHARINDEX ( 'Contractor' , wo.remaining_operations) ) > 0, 1,0)
            , wo.remaining_operations
            , wo.CurrentOperation
            
            -- update WilliamT 10/29/20
            
            ,dslType =  
            case when
                ( dsl.demand_base_id is null
                and dsl.demand_seq_no is null
                and dsl.demand_type is null ) then
                'unlinked'
            when
                ( dsl.demand_base_id is not null
                and dsl.demand_seq_no is not null
                and dsl.demand_type is not null ) then
                'linked'
                end

                    -- mar report --------------------------------------------------------
        -- ~~ xx
        ,customer_id_x = IIF(
        (CASE WHEN
                ( dsl.DEMAND_BASE_ID IS NULL
                AND dsl.DEMAND_SEQ_NO IS NULL
                AND dsl.DEMAND_TYPE IS NULL ) THEN
                'Unlinked'
                END) 
        
             = 'unlinked' and nullif(ltrim(rtrim(co.customer_id)),'') is null  -- version 2
                        , iif(ISNUMERIC(SUBSTRING(EndItemPart.buyer_user_id,4,1) ) = 1
                            ,'BOEPOP'
                                --, CASE 
                                --  WHEN EndItemPart.BUYER_USER_ID like '06-SPI[KS,OK]%' THEN
                                --    'SPIAER'
                                --  ELSE
                                --    SUBSTRING(EndItemPart.buyer_user_id,4, 6 )
                                --  END
                            ,SUBSTRING(EndItemPart.buyer_user_id,4, 6 )
                        )
                        ,CO.customer_ID)

            ,CO.customer_ID CO_Customr_ID

            ,EndItemPart.PART_ID EndItem_Part_id
            ,col.CUST_ORDER_ID
            ,CO.customer_ID
            --,wo.PART_ID wo_part_id
            ,enditempart.buyer_user_id EndItem_Part_buyer_user_id
        FROM #TMP_CTE_WO WO
        
       -- update 10/29/2020 WilliamT
        left join work_order enditem
        on enditem.[type] = wo.[type]
        and enditem.[base_id] = wo.[base_id]
        and enditem.[lot_id] = wo.[lot_id]
        and enditem.[split_id] = wo.[split_id]
        and enditem.[sub_id] = '0'

        LEFT OUTER JOIN DEMAND_SUPPLY_LINK DSL
          ON DSL.SUPPLY_BASE_ID = WO.BASE_ID
         AND DSL.SUPPLY_LOT_ID = WO.LOT_ID
         AND DSL.SUPPLY_SPLIT_ID = WO.SPLIT_ID
    -- TESTING 10/29/2020 WilliamT ToDo:
    --     AND DSL.SUPPLY_SUB_ID = WO.SUB_ID
         
        --left join demand_supply_link dsl2
        --on dsl2.supply_base_id = wo.base_id
        --and dsl2.supply_lot_id = wo.lot_id
        --and dsl2.supply_split_id = wo.split_id

        LEFT OUTER JOIN OPERATION o
          ON WO.BASE_ID = o.WORKORDER_BASE_ID
         AND WO.LOT_ID = o.WORKORDER_LOT_ID
         AND WO.SPLIT_ID = o.WORKORDER_SPLIT_ID
         AND WO.SUB_ID = o.WORKORDER_SUB_ID
         AND WO.TYPE = o.WORKORDER_TYPE
         AND WO.CurrentOperation = o.SEQUENCE_NO

       --  INNER JOIN WO_CURRENTLY_AT WOA
          --ON WOA.workorder_type = O.WORKORDER_TYPE
          --AND WOA.workorder_base_id = O.WORKORDER_BASE_ID
          --AND WOA.workorder_lot_id = O.WORKORDER_LOT_ID 
          --AND WOA.workorder_split_id = O.WORKORDER_SPLIT_ID 
          --AND WOA.workorder_sub_id = O.WORKORDER_SUB_ID
          --AND WOA.sequence_no = O.SEQUENCE_NO
        LEFT OUTER JOIN PART WP
          ON WO.PART_ID = WP.ID
          
        LEFT OUTER JOIN REQUIREMENT RQ
          ON O.WORKORDER_TYPE = RQ.WORKORDER_TYPE
         AND O.WORKORDER_BASE_ID = RQ.WORKORDER_BASE_ID
         AND O.WORKORDER_LOT_ID = RQ.WORKORDER_LOT_ID
         AND O.WORKORDER_SPLIT_ID = RQ.WORKORDER_SPLIT_ID
         AND O.WORKORDER_SUB_ID = RQ.WORKORDER_SUB_ID
         AND O.SEQUENCE_NO = RQ.OPERATION_SEQ_NO
         
        LEFT OUTER JOIN PART_SITE_VIEW P
          ON RQ.PART_ID = P.PART_ID
          AND P.SITE_ID = 'SK01'
          
        outer apply (
            select top 1 col2.cust_order_id
            from cust_order_line col2
            where col2.cust_order_id = dsl.demand_base_id
            and col2.line_no = dsl.demand_seq_no
            and dsl.demand_type = N'co'

        ) col
        
        left join customer_order co
        on co.id = col.cust_order_id
        
            -- TODO: WilliamT  

    left JOIN PART_SITE_VIEW EndItemPart
        ON EndItemPart.PART_ID = EndItem.PART_ID
            AND EndItemPart.SITE_ID = N'SK01'
            AND ISNULL(EndItemPart.PART_ID,'') <> 'REWORK MFG'

     
        WHERE o.RESOURCE_ID IN 
        (
          N'P2M2-RLSMTL-CMP'
        , N'P2M1-RLSMTL'
    --    , N'P1M1-KIT'
        , N'P2M1-KIT-FG'
        , N'P2M2-KIT-CMP'
        , N'P3M1-KIT'
        , N'P3M1-KIT-CMP'
    
        )
-- Filter removed in test 10/28/2020
--         AND ISNULL(RQ.ISSUED_QTY,0) = 0
         --and ( wo.WONUM = @testID
         --     or @TestID is null)
         ) AS A
   WHERE (1=1)
   
   AND LEFT(RESOURCE_ID,2) IN (@PLANT)
  -- 
  --  AND LEFT(RESOURCE_ID,2) IN (
        --SELECT        Abbr2 AS PLANT
        --FROM            [sql-lab-1].LIVESupplemental.dbo.Plant_Names)


   -- AND  ISNULL(CUSTOMER_VIA_BUYER, '_blank') IN (@CUSTOMER)
   --AND  ISNULL(customer_id_x, '_blank') IN (
   --     SELECT CUST_ID FROM #CUSTOMER_DROP_DOWN)

    AND A.RESOURCE_ID IN ( @Resource_ID )
    ----(select t.Resource_ID  from #Resource t)  

    -- order by BOM_Part_ID, Qty_Reqd asc, WO_Release_Date desc
order by               
 WO_Due_Date              
,WO_Release_Date             

test_1:

select * 
-- drop table Datawarehouse.WilliamT.Temp2
   --into Datawarehouse.WilliamT.Temp2
 --     into #Temp2
from #results t

order by               
WO_Due_Date             -- DESIRED_WANT_DATE AS WO_Due_Date
,WO_Release_Date             -- DESIRED_RLS_DATE AS WO_Release_Date 

```