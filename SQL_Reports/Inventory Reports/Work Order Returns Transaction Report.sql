-- Work Order Returns Inventory Transaction Report
-- produced by AI Assistant, not verified, for review only

-- This report shows inventory transactions related to work order returns (both material returns and receipt returns)

-- Date range parameters - adjust as needed (KEEP NARROW TO AVOID ROW LIMITS)
DECLARE @StartDate DATE = '2025-01-15'; -- Last month only to limit rows
DECLARE @EndDate DATE = '2025-01-20';

-- ROW LIMIT to prevent max row count exceeded error
DECLARE @MaxRows INT = 5000; -- Adjust based on your system limits

-- Optional filters - USE THESE TO NARROW RESULTS
DECLARE @WorkOrderFilter NVARCHAR(50) = NULL; -- e.g., 'WO123456%' for specific work order pattern
DECLARE @PartFilter NVARCHAR(50) = NULL; -- e.g., 'PART%' for specific part pattern
DECLARE @WarehouseFilter NVARCHAR(10) = NULL; -- e.g., 'WH01' for specific warehouse
DECLARE @MinCostThreshold MONEY = 0; -- Only show returns above this cost threshold

-- Main query for Work Order Returns with row limiting
WITH WorkOrderReturns AS (
    SELECT TOP (@MaxRows)
        IT.TRANSACTION_ID,
        IT.PART_ID,
        P.[DESCRIPTION] as PART_DESCRIPTION,
        IT.TRANSACTION_DATE,
        IT.QTY,
        IT.COSTED_QTY,
        IT.TYPE as TRANSACTION_TYPE,
        IT.CLASS as TRANSACTION_CLASS,
        
        -- Cost components
        IT.ACT_MATERIAL_COST,
        IT.ACT_LABOR_COST,
        IT.ACT_BURDEN_COST,
        IT.ACT_SERVICE_COST,
        IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST as TOTAL_COST,
        
        -- Work order information
        IT.WORKORDER_BASE_ID,
        IT.WORKORDER_LOT_ID,
        IT.WORKORDER_SPLIT_ID,
        IT.WORKORDER_SUB_ID,
        IT.OPERATION_SEQ_NO,
        IT.REQ_PIECE_NO,
        
        -- Location information
        IT.WAREHOUSE_ID,
        IT.LOCATION_ID,
        W.[DESCRIPTION] as WAREHOUSE_DESCRIPTION,
        
        -- Additional transaction details
        IT.[DESCRIPTION] as TRANSACTION_DESCRIPTION,
        IT.ISSUE_REAS_ID as ISSUE_REASON,
        IT.CREATE_DATE,
        IT.USER_ID as CREATE_USER_ID,
        
        -- Work order number formatting
        CASE 
            WHEN IT.WORKORDER_BASE_ID IS NOT NULL 
            THEN dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID)
            ELSE NULL
        END as WORK_ORDER_NUMBER,
        
        -- Transaction type description
        CASE 
            WHEN IT.TYPE = 'IR' AND IT.CLASS = 'R' THEN 'Issue Return - Material Returned to Stock'
            WHEN IT.TYPE = 'RR' AND IT.CLASS = 'R' THEN 'Receipt Return - WO Receipt Reversed'
            WHEN IT.TYPE = 'I' AND IT.CLASS = 'R' THEN 'Issue Return - General'
            WHEN IT.TYPE = 'R' AND IT.CLASS = 'R' THEN 'Receipt Return - General'
            WHEN IT.TYPE = 'IR' THEN 'Issue Return'
            WHEN IT.TYPE = 'RR' THEN 'Receipt Return'
            ELSE IT.TYPE + ' - ' + ISNULL(IT.CLASS, 'N/A')
        END as TRANSACTION_TYPE_DESCRIPTION,
        
        -- Unit cost calculation
        CASE 
            WHEN IT.QTY <> 0 
            THEN (IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST) / ABS(IT.QTY)
            ELSE 0
        END as UNIT_COST
        
    FROM INVENTORY_TRANS IT WITH (NOLOCK)
    INNER JOIN PART P WITH (NOLOCK) ON IT.PART_ID = P.ID
    LEFT JOIN WAREHOUSE W WITH (NOLOCK) ON IT.WAREHOUSE_ID = W.ID
    
    WHERE 1=1
