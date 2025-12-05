-- =============================================
-- ERP Schema Metadata Extraction
-- Purpose: Export complete schema for documentation, semantic layer, and visualization
-- Output: Compatible with LucidChart, ERD tools, and Copilot Spaces
-- =============================================

SELECT 
    t.TABLE_TYPE
    ,'sqlserver' AS dbms
    ,t.TABLE_CATALOG
    ,t.TABLE_SCHEMA
    ,t.TABLE_NAME
    ,c.COLUMN_NAME
    ,c.ORDINAL_POSITION
    ,c.DATA_TYPE
    ,c.CHARACTER_MAXIMUM_LENGTH
    ,c.NUMERIC_PRECISION
    ,c.NUMERIC_SCALE
    ,c.IS_NULLABLE
    ,c.COLUMN_DEFAULT
    ,n.CONSTRAINT_TYPE
    ,n.CONSTRAINT_NAME
    ,k2.TABLE_SCHEMA AS FK_TABLE_SCHEMA
    ,k2.TABLE_NAME AS FK_TABLE_NAME
    ,k2.COLUMN_NAME AS FK_COLUMN_NAME
    -- Extended properties for documentation (if available)
    ,CAST(ep.value AS NVARCHAR(500)) AS COLUMN_DESCRIPTION
FROM INFORMATION_SCHEMA.TABLES t 
LEFT JOIN INFORMATION_SCHEMA.COLUMNS c 
    ON t.TABLE_CATALOG = c.TABLE_CATALOG 
    AND t.TABLE_SCHEMA = c.TABLE_SCHEMA 
    AND t.TABLE_NAME = c.TABLE_NAME 
LEFT JOIN (
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE k 
    JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n 
        ON k.CONSTRAINT_CATALOG = n.CONSTRAINT_CATALOG 
        AND k.CONSTRAINT_SCHEMA = n.CONSTRAINT_SCHEMA 
        AND k.CONSTRAINT_NAME = n.CONSTRAINT_NAME 
    LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r 
        ON k.CONSTRAINT_CATALOG = r.CONSTRAINT_CATALOG 
        AND k.CONSTRAINT_SCHEMA = r.CONSTRAINT_SCHEMA 
        AND k.CONSTRAINT_NAME = r.CONSTRAINT_NAME
) ON c.TABLE_CATALOG = k.TABLE_CATALOG 
    AND c.TABLE_SCHEMA = k.TABLE_SCHEMA 
    AND c.TABLE_NAME = k.TABLE_NAME 
    AND c.COLUMN_NAME = k.COLUMN_NAME 
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k2 
    ON k.ORDINAL_POSITION = k2.ORDINAL_POSITION 
    AND r.UNIQUE_CONSTRAINT_CATALOG = k2.CONSTRAINT_CATALOG 
    AND r.UNIQUE_CONSTRAINT_SCHEMA = k2.CONSTRAINT_SCHEMA 
    AND r.UNIQUE_CONSTRAINT_NAME = k2.CONSTRAINT_NAME 
-- Get extended properties if they exist (documentation)
LEFT JOIN sys.tables st
    ON t.TABLE_SCHEMA = SCHEMA_NAME(st.schema_id)
    AND t.TABLE_NAME = st.name
LEFT JOIN sys.columns sc
    ON st.object_id = sc.object_id
    AND c.COLUMN_NAME = sc.name
LEFT JOIN sys.extended_properties ep
    ON sc.object_id = ep.major_id
    AND sc.column_id = ep.minor_id
    AND ep.name = 'MS_Description'
WHERE (1=1)
    -- Filter options (uncomment as needed):
    -- AND t.TABLE_TYPE = 'BASE TABLE'  -- Exclude views
    -- AND t.TABLE_SCHEMA NOT IN ('sys', 'INFORMATION_SCHEMA')  -- Exclude system schemas
    -- AND t.TABLE_NAME IN ('SK_SUPPLIER_PERFORMANCE_DETAILS', 'YOUR_TABLE')  -- Specific tables
    -- AND t.TABLE_SCHEMA = 'dbo'  -- Specific schema only
