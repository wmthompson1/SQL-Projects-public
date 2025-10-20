SELECT [Summary Requirements], rl.* 
FROM DatawareHouse.[managedData].[ReportsListLinks] rl (NOLOCK)
JOIN DatawareHouse.[managedData].[ReportsListProdDetail] rlpd (NOLOCK)
ON rl.Path = rlpd.Path  COLLATE SQL_Latin1_General_CP1_CI_AS 
-- "SQL_Latin1_General_CP1_CI_AS" and "Latin1_General_100_CI_AS_KS_WS" 
WHERE LinkType LIKE '%PowerBi%'
