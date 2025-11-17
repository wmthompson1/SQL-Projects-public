# Report Tracking

```sql
use ReportServer
go

SELECT c.[Path]
, C.[Name]
, C.ExecutionTime
, EL.[STATUS]
, MAX(EL.TimeStart)
FROM dbo.[Catalog] AS C
LEFT OUTER JOIN dbo.ExecutionLog AS EL 
ON EL.ReportID = C.ItemID
where C.[Path] NOT LIKE '/Users Folders/SKILLS %'
OR C.[Path] NOT LIKE '/Quick Links/%'
GROUP BY c.[Path]
, C.[Name]
, C.ExecutionTime
, EL.[STATUS]
ORDER BY C.[Path]


SELECT c.[Path]
, C.[Name]
, el.UserName
--, COUNT(*)
, MAX(EL.TimeStart)
FROM dbo.[Catalog] AS C
LEFT OUTER JOIN dbo.ExecutionLog AS EL 
ON EL.ReportID = C.ItemID
GROUP BY c.[Path]
, C.[Name]
, el.UserName
ORDER BY C.[Path]
```