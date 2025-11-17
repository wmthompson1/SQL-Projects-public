# DBA - TempDB monitor4 interim shrink

```sql
-- USE tempdb;
-- GO
-- DBCC SHRINKFILE (tempdev, <target_size_in_MB>); -- Shrinks the primary data file
-- GO
-- DBCC SHRINKFILE (templog, <target_size_in_MB>); -- Shrinks the log file
-- GO


-- /* Script #1: List tempdb files with size/usage/growth */
-- USE tempdb;
-- SET NOCOUNT ON;

-- SELECT 
--     df.file_id,
--     df.name AS logical_name,
--     df.type_desc,
--     physical_name = df.physical_name,
--     size_mb       = CONVERT(decimal(19,2), df.size * 8.0 / 1024.0),
--     space_used_mb = CONVERT(decimal(19,2), FILEPROPERTY(df.name, 'SpaceUsed') * 8.0 / 1024.0),
--     free_mb       = CONVERT(decimal(19,2), (df.size - FILEPROPERTY(df.name, 'SpaceUsed')) * 8.0 / 1024.0),
--     growth_desc   = CASE 
--                         WHEN df.is_percent_growth = 1 
--                             THEN CONCAT(df.growth, '%')
--                         ELSE CONCAT(CONVERT(int, df.growth * 8.0 / 1024.0), ' MB')
--                     END,
--     max_size_desc = CASE 
--                         WHEN df.max_size = -1 THEN 'Unlimited'
--                         ELSE CONCAT(CONVERT(bigint, df.max_size * 8.0 / 1024.0), ' MB')
--                     END
-- FROM sys.database_files AS df
-- ORDER BY df.type_desc, df.file_id;

/* Script #2: Shrink tempdb files safely with targets and optional growth settings */

-- =======================
-- Parameters (EDIT THESE)
-- =======================
DECLARE 
    @TargetDataTotalMB    int     = 151200,   -- Total target for all tempdb DATA files (e.g., 51200 = 50 GB)
    @TargetLogMB          int     = 4096,    -- Target for tempdb LOG file (e.g., 4096 = 4 GB)
    @SetFixedGrowthMB     int     = 2048,    -- Set FILEGROWTH to this MB (NULL = leave as-is)
    @DryRun               bit     = 0       -- 1 = print-only, 0 = execute

-- =======================
-- No edits below this line
-- =======================
SET NOCOUNT ON;
USE tempdb;

DECLARE 
    @DataFileCount int,
    @PerFileTargetMB int,
    @MinPerFileMB int = 128;  -- don't set absurdly small per-file target

-- Count data files
SELECT @DataFileCount = COUNT(*) 
FROM sys.database_files
WHERE type_desc = 'ROWS';

IF @DataFileCount = 0
BEGIN
    RAISERROR('No tempdb data files found.', 16, 1);
    RETURN;
END

-- Compute even split across data files
SET @PerFileTargetMB = @TargetDataTotalMB / @DataFileCount;
IF @PerFileTargetMB < @MinPerFileMB 
    SET @PerFileTargetMB = @MinPerFileMB;

PRINT CONCAT('Target total DATA size: ', @TargetDataTotalMB, ' MB across ', @DataFileCount, ' files => ', @PerFileTargetMB, ' MB per file');
PRINT CONCAT('Target LOG size: ', @TargetLogMB, ' MB');
IF @SetFixedGrowthMB IS NOT NULL 
    PRINT CONCAT('Will set FILEGROWTH to ', @SetFixedGrowthMB, ' MB for all files');
PRINT CASE WHEN @DryRun = 1 THEN 'Mode: DRY RUN (no changes will be made)' ELSE 'Mode: EXECUTE (changes will be applied)' END;

-- Show current file status
PRINT 'Current file layout:';
SELECT 
    df.file_id,
    df.name AS logical_name,
    df.type_desc,
    df.physical_name,
    size_mb       = CONVERT(decimal(19,2), df.size * 8.0 / 1024.0),
    space_used_mb = CONVERT(decimal(19,2), FILEPROPERTY(df.name, 'SpaceUsed') * 8.0 / 1024.0),
    free_mb       = CONVERT(decimal(19,2), (df.size - FILEPROPERTY(df.name, 'SpaceUsed')) * 8.0 / 1024.0),
    growth_desc   = CASE WHEN df.is_percent_growth = 1 
                         THEN CONCAT(df.growth, '%') 
                         ELSE CONCAT(CONVERT(int, df.growth * 8.0 / 1024.0), ' MB') END
FROM sys.database_files AS df
ORDER BY df.type_desc, df.file_id;

PRINT '---';

-- =======================
-- 2A) Shrink DATA files
-- =======================
DECLARE @name sysname, @cmd nvarchar(4000);
DECLARE data_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT name 
    FROM sys.database_files
    WHERE type_desc = 'ROWS'
    ORDER BY file_id;

OPEN data_cur;
FETCH NEXT FROM data_cur INTO @name;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- DBCC SHRINKFILE target is in MB
    SET @cmd = N'DBCC SHRINKFILE (' + QUOTENAME(@name) + N', ' + CAST(@PerFileTargetMB AS nvarchar(20)) + N') WITH NO_INFOMSGS;';
    PRINT @cmd;
    IF @DryRun = 0 EXEC(@cmd);

    -- Optionally set fixed growth and size to the target (to persist size/growth)
    IF @SetFixedGrowthMB IS NOT NULL
    BEGIN
        SET @cmd = N'ALTER DATABASE tempdb MODIFY FILE (NAME = ' + QUOTENAME(@name,'''') 
                 + N', SIZE = ' + CAST(@PerFileTargetMB AS nvarchar(20)) + N'MB'
                 + N', FILEGROWTH = ' + CAST(@SetFixedGrowthMB AS nvarchar(20)) + N'MB);';
        PRINT @cmd;
        IF @DryRun = 0 EXEC(@cmd);
    END

    FETCH NEXT FROM data_cur INTO @name;
END
CLOSE data_cur;
DEALLOCATE data_cur;

-- =======================
-- 2B) Shrink LOG file
-- =======================
DECLARE @logName sysname;
SELECT TOP (1) @logName = name FROM sys.database_files WHERE type_desc = 'LOG';

IF @logName IS NOT NULL
BEGIN
    SET @cmd = N'DBCC SHRINKFILE (' + QUOTENAME(@logName) + N', ' + CAST(@TargetLogMB AS nvarchar(20)) + N') WITH NO_INFOMSGS;';
    PRINT @cmd;
    IF @DryRun = 0 EXEC(@cmd);

    IF @SetFixedGrowthMB IS NOT NULL
    BEGIN
        SET @cmd = N'ALTER DATABASE tempdb MODIFY FILE (NAME = ' + QUOTENAME(@logName,'''') 
                 + N', SIZE = ' + CAST(@TargetLogMB AS nvarchar(20)) + N'MB'
                 + N', FILEGROWTH = ' + CAST(@SetFixedGrowthMB AS nvarchar(20)) + N'MB);';
        PRINT @cmd;
        IF @DryRun = 0 EXEC(@cmd);
    END
END

PRINT '---';
PRINT 'Post-shrink file layout:';
SELECT 
    df.file_id,
    df.name AS logical_name,
    df.type_desc,
    size_mb       = CONVERT(decimal(19,2), df.size * 8.0 / 1024.0),
    space_used_mb = CONVERT(decimal(19,2), FILEPROPERTY(df.name, 'SpaceUsed') * 8.0 / 1024.0),
    free_mb       = CONVERT(decimal(19,2), (df.size - FILEPROPERTY(df.name, 'SpaceUsed')) * 8.0 / 1024.0),
    growth_desc   = CASE WHEN df.is_percent_growth = 1 
                         THEN CONCAT(df.growth, '%') 
                         ELSE CONCAT(CONVERT(int, df.growth * 8.0 / 1024.0), ' MB') END
FROM sys.database_files AS df
ORDER BY df.type_desc, df.file_id;

go
-- check redo status on secondary replicas

-- -- Run on the secondary
-- SELECT 
--     ag.name AS AGName,
--     db_name(drs.database_id) AS DatabaseName,
--     drs.redo_queue_size AS RedoQueueKB,
--     drs.redo_rate AS RedoRateKBps,
--     drs.synchronization_state_desc,
--     drs.synchronization_health_desc
-- FROM sys.dm_hadr_database_replica_states AS drs
-- JOIN sys.availability_groups AS ag ON drs.group_id = ag.group_id
-- WHERE drs.is_local = 1;

-- estimated time to catch up (seconds)
-- Run on the SECONDARY
-- SET NOCOUNT ON;

-- SELECT 
--     AGName           = ag.name,
--     DatabaseName     = DB_NAME(drs.database_id),
--     drs.is_suspended,
--     drs.synchronization_state_desc,
--     drs.synchronization_health_desc,

--     -- Send (primary->secondary) queue/throughput
--     LogSendQueueKB   = drs.log_send_queue_size,      -- KB
--     LogSendRateKBps  = drs.log_send_rate,            -- KB/sec
--     EstSendLagMin    = CASE 
--                            WHEN drs.log_send_rate IS NULL OR drs.log_send_rate <= 0 THEN NULL
--                            ELSE CAST(drs.log_send_queue_size * 1.0 / drs.log_send_rate / 60.0 AS decimal(19,2))
--                        END,

--     -- Redo (unapplied on secondary) queue/throughput
--     RedoQueueKB      = drs.redo_queue_size,          -- KB
--     RedoRateKBps     = drs.redo_rate,                -- KB/sec
--     EstRedoLagMin    = CASE 
--                            WHEN drs.redo_rate IS NULL OR drs.redo_rate <= 0 THEN NULL
--                            ELSE CAST(drs.redo_queue_size * 1.0 / drs.redo_rate / 60.0 AS decimal(19,2))
--                        END
-- FROM sys.dm_hadr_database_replica_states AS drs
-- JOIN sys.availability_groups AS ag
--   ON ag.group_id = drs.group_id
-- WHERE drs.is_local = 1   -- this replica
-- ORDER BY ag.name, DatabaseName;
```