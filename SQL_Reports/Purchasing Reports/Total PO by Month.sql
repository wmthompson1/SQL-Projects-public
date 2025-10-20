
/*   Created by Juan A Jan-2025
      Update by JA, requested by Monica Jan-21-2025 UNION with LIVEARC 
*/
--DECLARE @StartDate date = dateadd(month, -6, getdate() )

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results

SELECT count(a.ID) as 'PO', a.VENDOR_ID, b.NAME,  DATENAME(MONTH, ORDER_DATE) as 'Month', 
b.USER_6 as 'Supplier Type', b.USER_7 as 'Product Type', DATEPART(MONTH, a.ORDER_DATE) 'M'
into #Results
FROM PURCHASE_ORDER a WITH (NOLOCK) 
inner join VENDOR b WITH (NOLOCK) on a.VENDOR_ID = b.ID
WHERE a.ORDER_DATE >= @StartDate and (b.USER_6 like 'PROCESSOR' or b.USER_6 = 'MANUFACTURER') 
and (b.USER_7 = 'FABRICATION' or b.USER_7 = 'SPECIAL PROCESSING')
GROUP BY a.VENDOR_ID, b.NAME, DATENAME(MONTH, ORDER_DATE), DATEPART(MONTH, a.ORDER_DATE), 
b.USER_6, b.USER_7

UNION

SELECT count(a.ID) as 'PO', a.VENDOR_ID, b.NAME,  DATENAME(MONTH, ORDER_DATE) as 'Month', 
b.USER_6 as 'Supplier Type', b.USER_7 as 'Product Type', DATEPART(MONTH, a.ORDER_DATE) 'M'
FROM [SQL-Lab-2].[LIVEARC].[dbo].PURCHASE_ORDER a WITH (NOLOCK) 
inner join [SQL-Lab-2].[LIVEARC].[dbo].VENDOR b WITH (NOLOCK) on a.VENDOR_ID = b.ID
WHERE a.ORDER_DATE >= @StartDate and (b.USER_6 like 'PROCESSOR' or b.USER_6 = 'MANUFACTURER') 
and (b.USER_7 = 'FABRICATION' or b.USER_7 = 'SPECIAL PROCESSING')
GROUP BY a.VENDOR_ID, b.NAME, DATENAME(MONTH, ORDER_DATE), DATEPART(MONTH, a.ORDER_DATE), 
b.USER_6, b.USER_7

ORDER BY a.VENDOR_ID, DATEPART(MONTH, a.ORDER_DATE) asc

select max(PO) as PO, VENDOR_ID, NAME, [Month], [Supplier Type], [Product Type], M 
from #Results
GROUP BY VENDOR_ID, NAME, [Month], [Supplier Type], [Product Type], M 
ORDER BY VENDOR_ID, M asc

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results

