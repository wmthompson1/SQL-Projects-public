# Delete Resource_ID

```sql
select *
from shop_resource where ID = 'anm-cncrouter'

select *
from shop_resource_site where resource_ID = 'anm-cncrouter'

select *
from OPERATION_SCHED where resource_ID = 'anm-cncrouter'

select *
from operation where resource_ID = 'anm-cncrouter'

select *
from labor_ticket where resource_ID = 'anm-cncrouter'

select *
from OPERATION_TYPE where resource_ID = 'anm-cncrouter'

select *
from SHOP_VIEW where resource_ID = 'anm-cncrouter'


delete 
from OPERATION_SCHED where resource_ID = 'anm-cncrouter'

delete 
from shop_resource_site where resource_ID = 'anm-cncrouter'

delete 
from shop_resource where ID = 'anm-cncrouter'

delete
from livesupplemental.dbo.[ResourceID_Assignments] where resource_id = 'anm-cncrouter'
```