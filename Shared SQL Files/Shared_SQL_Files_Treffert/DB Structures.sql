use SANDBOX_Baseline_App
go

select * from INFORMATION_SCHEMA.COLUMNS

SELECT  FK.name AS FK_Table,
        FkCol.name AS FK_Column,
        PK.name AS PK_Table,
        PkCol.name AS PK_Column,
        OBJECT_NAME(f.object_id) AS Constraint_Name,
        SCHEMA_NAME(FK.schema_id) AS fkSchema,
        SCHEMA_NAME(PK.schema_id) AS pkSchema,
        PkCol.name AS primarykey,
        k.constraint_column_id AS ORDINAL_POSITION
FROM    sys.objects AS PK
        INNER JOIN sys.foreign_keys AS f
            INNER JOIN sys.foreign_key_columns AS k
                ON k.constraint_object_id = f.object_id
            INNER JOIN sys.indexes AS i
                ON f.referenced_object_id = i.object_id
                   AND f.key_index_id = i.index_id
            ON PK.object_id = f.referenced_object_id
        INNER JOIN sys.objects AS FK
            ON f.parent_object_id = FK.object_id
        INNER JOIN sys.columns AS PkCol
            ON f.referenced_object_id = PkCol.object_id
               AND k.referenced_column_id = PkCol.column_id
        INNER JOIN sys.columns AS FkCol
            ON f.parent_object_id = FkCol.object_id
               AND k.parent_column_id = FkCol.column_id
ORDER BY FK_Table, FK_Column

SELECT  c.TABLE_SCHEMA AS SchemaName,
        c.TABLE_NAME AS TableName,
        t.TABLE_TYPE AS TableType,
        c.ORDINAL_POSITION AS Ordinal,
        c.COLUMN_NAME AS ColumnName,
        CAST(CASE WHEN IS_NULLABLE = 'YES' THEN 1
                  ELSE 0
             END AS BIT) AS IsNullable,
        DATA_TYPE AS TypeName,
        ISNULL(CHARACTER_MAXIMUM_LENGTH, 0) AS [MaxLength],
        CAST(ISNULL(NUMERIC_PRECISION, 0) AS INT) AS [Precision],
        ISNULL(COLUMN_DEFAULT, '') AS [Default],
        CAST(ISNULL(DATETIME_PRECISION, 0) AS INT) AS DateTimePrecision,
        ISNULL(NUMERIC_SCALE, 0) AS Scale,
        CAST(COLUMNPROPERTY(OBJECT_ID(QUOTENAME(c.TABLE_SCHEMA) + '.' + QUOTENAME(c.TABLE_NAME)), c.COLUMN_NAME, 'IsIdentity') AS BIT) AS IsIdentity,
        CAST(CASE WHEN COLUMNPROPERTY(OBJECT_ID(QUOTENAME(c.TABLE_SCHEMA) + '.' + QUOTENAME(c.TABLE_NAME)), c.COLUMN_NAME, 'IsIdentity') = 1 THEN 1
                  WHEN COLUMNPROPERTY(OBJECT_ID(QUOTENAME(c.TABLE_SCHEMA) + '.' + QUOTENAME(c.TABLE_NAME)), c.COLUMN_NAME, 'IsComputed') = 1 THEN 1
                  WHEN DATA_TYPE = 'TIMESTAMP' THEN 1
                  ELSE 0
             END AS BIT) AS IsStoreGenerated,
        CAST(CASE WHEN pk.ORDINAL_POSITION IS NULL THEN 0
                  ELSE 1
             END AS BIT) AS PrimaryKey,
        ISNULL(pk.ORDINAL_POSITION, 0) PrimaryKeyOrdinal,
        CAST(CASE WHEN fk.COLUMN_NAME IS NULL THEN 0
                  ELSE 1
             END AS BIT) AS IsForeignKey
FROM    INFORMATION_SCHEMA.COLUMNS c
        LEFT OUTER JOIN (SELECT u.TABLE_SCHEMA,
                                u.TABLE_NAME,
                                u.COLUMN_NAME,
                                u.ORDINAL_POSITION
                         FROM   INFORMATION_SCHEMA.KEY_COLUMN_USAGE u
                                INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
                                    ON u.TABLE_SCHEMA = tc.CONSTRAINT_SCHEMA
                                       AND u.TABLE_NAME = tc.TABLE_NAME
                                       AND u.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
                         WHERE  CONSTRAINT_TYPE = 'PRIMARY KEY') pk
            ON c.TABLE_SCHEMA = pk.TABLE_SCHEMA
               AND c.TABLE_NAME = pk.TABLE_NAME
               AND c.COLUMN_NAME = pk.COLUMN_NAME
        LEFT OUTER JOIN (SELECT DISTINCT
                                u.TABLE_SCHEMA,
                                u.TABLE_NAME,
                                u.COLUMN_NAME
                         FROM   INFORMATION_SCHEMA.KEY_COLUMN_USAGE u
                                INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
                                    ON u.TABLE_SCHEMA = tc.CONSTRAINT_SCHEMA
                                       AND u.TABLE_NAME = tc.TABLE_NAME
                                       AND u.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
                         WHERE  CONSTRAINT_TYPE = 'FOREIGN KEY') fk
            ON c.TABLE_SCHEMA = fk.TABLE_SCHEMA
               AND c.TABLE_NAME = fk.TABLE_NAME
               AND c.COLUMN_NAME = fk.COLUMN_NAME
        INNER JOIN INFORMATION_SCHEMA.TABLES t
            ON c.TABLE_SCHEMA = t.TABLE_SCHEMA
               AND c.TABLE_NAME = t.TABLE_NAME
WHERE c.TABLE_NAME NOT IN ('EdmMetadata', '__MigrationHistory')


