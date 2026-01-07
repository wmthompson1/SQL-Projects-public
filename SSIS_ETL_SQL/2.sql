
;WITH candidates AS
(
    SELECT
        s.session_id,
        s.login_name,
        s.host_name,
        s.program_name,
        s.status,
        s.open_transaction_count,
        s.last_request_start_time,
        s.last_request_end_time
    FROM sys.dm_exec_sessions AS s
    WHERE s.is_user_process = 1                          -- user sessions
      AND s.status = N'rollback'                        -- in-progress rollback after KILL
      AND s.session_id > 50                             -- skip system sessions
      AND (s.program_name IS NULL 
           OR s.program_name NOT LIKE N'SQLAgent%')     -- avoid agent job sessions (tweak as needed)
)
INSERT INTO msdb.dbo.SessionKillAlerts
    (session_id, login_name, host_name, program_name, status, open_tran_count,
     last_request_start_time, last_request_end_time)
SELECT
    c.session_id, c.login_name, c.host_name, c.program_name, c.status, c.open_transaction_count,
    c.last_request_start_time, c.last_request_end_time
FROM candidates AS c
WHERE NOT EXISTS
(
    SELECT 1
    FROM msdb.dbo.SessionKillAlerts AS a
    WHERE a.session_id = c.session_id
      AND a.status     = c.status
      AND a.detected_time_utc >= DATEADD(MINUTE, -10, SYSUTCDATETIME())  -- de-dupe window
);
