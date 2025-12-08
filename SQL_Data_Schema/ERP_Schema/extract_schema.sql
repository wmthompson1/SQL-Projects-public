-- # 1. Run the SQL query directly in SSMS
-- # 2. Export results as CSV

-- # OR use the PowerShell script:
-- cd "Data Models\ERP_Schema"

-- .\Export-SchemaDocumentation.ps1 `
--     -ServerInstance "YOUR_SQL_SERVER" `
--     -Database "VisualMfg" `
--     -OutputFormat All
-- =============================================

-- DETAILED SCHEMA EXTRACTION
-- =============================================

--use Datamart;
--use live;
-- C:\Users\williamt\OneDrive - Skills Inc GCC High\Documents\sql\111_Utils\999 Util Schema3.sql

/***
William          11/24/2015 Created for Skills Inc
Purpose: Extract detailed schema information for documentation

Data Models/
  ERP_Schema/
    ├── extract_schema.sql              (Enhanced version of your query)
    ├── Export-SchemaDocumentation.ps1  (PowerShell automation)
    └── README.md                       (Documentation)


***/



--use [IQM_Baseline_App]
use live;
go


SELECT
t.TABLE_TYPE 
,'sqlserver' dbms,t.TABLE_CATALOG,t.TABLE_SCHEMA
,t.TABLE_NAME,c.COLUMN_NAME,c.ORDINAL_POSITION,c.DATA_TYPE
,c.CHARACTER_MAXIMUM_LENGTH,n.CONSTRAINT_TYPE,k2.TABLE_SCHEMA,k2.TABLE_NAME,k2.COLUMN_NAME 
-- lucidChart schema definition
FROM INFORMATION_SCHEMA.TABLES t 
LEFT JOIN INFORMATION_SCHEMA.COLUMNS c ON t.TABLE_CATALOG=c.TABLE_CATALOG AND t.TABLE_SCHEMA=c.TABLE_SCHEMA AND t.TABLE_NAME=c.TABLE_NAME 
LEFT JOIN(INFORMATION_SCHEMA.KEY_COLUMN_USAGE k JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n ON k.CONSTRAINT_CATALOG=n.CONSTRAINT_CATALOG 
AND k.CONSTRAINT_SCHEMA=n.CONSTRAINT_SCHEMA AND k.CONSTRAINT_NAME=n.CONSTRAINT_NAME LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r 
ON k.CONSTRAINT_CATALOG=r.CONSTRAINT_CATALOG AND k.CONSTRAINT_SCHEMA=r.CONSTRAINT_SCHEMA AND k.CONSTRAINT_NAME=r.CONSTRAINT_NAME)ON c.TABLE_CATALOG=k.TABLE_CATALOG 
AND c.TABLE_SCHEMA=k.TABLE_SCHEMA AND c.TABLE_NAME=k.TABLE_NAME AND c.COLUMN_NAME=k.COLUMN_NAME LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k2 ON k.ORDINAL_POSITION=k2.ORDINAL_POSITION AND r.UNIQUE_CONSTRAINT_CATALOG=k2.CONSTRAINT_CATALOG AND r.UNIQUE_CONSTRAINT_SCHEMA=k2.CONSTRAINT_SCHEMA AND r.UNIQUE_CONSTRAINT_NAME=k2.CONSTRAINT_NAME 
WHERE (1=1) 
--AND t.TABLE_TYPE!='BASE TABLE'
--and t.TABLE_NAME in ('SK_SUPPLIER_PERFORMANCE_DETAILS','','')
order by 
 t.TABLE_CATALOG, t.TABLE_NAME, c.ORDINAL_POSITION