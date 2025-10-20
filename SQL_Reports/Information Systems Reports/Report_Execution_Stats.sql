DECLARE @DaysBack INT = 60

;
WITH ExecutionsSince AS
(
SELECT ItemPath, MAX(TimeStart) AS LastExecutionDate, COUNT(*) NumberOfExecutions
FROM ExecutionLog3
WHERE UserName NOT IN ('SKILLS\EricShafer', 'SKILLS\TraciT', 'SKILLS\Viviane', 'SKILLS\Ed')
    --AND ItemPath = '/Visual Enterprise Reports/Work Order Reports/Status by Work Order'
    AND TimeStart >= CONVERT(DATE,GETDATE() - @DaysBack)
GROUP BY ItemPath
)

SELECT e.*, e3.UserName as LastExecutedBy, e3.RequestType LastRequestType, e3.Status LastStatus,
    e4.UserName, e4.TimeStart, e4.Status, e4.RequestType
FROM ExecutionLog3 e3
    JOIN ExecutionsSince e
        on e3.ItemPath = e.ItemPath
            AND e3.TimeStart = e.LastExecutionDate
            
    JOIN ExecutionLog3 e4
        ON e4.ItemPath = e3.ItemPath
            AND e4.TimeStart >= CONVERT(DATE, GETDATE() - @DaysBack)
WHERE e3.ItemPath <> 'Unknown'
