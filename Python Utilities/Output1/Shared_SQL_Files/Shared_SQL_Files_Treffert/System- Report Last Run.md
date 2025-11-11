# System- Report Last Run

```sql
USE ReportServer
GO

SELECT cat.path, cat.Name, max(ex.TimeStart)
FROM Catalog AS cat 
left outer JOIN ExecutionLog AS ex 
ON ex.ReportID = cat.ItemID
where path like '/%'
--and ex.TimeStart >= '1/1/2020'
group by cat.path, cat.Name
ORDER BY cat.path, cat.Name
```