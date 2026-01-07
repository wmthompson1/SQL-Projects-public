

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET DEADLOCK_PRIORITY LOW;

DECLARE @BatchSize        int    = 2000;
DECLARE @Rows             int    = 1;
DECLARE @BatchNo          int    = 0;

WHILE @Rows > 0
BEGIN
    SET @BatchNo += 1;
    PRINT CONCAT('=== Starting batch #', @BatchNo, ' (TOP ', @BatchSize, ') ===');

    BEGIN TRY
        ;WITH t AS
        (
            SELECT
                LT.transaction_id,
                LT.[TYPE],
                LT.ACT_BURDEN_COST,
                LT.HOURLY_COST,
                LT.HOURS_WORKED,
                CASE
                    WHEN LT.[TYPE] = 'S' THEN SRS.BUR_PERCENT_SETUP
                    WHEN LT.[TYPE] = 'R' THEN SRS.BUR_PERCENT_RUN
                    ELSE NULL
                END AS BurdenPctRaw
            FROM dbo.LABOR_TICKET AS LT (nolock)
            JOIN dbo.SHOP_RESOURCE_SITE AS SRS
                ON SRS.RESOURCE_ID = LT.RESOURCE_ID
            WHERE 1 = 1
              AND ISNULL(LT.POSTING_CANDIDATE,'') <> 'Y'      -- exclude already marked
              AND LT.TRANSACTION_DATE >= '2025-11-27'
              AND LT.WORKORDER_TYPE = 'W'
              AND LT.ACT_LABOR_COST > 0
              AND LT.[TYPE] IN ('S','R')
        ),
        calc AS
        (
            SELECT
                t.*,
                TRY_CONVERT(decimal(28,6), HOURLY_COST)   AS HourlyCost,
                TRY_CONVERT(decimal(28,6), HOURS_WORKED)  AS HoursWorked,
                TRY_CONVERT(decimal(28,6), BurdenPctRaw)  AS BurdenPct
            FROM t
        ),
        calc_vals AS
        (
            SELECT
                calc.transaction_id,
                calc.ACT_BURDEN_COST,
                TRY_CONVERT(decimal(10,2),
                    (HourlyCost * HoursWorked * BurdenPct) / 100.0
                ) AS TargetBurdenCost
            FROM calc
            WHERE HourlyCost  IS NOT NULL
              AND HoursWorked IS NOT NULL
              AND BurdenPct  IS NOT NULL
        )
        UPDATE TOP (@BatchSize) LT
            SET
                LT.ACT_BURDEN_COST   = v.TargetBurdenCost,
                LT.POSTING_CANDIDATE = 'Y'                 -- mark this batch
        FROM dbo.LABOR_TICKET AS LT
        JOIN calc_vals AS v
            ON v.transaction_id = LT.transaction_id
        WHERE LT.ACT_BURDEN_COST IS NOT NULL
          AND ABS(LT.ACT_BURDEN_COST - v.TargetBurdenCost) > 0.01;

        SET @Rows = @@ROWCOUNT;

        PRINT CONCAT('Batch #', @BatchNo, ' updated rows: ', @Rows);

        IF @Rows = 0
        BEGIN
            PRINT CONCAT('=== No qualifying rows remain. Exiting at batch #', @BatchNo, ' ===');
            BREAK;
        END

        -- Optional: throttle between batches
        -- WAITFOR DELAY '00:00:01';

        PRINT CONCAT('=== Completed batch #', @BatchNo, ' ===');
    END TRY
    BEGIN CATCH
        PRINT CONCAT('*** ERROR in batch #', @BatchNo, ' ***');
        PRINT CONCAT('Error ', ERROR_NUMBER(), ' (Severity ', ERROR_SEVERITY(), ', State ', ERROR_STATE(), '): ', ERROR_MESSAGE());
        PRINT CONCAT('Procedure: ', COALESCE(ERROR_PROCEDURE(), '(adhoc)'), ', Line: ', ERROR_LINE());
        PRINT CONCAT('Context: transaction_id update loop with TOP ', @BatchSize);

        -- No explicit transaction in this loop, but if future edits add one,
        -- this guard ensures a safe rollback.
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        -- Decide whether to continue or stop. Under time pressure, safest is to stop:
        PRINT 'Halting loop due to error.';
        BREAK;
    END CATCH
END

--SP_WHOISACTIVE
--    EXEC sp_WhoIsActive @get_task_info = 2, @filter = 208;
