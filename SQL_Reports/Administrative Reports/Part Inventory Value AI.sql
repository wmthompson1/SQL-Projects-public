-- Visual Enterprise Reports/Administrative Reports/Part Inventory Value - End Items Q1 2025
-- End Items Inventory Value Report for First Quarter 2025
-- This report provides the inventory value of end items (finished goods/manufactured parts) 
-- based on their last transaction costs as of Q1 2025 end date (March 31, 2025).

-- Date range for Q1 2025
DECLARE @Q1StartDate DATETIME = '2025-01-01';
DECLARE @Q1EndDate DATETIME = '2025-03-31';
DECLARE @AsOfDate DATETIME = @Q1EndDate; -- End of Q1 2025

-- End item identification criteria
-- Typically end items are parts that:
-- 1. Have commodity codes like 'END ITEM', 'FINISHED GOODS', 'FG', etc.
-- 2. Are not purchased (PURCHASED = 'N' or null)
-- 3. Are manufactured parts (FABRICATED = 'Y' or similar indicators)
-- 4. Have work orders as their primary source (not purchased)
DECLARE @EndItemCommCodes VARCHAR(500) = 'END ITEM,FINISHED GOODS,FG,ASSEMBLY,FINAL ASSY'; -- Common end item commodity codes

-- Main query for End Items Inventory Value - Q1 2025
WITH EndItemsQ1 AS (
    -- Identify end items with Q1 2025 transaction activity
    SELECT DISTINCT
        P.ID as PART_ID,
        P.[DESCRIPTION] as PART_DESCRIPTION,
        P.QTY_ON_HAND,
        P.COMMODITY_CODE,
        P.PURCHASED,
        P.FABRICATED,
        P.BUYER_USER_ID,
        P.PLANNER_USER_ID,
        -- Check if part had any manufacturing activity in Q1 2025
        CASE 
            WHEN EXISTS (
                SELECT 1 FROM WORK_ORDER WO 
                WHERE WO.PART_ID = P.ID 
                AND WO.TYPE = 'W' 
                AND WO.STATUS IN ('R', 'F', 'C') -- Released, Finished, Closed
                AND (WO.DESIRED_WANT_DATE BETWEEN @Q1StartDate AND @Q1EndDate
                     OR WO.CLOSE_DATE BETWEEN @Q1StartDate AND @Q1EndDate)
            ) THEN 'Y' 
            ELSE 'N' 
        END as HAD_Q1_MANUFACTURING
    FROM PART P
    WHERE P.QTY_ON_HAND > 0
        AND (
            -- End item identification criteria
            P.COMMODITY_CODE IN (SELECT value FROM STRING_SPLIT(@EndItemCommCodes, ','))
            OR (P.PURCHASED = 'N' AND P.FABRICATED = 'Y')
            OR EXISTS (
                -- Parts that are primarily manufactured (have work orders as main source)
                SELECT 1 FROM WORK_ORDER WO 
                WHERE WO.PART_ID = P.ID 
                AND WO.TYPE = 'W'
                AND WO.SUB_ID = '0' -- End item work orders (not sub-assemblies)
            )
        )
),
LastTransactionCosts AS (
    -- Get the most recent transaction costs for each end item as of Q1 end
    SELECT 
        IT.PART_ID,
        IT.TRANSACTION_ID,
        IT.TRANSACTION_DATE,
        IT.QTY as TRANSACTION_QTY,
        IT.ACT_MATERIAL_COST,
        IT.ACT_LABOR_COST,
        IT.ACT_BURDEN_COST,
        IT.ACT_SERVICE_COST,
        IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST as TOTAL_TRANSACTION_COST,
        IT.TYPE as TRANSACTION_TYPE,
        IT.CLASS as TRANSACTION_CLASS,
        ROW_NUMBER() OVER (PARTITION BY IT.PART_ID ORDER BY IT.TRANSACTION_DATE DESC, IT.TRANSACTION_ID DESC) as RN
    FROM INVENTORY_TRANS IT
    INNER JOIN EndItemsQ1 EI ON IT.PART_ID = EI.PART_ID
    WHERE IT.TRANSACTION_DATE <= @AsOfDate
        AND IT.QTY <> 0 
        AND IT.TYPE IN ('I', 'O', 'R') -- Include Issues, Other, Receipts
        AND IT.CLASS <> 'A' -- Exclude adjustments
        AND (IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST) > 0
)

