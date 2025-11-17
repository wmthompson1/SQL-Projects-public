# Boeing Downloads by Part Number

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
   CATFILE.PartNumber LIKE @PartNumber
order by CATFILE.PartNumber

```