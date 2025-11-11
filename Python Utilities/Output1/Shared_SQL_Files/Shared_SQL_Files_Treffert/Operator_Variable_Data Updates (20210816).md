# Operator_Variable_Data Updates (20210816)

```sql
USE LIVE
GO

SELECT * 
FROM OPERATION_TYPE
WHERE ID LIKE '%SKY%'

SELECT * FROM LIVESupplemental.dbo.operator_variable_data 
WHERE OPERATION_TYPE_ID LIKE '%SKY%'
```