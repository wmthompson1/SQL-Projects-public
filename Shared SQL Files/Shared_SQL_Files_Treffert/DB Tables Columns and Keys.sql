USE LIVE
GO

select schema_name(tab.schema_id) as schema_name,
    tab.name as table_name, 
    col.column_id,
    col.name as column_name, 
    t.name as data_type,    
    col.max_length,
    col.precision
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
order by schema_name,
    table_name, 
    column_id;
	
SELECT OBJECT_SCHEMA_NAME(T.[object_id],DB_ID()) AS [Schema]
, T.[name] AS [table_name]
, AC.[name] AS [column_name]
, TY.[name] AS system_data_type
, AC.[max_length]
, AC.[precision]
, AC.[scale]
, AC.[is_nullable]
, AC.[is_ansi_padded]  
FROM sys.[tables] AS T   
INNER JOIN sys.[all_columns] AC 
ON T.[object_id] = AC.[object_id]  
INNER JOIN sys.[types] TY 
ON AC.[system_type_id] = TY.[system_type_id] 
AND AC.[user_type_id] = TY.[user_type_id]   
WHERE T.[is_ms_shipped] = 0  
ORDER BY T.[name]
, AC.[column_id]

--> looking for a field
DECLARE @FIELD NVARCHAR(MAX) = 'EMPLOYEE%'
SELECT t.name AS table_name
, SCHEMA_NAME(schema_id) AS schema_name
, c.name AS column_name
FROM sys.tables AS t
INNER JOIN sys.columns c 
ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE @FIELD
ORDER BY schema_name
, table_name; 

select schema_name(tab.schema_id) as [schema_name], 
    tab.[name] as table_name, 
    pk.[name] as pk_name,
    substring(column_names, 1, len(column_names)-1) as [columns]
from sys.tables tab
    left outer join sys.indexes pk
        on tab.object_id = pk.object_id 
        and pk.is_primary_key = 1
   cross apply (select col.[name] + ', '
                    from sys.index_columns ic
                        inner join sys.columns col
                            on ic.object_id = col.object_id
                            and ic.column_id = col.column_id
                    where ic.object_id = tab.object_id
                        and ic.index_id = pk.index_id
                            order by col.column_id
                            for xml path ('') ) D (column_names)
order by schema_name(tab.schema_id)
, tab.[name]

SELECT c.name 'Column Name',
    t.Name 'Data type',
    c.max_length 'Max Length',
    c.precision ,
    c.scale ,
    c.is_nullable,
    ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM sys.columns c
INNER JOIN sys.types t 
ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN sys.index_columns ic 
ON ic.object_id = c.object_id 
AND ic.column_id = c.column_id
LEFT OUTER JOIN sys.indexes i 
ON ic.object_id = i.object_id 
AND ic.index_id = i.index_id

SELECT c.name 'Column Name',
   t.name,
   t.name +
   CASE WHEN t.name IN ('char', 'varchar','nchar','nvarchar') THEN '('+
                CASE WHEN c.max_length=-1 THEN 'MAX' ELSE CONVERT(VARCHAR(4),
                               CASE WHEN t.name IN ('nchar','nvarchar') THEN  c.max_length/2 ELSE c.max_length END )
                  END +')'
          WHEN t.name IN ('decimal','numeric') THEN '('+ CONVERT(VARCHAR(4),c.precision)+',' + CONVERT(VARCHAR(4),c.Scale)+')'
          ELSE '' END as "DDL name",
   c.max_length 'Max Length in Bytes',
   c.precision ,
   c.scale ,
   c.is_nullable,
   ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM sys.columns c
INNER JOIN sys.types t 
ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN sys.index_columns ic 
ON ic.object_id = c.object_id 
AND ic.column_id = c.column_id
LEFT OUTER JOIN sys.indexes i 
ON ic.object_id = i.object_id 
AND ic.index_id = i.index_id

Select C.COLUMN_NAME, C.DATA_TYPE, C.CHARACTER_MAXIMUM_LENGTH, C.NUMERIC_PRECISION, C.IS_NULLABLE, TC.CONSTRAINT_NAME
From INFORMATION_SCHEMA.COLUMNS As C
    Left Join INFORMATION_SCHEMA.TABLE_CONSTRAINTS As TC
      On TC.TABLE_SCHEMA = C.TABLE_SCHEMA
          And TC.TABLE_NAME = C.TABLE_NAME
          And TC.CONSTRAINT_TYPE = 'PRIMARY KEY'

Select C.COLUMN_NAME, C.DATA_TYPE, C.CHARACTER_MAXIMUM_LENGTH
    , C.NUMERIC_PRECISION, C.NUMERIC_SCALE
    , C.IS_NULLABLE
    , Case When Z.CONSTRAINT_NAME Is Null Then 0 Else 1 End As IsPartOfPrimaryKey
