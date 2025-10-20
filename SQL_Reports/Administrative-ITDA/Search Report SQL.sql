

/**********************************************************************************************
Description:    
Sample:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------

Need to develop search, 1/10/2018


**********************************************************************************************/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW


IF OBJECT_ID('tempdb..#Temp') IS NOT NULL DROP TABLE #Temp

;WITH ItemContentBinaries AS
(
  SELECT
     ItemID,Name,[Type]
        ,CASE Type
       WHEN 2 THEN 'Report'
       WHEN 5 THEN 'Data Source'
       WHEN 7 THEN 'Report Part'
       WHEN 8 THEN 'Shared Dataset'
       When 13 Then 'Power BI Report'
       ELSE 'Other'
     END AS TypeDescription
    ,CONVERT(varbinary(max),Content) AS Content
    ,[Path]
  FROM ReportServer.dbo.Catalog (NOLOCK)
  WHERE Type IN (2,5,7,8,13)
),
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
     ,[Path]
  FROM ItemContentBinaries
)
,ItemContentXML AS
(
  SELECT
     ItemID,Name,[Type],TypeDescription
    ,CONVERT(xml,Content) AS ContentXML
    ,[Path]
 FROM ItemContentNoBOM
)

SELECT
    DISTINCT
     ItemID,Name,[Type],TypeDescription,[Path]
    ,ISNULL(Query.value('(./*:CommandType/text())[1]','nvarchar(1024)'),'Query') AS CommandType
    ,Query.value('(./*:CommandText/text())[1]','nvarchar(max)') AS CommandText
INTO #Temp
FROM ItemContentXML
CROSS APPLY ItemContentXML.ContentXML.nodes('//*:Query') Queries(Query)
;

select 
ItemID
,[Name]
,[Type]
,TypeDescription
,[Path]
,CommandType
 , QueryOrder = ROW_NUMBER() OVER
                             (PARTITION BY itemId
                             ORDER BY CommandType DESC)
,substring(CommandText,1,32000) CommandText1
,substring(CommandText,32001,64000) CommandText2
,substring(CommandText,32001,64000) CommandText3
,substring(CommandText,32001,64000) CommandText4

,substring(CommandText,32001,64000) CommandText5
,substring(CommandText,32001,64000) CommandText6
,substring(CommandText,32001,64000)CommandText7

--,substring(CommandText,32001,64000) CommandText2
--,substring(CommandText,32001,64000) CommandText3

--,substring(CommandText,32001,64000)CommandText4


from #Temp
--where CommandText LIKE '%' + 'as department' + '%'
where commandText LIKE '%' + @Srch1 + '%'

