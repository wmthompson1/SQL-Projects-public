use LIVESupplemental
go


select location, ra.resource_id
from wallboard_groups wg
right outer join 
    [dbo].[ResourceID_Assignments] ra
	   on ra.resource_id = wg.resource_id
where wg.resource_id is null 
  and resource_description not like '%do not use%'


insert into wallboard_groups 
select 
    case
	   when location = 'Auburn North' then 'Aub-North'
	   when location = 'Auburn South' then 'Aub-South'
	   else location
    end as location, 
    '99', 'no location', 'no location', ra.resource_id, NULL, NULL, NULL, NULL, NULL
from wallboard_groups wg
right outer join 
    [dbo].[ResourceID_Assignments] ra
	   on ra.resource_id = wg.resource_id
where wg.resource_id is null 
  and resource_description not like '%do not use%'


select *
from wallboard_groups wg

/*
update wallboard_groups
set Business_Stream = 'FIN'

update wallboard_groups
set Business_Stream = 'MFG'
where site = 'Aub-South'
  or resource_id like 'ANM-%'

update wallboard_groups
set NUMBER_SEQUENCE = '01',
    WALLBOARD_GROUP = 'CNCFladder',
    GROUP_SORT = '01-CNCFladder'
where resource_id in ('ANM-fladderburr', 'ANM-countersink', 'ANM-cncrouter3', 'ANM-cncrouter4')

update wallboard_groups
set NUMBER_SEQUENCE = '05',
    WALLBOARD_GROUP = 'Masking',
    GROUP_SORT = '05-Masking'
where resource_id = 'AUB-Mask-Cargo'

update wallboard_groups
set NUMBER_SEQUENCE = '09',
    WALLBOARD_GROUP = 'Final Inspection',
    GROUP_SORT = '09-Final Inspection'
where resource_id = 'AUB-Insp-Cargo'

update wallboard_groups
set NUMBER_SEQUENCE = '10',
    WALLBOARD_GROUP = 'no location',
    GROUP_SORT = '10-no location'
where resource_id = 'AUB-PM-Cargo'

*/