From INFORMATION_SCHEMA.COLUMNS As C
Outer Apply (
Select CCU.CONSTRAINT_NAME
From INFORMATION_SCHEMA.TABLE_CONSTRAINTS As TC
Join INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE As CCU
On CCU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
Where TC.TABLE_SCHEMA = C.TABLE_SCHEMA
And TC.TABLE_NAME = C.TABLE_NAME
And TC.CONSTRAINT_TYPE = 'PRIMARY KEY'
And CCU.COLUMN_NAME = C.COLUMN_NAME
) As Z


SELECT col.TABLE_CATALOG AS [Database]
     , col.TABLE_SCHEMA AS Owner
     , col.TABLE_NAME AS TableName
     , col.COLUMN_NAME AS ColumnName
     , col.ORDINAL_POSITION AS OrdinalPosition
     , col.COLUMN_DEFAULT AS DefaultSetting
     , col.DATA_TYPE AS DataType
     , col.CHARACTER_MAXIMUM_LENGTH AS MaxLength
     , col.DATETIME_PRECISION AS DatePrecision
     , CAST(CASE col.IS_NULLABLE
                WHEN 'NO' THEN 0
                ELSE 1
            END AS bit)AS IsNullable
     , COLUMNPROPERTY(OBJECT_ID('[' + col.TABLE_SCHEMA + '].[' + col.TABLE_NAME + ']'), col.COLUMN_NAME, 'IsIdentity')AS IsIdentity
     , COLUMNPROPERTY(OBJECT_ID('[' + col.TABLE_SCHEMA + '].[' + col.TABLE_NAME + ']'), col.COLUMN_NAME, 'IsComputed')AS IsComputed
     , CAST(ISNULL(pk.is_primary_key, 0)AS bit)AS IsPrimaryKey
  FROM INFORMATION_SCHEMA.COLUMNS AS col
       LEFT JOIN(SELECT SCHEMA_NAME(o.schema_id)AS TABLE_SCHEMA
                      , o.name AS TABLE_NAME
                      , c.name AS COLUMN_NAME
                      , i.is_primary_key
                   FROM sys.indexes AS i JOIN sys.index_columns AS ic ON i.object_id = ic.object_id
                                                                     AND i.index_id = ic.index_id
                                         JOIN sys.objects AS o ON i.object_id = o.object_id
                                         LEFT JOIN sys.columns AS c ON ic.object_id = c.object_id
                                                                   AND c.column_id = ic.column_id
                  WHERE i.is_primary_key = 1)AS pk ON col.TABLE_NAME = pk.TABLE_NAME
                                                  AND col.TABLE_SCHEMA = pk.TABLE_SCHEMA
                                                  AND col.COLUMN_NAME = pk.COLUMN_NAME
 WHERE col.TABLE_SCHEMA = 'dbo'
--   AND col.TABLE_NAME = 'YourTableName'
 ORDER BY col.TABLE_NAME, col.ORDINAL_POSITION;

SELECT * 
    --c.name 'Column Name',
    --t.name 'Data type',
    --IIF(t.name = 'nvarchar', c.max_length / 2, c.max_length) 'Max Length',
    --c.precision 'Precision',
    --c.scale 'Scale',
    --IIF(c.is_nullable = 0, 'No', 'Yes') 'Nullable',
    --IIF(ISNULL(i.is_primary_key, 0) = 0, 'No', 'Yes') 'Primary Key'
FROM    
    sys.columns c
INNER JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id


SELECT *
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS Tab, 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE Col 
WHERE Col.Constraint_Name = Tab.Constraint_Name
    AND Col.Table_Name = Tab.Table_Name
    AND Constraint_Type = 'PRIMARY KEY'


select schema_name(fk_tab.schema_id) + '.' + fk_tab.name as foreign_table,
    '>-' as rel,
    schema_name(pk_tab.schema_id) + '.' + pk_tab.name as primary_table,
    substring(column_names, 1, len(column_names)-1) as [fk_columns],
    fk.name as fk_constraint_name
from sys.foreign_keys fk
    inner join sys.tables fk_tab
        on fk_tab.object_id = fk.parent_object_id
    inner join sys.tables pk_tab
        on pk_tab.object_id = fk.referenced_object_id
    cross apply (select col.[name] + ', '
                    from sys.foreign_key_columns fk_c
                        inner join sys.columns col
                            on fk_c.parent_object_id = col.object_id
                            and fk_c.parent_column_id = col.column_id
                    where fk_c.parent_object_id = fk_tab.object_id
                      and fk_c.constraint_object_id = fk.object_id
                            order by col.column_id
                            for xml path ('') ) D (column_names)
order by schema_name(fk_tab.schema_id) + '.' + fk_tab.name,
    schema_name(pk_tab.schema_id) + '.' + pk_tab.name