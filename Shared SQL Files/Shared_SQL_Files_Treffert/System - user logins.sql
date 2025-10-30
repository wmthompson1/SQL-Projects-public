USE [LIVE]
go
select 'alter user [' + b.name + '] with login = [' + b.name + ']'
from .dbo.sysmembers a 
 join .dbo.sysusers b on a.memberuid = b.uid 
where b.islogin=1 and b.name <> 'dbo'




--The output will look like this, but will be very long with all users:

alter user [USHAR#] with login = [USHAR#]
alter user [JIMH#] with login = [JIMH#]
alter user [MARCP#] with login = [MARCP#]
alter user [ED#] with login = [ED#]
