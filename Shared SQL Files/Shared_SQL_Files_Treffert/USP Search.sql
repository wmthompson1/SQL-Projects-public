-- Search in Stored Procedure Only
SELECT DISTINCT OBJECT_NAME(OBJECT_ID),
object_definition(OBJECT_ID)
FROM sys.Procedures
WHERE object_definition(OBJECT_ID) LIKE '%' + 'ResourceID_Assignments' + '%'
	or object_definition(OBJECT_ID) LIKE '%' + 'Resource_ID' + '%'
GO