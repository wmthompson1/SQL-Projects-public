# supervisor dataset update

```sql
use Datamart
go

select * from shop_resource WHERE ([STATUS] <> 'O' or [status] is null) 

select user_4 from shop_resource_site_view
WHERE ([STATUS] <> 'O' or [status] is null)
group by user_4

SELECT '_Blank' AS SupervisorName, '_Blank'AS SupervisorNameLabel
FROM SHOP_RESOURCE_SITE_VIEW
WHERE USER_4 = 'ARCHIVED'
AND ([STATUS] <> 'O' or [status] is null)
GROUP BY USER_4
UNION ALL
SELECT ISNULL(USER_4, '_Blank') AS SupervisorName, ISNULL(USER_4, '_Blank') AS SupervisorNameLabel
FROM SHOP_RESOURCE_SITE_VIEW
WHERE USER_4 IS NULL
AND ([STATUS] <> 'O' or [status] is null)
GROUP BY USER_4
UNION ALL
SELECT ISNULL(USER_4, '_Blank') , USER_4
FROM SHOP_RESOURCE_SITE_VIEW
WHERE USER_4 IS NOT NULL
AND ([STATUS] <> 'O' or [status] is null)
GROUP BY USER_4
```