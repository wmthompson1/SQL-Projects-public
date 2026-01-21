--fike path: SQL_Data_Models/AP_App/AP App Invoices.sql
-- note AP Automation is a different perspective, and a different schema.
-- It's a dfferent DB as well: dbRMS vs Live, on sql-lab-1.  

SELECT top 100
 S.INVOICE_ID,
 R.[invoiceNo], R.[fileID]
-- R.INVOICE_ID, R.INVOICE_DATE, R.AMOUNT, R.CUSTOMER_ID

FROM [sql-lab-1].dbrms.dbo.tblInvoice R
LEFT JOIN dbo.shipper s ON s.INVOICE_ID = R.invoiceNo
WHERE s.INVOICE_ID IS NULL
;

SELECT 
      F.SECTION
    , P.PNO AS 'PO'
    , F.COMPANYID AS 'VENDOR_ID'
    , F.DOCNO AS 'DOC'
    , F.[FILENAME] AS 'FILE_NAME'
    , F.DDATE AS 'UPLOAD_DATE'
FROM [sql-lab-1].dbrms.[dbo].[tblFiles] F
LEFT JOIN [sql-lab-1].dbrms.[dbo].[tblPO] P
ON P.FILEID = F.ID
WHERE F.SECTION = 'INVOICE'
    AND F.VOUCHER# IS NULL
    -- AND F.ID  >= '3202'
    And F.ID >= '178539'
