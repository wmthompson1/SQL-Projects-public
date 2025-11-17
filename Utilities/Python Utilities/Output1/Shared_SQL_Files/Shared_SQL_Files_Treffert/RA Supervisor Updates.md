# RA Supervisor Updates

```sql
use LIVESupplemental
go

select * from ResourceID_Assignments where resource_id in ('AUB-mask', 'AUB-oven1', 'AUB-ovenPrime', 'AUB-ovenTC', 'AUB-pri', 'AUB-sand', 'AUB-setup', 'AUB-tc', 'AUB-tube')
/*
update ResourceID_Assignments set lead_supervisor = 'Kelsey Morgan' where resource_id = 'AUB-mask'
update ResourceID_Assignments set lead_supervisor = 'Shane Hassman' where resource_id = 'AUB-oven1'
update ResourceID_Assignments set lead_supervisor = 'Shane Hassman' where resource_id = 'AUB-ovenPrime'
update ResourceID_Assignments set lead_supervisor = 'Jimmy Spears' where resource_id = 'AUB-ovenTC'
update ResourceID_Assignments set lead_supervisor = 'Shane Hassman' where resource_id = 'AUB-pri'
update ResourceID_Assignments set lead_supervisor = 'Jimmy Spears' where resource_id = 'AUB-sand'
update ResourceID_Assignments set lead_supervisor = 'Shane Hassman' where resource_id = 'AUB-setup'
update ResourceID_Assignments set lead_supervisor = 'Jimmy Spears' where resource_id = 'AUB-tc'
update ResourceID_Assignments set lead_supervisor = 'Mike Baker' where resource_id = 'AUB-tube'


*/

```