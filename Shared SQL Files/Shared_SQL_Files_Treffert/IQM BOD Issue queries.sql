use live   --> Visual
go

select * from COR_outBOX_ENTRY

select c_id,c_was_processed,c_created_date_time,cast(c_xml as xml) from COR_outBOX_ENTRY
where C_CREATED_DATE_TIME > '2019-06-01' order by C_CREATED_DATE_TIME desc

select * from COR_outbOX_HEADERS where c_header_value like 'W~1576300%'

select * from work_order where base_id like 'W~1576300%';
select * from operation where workorder_base_id like '%15763%';

select count(*) from work_order where create_date = '2019-06-07'

select * from soa_id_map where noun_id = 'Work Order' and sys_key_id like 'W~1576300%';


select * from COR_outbOX_HEADERS where c_header_key = 'BODId' and  
c_header_value like 'infor-nid:SKILLS_TENANT:SK01:Site~SK01:W~1576300%'

select * from operation where STATUS_EFF_DATE >= '2019-06-07' and STATUS_EFF_DATE <= '2019-06-08' and workorder_type = 'w' --workorder_base_id = '1576300' and 


select * from COR_outbOX_HEADERS where c_header_key = 'BODId' and  
c_header_value like 'infor-nid:SKILLS_TENANT:SK01:Site~SK01:W~1531762%'

select workorder_base_id,workorder_lot_Id,resource_id from operation where  workorder_type = 'w' and workorder_base_id like '1576300%'


use IQM_Baseline_App  --> IQM
go

select c_id,c_was_processed,c_created_date_time,cast(c_xml as xml) from COR_INBOX_ENTRY
where C_CREATED_DATE_TIME > '2019-06-13' order by C_CREATED_DATE_TIME desc

select * from COR_INBOX_HEADERS where c_header_key = 'BODId' and  
c_header_value like 'infor-nid:SKILLS_TENANT:SK01:Site~SK01:W~1576300%'


infor-nid:SKILLS_TENANT:SK01:Site~SK01:W~1577424~1~0~0:?ProductionOrder&verb=Sync

select * from COR_INBOX_HEADERS

select count(*) from COR_INBOX_ENTRY

select * from COR_INBOX_HEADERS where c_header_key = 'BODId' and  
c_header_value like 'infor-nid:SKILLS_TENANT:SK01:Site~SK01:W~1576937%'



use datawarehouse --> Datawarehouse
go

select * from vq_operation where id like 'W~%' and id not in
(select cast(workorder_type+'~'+workorder_base_id+'~'+workorder_lot_id+'~'+workorder_split_id+'~'+workorder_sub_id+'~'+cast(SEQUENCE_NO as nvarchar) as nvarchar)
from operation where workorder_type = 'W')
--13990