--- IGNORE ---
        -- Focus on return transactions
    -- and
    --     (
    --         (IT.TYPE = 'IR' AND IT.CLASS = 'R') -- Issue Returns (material returned to stock from WO)
    --         OR (IT.TYPE = 'RR' AND IT.CLASS = 'R') -- Receipt Returns (WO receipts reversed)
    --         OR (IT.TYPE = 'I' AND IT.CLASS = 'R') -- General issue returns
    --         OR (IT.TYPE = 'R' AND IT.CLASS = 'R') -- General receipt returns
    --         OR IT.TYPE IN ('IR', 'RR') -- All issue/receipt returns regardless of class
    --     )
        AND IT.TRANSACTION_DATE BETWEEN @StartDate AND @EndDate
        AND IT.WORKORDER_BASE_ID IS NOT NULL -- Must be related to a work order
        
        -- Optional filters
        AND (@WorkOrderFilter IS NULL OR 
             dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID) LIKE @WorkOrderFilter)
        AND (@PartFilter IS NULL OR IT.PART_ID LIKE @PartFilter)
        AND (@WarehouseFilter IS NULL OR IT.WAREHOUSE_ID = @WarehouseFilter)
        -- Cost threshold filter to reduce result set
        AND ABS(IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST) >= @MinCostThreshold
),

-- Get work order details for context
WorkOrderDetails AS (
    SELECT 
        WO.BASE_ID,
        WO.LOT_ID,
        WO.SPLIT_ID,
        WO.SUB_ID,
        WO.PART_ID as WO_PART_ID,
        WOP.[DESCRIPTION] as WO_PART_DESCRIPTION,
        WO.STATUS as WO_STATUS,
        WO.DESIRED_QTY,
        WO.DESIRED_WANT_DATE,
        WO.CLOSE_DATE,
        dbo.sfnWONUMFormat(WO.BASE_ID, WO.LOT_ID, WO.SPLIT_ID, WO.SUB_ID) as WO_NUMBER,
        WOP.BUYER_USER_ID as WO_BUYER,
        WOP.PLANNER_USER_ID as WO_PLANNER
    FROM WORK_ORDER WO WITH (NOLOCK)
    INNER JOIN PART WOP WITH (NOLOCK) ON WO.PART_ID = WOP.ID
    WHERE WO.TYPE = 'W'
)

-- Final result set
SELECT 
    WOR.TRANSACTION_ID,
    WOR.TRANSACTION_DATE,
    WOR.PART_ID,
    WOR.PART_DESCRIPTION,
    WOR.WORK_ORDER_NUMBER,
    WOD.WO_PART_ID,
    WOD.WO_PART_DESCRIPTION,
    WOD.WO_STATUS,
    WOD.WO_BUYER,
    WOD.WO_PLANNER,
    WOR.OPERATION_SEQ_NO,
    WOR.REQ_PIECE_NO,
    WOR.TRANSACTION_TYPE,
    WOR.TRANSACTION_CLASS,
    WOR.TRANSACTION_TYPE_DESCRIPTION,
    WOR.QTY,
    WOR.COSTED_QTY,
    WOR.UNIT_COST,
    WOR.ACT_MATERIAL_COST,
    WOR.ACT_LABOR_COST,
    WOR.ACT_BURDEN_COST,
    WOR.ACT_SERVICE_COST,
    WOR.TOTAL_COST,
    WOR.WAREHOUSE_ID,
    WOR.WAREHOUSE_DESCRIPTION,
    WOR.LOCATION_ID,
    WOR.ISSUE_REASON,
    WOR.TRANSACTION_DESCRIPTION,
    WOR.CREATE_DATE,
    WOR.CREATE_USER_ID,
    WOD.DESIRED_QTY as WO_DESIRED_QTY,
    WOD.DESIRED_WANT_DATE as WO_DUE_DATE,
    WOD.CLOSE_DATE as WO_CLOSE_DATE,
    
    -- Impact indicators
    CASE 
        WHEN WOR.QTY > 0 THEN 'Return to Stock'
        WHEN WOR.QTY < 0 THEN 'Return from Stock'
        ELSE 'No Qty Impact'
    END as INVENTORY_IMPACT,
    
    -- Date range for reference
    @StartDate as REPORT_START_DATE,
    @EndDate as REPORT_END_DATE

