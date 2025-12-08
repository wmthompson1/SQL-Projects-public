--USE [DataWarehouse]
--GO


-- based on Supplier_Perf_Shafer_2018.sql
-- 1160-60
-- ATUR012022A0001

-- 167375
-- Exclude TMXDIV
-- START END
-- + only no minus's 

/**********************************************************************************************
Description:
1. grain of Received data should be by vendor, po, po line, and receiver
2. IQM grain is vendor, po, po line
3. Requirement change 8/12 will roll up 
4. Current versions of reports are probably not going to be in test plan

Note:
 previous processes and reports may have defects

Date    Modified By     Change Description
---------- ------------------ ------------------------------------------------------------
2025-08-11    William        Created - based on 750 Supplier_Perf_Shafer_2018.sql
2025-08-22    William      - adjusted due date  on_time_vs_late
2025-09-02    William      -= [sql-bi-1].DATAWAREHOUSE.DBO.

Test plan
173308 KAMCOR - 1000 total
162310 JAMCOR - 
174893 - poss dup
**********************************************************************************************/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SET DEADLOCK_PRIORITY LOW;

DECLARE @PURC_ORDER_ID NVARCHAR(15);

DECLARE @VENDOR_ID NVARCHAR(255);

SET @VENDOR_ID = null;
SET @VENDOR_ID = NULL;
SET @PURC_ORDER_ID = null;

DECLARE @START_DATE DATE; 
DECLARE @END_DATE DATE;
SET @START_DATE = '2025-07-01';
SET @END_DATE = GETDATE();

