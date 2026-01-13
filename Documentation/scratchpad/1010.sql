
DECLARE @TableName sysname = N'dbo.SetA';   -- change if needed
DECLARE @cols nvarchar(max) = N'';
DECLARE @sql  nvarchar(max) = N'';

;WITH date_cols AS (
    SELECT QUOTENAME(c.name) AS qname
    FROM sys.columns AS c
    WHERE c.object_id = OBJECT_ID(@TableName)
      AND c.name <> 'BusStream'
      -- Keep columns whose names are valid ISO dates like 2026-01-01
      AND TRY_CONVERT(date, c.name, 23) IS NOT NULL
)
SELECT @cols = STRING_AGG(qname, N',')
FROM date_cols;

IF @cols IS NULL OR LEN(@cols) = 0
BEGIN
    RAISERROR('No date-like columns (YYYY-MM-DD) found to unpivot.', 16, 1);
    RETURN;
END

SET @sql = N'
SELECT
    p.BusStream,
    YEAR(d.[Date])              AS [Year],
    DATENAME(month, d.[Date])   AS [Month],
    u.Target,
    d.[Date]
FROM (
    SELECT BusStream, ' + @cols + N'
    FROM ' + @TableName + N'
) AS p
UNPIVOT
(
    Target FOR DateCol IN (' + @cols + N')
) AS u
CROSS APPLY (VALUES (TRY_CONVERT(date, u.DateCol, 23))) AS d([Date])
WHERE d.[Date] IS NOT NULL
ORDER BY p.BusStream, d.[Date];';

-- For review:
-- PRINT @sql;

EXEC sys.sp_executesql @sql;
``
