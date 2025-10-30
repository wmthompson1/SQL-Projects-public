use ReportServer
go

/*
EXECUTE usp_UpdateOldEmailAddress
      @OldEmailAddress = 'CHARLIE@skillsinc.com'
      , @NewEmailAddress = 'CHARLIEF@skillsinc.com'
*/

/*
IF OBJECT_ID('tempdb..#T1') IS NOT NULL DROP TABLE #T1
IF OBJECT_ID('tempdb..#T2') IS NOT NULL DROP TABLE #T2
IF OBJECT_ID('tempdb..#T3') IS NOT NULL DROP TABLE #T3

SELECT REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
		UPPER(CAST(EXTENSIONSETTINGS AS NVARCHAR(MAX))), '<PARAMETERVALUES><PARAMETERVALUE><NAME>TO</NAME>', ''
	)
	, '</PARAMETERVALUE></PARAMETERVALUES>', '')
	, '</PARAMETERVALUE><PARAMETERVALUE>', '')
	, '<FIELD>EMAIL_ADDR</FIELD>', '')
	, '<FIELD>EMAIL</FIELD>', '')
	, '<FIELD>EMAILTO</FIELD>', '')
	, '<NAME>CC</NAME>', '')
	, '<NAME>COMMENT</NAME>', '')
	, '<NAME>INCLUDELINK</NAME>', '')
	, '<NAME>INCLUDEREPORT</NAME>', '')
	, '<NAME>PRIORITY</NAME>', '')
	, '<NAME>RENDERFORMAT</NAME>', '')
	, '<NAME>REPLYTO</NAME>', '')
	, '<NAME>SUBJECT</NAME>', '')
	, '<NAME>BCC</NAME>', '')
	, '<VALUE>TRUE</VALUE>', '')
	, '<VALUE>EXCELOPENXML</VALUE>', '')
	, '<VALUE>PDF</VALUE>', '')
	, '<VALUE>MHTML</VALUE>', '')
	, '<VALUE>NORMAL</VALUE>', '')
	, '@SKILLSINC.ONMICROSOFT.COM', '')
	, '@SKILLSINC.COM', '')
	, '</VALUE><VALUE>', ';')
	, '</VALUE>', '')
	, '<VALUE>', '')
	, ';', '$')
	AS USER_CHECK
	, *
INTO #T1
FROM Reportserver.dbo.Subscriptions su 
WHERE extensionsettings IS NOT NULL

SELECT VALUE
INTO #T2
FROM #T1
CROSS APPLY STRING_SPLIT(USER_CHECK, '$')
WHERE VALUE NOT LIKE '%@REPORTNAME%'
	AND VALUE NOT LIKE '%@EXECUTION%'
	AND VALUE NOT LIKE '%GOOD MORNING%'
	AND VALUE NOT LIKE '%COMPLETED CURRENT WEEK%'
	AND VALUE NOT LIKE '%COMPLETED LAST WEEK%'
	AND VALUE NOT LIKE '%GOOD AFTERNOON%'
	AND VALUE NOT LIKE '%WORK ORDER%'
	AND VALUE NOT LIKE '%WODS - CNC%'
	AND VALUE NOT LIKE '%WODS BP-SAW%'
	AND VALUE NOT LIKE '% - WODS PM%'
	AND VALUE NOT LIKE '%NEW PARTS%'
	AND VALUE NOT LIKE '%PLEASE %'
	AND VALUE NOT LIKE '%THE STATUS METRICS %'
	AND VALUE NOT LIKE '%ITDATAADMINS%'
	AND VALUE NOT LIKE '%~ZPART MAINTENANCE ERRORS%'
	AND VALUE NOT LIKE '%LABORTICKETS%'
	AND VALUE NOT LIKE '%REPORT - SHIPPED AND RECEIVED ORDERS%'
	AND VALUE NOT LIKE '%SOURCE INSPECTION SHIP LIST%'
	AND VALUE NOT LIKE '%XML%'
	AND VALUE NOT LIKE '%HAAS10%'
GROUP BY VALUE

SELECT REPLACE(VALUE, ' ', '') COLLATE SQL_Latin1_General_CP1_CI_AS AS [USER_ID] 
INTO #T3 
FROM #T2 GROUP BY REPLACE(VALUE, ' ', '')

SELECT T.[USER_ID]
FROM #T3 T
LEFT OUTER JOIN DATAWAREHOUSE.dbo.EMPLOYEE EE
ON T.[USER_ID] COLLATE SQL_Latin1_General_CP1_CI_AS = EE.[USER_ID]
WHERE EE.[USER_ID] IS NULL

*/

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
  , su.[Parameters]
  , extensionsettings
  FROM Reportserver.dbo.Subscriptions su 
  JOIN Reportserver.dbo.Catalog c 
    ON su.Report_OID = c.ItemID 
  JOIN Reportserver.dbo.ReportSchedule rsc 
    ON rsc.ReportID = c.ItemID 
   AND rsc.SubscriptionID = su.SubscriptionID 
  JOIN Reportserver.dbo.Schedule Sch 
    ON rsc.ScheduleID = sch.ScheduleID 
WHERE extensionsettings LIKE '%ADAMH%'
--or extensionsettings LIKE '%jacobh%'
ORDER BY LastRunTime DESC

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
