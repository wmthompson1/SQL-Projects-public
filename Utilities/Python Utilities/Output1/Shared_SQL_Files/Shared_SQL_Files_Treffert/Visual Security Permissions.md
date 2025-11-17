# Visual Security Permissions

```sql
use live
go

/*
KB1525341

select 
a.name 
from 
dbo.sysuserauth a, dbo.sysuserauth b 
where
a.name not like 'DB[_]%' 
and a.name not in ( 'SYSADM', 'SYSREP', 'SYSSQL', 'EIS', 'SYS', 'DBO', 'GUEST', 'PUBLIC', 'SYSTEM', 'DBSNMP' ) 
and a.name not like '%#' 
and b.name like '%#' and substring(a.name, 1, 7) || '#' = b.name 
order by 1 into :sUSER_ID

2.
select u.permission, u.profile_string, u.program_component
from USER_PGM_AUTHORITY u
where 
	u.user_id = :sUSER_ID
	and u.program_id = :sMODULE_ID
	and u.program_component = :sCOMPONENT
into :sPERMISSION, :sPROFILE, :sCOMPONENT

2a.
select a.field_description, a.field_id
from APPLICATION_FIELDS a
where 
	a.program_id = :sMODULE_ID
into :sFIELD, :sFIELD_ID 

 Mauricio Rodriguez: 2b.
select u.permission
from USER_FLD_AUTHORITY u
where u.program_field = :sFIELD_ID
and u.program_id = :sMODULE_ID
and u.user_id = :sUSER_ID
into :sPERMISSION 

 Mauricio Rodriguez: 3.
select menu_string from APPLICATION
where program_id = :sMODULE_ID 
into :sMODULE_NAME 

 Mauricio Rodriguez: 4.
select program_id from application 
where
	module in ('V','F','Q','T','C','O','N','A')
	and program_id not like '.%' into :sMODULE_ID 

 Mauricio Rodriguez: 5.
select group_id from APPLICATION_LINK
where 
	program_id = :sMODULE_ID into :sGROUP_ID 


USER_PGM_AUTHORITY
ROWID, USER_ID, PROGRAM_ID, PROGRAM_COMPONENT, PERMISSION, PROFILE_STRING

APPLICATION_FIELDS
ROWID, PROGRAM_ID, FIELD_ID, FIELD_DESCRIPTION

USER_FLD_AUTHORITY
ROWID, USER_ID, PROGRAM_ID, PROGRAM_FIELD, PERMISSION

APPLICATION
ROWID, PROGRAM_ID, LANGUAGE_ID, MENU_STRING, TYPE, CMD_LINE_ARGS, MODULE

APPLICATION_LINK
ROWID, GROUP_ID, GROUP_SEQ_NO, PROGRAM_ID, LANGUAGE_ID, ACCELERATOR

*/


select * from USER_PGM_AUTHORITY

select * from APPLICATION_FIELDS

--select * from USER_FLD_AUTHORITY

select * from [APPLICATION]

select * from APPLICATION_LINK


select * 
from 
	USER_PGM_AUTHORITY u
--left outer join 
--	APPLICATION_FIELDS a1
--	on u.PROGRAM_ID = a1.PROGRAM_ID
--left outer join 
--	[APPLICATION] a2
--	on u.PROGRAM_ID = a2.PROGRAM_ID
--left outer join 
--	APPLICATION_LINK a3
--	on u.PROGRAM_ID = a3.PROGRAM_ID

where program_id like 'lmc%'
--[user_id] = 'tracit'
order by permission

```