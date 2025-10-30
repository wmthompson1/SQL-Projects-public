select * from NEXT_NUMBER_GEN
 where table_name = 'JOURNAL_BATCH'

 -- get next batch number

select max(batch_id)  from JOURNAL 
/*
update n 
 set next_number = 30750
 from NEXT_NUMBER_GEN n
 where table_name = 'JOURNAL_BATCH'
 and next_number = 42
*/