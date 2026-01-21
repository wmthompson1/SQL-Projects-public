-- Diagnostic SQL to locate source of [LIVESupplemental].dbo.WODS_output_ETL
-- Run these on the SQL instance that hosts the LIVESupplemental database (e.g., SQL-LAB-1).

-- 1) Confirm table exists and basic metadata
SELECT OBJECT_NAME(o.object_id) AS object_name,
       o.create_date,
       o.modify_date,
       s.name AS schema_name,
       o.type_desc
FROM LIVESupplemental.sys.objects o
JOIN LIVESupplemental.sys.schemas s ON o.schema_id = s.schema_id
WHERE o.name LIKE 'WODS_output%';

-- 2) Quick row sample and recent timestamp fields (adjust column names as present)
SELECT TOP (20) *
FROM LIVESupplemental.dbo.WODS_output_ETL
ORDER BY SnapshotDate DESC;  -- SnapshotDate is commonly used in these tables; adjust if necessary

-- 3) Search stored modules (procedures/functions/views) that reference the table
SELECT OBJECT_SCHEMA_NAME(m.object_id, DB_ID('LIVESupplemental')) AS schema_name,
       OBJECT_NAME(m.object_id, DB_ID('LIVESupplemental')) AS object_name,
       m.definition
FROM LIVESupplemental.sys.sql_modules m
WHERE m.definition LIKE '%WODS_output_ETL%';

-- 4) Search all stored procedures for references to WODS_output (broader search)
SELECT OBJECT_SCHEMA_NAME(m.object_id, DB_ID('LIVESupplemental')) AS schema_name,
       OBJECT_NAME(m.object_id, DB_ID('LIVESupplemental')) AS object_name
FROM LIVESupplemental.sys.sql_modules m
WHERE m.definition LIKE '%WODS_output%';

-- 5) Search msdb jobs for steps that reference the table or an ETL stored proc
SELECT j.name AS job_name,
       s.step_id,
       s.step_name,
       s.command
FROM msdb.dbo.sysjobsteps s
JOIN msdb.dbo.sysjobs j ON s.job_id = j.job_id
WHERE s.command LIKE '%WODS_output_ETL%'
   OR s.command LIKE '%WODS_output%'
   OR s.command LIKE '%WODS%';

-- 6) If SSIS catalog (SSISDB) is used, search package executions / parameters for references
-- Requires SSISDB/catalog access
SELECT folder_name, project_name, package_name
FROM SSISDB.catalog.packages
WHERE package_name LIKE '%WODS%';

-- 7) If older SSIS (msdb) deployed packages exist, search package text for WODS
-- This may require exporting packages or inspecting package contents.

-- 8) Find recent jobs that touched WODS_output_ETL (job history)
SELECT j.name, h.run_date, h.run_time, h.message
FROM msdb.dbo.sysjobhistory h
JOIN msdb.dbo.sysjobs j ON h.job_id = j.job_id
WHERE h.message LIKE '%WODS_output%'
   OR h.message LIKE '%WODS%'
ORDER BY h.run_date DESC, h.run_time DESC;

-- 9) Optional: check for any views that present/create WODS_output (on other servers)
SELECT v.name AS view_name, m.definition
FROM LIVESupplemental.sys.views v
JOIN LIVESupplemental.sys.sql_modules m ON v.object_id = m.object_id
WHERE m.definition LIKE '%WODS_output%';

-- End of diagnostic
