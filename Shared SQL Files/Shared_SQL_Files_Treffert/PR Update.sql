use live
go

declare @reqid nvarchar(5) = '9793'

select * from PURC_ORDER_REQ where PURC_REQ_ID in (@reqid)

select * from PURC_REQUISITION where ID in (@reqid, '9738')

SELECT * FROM [PURC_GROUP_USER] WHERE PURC_REQ_ID in (@reqid)
--select * from task where type = 'req' and ec_id = '9738'
select * from task where type = 'req' and ec_id = @reqid

/*
update [PURC_GROUP_USER]
set user_signoff = 'Y'
where [PURC_REQ_ID] in ('9793')
and group_type = 'A2'

update task
--set [status] = 'P'
--, COMPLETED_DATE = NULL
set [status] = 'C'
, COMPLETED_DATE = getdate()
where type = 'REQ'
AND TASK_NO = '9447'
AND SEQ_NO = 2

update PURC_REQUISITION
--set [status] = 'I'
--, APP2_DATE = NULL
set [status] = 'V'
, APP2_DATE = getdate()
where ID in ('9793')

*/