# Subscriptions IUpdates

```sql
SELECT 'EXEC MSDB.DBO.SP_START_JOB @job_name = ''' + CAST(J.NAME AS VARCHAR(40)) + '''' as [Exec]
	, CAT.[PATH]
	, CAT.[NAME]
	, S.[DESCRIPTION]
	, JS.LAST_RUN_DATE
	, JS.LAST_RUN_TIME
	, LASTSTATUS 
	, s.subscriptionid
FROM 
	MSDB.dbo.SYSJOBS J  
JOIN  
	MSDB.dbo.SYSJOBSTEPS JS 
	ON JS.JOB_ID = J.JOB_ID 
JOIN  
	[REPORTSERVER].dbo.[SUBSCRIPTIONS] S  
	ON JS.COMMAND LIKE '%' + CAST(S.SUBSCRIPTIONID AS VARCHAR(40)) + '%' 
JOIN 
	[REPORTSERVER].[DBO].CATALOG AS CAT 
	ON CAT.ITEMID = S.REPORT_OID 
WHERE   
	LEFT(LASTSTATUS, 12) <> 'MAIL SENT TO'
	AND LEFT(LASTSTATUS, 8) <> 'DISABLED'
	AND LEFT(LASTSTATUS, 23) <> 'CACHE REFRESH SUCCEEDED'
	AND LEFT(LASTSTATUS, 22) <> 'Completed Data Refresh'
	AND LEFT(LASTSTATUS, 24) <> 'New Cache Refresh Plan'
	AND LEFT(LASTSTATUS, 17) <> 'New Subscription'
	AND LEFT(LASTSTATUS, 5) NOT IN ('READY', 'DONE:')
	AND LASTSTATUS NOT IN ('Saving model to the catalog', 'Refreshing data', 'Thread was being aborted.')
	AND LEFT(S.[DESCRIPTION],9) <> 'Wallboard'
order by path



/*
use reportserver
go

-- list of valid usernames
select * from users 
where sid is not null  --> very important!!!
order by username

select u.username, count(*) from subscriptions s
INNER JOIN dbo.users u
	ON s.ownerid = u.userid
--WHERE OwnerID = 'CEAE80AF-3B5F-467A-9B8E-6E29855F2B08' 
group by u.username
order by u.username

--> create a temp table copy (just in case of problems)
select * into datawarehouse.zzzTest.tlt_subscriptions from subscriptions
--drop table datawarehouse.zzzTest.tlt_subscriptions 

-- when you want to change the owner of a specific subscription
UPDATE dbo.Subscriptions 
SET OwnerID = 'C6F74B49-C4BB-4781-934A-48823953829D'  -- skills\admin
WHERE OwnerID = 'AD33E7F8-FF5B-40BE-BD4C-0CBD0CF3E34D'  -- skills\traci
and subscriptionid = 'DA895F3E-58D0-4360-9696-D2917D53A73B'

-- when you want to change a specific owner of multiple subscriptions
UPDATE dbo.Subscriptions 
SET OwnerID = 'C6F74B49-C4BB-4781-934A-48823953829D'  -- skills\admin (with SID not null)
--select count(*) from dbo.Subscriptions
WHERE OwnerID = 'CEAE80AF-3B5F-467A-9B8E-6E29855F2B08'  -- skills\eric

-- executables from above
EXEC MSDB.DBO.SP_START_JOB @job_name = '3F3F8B76-E659-4E44-9E4C-CC91643A1715'
EXEC MSDB.DBO.SP_START_JOB @job_name = '50C6639D-EFE7-41A1-8ABD-7E054AE50C25'
EXEC MSDB.DBO.SP_START_JOB @job_name = 'FA7DCE18-43A3-4166-9AC3-FC9E951F70C1'
EXEC MSDB.DBO.SP_START_JOB @job_name = '57F61084-741D-4656-9492-B7EC01A8C852'
EXEC MSDB.DBO.SP_START_JOB @job_name = '0E848DDD-5CD5-47FC-8427-D965C4165D6F'
EXEC MSDB.DBO.SP_START_JOB @job_name = '5CDCB80B-EC7D-4A32-AB40-056AD4C5AD71'
EXEC MSDB.DBO.SP_START_JOB @job_name = '01A610BA-E173-4651-9720-E207A5E67CFD'
EXEC MSDB.DBO.SP_START_JOB @job_name = '7BCB3B49-A814-4DBC-81EA-1B3C0EFF4E95'
EXEC MSDB.DBO.SP_START_JOB @job_name = '05FF7A77-2839-4252-BB85-BC1E12E01109'
EXEC MSDB.DBO.SP_START_JOB @job_name = 'B43F2788-ED3E-444A-A885-E62BB9FD1926'
EXEC MSDB.DBO.SP_START_JOB @job_name = 'B141A45B-2F7B-41F8-B562-D445FE9D72C5'
EXEC MSDB.DBO.SP_START_JOB @job_name = '0DB948C0-D390-48F9-AF19-3BA80E73D717'
EXEC MSDB.DBO.SP_START_JOB @job_name = 'C6716A5E-DC61-4F86-939E-5CD88511F148'
EXEC MSDB.DBO.SP_START_JOB @job_name = '54E9C6CD-4F8A-4468-96EF-D8912437DF45'
EXEC MSDB.DBO.SP_START_JOB @job_name = '2DE27C0E-304D-4E56-B35C-D421ECC0F92D'
EXEC MSDB.DBO.SP_START_JOB @job_name = '67CE69B5-142F-40E7-8E44-12C14B141C97'


*/
```