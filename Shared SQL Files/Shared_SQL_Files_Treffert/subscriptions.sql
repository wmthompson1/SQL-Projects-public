USE [ReportServer];  -- You may change the database name. 
GO 
 
SELECT CAT.[Path] AS ReportPath 
, CAT.[Description] AS ReportDescription 
, USR.UserName AS SubscriptionOwner 
, SUB.ModifiedDate 
, SUB.[Description] 
, SUB.EventType 
, SUB.DeliveryExtension 
, SUB.LastStatus 
, SUB.LastRunTime 
, SCH.NextRunTime 
 --     ,SCH.Name AS ScheduleName       
FROM dbo.Subscriptions AS SUB 
     INNER JOIN dbo.Users AS USR 
         ON SUB.OwnerID = USR.UserID 
     INNER JOIN dbo.[Catalog] AS CAT 
         ON SUB.Report_OID = CAT.ItemID 
     INNER JOIN dbo.ReportSchedule AS RS 
         ON SUB.Report_OID = RS.ReportID 
            AND SUB.SubscriptionID = RS.SubscriptionID 
     INNER JOIN dbo.Schedule AS SCH 
         ON RS.ScheduleID = SCH.ScheduleID 
WHERE SUB.LastStatus LIKE 'FAILURE%'
ORDER BY USR.UserName 
        ,CAT.[Path];

/*
SELECT
  S.ScheduleID,
  C.[Path] ObjectPath,
  U.UserName,
  SB.[Description],
  S.StartDate,
  S.LastRunTime
FROM ReportServer.dbo.ReportSchedule RS
  INNER JOIN ReportServer.dbo.Schedule S ON S.ScheduleID = RS.ScheduleID
  INNER JOIN ReportServer.dbo.[Catalog] C ON C.ItemID = RS.ReportID
  INNER JOIN ReportServer.dbo.Subscriptions SB ON SB.SubscriptionID = RS.SubscriptionID
  INNER JOIN ReportServer.dbo.Users U ON U.UserID = SB.OwnerID


SELECT Reportname = c.Name 
  ,FileLocation = c.Path
  ,SubscriptionDesc=su.Description 
  ,Subscriptiontype=su.EventType 
  ,su.LastStatus 
  ,su.LastRunTime 
  ,Schedulename=sch.Name 
  ,ScheduleType = sch.EventType 
  ,ScheduleFrequency = 
   CASE sch.RecurrenceType 
   WHEN 1 THEN 'Once' 
   WHEN 2 THEN 'Hourly' 
   WHEN 4 THEN 'Daily/Weekly' 
   WHEN 5 THEN 'Monthly' 
   END 
  ,su.Parameters 
  FROM Reportserver.dbo.Subscriptions su 
  JOIN Reportserver.dbo.Catalog c 
    ON su.Report_OID = c.ItemID 
  JOIN Reportserver.dbo.ReportSchedule rsc 
    ON rsc.ReportID = c.ItemID 
   AND rsc.SubscriptionID = su.SubscriptionID 
  JOIN Reportserver.dbo.Schedule Sch 
    ON rsc.ScheduleID = sch.ScheduleID 
ORDER BY LastRunTime DESC

*/
SELECT [Path]
, Sub.[ModifiedDate]
, [LastStatus]
, [EventType]
, [LastRunTime]
FROM [ReportServer].[dbo].[Subscriptions] as Sub
left outer join [ReportServer].[dbo].[Catalog] as Cat on
Sub.Report_OID = ItemID
where LastStatus like 'Failure%'

SELECT CAT.[PATH]
	, S.[DESCRIPTION]
	, JS.LAST_RUN_DATE
	, JS.LAST_RUN_TIME
	, LASTSTATUS 
FROM MSDB.dbo.SYSJOBS J  
JOIN MSDB.dbo.SYSJOBSTEPS JS 
	ON JS.JOB_ID = J.JOB_ID 
JOIN [ReportServer].[dbo].[SUBSCRIPTIONS] S  
	ON JS.COMMAND LIKE '%' + CAST(S.SUBSCRIPTIONID AS VARCHAR(40)) + '%' 
JOIN [ReportServer].[dbo].[CATALOG] AS CAT 
	ON CAT.ITEMID = S.REPORT_OID 
WHERE   
	LEFT(LASTSTATUS, 12) <> 'MAIL SENT TO'
	AND LEFT(LASTSTATUS, 8) <> 'DISABLED'
	AND LEFT(LASTSTATUS, 23) <> 'CACHE REFRESH SUCCEEDED'
	AND LEFT(LASTSTATUS, 22) <> 'Completed Data Refresh'
	AND LEFT(LASTSTATUS, 24) <> 'New Cache Refresh Plan'
	AND LEFT(LASTSTATUS, 17) <> 'New Subscription'
	AND LEFT(LASTSTATUS, 5) NOT IN ('READY', 'DONE:')
	AND LASTSTATUS NOT IN ('Saving model to the catalog', 'Refreshing data', 'Thread was being aborted.')
	AND LEFT(S.[DESCRIPTION],9) <> 'Wallboard'
AND PATH NOT LIKE '/Users Folders/SKILLS viviane/%'
AND PATH NOT LIKE '/Unapproved Items/%'
AND PATH NOT LIKE '/ITDA/Test/%'