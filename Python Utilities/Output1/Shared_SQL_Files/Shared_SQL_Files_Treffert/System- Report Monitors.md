# System- Report Monitors

```sql
USE ReportServer
GO

/*
USE ReportServer
GO

UPDATE ConfigurationInfo
SET Value = '365'
WHERE Name = 'ExecutionLogDaysKept'

SELECT * FROM ConfigurationInfo

*/

SELECT ReportPath
, MAX(TimeStart)
--, TimeEnd 
FROM [REPORTSERVER].dbo.ExecutionLog2
WHERE ReportPath IS NOT NULL
AND [ReportPath] NOT LIKE '/Users Folders/%'
AND [ReportPath] NOT LIKE '/Unapproved Items/%'
AND [ReportPath] NOT LIKE '/AP Automation/%'
AND [ReportPath] NOT LIKE '/Exec Dashboards/%'
AND [ReportPath] NOT LIKE '/ITDA/%'
AND [ReportPath] NOT LIKE '/Unapproved Items/%'
AND [ReportPath] NOT LIKE '/DATASETS/%'
AND [ReportPath] NOT LIKE '/Quick Links/%'
AND [ReportPath] NOT LIKE '/Information Systems Reports/%'
AND [ReportPath] NOT LIKE '/Phone List/%'
AND [ReportPath] NOT LIKE '/Wellness Reports/%'
AND [ReportPath] NOT LIKE 'Unknown'
AND [ReportPath] NOT LIKE ''
GROUP BY ReportPath
ORDER BY ReportPath


/*
use ReportServer
go

WITH RankedReports
AS
(SELECT ReportID,
        TimeStart,
        UserName, 
        RANK() OVER (PARTITION BY ReportID ORDER BY TimeStart DESC) AS iRank
   FROM dbo.ExecutionLog t1
        JOIN 
        dbo.Catalog t2
          ON t1.ReportID = t2.ItemID
)
SELECT t2.Name AS ReportName,
       MAX(t1.TimeStart) LastAccessed,
       --t1.UserName,
       t2.Path,    
       SUBSTRING(t2.Path, 0, CHARINDEX('/', t2.Path, 2)) ParentFolder,
       t1.ReportID
  FROM RankedReports t1
       JOIN 
       dbo.Catalog t2
         ON t1.ReportID = t2.ItemID
 WHERE t1.iRank = 1
GROUP BY t2.Name, Path, ReportID
ORDER BY MAX(t1.TimeStart) DESC;

-----------------------------------------------------------------



SELECT CAT.[PATH]
	, CAT.[NAME]
	, S.[DESCRIPTION]
	, JS.LAST_RUN_DATE
	, JS.LAST_RUN_TIME
	, LASTSTATUS 
FROM MSDB.dbo.SYSJOBS J  
JOIN MSDB.dbo.SYSJOBSTEPS JS 
	ON JS.JOB_ID = J.JOB_ID 
LEFT OUTER JOIN [REPORTSERVER].dbo.[SUBSCRIPTIONS] S  
	ON JS.COMMAND LIKE '%' + CAST(S.SUBSCRIPTIONID AS VARCHAR(40)) + '%' 
LEFT OUTER JOIN [REPORTSERVER].[dbo].[CATALOG] AS CAT 
	ON CAT.ITEMID = S.REPORT_OID 
WHERE LASTSTATUS != 'Cache refresh succeeded.'
AND LASTSTATUS != 'Completed Data Refresh'
AND LASTSTATUS != 'Mail sent to williamt@skillsinc.com'
AND LASTSTATUS NOT IN ('Saving model to the catalog', 'Refreshing data', 'Thread was being aborted.')
AND LEFT(S.[DESCRIPTION],9) <> 'Wallboard'
AND LEFT(LASTSTATUS, 8) <> 'DISABLED'
AND LEFT(LASTSTATUS, 23) <> 'CACHE REFRESH SUCCEEDED'
AND LEFT(LASTSTATUS, 22) <> 'Completed Data Refresh'
AND LEFT(LASTSTATUS, 24) <> 'New Cache Refresh Plan'
AND LEFT(LASTSTATUS, 17) <> 'New Subscription'
AND [PATH] NOT LIKE '/Users Folders/SKILLS viviane/%'
AND [PATH] NOT LIKE '/Unapproved Items/%'
AND [PATH] NOT LIKE '/ITDA/Test/%'
AND [PATH] NOT LIKE '/Unapproved Items/%'
AND [PATH] NOT LIKE '/ITDA/Test/%'
--	AND LEFT(LASTSTATUS, 5) NOT IN ('READY', 'DONE:')
--	LEFT(LASTSTATUS, 12) <> 'MAIL SENT TO'
*/
```