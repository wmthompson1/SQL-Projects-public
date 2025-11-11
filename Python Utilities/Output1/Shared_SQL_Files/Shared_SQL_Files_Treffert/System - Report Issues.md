# System - Report Issues

```sql
USE ReportServer
GO

SELECT CAT.ItemID -- Unique Identifier
, CAT.[Path] --Path including object name
, CAT.[Name] --Just the objectd name
--, CAT.ParentID --The ItemID of the folder in which it resides
, CASE CAT.[Type] --Type, an int which can be converted using this case statement.
    WHEN 1 THEN 'Folder'
    WHEN 2 THEN 'Report'
    WHEN 3 THEN 'File'
    WHEN 4 THEN 'Linked Report'
    WHEN 5 THEN 'Data Source'
    WHEN 6 THEN 'Report Model - Rare'
    WHEN 7 THEN 'Report Part - Rare'
    WHEN 8 THEN 'Shared Data Set - Rare'
    WHEN 9 THEN 'Image'
    ELSE CAST([Type] as varchar(100))
  END AS TypeName
, CAT.LinkSourceID --If a linked report then this is the ItemID of the actual report.
, CAT.[Description] --This is the same information as can be found in the GUI
, CAT.[Hidden]
, EL.[LogEntryId]
, EL.[InstanceName]
, EL.[ReportID]
, EL.[UserName]
, EL.[ExecutionId]
, EL.[RequestType]
, EL.[Format]
, EL.[Parameters]
, EL.[ReportAction]
, CASE(ReportAction)
	WHEN 1 THEN 'Render'
	WHEN 2 THEN 'BookmarkNavigation'
	WHEN 3 THEN 'DocumentMapNavigation'
	WHEN 4 THEN 'DrillThrough'
	WHEN 5 THEN 'FindString'
	WHEN 6 THEN 'GetDocumentMap'
	WHEN 7 THEN 'Toggle'
	WHEN 8 THEN 'Sort'
	WHEN 9 THEN 'Execute'
	WHEN 10 THEN 'RenderEdit'
	WHEN 11 THEN 'ExecuteDataShapeQuery'
	WHEN 12 THEN 'RenderMobileReport'
	WHEN 13 THEN 'ConceptualSchema'
	WHEN 14 THEN 'QueryData'
	WHEN 15 THEN 'ASModelStream'
	WHEN 16 THEN 'RenderExcelWorkbook'
	WHEN 17 THEN 'GetExcelWorkbookInfo'
	WHEN 18 THEN 'SaveToCatalog'
	WHEN 19 THEN 'DataRefresh'
	ELSE 'Unknown'
END AS ItemAction
, max(EL.[TimeStart])
, EL.[TimeEnd]
, EL.[TimeDataRetrieval]
, EL.[TimeProcessing]
, EL.[TimeRendering]
, EL.[Source]
, CASE(Source)
	WHEN 1 THEN 'Live'
	WHEN 2 THEN 'Cache'
	WHEN 3 THEN 'Snapshot'
	WHEN 4 THEN 'History'
	WHEN 5 THEN 'AdHoc'
	WHEN 6 THEN 'Session'
	WHEN 7 THEN 'Rdce'
	ELSE 'Unknown'
END AS SourcedDef
, EL.[Status]
--, EL.[ByteCount]
--, EL.[RowCount]
--, EL.[AdditionalInfo]
FROM Catalog CAT WITH(NOLOCK)
LEFT OUTER JOIN ExecutionLogStorage EL WITH(NOLOCK) 
ON (EL.ReportID = CAT.ItemID)
--WHERE EL.[STATUS] != 'rsSuccess'

--GROUP BY cat.path, cat.Name
--ORDER BY cat.path, cat.Name


```