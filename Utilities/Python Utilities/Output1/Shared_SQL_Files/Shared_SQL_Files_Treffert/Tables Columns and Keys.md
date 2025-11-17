# Tables Columns and Keys

```sql
USE LIVE
GO

SELECT *
--, COLS.*
--TABLE_SCHEMA ,
--   TABLE_NAME ,
--   COLUMN_NAME ,
--   ORDINAL_POSITION ,
--   COLUMN_DEFAULT ,
--   DATA_TYPE ,
--   CHARACTER_MAXIMUM_LENGTH ,
--   NUMERIC_PRECISION ,
--   NUMERIC_PRECISION_RADIX ,
--   NUMERIC_SCALE ,
--   DATETIME_PRECISION
FROM   INFORMATION_SCHEMA.COLUMNS COLS
LEFT OUTER JOIN  
(SELECT i.name AS IndexName, OBJECT_NAME(ic.OBJECT_ID) AS TableName, 
       COL_NAME(ic.OBJECT_ID,ic.column_id) AS ColumnName
FROM sys.indexes AS i
INNER JOIN sys.index_columns AS ic
ON i.OBJECT_ID = ic.OBJECT_ID
AND i.index_id = ic.index_id
WHERE i.is_primary_key = 1
) PK
ON PK.TABLENAME = COLS.TABLE_NAME
AND PK.COLUMNNAME = COLS.COLUMN_NAME 


SELECT so.name 'Table Name',
    c.name 'Column Name',
    t.Name 'Data type',
    c.max_length 'Max Length',
    c.is_nullable,
    case when ISNULL(i.is_primary_key, 0) = 1 then 'Primary Key' end as [Primary Key]
FROM    
    sys.columns c
INNER JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
INNER JOIN 
    sysobjects so ON c.object_id = so.id
WHERE
 --   i.is_primary_key = 1 and 
    so.xtype = 'U'
Order By 'Table Name', 'Column Name'





--> To list all the Primary keys in a SQL Server database run:
SELECT * FROM information_schema.table_constraints
WHERE constraint_type = 'Primary Key'

--> To list all the Foreign keys in a SQL Server database run:
SELECT * FROM information_schema.table_constraints
WHERE constraint_type = 'Foreign Key'



```