FROM WorkOrderReturns WOR
LEFT JOIN WorkOrderDetails WOD ON 
    WOR.WORKORDER_BASE_ID = WOD.BASE_ID
    AND WOR.WORKORDER_LOT_ID = WOD.LOT_ID
    AND WOR.WORKORDER_SPLIT_ID = WOD.SPLIT_ID
    AND WOR.WORKORDER_SUB_ID = WOD.SUB_ID
where 1=1
and WOR.TRANSACTION_ID = '16499'

ORDER BY 
    WOR.TRANSACTION_DATE DESC,
    WOR.WORK_ORDER_NUMBER,
    WOR.PART_ID,
    WOR.TRANSACTION_ID;

-- Separate queries for summaries (using temp table or re-running the logic)

-- -- Summary by transaction type
-- WITH WorkOrderReturnsSummary AS (
--     SELECT 
--         IT.TRANSACTION_ID,
--         IT.PART_ID,
--         IT.TRANSACTION_DATE,
--         IT.QTY,
--         IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST as TOTAL_COST,
--         IT.WORKORDER_BASE_ID,
--         IT.WORKORDER_LOT_ID,
--         IT.WORKORDER_SPLIT_ID,
--         IT.WORKORDER_SUB_ID,
--         CASE 
--             WHEN IT.QTY <> 0 
--             THEN (IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST) / ABS(IT.QTY)
--             ELSE 0
--         END as UNIT_COST,
--         CASE 
--             WHEN IT.TYPE = 'IR' AND IT.CLASS = 'R' THEN 'Issue Return - Material Returned to Stock'
--             WHEN IT.TYPE = 'RR' AND IT.CLASS = 'R' THEN 'Receipt Return - WO Receipt Reversed'
--             WHEN IT.TYPE = 'I' AND IT.CLASS = 'R' THEN 'Issue Return - General'
--             WHEN IT.TYPE = 'R' AND IT.CLASS = 'R' THEN 'Receipt Return - General'
--             WHEN IT.TYPE = 'IR' THEN 'Issue Return'
--             WHEN IT.TYPE = 'RR' THEN 'Receipt Return'
--             ELSE IT.TYPE + ' - ' + ISNULL(IT.CLASS, 'N/A')
--         END as TRANSACTION_TYPE_DESCRIPTION,
--         dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID) as WORK_ORDER_NUMBER
--     FROM INVENTORY_TRANS IT WITH (NOLOCK)
--     WHERE 
--         (
--             (IT.TYPE = 'IR' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'RR' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'I' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'R' AND IT.CLASS = 'R')
--             OR IT.TYPE IN ('IR', 'RR')
--         )
--         AND IT.TRANSACTION_DATE BETWEEN @StartDate AND @EndDate
--         AND IT.WORKORDER_BASE_ID IS NOT NULL
--         AND (@WorkOrderFilter IS NULL OR 
--              dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID) LIKE @WorkOrderFilter)
--         AND (@PartFilter IS NULL OR IT.PART_ID LIKE @PartFilter)
--         AND (@WarehouseFilter IS NULL OR IT.WAREHOUSE_ID = @WarehouseFilter)
-- )
-- SELECT 
--     'SUMMARY BY TRANSACTION TYPE' as SUMMARY_TYPE,
--     WOR.TRANSACTION_TYPE_DESCRIPTION,
--     COUNT(*) as TRANSACTION_COUNT,
--     SUM(ABS(WOR.QTY)) as TOTAL_QTY,
--     SUM(ABS(WOR.TOTAL_COST)) as TOTAL_COST_IMPACT,
--     AVG(ABS(WOR.UNIT_COST)) as AVG_UNIT_COST,
--     MIN(WOR.TRANSACTION_DATE) as EARLIEST_DATE,
--     MAX(WOR.TRANSACTION_DATE) as LATEST_DATE
-- FROM WorkOrderReturnsSummary WOR
-- GROUP BY WOR.TRANSACTION_TYPE_DESCRIPTION
-- ORDER BY TOTAL_COST_IMPACT DESC;

