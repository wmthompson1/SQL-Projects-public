/**
2..12 | ForEach-Object {
 New-Item -Path "SSIS_ETL_SQL\$_.sql" -ItemType File -Force
}

# Create SQL files 2.sql through 12.sql in SSIS_ETL_SQL folder
13..20 | ForEach-Object {
    New-Item -Path "SSIS_ETL_SQL\$_.sql" -ItemType File -Force
}
**/
USE msdb;
GO
IF OBJECT_ID('dbo.SessionKillAlerts') IS NULL
BEGIN
    CREATE TABLE dbo.SessionKillAlerts
    (
        alert_id           bigint IDENTITY(1,1) PRIMARY KEY,
        detected_time_utc  datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
        session_id         int          NOT NULL,
        login_name         nvarchar(128) NULL,
        host_name          nvarchar(128) NULL,
        program_name       nvarchar(128) NULL,
        status             nvarchar(30)  NULL,
        open_tran_count    int           NULL,
        last_request_start_time datetime2(3) NULL,
        last_request_end_time   datetime2(3) NULL,
        emailed            bit           NOT NULL DEFAULT 0
    );
END
GO
