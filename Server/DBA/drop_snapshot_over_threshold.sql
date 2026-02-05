
-- Manufacturing_drop_snap_if_over_threshold.sql

/**
Description:
Sample:
Date      Modified By      Change Description
---------- ------------------ ------------------------------------------------------------
09/22/2025	William	      Created.
09/22/2025    William	      Initial version with drop logic based on hours threshold.
09/22/2025    William	      Updated to use minutes for threshold and added logging of drop attempts.
02/05/2026    William	      Was inadvertently deleted before version testing - needs retest 

Description: drop snapshot to avoid IO if over threshold age

Note: this script is intended to be run as a SQL Agent job on the server hosting the source database.
It uses application locks to prevent concurrent runs and logs drop attempts to a table.
Only sbapshot dropping is done here; creation is handled in a separate script.
Only Snapshots have source_database_id set; regular DBs do not.


    Checklist:
	for manufacturing:
	- Source database: LIVE
    - Snapshot name: VisualProdTmpSnp
    - Snapshot physical files (user-supplied):
		E:\SQLDATA\VisualProd.ss 
		E:\SQLDATA\VisualProd2.ss

	for quality:
    - Source database: IQM_Baseline_App
    - Snapshot name: IQMProdTmpSnp
    - Snapshot physical files (user-supplied):
        E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IQMProd.ss
        E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IQMProd2.ss.ss

If you want automatic cleanup, set @autoDropOldSnapshots = 1 near the top of the script and run it.
Set test mode to 1 to skip actual drops and just print what would be dropped for validation.

If you'd rather review before dropping, leave it 0 and manually drop snapshots the script lists.
Quality gates

job processes
ManagedData - drop old snapshots on 2nd
ManagedData - Manufacturing Create Snapshot

select * from Staging.managedData.SnapshotDropLog


**/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW
SET NOCOUNT ON;

-- Parameters (edit if you want different values)
DECLARE @Manufacturing_snapshot BIT = 1
DECLARE @counter INT = 0
DECLARE @testMode BIT = 0; -- run in test mode by default for validation
DECLARE @sourceDb sysname = N'LIVE';
DECLARE @snapName sysname = N'VisualProdTmpSnp';
DECLARE @prep bit = 2

IF OBJECT_ID('tempdb..#ServerName') IS NOT NULL DROP TABLE #ServerName

-- adhoc
IF @prep = 1
BEGIN
-- Useful checks: list snapshots for the source DB
SELECT name AS SnapshotName, create_date
, DB_NAME(source_database_id) AS SourceDB
, datediff(hour,create_date, getdate()) AS hoursUsed
FROM sys.databases
WHERE source_database_id = DB_ID(@sourceDb);
end

-- confirm process is running on the chosen server
-- Optional: define expected server name
-- Set this to the instance name where the job should run (leave empty to skip enforcement)
DECLARE @expectedServer sysname = N'SQL-VISUAL-2'; -- e.g. N'SQL-VISUAL-2' or N'sql-lab-2'

SELECT @@SERVERNAME AS ServerName
INTO #ServerName;

declare @server_is_correct bit;

select @server_is_correct =
cast(iif(ServerName = @expectedServer,1,0) as bit)  
from #ServerName;  -- is it the chosen server?

IF @server_is_correct = 1
PRINT 'server ok:' + CAST(@server_is_correct AS VARCHAR(20));
-- select * from  #ServerName
	

-- (Removed @paths handling — not needed for drop-only job)

-- Prevent concurrent job runs using an application lock
DECLARE @lockResult INT;
EXEC @lockResult = sp_getapplock @Resource = N'Manufacturing_Drop_Snapshot', @LockMode = 'Exclusive', @LockOwner = 'Session', @LockTimeout = 1000;
IF @lockResult NOT IN (0,1)
BEGIN
    PRINT 'Could not acquire application lock; another instance may be running. Exiting.';
    RETURN;
END

-- Audit table for snapshot drops (created once)
IF OBJECT_ID('Staging.managedData.SnapshotDropLog', 'U') IS NULL
BEGIN
    CREATE TABLE Staging.managedData.SnapshotDropLog (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        SnapshotName SYSNAME NULL,
        SourceDB SYSNAME NULL,
        DropTime DATETIME2 DEFAULT SYSUTCDATETIME(),
        Success BIT,
        Message NVARCHAR(4000)
    );
END


-- Use minutes for precise threshold and limit drops per run
DECLARE @thresholdMinutes INT = 120; -- snapshot older than this (minutes) will be considered for drop
DECLARE @maxDropsPerRun INT = 1;      -- maximum number of snapshots to drop per job run
DECLARE @droppedCount INT = 0;
DECLARE @exitNow BIT = 0; -- flag to ensure cleanup runs before exiting