ORDER BY 
    t.TABLE_CATALOG
    ,t.TABLE_SCHEMA
    ,t.TABLE_NAME
    ,c.ORDINAL_POSITION;

-- =============================================
-- ALTERNATIVE: Simplified Schema for Documentation
-- =============================================
/*
SELECT 
    t.TABLE_SCHEMA + '.' + t.TABLE_NAME AS [Table]
    ,c.COLUMN_NAME AS [Column]
    ,c.DATA_TYPE 
        + CASE 
            WHEN c.CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
            THEN '(' + CAST(c.CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
            WHEN c.NUMERIC_PRECISION IS NOT NULL
            THEN '(' + CAST(c.NUMERIC_PRECISION AS VARCHAR) + ',' + CAST(c.NUMERIC_SCALE AS VARCHAR) + ')'
            ELSE ''
          END AS [Data Type]
    ,CASE WHEN n.CONSTRAINT_TYPE = 'PRIMARY KEY' THEN 'PK'
          WHEN n.CONSTRAINT_TYPE = 'FOREIGN KEY' THEN 'FK → ' + k2.TABLE_NAME
          WHEN n.CONSTRAINT_TYPE = 'UNIQUE' THEN 'UQ'
          ELSE ''
     END AS [Key]
    ,c.IS_NULLABLE AS [Nullable]
    ,CAST(ep.value AS NVARCHAR(500)) AS [Description]
FROM INFORMATION_SCHEMA.TABLES t 
LEFT JOIN INFORMATION_SCHEMA.COLUMNS c 
    ON t.TABLE_CATALOG = c.TABLE_CATALOG 
    AND t.TABLE_SCHEMA = c.TABLE_SCHEMA 
    AND t.TABLE_NAME = c.TABLE_NAME 
LEFT JOIN (
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE k 
    JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n 
        ON k.CONSTRAINT_CATALOG = n.CONSTRAINT_CATALOG 
        AND k.CONSTRAINT_SCHEMA = n.CONSTRAINT_SCHEMA 
        AND k.CONSTRAINT_NAME = n.CONSTRAINT_NAME 
    LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r 
        ON k.CONSTRAINT_CATALOG = r.CONSTRAINT_CATALOG 
        AND k.CONSTRAINT_SCHEMA = r.CONSTRAINT_SCHEMA 
        AND k.CONSTRAINT_NAME = r.CONSTRAINT_NAME
) ON c.TABLE_CATALOG = k.TABLE_CATALOG 
    AND c.TABLE_SCHEMA = k.TABLE_SCHEMA 
    AND c.TABLE_NAME = k.TABLE_NAME 
    AND c.COLUMN_NAME = k.COLUMN_NAME 
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k2 
    ON k.ORDINAL_POSITION = k2.ORDINAL_POSITION 
    AND r.UNIQUE_CONSTRAINT_CATALOG = k2.CONSTRAINT_CATALOG 
    AND r.UNIQUE_CONSTRAINT_SCHEMA = k2.CONSTRAINT_SCHEMA 
    AND r.UNIQUE_CONSTRAINT_NAME = k2.CONSTRAINT_NAME
LEFT JOIN sys.tables st
    ON t.TABLE_SCHEMA = SCHEMA_NAME(st.schema_id)
    AND t.TABLE_NAME = st.name
LEFT JOIN sys.columns sc
    ON st.object_id = sc.object_id
    AND c.COLUMN_NAME = sc.name
LEFT JOIN sys.extended_properties ep
    ON sc.object_id = ep.major_id
    AND sc.column_id = ep.minor_id
    AND ep.name = 'MS_Description'
WHERE t.TABLE_TYPE = 'BASE TABLE'
    AND t.TABLE_SCHEMA NOT IN ('sys', 'INFORMATION_SCHEMA')
ORDER BY 
    t.TABLE_SCHEMA
    ,t.TABLE_NAME
    ,c.ORDINAL_POSITION;
*/
