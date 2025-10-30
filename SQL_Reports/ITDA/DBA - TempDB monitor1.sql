use tempdb;

-- ```[7](https://www.sqltabletalk.com/?p=1171)[8](https://learn.microsoft.com/en-us/sql/relational-databases/resource-governor/tempdb-space-resource-governance-walkthrough?view=sql-server-ver17)[9](https://dev.to/arvind_toorpu/identifying-heavy-usage-of-tempdb-in-sqlserver-and-monitoring-it-40a3)
-- ---

-- ## **Page 4: Proactive Maintenance and Governance**

-- ### **1. Scheduled Health Checks**
-- - Include TempDB in weekly maintenance plans.
-- - Restart SQL Server during low-traffic windows to reset TempDB.

-- ### **2. Avoid Shrinking TempDB**
-- - Shrinking causes fragmentation and performance hits.
-- - Only shrink during downtime and after root cause resolution.

-- ### **3. Governance and Alerting**
-- - Use DMVs to track space usage per session.
-- - Set up alerts for:
--   - Autogrowth events
--   - Space thresholds
--   - Wait stats
-- ### **4. Development Best Practices**
-- - Educate developers to:
--   - Avoid SELECT *
--   - Use table variables judiciously
--   - Index temp tables
--   - Avoid unnecessary sorts and spills
-- ### **5. Upgrade Considerations**
-- - SQL Server 2022+ introduces **latch-free GAM pages**.
-- - Consider upgrading if facing severe contention under high concurrency.[10](https://developersvoice.com/blog/database/tempdb-under-pressure-fixing-sql-server/)[11](https://www.mssqltips.com/sqlservertip/8025/sql-server-2022-tempdb-contention-enhancements/)[12](https://www.sqlshack.com/monitor-sql-server-tempdb-database/)
-- ---

-- Would you like this compiled into a downloadable PDF or Word document for sharing or documentation? I can also help you script out a TempDB health check or monitoring dashboard if needed.

-- Current size of each tempdb file and free space inside
USE tempdb;

-- Get SQL Server version/edition
SELECT @@VERSION AS SQLServerVersion;


SELECT name AS logical_name, physical_name
, size * 8 / 1024 AS size_mb  -- need to reduce size 
, growth * 8 / 1024 AS growth_mb
FROM master.sys.master_files
WHERE database_id = DB_ID('tempdb');


SELECT 
    df.file_id,
    df.name,
    df.type_desc,
    size_mb = df.size * 8.0 / 1024,
    space_used_mb = CAST(FILEPROPERTY(df.name, 'SpaceUsed') AS BIGINT) * 8.0 / 1024,
    free_mb = (df.size - FILEPROPERTY(df.name, 'SpaceUsed')) * 8.0 / 1024,
    growth = CASE WHEN df.is_percent_growth = 1 THEN CAST(df.growth AS varchar(10)) + '%'
                  ELSE CAST(df.growth * 8 / 1024 AS varchar(10)) + ' MB' END,
    max_size = CASE WHEN df.max_size = -1 THEN 'Unlimited'
                    WHEN df.max_size = 268435456 THEN '2 TB cap'
                    ELSE CAST(df.max_size * 8 / 1024 AS varchar(20)) + ' MB' END
FROM sys.database_files AS df
ORDER BY df.type_desc, df.file_id;

-- How tempdb is allocated (user objects, internal objects, version store, free)
SELECT 
    unallocated_mb = SUM(unallocated_extent_page_count) * 8.0 / 1024,
    user_object_mb  = SUM(user_object_reserved_page_count) * 8.0 / 1024,
    internal_obj_mb = SUM(internal_object_reserved_page_count) * 8.0 / 1024,
    version_store_mb= SUM(version_store_reserved_page_count) * 8.0 / 1024,
    mixed_extent_mb = SUM(mixed_extent_page_count) * 8.0 / 1024
FROM sys.dm_db_file_space_usage;


SELECT 
  GETDATE() AS SampleTime,
  SUM(size)*8.0/1024 AS TotalSizeMB
FROM sys.database_files WHERE type_desc='ROWS';

SELECT 
  SUM(unallocated_extent_page_count)*8.0/1024 AS UnallocatedMB,
  SUM(user_object_reserved_page_count)*8.0/1024 AS UserObjMB,
  SUM(internal_object_reserved_page_count)*8.0/1024 AS InternalObjMB,
  SUM(version_store_reserved_page_count)*8.0/1024 AS VersionStoreMB
FROM sys.dm_db_file_space_usage;

/* Long-running user transactions, with safest text retrieval path */
SELECT
    at.transaction_id,
    at.transaction_begin_time,
    DATEDIFF(MINUTE, at.transaction_begin_time, SYSDATETIME()) AS minutes_open,
    at.transaction_state,
    CASE at.transaction_state
        WHEN 0 THEN 'Initializing'
        WHEN 1 THEN 'Initialized'
        WHEN 2 THEN 'Active'
        WHEN 3 THEN 'Ended'
        WHEN 4 THEN 'Commit Initiated'
        WHEN 5 THEN 'Prepared'
        WHEN 6 THEN 'Committed'
        WHEN 7 THEN 'Rolling Back'
        WHEN 8 THEN 'Rolled Back'
    END AS transaction_state_desc,
    s.session_id,
    s.login_name,
    s.host_name,
    s.program_name,
    DB_NAME(s.database_id) AS database_name,
    txt.text AS last_sql,
    r.blocking_session_id,
    r.wait_type,
    r.wait_time
FROM sys.dm_tran_active_transactions AS at
JOIN sys.dm_tran_session_transactions AS st ON at.transaction_id = st.transaction_id
JOIN sys.dm_exec_sessions AS s ON st.session_id = s.session_id
LEFT JOIN sys.dm_exec_requests AS r ON s.session_id = r.session_id
OUTER APPLY sys.dm_exec_sql_text(s.most_recent_sql_handle) AS txt
WHERE at.transaction_type = 1
ORDER BY minutes_open DESC;



/* Which databases are driving version store usage */
/* Which databases are driving version store usage (SQL Server 2019) */
SELECT 
    DB_NAME(database_id) AS database_name,
    version_store_mb = SUM(reserved_page_count) * 8.0 / 1024.0
FROM sys.dm_tran_version_store_space_usage
GROUP BY database_id
ORDER BY version_store_mb DESC;

SELECT
    name,
    snapshot_isolation_state_desc,
    is_read_committed_snapshot_on
FROM sys.databases
WHERE name = 'LIVESupplemental';


USE LIVESupplemental;
GO
SELECT 
    at.transaction_id,
    at.transaction_begin_time,
    DATEDIFF(MINUTE, at.transaction_begin_time, SYSDATETIME()) AS minutes_open,
    s.session_id,
    s.login_name,
    s.host_name,
    s.program_name,
    txt.text AS last_sql
FROM sys.dm_tran_active_transactions at
JOIN sys.dm_tran_session_transactions st ON at.transaction_id = st.transaction_id
JOIN sys.dm_exec_sessions s ON st.session_id = s.session_id
LEFT JOIN sys.dm_exec_connections c ON c.session_id = s.session_id
OUTER APPLY sys.dm_exec_sql_text(c.most_recent_sql_handle) AS txt
WHERE at.transaction_type = 1
ORDER BY minutes_open DESC;


SELECT
    r.session_id,
    r.command,
    r.status,
    r.start_time,
    r.percent_complete,
    DB_NAME(r.database_id) AS db_name,
    SUBSTRING(t.text, (r.statement_start_offset/2)+1,
              CASE WHEN r.statement_end_offset = -1 
                   THEN LEN(CONVERT(nvarchar(max), t.text))
                   ELSE (r.statement_end_offset - r.statement_start_offset)/2 END) AS stmt
FROM sys.dm_exec_requests r
OUTER APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
WHERE r.command LIKE '%INDEX%' AND r.database_id = DB_ID('LIVESupplemental');

SELECT
    oldest_active_transaction_start_time,
    DATEDIFF(MINUTE, oldest_active_transaction_start_time, SYSDATETIME()) AS minutes_blocking_cleanup
FROM sys.dm_tran_version_store_space_usage;



--  troubleshooter 1 
-- Long-running readers on the secondary (holding version store open)
SELECT 
    s.session_id,
    s.login_name,
    s.host_name,
    s.program_name,
    r.status,
    r.command,
    r.start_time,
    DATEDIFF(MINUTE, r.start_time, SYSDATETIME()) AS minutes_running,
    SUBSTRING(t.text, (r.statement_start_offset/2)+1,
              CASE WHEN r.statement_end_offset = -1 
                   THEN LEN(CONVERT(nvarchar(max), t.text))
                   ELSE (r.statement_end_offset - r.statement_start_offset)/2 END) AS current_stmt
FROM sys.dm_exec_requests AS r
JOIN sys.dm_exec_sessions AS s ON r.session_id = s.session_id
OUTER APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
WHERE r.database_id > 4  -- user DBs
  AND r.command NOT LIKE '%BACKUP%'  -- exclude backups
ORDER BY r.start_time;

-- Which databases are contributing to version store usage
SELECT 
    DB_NAME(database_id) AS database_name,
    version_store_mb = SUM(reserved_page_count) * 8.0 / 1024.0
FROM sys.dm_tran_version_store_space_usage
GROUP BY database_id
ORDER BY version_store_mb DESC;



-- 🛠️ What you can do

-- Identify and tune long-running read queries on the secondary.

-- Consider breaking them into smaller batches or using filtered queries.


-- Avoid running large reports or Power BI refreshes directly against the secondary if they run for a long time.
-- Monitor version store growth and correlate with read activity.
-- If needed, restart the SQL Server service on the secondary to reclaim tempdb space (as tempdb 
-- is recreated on restart), but only as a last resort and during a maintenance window.