-- -- Summary by work order
-- WITH WorkOrderReturnsByWO AS (
--     SELECT 
--         IT.TRANSACTION_ID,
--         IT.PART_ID,
--         IT.QTY,
--         IT.ACT_MATERIAL_COST + IT.ACT_LABOR_COST + IT.ACT_BURDEN_COST + IT.ACT_SERVICE_COST as TOTAL_COST,
--         IT.WORKORDER_BASE_ID,
--         IT.WORKORDER_LOT_ID,
--         IT.WORKORDER_SPLIT_ID,
--         IT.WORKORDER_SUB_ID,
--         dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID) as WORK_ORDER_NUMBER
--     FROM INVENTORY_TRANS IT WITH (NOLOCK)
--     WHERE 
--         (
--             (IT.TYPE = 'IR' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'RR' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'I' AND IT.CLASS = 'R')
--             OR (IT.TYPE = 'R' AND IT.CLASS = 'R')
--             OR IT.TYPE IN ('IR', 'RR')
--         )

--         AND IT.TRANSACTION_DATE BETWEEN @StartDate AND @EndDate
--         AND IT.WORKORDER_BASE_ID IS NOT NULL
--         AND (@WorkOrderFilter IS NULL OR 
--              dbo.sfnWONUMFormat(IT.WORKORDER_BASE_ID, IT.WORKORDER_LOT_ID, IT.WORKORDER_SPLIT_ID, IT.WORKORDER_SUB_ID) LIKE @WorkOrderFilter)
--         AND (@PartFilter IS NULL OR IT.PART_ID LIKE @PartFilter)
--         AND (@WarehouseFilter IS NULL OR IT.WAREHOUSE_ID = @WarehouseFilter)
-- )
-- SELECT 
--     'SUMMARY BY WORK ORDER' as SUMMARY_TYPE,
--     WOR.WORK_ORDER_NUMBER,
--     WOD.WO_PART_ID,
--     WOD.WO_PART_DESCRIPTION,
--     WOD.WO_STATUS,
--     COUNT(*) as RETURN_TRANSACTION_COUNT,
--     COUNT(DISTINCT WOR.PART_ID) as DISTINCT_PARTS_RETURNED,
--     SUM(ABS(WOR.QTY)) as TOTAL_QTY_RETURNED,
--     SUM(ABS(WOR.TOTAL_COST)) as TOTAL_COST_IMPACT
-- FROM WorkOrderReturnsByWO WOR
-- LEFT JOIN (
--     SELECT 
--         WO.BASE_ID,
--         WO.LOT_ID,
--         WO.SPLIT_ID,
--         WO.SUB_ID,
--         WO.PART_ID as WO_PART_ID,
--         WOP.[DESCRIPTION] as WO_PART_DESCRIPTION,
--         WO.STATUS as WO_STATUS
--     FROM WORK_ORDER WO WITH (NOLOCK)
--     INNER JOIN PART WOP WITH (NOLOCK) ON WO.PART_ID = WOP.ID
--     WHERE WO.TYPE = 'W'
-- ) WOD ON 
--     WOR.WORKORDER_BASE_ID = WOD.BASE_ID
--     AND WOR.WORKORDER_LOT_ID = WOD.LOT_ID
--     AND WOR.WORKORDER_SPLIT_ID = WOD.SPLIT_ID
--     AND WOR.WORKORDER_SUB_ID = WOD.SUB_ID
-- GROUP BY 
--     WOR.WORK_ORDER_NUMBER,
--     WOD.WO_PART_ID,
--     WOD.WO_PART_DESCRIPTION,
--     WOD.WO_STATUS
-- ORDER BY TOTAL_COST_IMPACT DESC;

/*
ROW LIMITING NOTES:
- Added TOP (@MaxRows) to limit result set to prevent "max row count exceeded" errors
- Default @MaxRows = 10,000 - adjust based on your system limits
- Narrowed default date range to last month only
- Added @MinCostThreshold filter to exclude low-value transactions
- Summary queries are commented out to focus on main detail report

TO USE EFFECTIVELY:
1. Set specific filters (@WorkOrderFilter, @PartFilter, @WarehouseFilter) to narrow results
2. Increase @MinCostThreshold to focus on significant returns only  
3. Use shorter date ranges for large datasets
4. Uncomment summary sections only if detail report runs successfully
*/