-- Decision point: detect snapshots older than a threshold and optionally drop them to avoid extra I/O
-- Configure: number of hours and whether to auto-drop. Set @autoDropOldSnapshots = 1 to drop automatically.
DECLARE @autoDropOldSnapshots bit = 1; -- change to 1 to auto-drop old snapshots

-- Check for snapshots older than threshold (minutes)
IF EXISTS (
    SELECT 1 FROM sys.databases
    WHERE source_database_id = DB_ID(@sourceDb)
      AND DATEDIFF(minute, create_date, GETDATE()) > @thresholdMinutes
)
BEGIN
    PRINT 'Found snapshots older than ' + CAST(@thresholdMinutes AS nvarchar(10)) + ' minute(s) for source DB ' + @sourceDb + '.';
        IF @autoDropOldSnapshots = 0
    BEGIN
        SELECT name AS SnapshotName, create_date, DATEDIFF(minute, create_date, GETDATE()) AS MinutesOld
        FROM sys.databases
        WHERE source_database_id = DB_ID(@sourceDb)
          AND DATEDIFF(minute, create_date, GETDATE()) > @thresholdMinutes;
        PRINT 'To automatically drop these snapshots, set @autoDropOldSnapshots = 1 and re-run the script.';
        SET @exitNow = 1; GOTO Cleanup; -- ensure lock release and logging
    END
    ELSE
    BEGIN
        DECLARE @oldName sysname;
        WHILE @droppedCount < @maxDropsPerRun
        BEGIN
            SELECT TOP 1 @oldName = name
            FROM sys.databases
            WHERE source_database_id = DB_ID(@sourceDb)
              AND DATEDIFF(minute, create_date, GETDATE()) > @thresholdMinutes
            ORDER BY create_date; -- oldest first

            IF @oldName IS NULL BREAK;

            DECLARE @dropSQL nvarchar(4000) = N'DROP DATABASE ' + QUOTENAME(@oldName) + N';';
            PRINT 'Attempting to drop old snapshot: ' + @oldName;

            BEGIN TRY
                IF @testMode = 0
                BEGIN
                    EXEC sp_executesql @dropSQL;
                END
                ELSE
                BEGIN
                    PRINT 'TEST MODE: Skipping actual drop';
                END

                INSERT INTO Staging.managedData.SnapshotDropLog (SnapshotName, SourceDB, Success, Message)
                VALUES (@oldName, @sourceDb, 1, N'Dropped successfully');

                SET @droppedCount = @droppedCount + 1;
            END TRY
            BEGIN CATCH
                DECLARE @errMsg nvarchar(4000) = ERROR_MESSAGE();
                PRINT 'Error dropping snapshot ' + ISNULL(@oldName, '<unknown>') + ': ' + @errMsg;
                INSERT INTO Staging.managedData.SnapshotDropLog (SnapshotName, SourceDB, Success, Message)
                VALUES (@oldName, @sourceDb, 0, @errMsg);
                -- On error, break to avoid repeated failures in loop
                BREAK;
            END CATCH;
        END
    END
END

-- Optional: check if snapshot already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @snapName AND source_database_id IS NOT NULL)
BEGIN
                PRINT 'Snapshot ''' + @snapName + ''' already exists. Drop it first if you want to recreate.';
                -- If you want to auto-drop this by name, set @autoDropOldSnapshots = 1 and ensure the create_date condition matches.
                SET @exitNow = 1; GOTO Cleanup;
END

PRINT 'completed'
-- Cleanup label: always attempt to release application lock and log the result
Cleanup:
DECLARE @releaseResult INT = NULL;
IF @lockResult IN (0,1)
BEGIN
    EXEC @releaseResult = sp_releaseapplock @Resource = N'Manufacturing_Drop_Snapshot', @LockOwner = 'Session';
    PRINT 'sp_releaseapplock returned ' + CAST(@releaseResult AS NVARCHAR(10));

    -- Log release attempt
   INSERT INTO Staging.managedData.SnapshotDropLog (SnapshotName, SourceDB, Success, Message)
   VALUES (NULL, @sourceDb, CASE WHEN @releaseResult >= 0 THEN 1 ELSE 0 END, N'sp_releaseapplock result=' + CAST(@releaseResult AS NVARCHAR(10)));
END

DELETE FROM Staging.managedData.SnapshotDropLog
WHERE InsertDate < DATEADD(day, -30, SYSUTCDATETIME());


PRINT 'Job finished.';

RETURN;