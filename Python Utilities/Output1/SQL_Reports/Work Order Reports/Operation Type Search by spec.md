# Operation Type Search by spec

```sql
SELECT 
    Ot.id as operation_type
    , ot.description
    , CAST(CAST(B.BITS AS varbinary(max)) AS nvarchar(max)) AS specs
from  OPERATION_TYPE ot
inner join dbo.OPER_TYPE_BINARY B
    ON ot.id = b.OPERATION_TYPE_ID
    and b.TYPE = 'D'
WHERE (ot.id LIKE @op_type + '%'
    or @op_type is null)
    AND (ot.DESCRIPTION like  '%'+ @description + '%'
        or @description is null)
    AND (CAST(CAST(B.BITS AS varbinary(max)) AS nvarchar(max)) LIKE '%'+ @specs + '%'
        or @specs is null)

```