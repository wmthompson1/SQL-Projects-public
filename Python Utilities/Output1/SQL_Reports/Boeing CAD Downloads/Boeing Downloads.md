# Boeing Downloads

```sql
SELECT
  CATFILE.PackageID
  ,CATFILE.PartNumber
  ,CATFILE.DocumentType
  ,CATFILE.FileName
  ,CATFILE.Version
  ,CATFILE.FilePath
  ,CATFILE.DateLastModified
  ,CATFILE.Superseded
  ,CATFILE.Customer
  ,CATFILE.Download_Date
FROM
  CATFILE
WHERE
  CATFILE.Download_Date  > DATEADD(DAY,-30,GETDATE()) 
order by CATFILE.PartNumber

```