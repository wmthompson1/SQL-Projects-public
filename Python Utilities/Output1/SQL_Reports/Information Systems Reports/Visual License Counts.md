# Visual License Counts

```sql
select 
    'WDGE' LICENSE,
    95 as maxcount, 
    CAST(COUNT(*) AS int) AS LICENSE_CNT, 
    95-CAST(COUNT(*) AS int) as REMAINING
from 
    (select 
        GETDATE() TODAY,
        PROGRAM_ID, 
        user_id, 
        LOGIN_TIME,
        LAST_ACTIVITY,
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 / 60 / 24 % 7 AS NVARCHAR(50)) + 'd '    + 
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 / 60 % 24  AS NVARCHAR(50)) + 'h '    + 
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 % 60 AS NVARCHAR(50))  + 'm ' elapsed_time ,
        machine_id
    from 
        LOGINS 
    where 
        PROGRAM_ID = 'VMBCLABR' 
    ) z
 union 
 select 
    'VMFG' LICENSE, 
    128 as maxcount,
    CAST(COUNT(*) AS int) AS LICENSE_CNT,
    128-CAST(COUNT(*) AS int) as REMAINING
from 
    (select 
        GETDATE() TODAY,
        PROGRAM_ID, 
        user_id, 
        LOGIN_TIME,
        LAST_ACTIVITY,
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 / 60 / 24 % 7 AS NVARCHAR(50)) + 'd '    + 
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 / 60 % 24  AS NVARCHAR(50)) + 'h '    + 
        CAST(DATEDIFF(second, LAST_ACTIVITY, getdate()) / 60 % 60 AS NVARCHAR(50))  + 'm ' elapsed_time ,
        machine_id
    from 
        LOGINS 
    where 
        PROGRAM_ID = 'MENU' 
    ) z

```