-- Final result set: End Items Inventory Value for Q1 2025
SELECT 
    EI.PART_ID,
    EI.PART_DESCRIPTION,
    EI.QTY_ON_HAND,
    EI.COMMODITY_CODE,
    EI.PURCHASED,
    EI.FABRICATED,
    EI.BUYER_USER_ID,
    EI.PLANNER_USER_ID,
    EI.HAD_Q1_MANUFACTURING,
    
    -- Cost information from last transaction
    LTC.TRANSACTION_DATE as LAST_COST_DATE,
    LTC.TRANSACTION_TYPE,
    LTC.TRANSACTION_QTY,
    LTC.ACT_MATERIAL_COST,
    LTC.ACT_LABOR_COST,
    LTC.ACT_BURDEN_COST,
    LTC.ACT_SERVICE_COST,
    LTC.TOTAL_TRANSACTION_COST as LAST_TRANSACTION_TOTAL_COST,
    
    -- Unit cost calculation
    CASE 
        WHEN LTC.TRANSACTION_QTY > 0 
        THEN LTC.TOTAL_TRANSACTION_COST / LTC.TRANSACTION_QTY 
        ELSE 0 
    END as UNIT_COST,
    
    -- Total inventory value
    CASE 
        WHEN LTC.TRANSACTION_QTY > 0 
        THEN (LTC.TOTAL_TRANSACTION_COST / LTC.TRANSACTION_QTY) * EI.QTY_ON_HAND
        ELSE 0 
    END as TOTAL_INVENTORY_VALUE,
    
    -- Q1 2025 date range for reference
    @Q1StartDate as Q1_START_DATE,
    @Q1EndDate as Q1_END_DATE,
    @AsOfDate as AS_OF_DATE

FROM EndItemsQ1 EI
LEFT JOIN LastTransactionCosts LTC ON EI.PART_ID = LTC.PART_ID AND LTC.RN = 1

WHERE EI.QTY_ON_HAND > 0

ORDER BY 
    TOTAL_INVENTORY_VALUE DESC,
    EI.PART_ID;

-- Summary totals query (run separately or uncomment to include)

-- SELECT 
--     '*** TOTALS ***' as PART_ID,
--     'End Items Inventory Value Summary - Q1 2025' as PART_DESCRIPTION,
--     SUM(EI.QTY_ON_HAND) as QTY_ON_HAND,
--     'SUMMARY' as COMMODITY_CODE,
--     '' as PURCHASED,
--     '' as FABRICATED,
--     '' as BUYER_USER_ID,
--     '' as PLANNER_USER_ID,
--     '' as HAD_Q1_MANUFACTURING,
--     @AsOfDate as LAST_COST_DATE,
--     'SUMMARY' as TRANSACTION_TYPE,
--     0 as TRANSACTION_QTY,
--     SUM(LTC.ACT_MATERIAL_COST) as ACT_MATERIAL_COST,
--     SUM(LTC.ACT_LABOR_COST) as ACT_LABOR_COST,
--     SUM(LTC.ACT_BURDEN_COST) as ACT_BURDEN_COST,
--     SUM(LTC.ACT_SERVICE_COST) as ACT_SERVICE_COST,
--     SUM(LTC.TOTAL_TRANSACTION_COST) as LAST_TRANSACTION_TOTAL_COST,
--     0 as UNIT_COST,
--     SUM(CASE 
--         WHEN LTC.TRANSACTION_QTY > 0 
--         THEN (LTC.TOTAL_TRANSACTION_COST / LTC.TRANSACTION_QTY) * EI.QTY_ON_HAND
--         ELSE 0 
--     END) as TOTAL_INVENTORY_VALUE,
--     @Q1StartDate as Q1_START_DATE,
--     @Q1EndDate as Q1_END_DATE,
--     @AsOfDate as AS_OF_DATE

-- FROM EndItemsQ1 EI
-- LEFT JOIN LastTransactionCosts LTC ON EI.PART_ID = LTC.PART_ID AND LTC.RN = 1
-- WHERE EI.QTY_ON_HAND > 0;
