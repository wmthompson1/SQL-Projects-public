-- Cleaned-up AP Automation query (aliases, formatting, and null-handling)
DECLARE @DaysToLoad INT = 90;

SELECT
    f.id,
    f.CompanyID                        AS [Company],    -- vendor ID
    p.pNo                              AS [PO #],
    f.DocNo,
    f.fileName                         AS [File Name],
    f.section                          AS [Document Type],
    CONVERT(date, f.ddate)             AS [Date],
    i.invoiceNo                        AS [Invoice #], -- show null if missing
    COALESCE(f.[Receiver#], '')        AS [Receiver#],
    COALESCE(f.[Voucher#], '')         AS [Voucher#],
    DATEADD(DAY, -@DaysToLoad, GETDATE()) AS CutoffDate
FROM [sql-lab-1].dbRMS.dbo.tblFiles AS f
LEFT JOIN [sql-lab-1].dbRMS.dbo.tblInvoice AS i
    ON i.fileID = f.id
LEFT JOIN [sql-lab-1].dbRMS.dbo.tblPO AS p
    ON p.fileID = f.id
WHERE 1 = 1
  -- keep date filter against f.ddate (files) and convert to date to avoid time-component issues
  AND CONVERT(date, f.ddate) >= CONVERT(date, DATEADD(DAY, -@DaysToLoad, GETDATE()))
  -- Example company filter (uncomment if needed):
  -- AND f.COMPANYID = 'IMAUSA'
ORDER BY CONVERT(date, f.ddate);