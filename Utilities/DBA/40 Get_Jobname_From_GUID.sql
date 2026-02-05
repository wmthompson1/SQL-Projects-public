-- need to get job name from GUID - 0x45CA9B333109954E9B594312BF34F705
-- ...existing code...
-- Get job name from job GUID (binary form)
DECLARE @jobId UNIQUEIDENTIFIER = 0x45CA9B333109954E9B594312BF34F705;

SELECT job_id, name
FROM msdb.dbo.sysjobs
WHERE job_id = @jobId;