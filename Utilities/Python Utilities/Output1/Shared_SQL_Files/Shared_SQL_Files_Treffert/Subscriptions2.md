# Subscriptions2

```sql
use ReportServer
go

SELECT y.SubscriberList
	, y.ReportPath 
FROM 
	(SELECT PseudoTable.TheseNodes.value('(./Value)[1]', 'varchar(MAX)') AS SubscriberList
		, x.ReportPath 
	FROM 
		(SELECT sub.Description AS Recipients
			, CAST(sub.ExtensionSettings AS xml) AS Subscribers
			, cat.[Path] AS ReportPath 
		FROM dbo.Subscriptions sub 
		JOIN dbo.[Catalog] AS cat 
			ON sub.Report_OID = cat.ItemID 
		) x 
	CROSS APPLY Subscribers.nodes('/ParameterValues/ParameterValue') AS PseudoTable(TheseNodes) 
	WHERE PseudoTable.TheseNodes.value('(./Name)[1]', 'varchar(100)') = 'TO' 
	) y 
WHERE y.SubscriberList like '%dano@skillsinc%'
ORDER BY SubscriberList
	, ReportPath

/*


select c.Name,
s.StartDate,
s.NextRunTime,
s.LastRunTime,
s.EndDate,
s.RecurrenceType,
s.LastRunStatus,
s.MinutesInterval,
s.DaysInterval,
s.WeeksInterval,
s.DaysOfWeek,
s.DaysOfMonth,
s.[Month],
s.MonthlyWeek
from dbo.catalog c with (nolock)
inner join dbo.ReportSchedule rs
on rs.ReportID = c.ItemID
inner join dbo.Schedule s with (nolock)
on rs.ScheduleID = s.ScheduleID
order by c.name 

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

*/
```