;WITH CTE_IQM AS (    
    SELECT NCM_ID, NCM.PRODUCT_REC_ID, DSL.SUPPLY_BASE_ID AS 'SupplierPO'
        , convert(nvarchar(12), DSL.SUPPLY_SEQ_NO) AS 'SupplierPO_LINE'
        , NCM.LOT_SIZE, NCM.ACCEPTED, NCM.REJECTED, NCM.NCM_DATE
    FROM [sql-bi-1].DATAWAREHOUSE.DBO.VQ_NONCONFORMANCE NCM
    INNER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_PRODUCT P ON P.RECORD_ID = NCM.PRODUCT_REC_ID
    INNER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_PRODUCTION_ORDER PO ON PO.RECORD_ID = NCM.PROD_ORDER_REC_ID
        AND PO.ALT_ID_1 = 'W'
    INNER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_OPERATION O ON O.RECORD_ID = NCM.OPERATION_REC_ID
    INNER JOIN OPERATION OP ON  PO.ALT_ID_2 = OP.WORKORDER_BASE_ID
        AND PO.ALT_ID_3 = OP.WORKORDER_LOT_ID AND PO.ALT_ID_4 = OP.WORKORDER_SPLIT_ID
        AND PO.ALT_ID_5 = OP.WORKORDER_SUB_ID AND O.DISPLAY_ID = OP.SEQUENCE_NO
        AND op.WORKORDER_TYPE = 'W'
    LEFT OUTER JOIN [SQL-IQM-9].[IQM_Baseline_App].DBO.VQ_SUPPLIER s
        ON s.RECORD_ID = NCM.REPORTED_BY_SUPP_REC_ID 
    INNER JOIN DBO.DEMAND_SUPPLY_LINK AS DSL
        ON OP.WORKORDER_BASE_ID = DSL.DEMAND_BASE_ID
            AND OP.WORKORDER_LOT_ID = DSL.DEMAND_LOT_ID AND OP.WORKORDER_SPLIT_ID = DSL.DEMAND_SPLIT_ID
            AND OP.WORKORDER_SUB_ID = DSL.DEMAND_SUB_ID AND OP.SEQUENCE_NO = DSL.DEMAND_SEQ_NO
            AND OP.WORKORDER_TYPE ='W'
    INNER JOIN DBO.WORK_ORDER AS WO ON DSL.DEMAND_BASE_ID = WO.BASE_ID
        AND DSL.DEMAND_LOT_ID = WO.LOT_ID AND DSL.DEMAND_SPLIT_ID = WO.SPLIT_ID
        AND DSL.DEMAND_SUB_ID = WO.SUB_ID AND DSL.SUPPLY_PART_ID = WO.PART_ID AND WO.[TYPE] ='W'
    
    WHERE NCM.NCM_TYPE = 'SUPPLIER - MAJOR' AND O.CONST_RESOURCE_ID = 'CONTRACTOR'
        AND PO.ALT_ID_2 is not null 
    UNION ALL
    --not a contractor operation; not associated with a work order
    SELECT NCM_ID , NCM.PRODUCT_REC_ID
        , CASE 
            WHEN CHARINDEX('/',NCM.PO_NUMBER,1) = 0 THEN NCM.PO_NUMBER
            ELSE SUBSTRING(NCM.PO_NUMBER, 1, CHARINDEX('/',NCM.PO_NUMBER,1)-1) 
        END AS 'SupplierPO'
        , SUBSTRING(NCM.PO_NUMBER, LEN(NCM.PO_NUMBER), CHARINDEX('/',NCM.PO_NUMBER,1)+1) AS 'SupplierPO_LINE'
        , NCM.LOT_SIZE, NCM.ACCEPTED, NCM.REJECTED, NCM.NCM_DATE
    FROM [sql-bi-1].DATAWAREHOUSE.DBO.VQ_NONCONFORMANCE NCM
    LEFT OUTER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_PRODUCT P ON P.RECORD_ID = NCM.PRODUCT_REC_ID
    LEFT OUTER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_PRODUCTION_ORDER PO ON PO.RECORD_ID = NCM.PROD_ORDER_REC_ID
        AND PO.ALT_ID_1 = 'W'
    LEFT OUTER JOIN [sql-bi-1].DATAWAREHOUSE.DBO.VQ_OPERATION O ON O.RECORD_ID = NCM.OPERATION_REC_ID
    LEFT OUTER JOIN [SQL-IQM-9].[IQM_Baseline_App].DBO.VQ_SUPPLIER s
        ON S.RECORD_ID = NCM.REPORTED_BY_SUPP_REC_ID 
    WHERE NCM.NCM_TYPE = 'SUPPLIER - MAJOR' AND PO.ALT_ID_2 IS NULL
)

    SELECT  
    
         --'Version 7/28 + - 1/1/25 - 6/30/25' NOTE
         PO.VENDOR_ID              --3 
        , POL.PURC_ORDER_ID      --4
        , convert(smallint, POL.LINE_NO) AS 'PURC_ORDER_LINE_NO'    -- 5.
        , POL.ORDER_QTY AS 'PO_LINE_ORDERQTY'
        , RL.RECEIVER_ID    -- 6.
        , RL.RECEIVED_Qty
        , pol.PROMISE_DATE
        , R.RECEIVED_Date

        -- adjusted_due_date
        ,convert(date,
          iif(pol.promise_DATE is null, pol.Desired_recv_date + 3, 
             iif (pol.promise_date >= pol.Desired_recv_date, pol.promise_date, pol.Desired_recv_date + 3))
          ) adjusted_due_date 

        -- on_time_vs_late
          ,convert(varchar(15),
             IIF(R.received_date <= (
               -- using adjusted_due_date
                 convert(date,
                  iif(pol.promise_DATE is null, pol.Desired_recv_date + 3, 
                     iif (pol.promise_date >= pol.Desired_recv_date, pol.promise_date, pol.Desired_recv_date + 3))
                     ) 

             ), 'On-time', 'Late')
                ) on_time_vs_late

        , pol.DESIRED_RECV_DATE -- 8.
        , POL.COMMODITY_CODE
                --, CONVERT(DATE, POL.DESIRED_RECV_DATE + 5, 101) as 'DUE_DATE'
        , UD.STRING_VAL AS CONTROLLED
        , V.USER_6 as SUPPLIER_TYPE
        , POL.PART_ID
        , PART.PLANNER_USER_ID
        , V.user_7 as PRODUCT_TYPE

    /*
    1. Receiver.Received_Date for date range 
    2. Included in data 
    3. Vendor ID 
    4. PO# 
    5. PO Line  
    6. Receiver ID – From Purchase Receipt 
    7. Promise Date – From Purchase Order 
    8. Desired_Recv Date – from Purchase Order 
    9. Commodity Code – from part maintenance 
    10. Controlled – Part Maintenance |  
    11. Supplier Type -vendor maintenance 

    */

    FROM PURC_ORDER_LINE POL
    INNER JOIN PURCHASE_ORDER PO ON POL.PURC_ORDER_ID = PO.ID
    INNER JOIN RECEIVER_LINE RL
        ON POL.PURC_ORDER_ID = RL.PURC_ORDER_ID
        AND POL.LINE_NO = RL.PURC_ORDER_LINE_NO AND RL.RECEIVED_QTY > 0 -- UPD 8/7
    INNER JOIN RECEIVER R  ON RL.RECEIVER_ID = R.ID


    LEFT JOIN Datamart.dbo.SKILLS_PART_UDF SKILLS_PART_UDF 
    ON POL.PART_ID=SKILLS_PART_UDF.PART_ID

    left JOIN.PART 
    ON PART.ID = POL.PART_ID

    left JOIN VENDOR V
    ON PO.VENDOR_ID = V.ID

    LEFT JOIN USER_DEF_FIELDS UD 
    ON POL.PART_ID = UD.DOCUMENT_ID 
    AND UD.ID = 'UDF-0000082' AND UD.PROGRAM_ID = 'VMPRTMNT'

    WHERE (1=1)
    --and (PO.VENDOR_ID = @VENDOR_ID
    --     OR @VENDOR_ID IS NULL)
        AND V.ID != 'TMXDIV'
     --   AND 
        --(POL.PURC_ORDER_ID = @PURC_ORDER_ID
        --   OR @PURC_ORDER_ID IS NULL)
                AND R.RECEIVED_Date >= @START_DATE AND R.RECEIVED_Date <= @END_DATE


ORDER BY PURC_ORDER_ID, VENDOR_ID,PURC_ORDER_LINE_NO
;



