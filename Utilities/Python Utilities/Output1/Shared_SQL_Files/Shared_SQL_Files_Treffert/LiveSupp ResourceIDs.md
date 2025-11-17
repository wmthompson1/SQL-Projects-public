# LiveSupp ResourceIDs

```sql
use LIVESupplemental
go
select 
	*
from 
	[dbo].[ResourceID_Assignments]
--where skills_type = 'E'
where Resource_Description <> 'DO NOT USE'
order by 
	Resource_ID



```