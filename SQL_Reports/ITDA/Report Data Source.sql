--use ReportServer
--go
-- C:\Users\williamt\OneDrive - Skills Inc GCC High\Documents\sql\222_Data_Models\Reports_SQL

/***


https://www.sqlservercentral.com/articles/dynamic-ssrs-report-documentation-via-a-reportserver-dbo-catalog-query-1



**/

-- ***
-- Fix: Use the Correct XML Namespace for 2016 RDL
-- 2008
--WITH XMLNAMESPACES ( DEFAULT 'http://schemas.microsoft.com/sqlserver/reporting/2008/01/reportdefinition', 
--   'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS rd )
-- 2016 
WITH XMLNAMESPACES (
    DEFAULT 'http://schemas.microsoft.com/sqlserver/reporting/2016/01/reportdefinition',
    'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS rd,
    'http://schemas.microsoft.com/sqlserver/reporting/2016/01/reportdefinition/defaultfontfamily' AS df
)

, dat as (
SELECT -- DISTINCT -- or debug xml
   ReportName= DependentItemName
  ,Path  = a.DependentItemPath
  ,DataSource_Name = ds.value('@Name', 'VARCHAR(255)')
 ,DataSet_Name = x.value('@Name', 'VARCHAR(255)')
 ,CommandText= x.value('(Query/CommandText)[1]','VARCHAR(250)')
  -- ??Datasource_Name = ???

  ,type
  ,reportXML
 FROM ( 
   --   SELECT C.Name,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
      ---- Added
      ----,C.Type 
   --   FROM ReportServer.dbo.Catalog C
   --    WHERE C.Content is not null
   --   --AND C.Type = 2
      ---- and  c.Type = 5 -- Shared Data Source
      -- 2 -------------------------------
      SELECT
    DS.Name AS DatasourceName,
    C.Name AS DependentItemName, 
    C.Path AS DependentItemPath,
    C.Type,
    C.Content,
    CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
FROM
    ReportServer.dbo.Catalog AS C 
        INNER JOIN
    ReportServer.dbo.Users AS CU
        ON C.CreatedByID = CU.UserID
        INNER JOIN
    ReportServer.dbo.Users AS MU
        ON C.ModifiedByID = MU.UserID
        LEFT OUTER JOIN
    ReportServer.dbo.SecData AS SD
        ON C.PolicyID = SD.PolicyID AND SD.AuthType = 1
        INNER JOIN
    ReportServer.dbo.DataSource AS DS
        ON C.ItemID = DS.ItemID
WHERE 1=1
  --  and (C.Path = @ItemName or @itemName is null)
    and C.Type = 2
    and DS.Name IS NOT NULL
    --and  C.Name like 'BOE_%'
  ) a
CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') r ( x )
--CROSS APPLY x.nodes('Fields/Field') f(df) 
CROSS APPLY ReportXML.nodes('/Report/DataSources/DataSource') AS z(ds)
) 
select DISTINCT
 ReportName
,Path
,DataSource_Name
,DataSet_Name
,CommandText
,type
, NULL AS Checklist1
, NULL AS Dependency1
--,reportXML
FROM dat
where CommandText is not null
ORDER BY ReportName  
;
