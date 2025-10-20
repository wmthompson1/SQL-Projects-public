/**********************************************************************************************
Description:    
Sample:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
01/23/2020    William Thompson    Report Path internal param


**********************************************************************************************/
WITH ItemContentBinaries AS
(
  SELECT
     ItemID
     , RTRIM(LTRIM(Name)) Name
     ,[Type]
    ,CASE Type
       WHEN 2 THEN 'Report'
       WHEN 5 THEN 'Data Source'
       WHEN 7 THEN 'Report Part'
       WHEN 8 THEN 'Shared Dataset'
       When 13 Then 'Power BI Report'
       ELSE 'Other'
     END AS TypeDescription
    ,[Path]
    ,CONVERT(varbinary(max),Content) AS Content
    ,Folder = SUBSTRING(Path,1,LEN(Path) - CHARINDEX('/',REVERSE(Path)) + 1)
  FROM ReportServer.dbo.Catalog
  WHERE Type in (2,13)
),

--The second CTE strips off the BOM if it exists...
ItemContentNoBOM AS
(
  SELECT
     ItemID,Name,[Type],TypeDescription
    ,CASE
       WHEN LEFT(Content,3) = 0xEFBBBF
         THEN CONVERT(varbinary(max),SUBSTRING(Content,4,LEN(Content)))
       ELSE
         Content
     END AS Content
     ,Path, Folder
  FROM ItemContentBinaries
)
--The outer query gets the content in its varbinary, varchar and xml representations...
SELECT
   1 As Singleton
  ,1 AS TabGroup
  ,ItemID,Name,[Type],TypeDescription,Path, Folder
  ,Content --varbinary
  
  ,CONVERT(varchar(max),Content) AS ContentVarchar --varchar
  ,CONVERT(xml,Content) AS ContentXML --xml
    ,Case WHEN [Type] = 2 THEN 'Report'
    WHEN [Type] = 13 THEN 'PowerBI'
    END AS LinkType

FROM ItemContentNoBOM  
WHERE Path = @ReportPath
ORDER BY 4,5
