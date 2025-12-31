-- Ground Truth SQL: Supplier Performance Queries
-- Source: Flask Manufacturing App (LangChain Semantic Layer)
-- Category: Template Category


-- Name: Sample 1 query Title
-- Description: Description 1 What this query does
SELECT 
    column1,
    column2
FROM table_name
join second_table ON table_name.id = second_table.fk_id
WHERE condition = 123;

-- Name: Another Sample 2 Query Title
-- Description: Description 2 What this query does
SELECT * 
FROM another_table
left table_name on another_table.ref_id = table_name.id
WHERE another_condition = 'value';
