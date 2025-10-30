use live
go

select *
from shop_resource
where id like '%mylar%'
    or id like '%cargo%'
    or id like '%review%'
    or id like '%ass%'
    or id like '%mask%'
    or id like '%pm%'
    or id like '%insp%'


select *
from shop_resource_site
where resource_id like '%mylar%'
    or resource_id like '%cargo%'
    or resource_id like '%review%'
    or resource_id like '%ass%'
    or resource_id like '%mask%'
    or resource_id like '%pm%'
    or resource_id like '%insp%'

/*
update shop_resource
set skills_type = 'A',
--    AFC_GL_ACCT_ID = '6041',
    --AFB_GL_ACCT_ID = '6041.1',
    shift_1_capacity = 1,
    Schedule_Normally = 'Y'
where id = 'AUB-PM-Cargo'

update shop_resource_site 
set monitor_load = NULL,
    setup_cost_per_hr = 27.1,
    run_cost_per_hr = 27.1,
    bur_percent_setup = 103.51,
    bur_percent_run = 103.51,
    AFC_GL_ACCT_ID = NULL,
    AFB_GL_ACCT_ID = NULL,
    Schedule_type = NULL,
    Schedule_normally = NULL,
    auto_reporting = NULL,
    shift_1_capacity = NULL,
    shift_2_capacity = NULL,
    shift_3_capacity = NULL
where resource_id = 'ANM-Review'
*/


select * from LIVESupplemental.[dbo].[ResourceID_Assignments]
where resource_id like '%mylar%'
    or resource_id like '%cargo%'
    or resource_id like '%review%'
    or resource_id like '%ass%'
    or resource_id like '%mask%'
    or resource_id like '%pm%'
    or resource_id like '%insp%'

/*
use LIVESupplemental
go

INSERT INTO ResourceID_Assignments VALUES ('ANM-Review', 'Cargo Panels / Skyflex', 'Cargo Panels / Skyflex', 'Chris', 'E', 'N', 'Review work orders - North MFG', NULL, NULL, NULL, NULL, NULL, NULL, 8, 'Planning', 'Cargo Panels / Skyflex', 99, 3, NULL, 8,'Planning', 'Auburn North');
INSERT INTO ResourceID_Assignments VALUES ('ANM-assembly', 'Cargo Panels / Skyflex', 'Cargo Panels / Skyflex', 'Chris', 'E', 'N', 'Review work orders - North MFG', NULL, NULL, NULL, NULL, NULL, NULL, 8, 'Assembly', 'Cargo Panels / Skyflex', 99, 3, NULL, 8,'Planning', 'Auburn North');
INSERT INTO ResourceID_Assignments VALUES ('AUB-Mask-Cargo', 'AUB-Mask-Cargo', 'AUB-Mask-Cargo', NULL, 'A', 'N', 'Cargo Masking - North', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 99, 9, NULL, 9,NULL, 'Auburn North');
INSERT INTO ResourceID_Assignments VALUES ('AUB-Mylar-Cargo', 'AUB-Mylar-Cargo', 'AUB-Mylar-Cargo', NULL, 'A', 'N', 'Cargo Mylar Application - North', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 99, 9, NULL, 9,NULL, 'Auburn North');
INSERT INTO ResourceID_Assignments VALUES ('AUB-Insp-Cargo', 'AUB-Insp-Cargo', 'AUB-Insp-Cargo', NULL, 'A', 'N', 'Cargo Inspection - North', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 99, 9, NULL, 9,NULL, 'Auburn North');
INSERT INTO ResourceID_Assignments VALUES ('AUB-PM-Cargo', 'AUB-PM-Cargo', 'AUB-PM-Cargo', NULL, 'A', 'N', 'Cargo Part Mark - North', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 99, 9, NULL, 9,NULL, 'Auburn North');

*/