# Report SQL

```sql
--use ReportServer
--go
-- C:\Users\williamt\OneDrive - Skills Inc GCC High\Documents\sql\222_Data_Models\Reports_SQL



/**********************************************************************************************
Description:  Report Data Source

Sample:


Date      Modified By      Change Description
---------- ------------------ ------------------------------------------------------------
08/29/2025    William            Started with non-distinct set

Resources
https://www.sqlservercentral.com/articles/dynamic-ssrs-report-documentation-via-a-reportserver-dbo-catalog-query-1

**********************************************************************************************/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET DEADLOCK_PRIORITY LOW;
IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results;



WITH XMLNAMESPACES (
    DEFAULT 'http://schemas.microsoft.com/sqlserver/reporting/2016/01/reportdefinition',
    'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS rd,
    'http://schemas.microsoft.com/sqlserver/reporting/2016/01/reportdefinition/defaultfontfamily' AS df
)

, dat as (
SELECT -- DISTINCT -- or debug xml
   ReportName= DependentItemName  -- nvarchar(850)
  ,Path  = a.DependentItemPath    -- nvarchar(850)
  ,DataSource_Name = ds.value('@Name', 'VARCHAR(255)')  -- [nvarchar](260)
 ,DataSet_Name = x.value('@Name', 'VARCHAR(255)')
 ,CommandText= x.value('(Query/CommandText)[1]','VARCHAR(MAX)')
  -- ??Datasource_Name = ???

  ,type
  ,reportXML
 FROM ( 

      SELECT
    DS.Name AS DatasourceName,  -- [nvarchar](260)
    C.Name AS DependentItemName, -- nvarchar(850)
    C.Path AS DependentItemPath,  -- nvarchar(850)
    C.Type,                        -- int
    C.Content,  -- [varbinary](max)
    CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML  -- xml
FROM
    ReportServer.dbo.Catalog AS C 
    -- EXEC sp_help 'ReportServer.dbo.Catalog';
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
    and C.Type = 2
    and DS.Name IS NOT NULL
    --and  C.Name like 'BOE_%'
  ) a
CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') r ( x )
CROSS APPLY ReportXML.nodes('/Report/DataSources/DataSource') AS z(ds)
) 
select DISTINCT
     ReportName
    ,Path
    ,DataSource_Name
    ,DataSet_Name
    ,CommandText
    ,type
    --,reportXML
    FROM dat
where CommandText is not null
ORDER BY ReportName  
;

```