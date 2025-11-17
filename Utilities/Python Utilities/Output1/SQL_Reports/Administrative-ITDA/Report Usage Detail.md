# Report Usage Detail

```sql


/**********************************************************************************************
Description:    Execution Results and Rate of Successful execution
Sample:            In-line sql as of 9/19

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
09/23/2019    William Thompson

RESOURCES
R-5 https://www.sqlshack.com/monitoring-sql-server-reporting-services/

R-4 http://blogs.wrox.com/article/creating-a-report-server-usage-report-with-sql-server-reporting-services/
R-3 http://bretstateham.com/extracting-ssrs-report-rdl-xml-from-the-reportserver-database/
R-2 http://technet.microsoft.com/en-us/library/ms159110(v=sql.105).aspx

R-1 https://www.google.com/search?rlz=1C1GCEU_enUS839US839&sxsrf=ACYBGNTnXc6VRKAK46IgbH2xmlxsSemmsA%3A1569256443231&ei=-_OIXYjoDZH3-gTnqY3wCw&q=Reporting+Services+usage+reports+execution+sql+server&oq=Reporting+Services+usage+reports+execution+sql+server&gs_l=psy-ab.3...4198.25794..28796...3.3..0.106.2007.31j1......0....1..gws-wiz.......0i71j0i13j0i8i7i30j0i13i30j0i13i5i30j33i299j33i22i29i30j33i160j33i10.bBxjuRk-9wE&ved=0ahUKEwjI0fDmr-fkAhWRu54KHedUA74Q4dUDCAs&uact=5

DEFINITIONS
  Type 2 = Report; 4=Linked Report

  sp_helptext 'Report.usp_CrmPyramid'

TESTER
-- Detail about empty set and userName needed
-- Plant Shipments W OTD
**********************************************************************************************/

/*


    SELECT 
    --    CONVERT(XML,c.parameter) parameter
         el3.parameters,el3.UserName,el3.ExecutionId
         ,el3.TimeStart, el3.TimeEnd
         ,c.Type
         ,el3.ItemPath
         --,FLD1 = REVERSE(SUBSTRING(REVERSE(ItemPath),CHARINDEX('/',ItemPath)+0,LEN(ItemPath)))
         --,FLD2 = REVERSE(SUBSTRING(REVERSE(ItemPath),CHARINDEX('/',ItemPath)+0,LEN(ItemPath)))
         --,FLD3 = LEN(ItemPath) - CHARINDEX('/',REVERSE(ItemPath))
         ,Folder = SUBSTRING(ItemPath,1,LEN(ItemPath) - CHARINDEX('/',REVERSE(ItemPath)) + 1)
         ,FilePath = ItemPath
    --    ,*
    FROM ReportServer.dbo.Catalog c (NOLOCK) 
    INNER JOIN ReportServer.dbo.ExecutionLog3 el3 (NOLOCK)
        ON c.path = el3.itemPath
    WHERE el3.TimeStart 
    BETWEEN '2019-03-01' AND '2019-12-31'
    AND    ItemPath LIKE '%' + 'Visual Enterprise Reports' + '%'



*/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

Declare @ThisServer NVARCHAR(128)
--SELECT @@SERVERNAME


DECLARE @DateFrom Date, @DateTo Date, @SubsDateFrom Date, @SubsDateTo Date
--@ItemName VARCHAR(128)
--,@UsersName VARCHAR(128)

SET @DateFrom = dateadd(month,-3, getdate()) -- '2020-01-17'
SET @DateTo = dateadd(month,-0, getdate())  -- '2020-01-22'
--SET @ItemName = 'CRM iStock Customer Spend'
--SET @ItemName = 'CRM'
--SET @ItemName = null -- 'Plant Shipments W OTD' --NULL
--SET @UsersName = null --'SKILLS\williamt,SKILLS\markH, SKILLS\cthompson-ferrero, SKILLS\cturnbaugh,SKILLS\DRath'
--SET @UsersName = 'AMER\wthompson'
--SET @UsersName = 'AMER\DRath'
--SET @UsersName = NULL
-- Cannot resolve the collation conflict between "SQL_Latin1_General_CP1_CI_AS" and "Latin1_General_CI_AS_KS_WS" in the equal to operation.



SELECT 
      1 AS ExecutionCount
    , CASE WHEN RE.[Status] = 'rsSuccess' THEN 1 ELSE 0 END AS SuccessCount
    , CASE WHEN RE.[Status] = 'rsSuccess' THEN 0 ELSE 1 END AS FailureCount
    , Name
    , UserName
    , [Parameters]
    , ExecutionId
    , (([RowCount]) / 1) RowsPerExec
    , TimeStart
    , TimeEnd
    , TimeDataRetrieval/1000  AS TimeDataRetrievalSum
    , TimeProcessing/1000  AS TimeProcessingSum
    , TimeRendering/1000  AS TimeRenderingSum
    , ByteCount AS ByteCountSum
    , [RowCount] AS RowCountSum
    , ((TimeDataRetrieval/1000) ) / 1 SecsPerExec
    , IfRow = IIF([RowCount] <= 1, 0, 1)
FROM
(
    SELECT el3.TimeStart, Catalog.Type, Catalog.Name,
      TimeDataRetrieval, TimeProcessing, TimeRendering, ByteCount, [RowCount]
      ,el3.[Status]
      ,el3.[parameters],el3.UserName,el3.ExecutionId
      ,el3.TimeEnd
    FROM ReportServer.dbo.Catalog (NOLOCK)
    INNER JOIN ReportServer.dbo.ExecutionLog3 el3 (NOLOCK)
    ON Catalog.path = el3.itemPath
    WHERE el3.TimeStart 
    BETWEEN @DateFrom AND @DateTo 
    --AND el3.UserName IN (@UsersName)
    AND (
        (el3.UserName IN (
        SELECT Data COLLATE SQL_Latin1_General_CP1_CI_AS
        FROM DataWarehouse.Resource.udf_SplitByXml(@UsersName,','))
        )
        OR
        (
        @UsersName IS NULL
        ))

--    AND Type IN  (2,4)
--    AND requesttype = 'subscription'
--    AND EL3.[RowCount] = 0
    And el3.ItemPath 
        IN(

        SELECT ItemPath
        FROM ReportServer.dbo.ExecutionLog3 (NOLOCK)
        WHERE 
        ((ItemPath LIKE '%' + @ItemName + '%')
        OR
        (@ItemName IS NULL))

        GROUP BY ItemPath

        )
) AS RE

ORDER BY
         executionId 
        ,timeStart
        ,[RowCount] ASC
--        ,Name;

```