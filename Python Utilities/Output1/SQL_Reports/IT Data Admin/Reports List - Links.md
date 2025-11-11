# Reports List - Links

```sql



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
  FROM ReportServer.dbo.Catalog
  WHERE ([Type] > 1) 
  and (Type in (2,13))
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
     ,Path
  FROM ItemContentBinaries
)
--The outer query gets the content in its varbinary, varchar and xml representations...
SELECT

  ItemID,Name,[Type],TypeDescription
    ,Case WHEN [Type] = 2 THEN 'Report'
    WHEN [Type] = 13 THEN 'PowerBI'
    END AS LinkType
  ,Path
  ,Content --varbinary
  
  ,CONVERT(varchar(max),Content) AS ContentVarchar --varchar
  ,CONVERT(xml,Content) AS ContentXML --xml

FROM ItemContentNoBOM  
ORDER BY 2,3

```