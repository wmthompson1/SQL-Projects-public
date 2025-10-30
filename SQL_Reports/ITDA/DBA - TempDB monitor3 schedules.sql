USE msdb;
SET NOCOUNT ON;

BEGIN TRY
    -------------------------------------------------------------------------
    -- 0) Variables
    -------------------------------------------------------------------------
    DECLARE 
        @jobName           sysname         = N'DBA: Capture Tempdb + AG Redo Health',
        @jobId             uniqueidentifier,
        @owner             sysname,
        @fiveMinSchedName  sysname         = N'DBA: Every 5 minutes',
        @weeklySchedName   sysname         = N'DBA: Weekly purge Sunday 02:00',
        @fiveMinSchedId    int             = NULL,
        @weeklySchedId     int             = NULL,
        @startStepId       int,
        @sid               int;

    -- Pick a safe owner: current login if a valid server principal (SQL/Windows login), else fall back to 'sa'
    SELECT @owner = SUSER_SNAME()
    WHERE SUSER_SID() IS NOT NULL
      AND EXISTS (
            SELECT 1
            FROM sys.server_principals p
            WHERE p.sid = SUSER_SID()
              AND p.type IN ('S','U')
              AND p.is_disabled = 0
        );

    IF @owner IS NULL
        SET @owner = N'sa';

    -------------------------------------------------------------------------
    -- 1) Create or get Job
    -------------------------------------------------------------------------
    SELECT @jobId = j.job_id
    FROM msdb.dbo.sysjobs AS j
    WHERE j.name = @jobName;

    IF @jobId IS NULL
    BEGIN
        EXEC msdb.dbo.sp_add_job
             @job_name         = @jobName
            ,@enabled          = 1
            ,@description      = N'Captures tempdb usage and AG redo/queue health on the local replica.'
            ,@owner_login_name = @owner
            ,@job_id           = @jobId OUTPUT;
    END

    -------------------------------------------------------------------------
    -- 2) Steps (delete by step_id if exist, then add)
    -------------------------------------------------------------------------
    -- Step 1: Capture Tempdb Usage
    SELECT @sid = step_id
    FROM msdb.dbo.sysjobsteps 
    WHERE job_id = @jobId AND step_name = N'Capture Tempdb Usage';

    IF @sid IS NOT NULL
    BEGIN
        EXEC msdb.dbo.sp_delete_jobstep
             @job_id  = @jobId
            ,@step_id = @sid;
    END;

    EXEC msdb.dbo.sp_add_jobstep
         @job_id             = @jobId
        ,@step_name          = N'Capture Tempdb Usage'
        ,@subsystem          = N'TSQL'
        ,@database_name      = N'DBA2'
        ,@command            = N'EXEC DBA.dbo.CaptureTempdbUsage;'
        ,@on_success_action  = 3
        ,@on_fail_action     = 2;

    -- Step 2: Capture AG Redo Health (comment out if the proc doesn’t exist yet)
    SET @sid = NULL;
    SELECT @sid = step_id
    FROM msdb.dbo.sysjobsteps 
    WHERE job_id = @jobId AND step_name = N'Capture AG Redo Health';

    IF @sid IS NOT NULL
    BEGIN
        EXEC msdb.dbo.sp_delete_jobstep
             @job_id  = @jobId
            ,@step_id = @sid;
    END;

    EXEC msdb.dbo.sp_add_jobstep
         @job_id             = @jobId
        ,@step_name          = N'Capture AG Redo Health'
        ,@subsystem          = N'TSQL'
        ,@database_name      = N'DBA2'
        ,@command            = N'EXEC DBA2.bo.CaptureAGRedoHealth;'
        ,@on_success_action  = 1
        ,@on_fail_action     = 2;

    -- Step 3: Weekly purge (comment out if the proc doesn’t exist yet)
    SET @sid = NULL;
    SELECT @sid = step_id
    FROM msdb.dbo.sysjobsteps 
    WHERE job_id = @jobId AND step_name = N'Purge Monitoring Data (weekly)';

    IF @sid IS NOT NULL
    BEGIN
        EXEC msdb.dbo.sp_delete_jobstep
             @job_id  = @jobId
            ,@step_id = @sid;
    END;

    EXEC msdb.dbo.sp_add_jobstep
         @job_id             = @jobId
        ,@step_name          = N'Purge Monitoring Data (weekly)'
        ,@subsystem          = N'TSQL'
        ,@database_name      = N'DBA2'
        ,@command            = N'EXEC DBA.dbo.PurgeMonitoringData @KeepDays = 14;'
        ,@on_success_action  = 1
        ,@on_fail_action     = 2;

    -- Ensure start step is the new Step 1
    SELECT @startStepId = step_id
    FROM msdb.dbo.sysjobsteps
    WHERE job_id = @jobId AND step_name = N'Capture Tempdb Usage';

    IF @startStepId IS NOT NULL
    BEGIN
        EXEC msdb.dbo.sp_update_job
             @job_id        = @jobId
            ,@start_step_id = @startStepId;
    END
    -------------------------------------------------------------------------
    -- 3) Schedules: create/reuse, then attach
    -------------------------------------------------------------------------
    -- Every 5 minutes
    SELECT @fiveMinSchedId = schedule_id
    FROM msdb.dbo.sysschedules
    WHERE name = @fiveMinSchedName;

    IF @fiveMinSchedId IS NULL
    BEGIN
        EXEC msdb.dbo.sp_add_schedule
             @schedule_name          = @fiveMinSchedName
            ,@enabled                = 1
            ,@freq_type              = 4      -- daily
            ,@freq_interval          = 1
            ,@freq_subday_type       = 4      -- minutes
            ,@freq_subday_interval   = 5
            ,@active_start_time      = 0;     -- 00:00:00
        SELECT @fiveMinSchedId = schedule_id
        FROM msdb.dbo.sysschedules
        WHERE name = @fiveMinSchedName;
    END;

    IF NOT EXISTS (
        SELECT 1
        FROM msdb.dbo.sysjobschedules js
        WHERE js.job_id = @jobId AND js.schedule_id = @fiveMinSchedId
    )
    BEGIN
        EXEC msdb.dbo.sp_attach_schedule
             @job_id      = @jobId
            ,@schedule_id = @fiveMinSchedId;
    END;

    -- Weekly purge Sunday 02:00
    SELECT @weeklySchedId = schedule_id
    FROM msdb.dbo.sysschedules
    WHERE name = @weeklySchedName;

    IF @weeklySchedId IS NULL
    BEGIN
        EXEC msdb.dbo.sp_add_schedule
             @schedule_name           = @weeklySchedName
            ,@enabled                 = 1
            ,@freq_type               = 8     -- weekly
            ,@freq_interval           = 1     -- Sunday
            ,@freq_recurrence_factor  = 1     -- every 1 week
            ,@active_start_time       = 20000;-- 02:00:00
        SELECT @weeklySchedId = schedule_id
        FROM msdb.dbo.sysschedules
        WHERE name = @weeklySchedName;
    END;

    IF NOT EXISTS (
        SELECT 1
        FROM msdb.dbo.sysjobschedules js
        WHERE js.job_id = @jobId AND js.schedule_id = @weeklySchedId
    )
    BEGIN
        EXEC msdb.dbo.sp_attach_schedule
             @job_id      = @jobId
            ,@schedule_id = @weeklySchedId;
    END;

    -------------------------------------------------------------------------
    -- 4) Ensure job is targeted to this server
    -------------------------------------------------------------------------
    IF NOT EXISTS (
        SELECT 1
        FROM msdb.dbo.sysjobservers
        WHERE job_id = @jobId
    )
    BEGIN
        EXEC msdb.dbo.sp_add_jobserver
             @job_id = @jobId;
    END;

    PRINT(N'Job ensured/updated: ' + @jobName);
END TRY
BEGIN CATCH
    DECLARE 
        @msg   nvarchar(4000) = ERROR_MESSAGE(),
        @num   int            = ERROR_NUMBER(),
        @state int            = ERROR_STATE(),
        @line  int            = ERROR_LINE();
    RAISERROR(N'Failed to create/update job. (%d, state %d, line %d): %s', 16, 1, @num, @state, @line, @msg);
END CATCH;