/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Unique]
      ,[GL]
      ,[Location]
      ,[Reference No]
      ,[Description]
      ,[Acq Date]
      ,[Date IfDiff]
      ,[Cost Basis]
      ,[Additions]
      ,[Disposed]
      ,[Ending Cost]
      ,[Method]
      ,[Life]
      ,[Depreciation Start]
      ,[Depreciation Ending]
      ,[Months]
      ,[AccumDepThru20201130]
      ,[DepFor20201231]
      ,[TotalAccumDepThru2020]
  FROM [LIVESupplemental].[dbo].[FixedAssets]

/*
UPDATE [LIVESupplemental].[dbo].[FixedAssets]
SET [Location] = NULL
, [Reference No] = NULL
, [Date IfDiff] = NULL
, [Cost Basis] = NULL
, [Disposed] = NULL
WHERE [Unique] IN ('2020-63', '2021-01', '2021-02', '2021-03', '2021-04', '2021-05', '2021-06', '2021-01A')

UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '05/01/2020', [Depreciation Ending] = '05/01/2025' WHERE [UNIQUE] = '2020-63'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '02/01/2021', [Depreciation Ending] = '02/01/2026' WHERE [UNIQUE] = '2021-01'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '02/01/2021', [Depreciation Ending] = '02/01/2024' WHERE [UNIQUE] = '2021-02'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '02/01/2021', [Depreciation Ending] = '02/01/2024' WHERE [UNIQUE] = '2021-03'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '02/01/2021', [Depreciation Ending] = '02/01/2031' WHERE [UNIQUE] = '2021-04'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '03/01/2021', [Depreciation Ending] = '03/01/2026' WHERE [UNIQUE] = '2021-05'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '03/01/2021', [Depreciation Ending] = '03/01/2026' WHERE [UNIQUE] = '2021-06'
UPDATE [LIVESupplemental].[dbo].[FixedAssets] SET [Depreciation Start] = '03/01/2021', [Depreciation Ending] = '03/01/2026' WHERE [UNIQUE] = '2021-01A'



*/