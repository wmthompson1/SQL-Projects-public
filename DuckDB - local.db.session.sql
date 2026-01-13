-- copy my information_schena queries from mumeical docsz 
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;
-- DuckDB does not support NOLOCK hint; it uses MVCC for concurrency control.
-- The ISNULL function is replaced with COALESCE in DuckDB.
-- The syntax for JOINs and WHERE clauses remains largely the same in DuckDB.

-- get queries that return schema from duckdb:
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'   
ORDER BY table_name, ordinal_position;



