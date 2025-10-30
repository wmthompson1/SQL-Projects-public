--S:\IS\admin stuff\Database Actions\As Needed Fixes\update_cert_user_fields.sql
select * from SHIPPER where packlist_id = '1029665'
order by user_9 desc

update SHIPPER 
set USER_1 = '22',
	USER_2 = '18',
	USER_3 = '4',
	USER_9 = '120273'
where packlist_id = '1029665' and ROWID = '788816'