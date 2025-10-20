--USE [Datamart]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_BOE_BILLING_605]    Script Date: 8/29/2025 9:24:26 AM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO




-- ============================================= 
-- Monthly BOE Billing 605

-- Author:        traci treffert
-- Create date: 9/23/2019
-- Description:    Boeing Billing for BOE602 and BOE605
--        converted from original code in Crystal Reports to be used as SSRS report
--        take the logic/process out of hardcoded CR report and put in SQL for ease of maintenance
--        logic to also be included in Gross Margin processing
-- 08/29 William moved to live using linked server for depends
-- =============================================

--DECLARE @STARTDATE DATE = '2025-08-01';
--DECLARE @ENDDATE DATE = '2025-08-31';

--CREATE PROCEDURE [dbo].[usp_BOE_BILLING_605] (@STARTDATE DATE, @ENDDATE DATE)  
--AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

DECLARE @CHARGE FLOAT = (SELECT CHARGE FROM [SQL-BI-1].LIVESupplemental.dbo.[BOE_Billing_Charges] WHERE [REPORT] = 'usp_BOE_BILLING_605')
--, @STARTDATE DATE = '2023-01-01' 
--, @ENDDATE DATE = '2023-10-31'
;

SELECT SPROC 
    , [COST ITEM]
    , POS
    , [PART NUMBER]
    , RAMAC
    , [BILLED QTY]
    , CASE
        WHEN ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE) < 250 THEN 250 / [BILLED QTY]
        ELSE ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE) / [BILLED QTY] 
    END AS [UNIT PRICE]
    , CASE
        WHEN ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE) < 250 THEN 250 
        ELSE ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE)  
    END AS [EXTENDED DOLLARS]
    , [EXPEDITE DOLLARS]
    , [SPECIAL FEES]
    , 0 AS [SERVICE FEES]
    , SUM(SORT_SETUP) AS [SETUP HOURS]
    , SUM(SORT_RUN) AS [RUN HOURS]
    , [EXPEDITE HOURS]
    , [PACK SLIPS / DATE]
    , [INVOICE ID]
    , STUFF(REPLACE('/' + CONVERT(NVARCHAR(15), INVOICED_DATE, 101), '/0', '/'), 1, 1, '') + CASE
        WHEN ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE) < 250 THEN ',MIN LOT'
        ELSE ',WRAP' 
    END AS COMMENTS
    , CASE
        WHEN ((SUM(SORT_SETUP) + SUM(SORT_RUN)) * @CHARGE) < 250 THEN 1
        ELSE 9 
    END AS SORTATION

FROM 
    (SELECT '605' AS SPROC 
        , 0 AS [COST ITEM]
        , 1 AS POS
        , COL.PART_ID AS [PART NUMBER]
        , CO.ID AS RAMAC
        --, COL.TOTAL_SHIPPED_QTY AS [BILLED QTY]
        , IIF(COL.TOTAL_SHIPPED_QTY  = 0, SL.SHIPPED_QTY, COL.TOTAL_SHIPPED_QTY) AS [BILLED QTY]
        , 0 AS [EXPEDITE HOURS]
        , CASE
            WHEN RIGHT(CO.CUSTOMER_PO_REF, 2) = 'SB' THEN 250
            ELSE 0 
        END AS [EXPEDITE DOLLARS]
        , 0 AS [SPECIAL FEES]
        , LT.WORKORDER_BASE_ID
        , LT.HOURS_WORKED
        , LT.[TYPE]
        , LT.TRANSACTION_ID
        , CO.CUSTOMER_ID
        , SR.USER_1
        , SL.SHIPPED_QTY
        , S.INVOICE_ID AS [INVOICE ID]
        , S.INVOICED_DATE
        , S.PACKLIST_ID AS [PACK SLIPS / DATE]
        , SR.RESOURCE_ID
        , CASE
            WHEN LT.[TYPE] = 'S' THEN LT.HOURS_WORKED
            ELSE 0
        END AS SORT_SETUP
        , CASE
            WHEN LT.[TYPE] = 'R' THEN LT.HOURS_WORKED
            ELSE 0
        END AS SORT_RUN
    FROM dbo.SHIPPER S
    INNER JOIN dbo.SHIPPER_LINE SL
        ON S.PACKLIST_ID = SL.PACKLIST_ID
    INNER JOIN dbo.CUST_ORDER_LINE COL
        ON SL.CUST_ORDER_ID = COL.CUST_ORDER_ID
        AND SL.CUST_ORDER_LINE_NO = COL.LINE_NO
    INNER JOIN dbo.CUSTOMER_ORDER CO
        ON COL.CUST_ORDER_ID = CO.ID
    INNER JOIN dbo.DEMAND_SUPPLY_LINK DSL
        ON COL.CUST_ORDER_ID = DSL.DEMAND_BASE_ID
        AND COL.LINE_NO = DSL.DEMAND_SEQ_NO
    INNER JOIN dbo.WORK_ORDER WO
        ON DSL.SUPPLY_BASE_ID = WO.BASE_ID
        AND DSL.SUPPLY_LOT_ID = WO.LOT_ID
        AND DSL.SUPPLY_SPLIT_ID = WO.SPLIT_ID
    INNER JOIN dbo.LABOR_TICKET LT
        ON WO.BASE_ID = LT.WORKORDER_BASE_ID
        AND WO.LOT_ID = LT.WORKORDER_LOT_ID
        AND WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID
        AND WO.SUB_ID = LT.WORKORDER_SUB_ID
        AND WO.[TYPE] = LT.WORKORDER_TYPE
    INNER JOIN dbo.SHOP_RESOURCE_SITE SR
        ON LT.RESOURCE_ID = SR.RESOURCE_ID
        --AND ISNULL(SR.USER_9, '') != 'BOE BILLING EXCLUDE'  -- Change
    WHERE SL.SHIPPED_QTY > 0
        AND WO.BASE_ID NOT LIKE N'%R%'
        AND WO.PART_ID NOT LIKE '%REWORK%'
--> tt20211202: remove 602 from billing
-->        AND CO.CUSTOMER_ID IN (N'BOE602', N'BOE605')
        AND CO.CUSTOMER_ID IN (N'BOE605')
        AND (S.INVOICED_DATE >= @STARTDATE AND S.INVOICED_DATE <= @ENDDATE)
    ) A
GROUP BY SPROC 
    , [COST ITEM]
    , POS
    , [PART NUMBER]
    , RAMAC
    , [BILLED QTY]
    , [PACK SLIPS / DATE]
    , [INVOICE ID]
    , INVOICED_DATE
    , [EXPEDITE HOURS]
    , [EXPEDITE DOLLARS]
    , [SPECIAL FEES]
--GO

-- SELECT * FROM LIVESupplemental.dbo.[BOE_Billing_Charges] WHERE [REPORT] = 'usp_BOE_BILLING_605'

