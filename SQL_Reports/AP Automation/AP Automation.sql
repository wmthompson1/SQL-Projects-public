declare @DaysToLoad int = 90;
SELECT 
    tblFiles.id,
    tblFiles.CompanyID [Company],  -- vendor ID
    tblPO.pNo [PO #],
    tblFiles.DocNo,
    tblFiles.fileName [File Name],
    tblFiles.section [Document Type],
    tblFiles.ddate [Date],
    tblInvoice.invoiceNo [Invoice #],
    tblFiles.[Receiver#] [Receiver#],
    tblFiles.[Voucher#] [Voucher#],
    DATEADD(DAY, -@DaysToLoad, GETDATE()) as 'CutoffDate'
FROM [sql-lab-1].dbRMS.dbo.tblFiles 
    
    LEFT OUTER JOIN [sql-lab-1].dbRMS.dbo.tblInvoice
    ON tblInvoice.fileID = tblFiles.id
    LEFT OUTER JOIN [sql-lab-1].dbRMS.dbo.tblPO ON tblFiles.id = tblPO.fileID
WHERE 1=1
  --  and tblFiles.ddate >= DATEADD(DAY, -@DaysToLoad, GETDATE())  -- incorrect cutoff date filter because of time component
   and    convert(date,tblFiles.ddate) >= convert(date, cast(DATEADD(DAY, -@DaysToLoad, GETDATE())  as datetime))


    		--AND tblFiles.COMPANYID = 'IMAUSA'
ORDER BY 
    convert(date,tblFiles.ddate);