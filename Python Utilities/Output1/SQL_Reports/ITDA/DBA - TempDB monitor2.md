# DBA - TempDB monitor2

```sql
/* =============================================================================
   DBA Utility DB + Tables + Procs + Job for tempdb + AG redo monitoring
   Target: SQL Server 2019 (15.x) on secondary replica (readable)
   Author: William’s M365 Copilot
   ========================================================================== */

SET NOCOUNT ON;

-- /* 1) Create DBA utility database (if it doesn’t exist) */
-- IF DB_ID('DBA2') IS NULL
-- BEGIN
--     PRINT('Creating DBA2 database...');
--     EXEC('CREATE DATABASE DBA2;');
-- END
-- GO

/* 2) Tables: TempdbUsageLog and AGRedoHealthLog */
USE DBA2;
GO

IF OBJECT_ID('dbo.TempdbUsageLog','U') IS NULL
BEGIN
    CREATE TABLE dbo.TempdbUsageLog
    (
        TempdbUsageLogID   bigint IDENTITY(1,1) PRIMARY KEY,
        SampleTimeUtc      datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
        TotalSizeMB        decimal(19,2) NOT NULL,
        UnallocatedMB      decimal(19,2) NOT NULL,
        UserObjMB          decimal(19,2) NOT NULL,
        InternalObjMB      decimal(19,2) NOT NULL,
        VersionStoreMB     decimal(19,2) NOT NULL,
        Files              int NOT NULL,
        FilesInfo          nvarchar(4000) NULL
    );
    CREATE INDEX IX_TempdbUsageLog_SampleTime ON dbo.TempdbUsageLog(SampleTimeUtc);
END
GO

IF OBJECT_ID('dbo.AGRedoHealthLog','U') IS NULL
BEGIN
    CREATE TABLE dbo.AGRedoHealthLog
    (
        AGRedoHealthLogID        bigint IDENTITY(1,1) PRIMARY KEY,
        SampleTimeUtc            datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
        AGName                   sysname       NULL,
        ReplicaName              sysname       NULL,
        IsPrimaryReplica         bit           NULL,
        DatabaseName             sysname       NOT NULL,
        DatabaseId               int           NOT NULL,

        -- From dm_hadr_database_replica_states (secondary focus)
        SynchronizationStateDesc nvarchar(60)  NULL,
        IsCommitParticipant      bit           NULL,
        RedoQueueKB              bigint        NULL, -- redo_queue_size KB
        RedoRateKBps             bigint        NULL, -- redo_rate KB/s
        LogSendQueueKB           bigint        NULL, -- send queue KB (from primary perspective; we approximate)
        LogSendRateKBps          bigint        NULL, -- KB/s where visible
        EndOfLogLSN              numeric(25,0) NULL,
        LastRedoneLSN            numeric(25,0) NULL,
        LastHardenedLSN          numeric(25,0) NULL,

        -- Perf counters snapshot (when available)
        Perf_RedoBytesRemainingKB bigint      NULL,
        Perf_RedoRateKBps         bigint      NULL,
        Perf_LogSendQueueKB       bigint      NULL,

        -- Status/context
        IsReadableSecondary       bit          NULL,
        IsSynchronized            bit          NULL,
        RoleDesc                  nvarchar(60) NULL,
        HadrTransportFlow         nvarchar(60) NULL
    );
    CREATE INDEX IX_AGRedoHealthLog_SampleTime ON dbo.AGRedoHealthLog(SampleTimeUtc);
    CREATE INDEX IX_AGRedoHealthLog_DBTime ON dbo.AGRedoHealthLog(DatabaseName, SampleTimeUtc);
END
GO
/* 3) Stored Proc: CaptureTempdbUsage */
CREATE OR ALTER PROCEDURE dbo.CaptureTempdbUsage
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @TotalSizeMB     decimal(19,2),
        @UnallocatedMB   decimal(19,2),
        @UserObjMB       decimal(19,2),
        @InternalObjMB   decimal(19,2),
        @VersionStoreMB  decimal(19,2),
        @Files           int,
        @FilesInfo       nvarchar(4000);

    -- Total tempdb file size (ROWS + LOG)
    SELECT @TotalSizeMB = SUM(size) * 8.0 / 1024.0
    FROM tempdb.sys.database_files
    WHERE type_desc IN ('ROWS','LOG');

    -- Space breakdown (dmv in tempdb context)
    SELECT
        @UnallocatedMB   = SUM(unallocated_extent_page_count) * 8.0 / 1024.0,
        @UserObjMB       = SUM(user_object_reserved_page_count) * 8.0 / 1024.0,
        @InternalObjMB   = SUM(internal_object_reserved_page_count) * 8.0 / 1024.0,
        @VersionStoreMB  = SUM(version_store_reserved_page_count) * 8.0 / 1024.0
    FROM tempdb.sys.dm_db_file_space_usage;

    -- File count and sizes
    SELECT 
        @Files = COUNT(*),
        @FilesInfo = STRING_AGG(CONCAT(df.file_id, ':', CONVERT(varchar(20), df.size * 8 / 1024), 'MB'), ', ')
    FROM tempdb.sys.database_files AS df
    WHERE df.type_desc = 'ROWS';

    INSERT dbo.TempdbUsageLog (TotalSizeMB, UnallocatedMB, UserObjMB, InternalObjMB, VersionStoreMB, Files, FilesInfo)
    VALUES (@TotalSizeMB, @UnallocatedMB, @UserObjMB, @InternalObjMB, @VersionStoreMB, @Files, @FilesInfo);

    /* Optional alerting (uncomment & adjust thresholds)
    DECLARE @ThresholdVersionMB decimal(19,2) = 51200; -- 50 GB
    IF @VersionStoreMB > @ThresholdVersionMB
    BEGIN
        RAISERROR('ALERT: VersionStoreMB %.1f MB exceeded threshold %.1f MB', 16, 1, @VersionStoreMB, @ThresholdVersionMB);
        -- Or send DB Mail here
    END
    */
END
GO

/* 4) Stored Proc: Capture AG Redo / Queue Health (runs on secondary) */
CREATE OR ALTER PROCEDURE dbo.CaptureAGRedoHealth
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH rs AS (
        SELECT 
            drs.database_id,
            DB_NAME(drs.database_id) AS DatabaseName,
            drs.redo_queue_size,                 -- KB
            drs.redo_rate,                       -- KB/s
            drs.synchronization_state_desc,
            drs.is_commit_participant,
            drs.end_of_log_lsn,
            drs.last_redone_lsn,
            drs.last_hardened_lsn,
            drs.is_suspended,
            drs.synchronization_health_desc,
            drs.is_primary_replica
        FROM sys.dm_hadr_database_replica_states AS drs
    ),
    rinfo AS (
        SELECT 
            ar.replica_id,
            ar.replica_server_name AS ReplicaName,
            ar.availability_mode_desc,
            ar.primary_role_allow_connections_desc,
            ar.secondary_role_allow_connections_desc,
            ars.role_desc,
            ars.is_local,
            ars.connected_state_desc,
            ag.name AS AGName
        FROM sys.availability_replicas AS ar
        JOIN sys.dm_hadr_availability_replica_states AS ars
            ON ars.replica_id = ar.replica_id
        JOIN sys.availability_groups AS ag
            ON ag.group_id = ar.group_id
        WHERE ars.is_local = 1
    )
    INSERT dbo.AGRedoHealthLog
    (
        AGName, ReplicaName, IsPrimaryReplica, DatabaseName, DatabaseId,
        SynchronizationStateDesc, IsCommitParticipant, RedoQueueKB, RedoRateKBps,
        LogSendQueueKB, LogSendRateKBps,
        EndOfLogLSN, LastRedoneLSN, LastHardenedLSN,
        Perf_RedoBytesRemainingKB, Perf_RedoRateKBps, Perf_LogSendQueueKB,
        IsReadableSecondary, IsSynchronized, RoleDesc, HadrTransportFlow
    )
    SELECT
        rinfo.AGName,
        rinfo.ReplicaName,
        CASE WHEN rs.is_primary_replica = 1 THEN 1 ELSE 0 END AS IsPrimaryReplica,
        rs.DatabaseName,
        rs.database_id,
        rs.synchronization_state_desc,
        rs.is_commit_participant,
        CAST(rs.redo_queue_size AS bigint) AS RedoQueueKB,
        CAST(rs.redo_rate AS bigint) AS RedoRateKBps,

        /* Approximate send queue and rate from perf counters where available
           Note: On a secondary, Log Send Queue is primarily tracked on the primary.
           We include perf counters exposed locally if present. */
        CAST(p1.cntr_value / 1024 AS bigint) AS LogSendQueueKB,
        CAST(p2.cntr_value / 1024 AS bigint) AS LogSendRateKBps, -- if present; many builds expose bytes/sec

        rs.end_of_log_lsn,
        rs.last_redone_lsn,
        rs.last_hardened_lsn,

        /* Perf counters for redo on the local server (Database Replica) */
        CAST(p3.cntr_value / 1024 AS bigint) AS Perf_RedoBytesRemainingKB,
        CAST(p4.cntr_value / 1024 AS bigint) AS Perf_RedoRateKBps,
        CAST(p1.cntr_value / 1024 AS bigint) AS Perf_LogSendQueueKB,

        /* Readability/sync booleans */
        CASE WHEN rinfo.role_desc = 'SECONDARY' 
               AND rinfo.secondary_role_allow_connections_desc IN ('READ_ONLY','READ_INTENT_ONLY') THEN 1 ELSE 0 END AS IsReadableSecondary,
        CASE WHEN rs.synchronization_state_desc IN ('SYNCHRONIZED','SYNCHRONIZING') THEN 1 ELSE 0 END AS IsSynchronized,
        rinfo.role_desc,
        rinfo.availability_mode_desc
    FROM rs
    CROSS JOIN rinfo
    OUTER APPLY (
        -- Log Send Queue Bytes (SQLServer:Database Replica\Log Send Queue)
        SELECT TOP (1) pc.cntr_value
        FROM sys.dm_os_performance_counters AS pc
        WHERE pc.object_name LIKE '%Database Replica%'
          AND pc.counter_name = 'Log Send Queue'
          AND pc.instance_name = rs.DatabaseName
        ORDER BY pc.cntr_value DESC
    ) AS p1
    OUTER APPLY (
        -- Log Send Rate (Bytes/sec or KB/sec depending on build; we divide by 1024 above)
        SELECT TOP (1) pc.cntr_value
        FROM sys.dm_os_performance_counters AS pc
        WHERE pc.object_name LIKE '%Database Replica%'
          AND pc.counter_name IN ('Log Send Rate','Log Send Rate (KB/sec)','Log Send Bytes/sec')
          AND pc.instance_name = rs.DatabaseName
        ORDER BY pc.cntr_value DESC
    ) AS p2
    OUTER APPLY (
        -- Redo Bytes Remaining
        SELECT TOP (1) pc.cntr_value
        FROM sys.dm_os_performance_counters AS pc
        WHERE pc.object_name LIKE '%Database Replica%'
          AND pc.counter_name = 'Redo Bytes Remaining'
          AND pc.instance_name = rs.DatabaseName
        ORDER BY pc.cntr_value DESC
    ) AS p3
    OUTER APPLY (
        -- Redo Throughput/Rate (Bytes/sec or KB/sec)
        SELECT TOP (1) pc.cntr_value
        FROM sys.dm_os_performance_counters AS pc
        WHERE pc.object_name LIKE '%Database Replica%'
          AND pc.counter_name IN ('Redo Rate', 'Redo Bytes/sec', 'Redo Rate (KB/sec)')
          AND pc.instance_name = rs.DatabaseName
        ORDER BY pc.cntr_value DESC
    ) AS p4;
END
GO

/* 5) Retention cleanup procedure */
CREATE OR ALTER PROCEDURE dbo.PurgeMonitoringData
    @KeepDays int = 14
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @cutoff datetime2(3) = DATEADD(DAY, -@KeepDays, SYSUTCDATETIME());

    DELETE FROM dbo.TempdbUsageLog WHERE SampleTimeUtc < @cutoff;
    DELETE FROM dbo.AGRedoHealthLog WHERE SampleTimeUtc < @cutoff;
END
GO
/* 6) Create SQL Agent Job (runs every 5 minutes) */
USE msdb;
GO

DECLARE @jobId uniqueidentifier;

IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = N'DBA: Capture Tempdb + AG Redo Health')
BEGIN
    EXEC msdb.dbo.sp_add_job
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @enabled = 1,
        @description = N'Captures tempdb usage and AG redo/queue health on the local replica.',
        @start_step_id = 1,
       --owner_login_name = SUSER_SNAME(),
        @job_id = @jobId OUTPUT;

    -- Step 1: Capture Tempdb
    EXEC msdb.dbo.sp_add_jobstep
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @step_id = 1,
        @step_name = N'Capture Tempdb Usage',
        @subsystem = N'TSQL',
        @database_name = N'DBA2',    
        @command = N'EXEC DBA2.dbo.CaptureTempdbUsage;',
        @on_success_action = 3, -- go to next step
        @on_fail_action = 2;    -- quit with failure

    -- Step 2: Capture AG Redo / Queues
    EXEC msdb.dbo.sp_add_jobstep
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @step_id = 2,
        @step_name = N'Capture AG Redo Health',
        @subsystem = N'TSQL',
        @database_name = N'DBA2',
        @command = N'EXEC DBA2.dbo.CaptureAGRedoHealth;',
        @on_success_action = 1, -- quit with success
        @on_fail_action = 2;    -- quit with failure

    -- Step 3: Weekly retention purge (separate schedule)
    EXEC msdb.dbo.sp_add_jobstep
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @step_id = 3,
        @step_name = N'Purge Monitoring Data (weekly)',
        @subsystem = N'TSQL',
        @database_name = N'DBA2',
        @command = N'EXEC DBA2.dbo.PurgeMonitoringData @KeepDays = 14;',
        @on_success_action = 1,
        @on_fail_action = 2;

    -- Schedule A: Every 5 minutes
    EXEC msdb.dbo.sp_add_schedule
        @schedule_name = N'Every 5 minutes',
        @freq_type = 4,              -- daily
        @freq_interval = 1,
        @freq_subday_type = 4,       -- minutes
        @freq_subday_interval = 5,
        @active_start_time = 0;

    EXEC msdb.dbo.sp_attach_schedule
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @schedule_name = N'Every 5 minutes';

    -- Schedule B: Weekly Sunday 02:00 for purge
    EXEC msdb.dbo.sp_add_schedule
        @schedule_name = N'Weekly purge Sunday 02:00',
        @freq_type = 8,              -- weekly
        @freq_interval = 1,          -- Sunday
        @active_start_time = 20000;  -- 02:00
    EXEC msdb.dbo.sp_attach_schedule
        @job_name = N'DBA: Capture Tempdb + AG Redo Health',
        @schedule_name = N'Weekly purge Sunday 02:00';

    EXEC msdb.dbo.sp_add_jobserver
        @job_name = N'DBA: Capture Tempdb + AG Redo Health';
END
ELSE
BEGIN
    RAISERROR('Job already exists: DBA: Capture Tempdb + AG Redo Health', 10, 1);
END
GO
```