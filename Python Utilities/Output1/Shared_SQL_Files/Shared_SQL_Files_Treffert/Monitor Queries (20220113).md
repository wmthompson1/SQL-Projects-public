# Monitor Queries (20220113)

```sql
USE LIVE
GO

update part set bur_gl_acct_id = 161 where purchased = 'y' and part.consumable = 'n' and (bur_gl_acct_id <> 161 or bur_gl_acct_id  is null)
update part set mat_gl_acct_id = 161 where part.purchased = 'y' and part.consumable = 'n' and (mat_gl_acct_id <> 161 or mat_gl_acct_id is null)
update part set ser_gl_acct_id = 162 where part.fabricated = 'y' and part.purchased = 'n' and (ser_gl_acct_id <> 162 or ser_gl_acct_id is null)
update part set mat_gl_acct_id = 162 where part.fabricated = 'y' and part.purchased = 'n' and (mat_gl_acct_id <> 162 or mat_gl_acct_id is null)
update part set lab_gl_acct_id = 162 where part.fabricated = 'y' and part.purchased = 'n' and (lab_gl_acct_id <> 162 or lab_gl_acct_id is null)
update part set bur_gl_acct_id = 162 where part.fabricated = 'y' and part.purchased = 'n' and (bur_gl_acct_id <> 162 or bur_gl_acct_id is null)

UPDATE OPERATION SET RUN = 0.0 FROM OPERATION WHERE RUN IS NULL 
UPDATE OPERATION SET RUN_HRS = 0.0 FROM OPERATION WHERE RUN_HRS IS NULL

DELETE SHIPPER_LINE
FROM SHIPPER_LINE SL 
INNER JOIN 
	SHIPPER S 
	ON SL.PACKLIST_ID = S.PACKLIST_ID
INNER JOIN  
	CUST_ORDER_LINE CL
	ON SL.CUST_ORDER_ID = CL.CUST_ORDER_ID
	AND SL.CUST_ORDER_LINE_NO = CL.LINE_NO
INNER JOIN 
	CUSTOMER_ORDER C
	ON CL.CUST_ORDER_ID = C.ID
WHERE SL.TRANSACTION_ID IS NULL 
	AND SL.shipped_qty = 0 
	AND SL.USER_SHIPPED_QTY = 0
	AND S.INVOICE_ID IS NULL
	AND S.CREATE_DATE > DATEADD(MM, -6, GETDATE())


UPDATE WORK_ORDER
SET POSTING_CANDIDATE = 'N'
WHERE [TYPE] in ('M', 'Q')
	AND POSTING_CANDIDATE = 'Y'

update labor_ticket
set POSTING_CANDIDATE = 'Y',
    act_burden_cost = cast((lt.HOURLY_COST * lt.HOURS_WORKED * 
	   (case
		  when lt.[type] = 'S' then srs.bur_percent_setup
		  when lt.[type] = 'R' then srs.bur_percent_run
	   end) / 100) as decimal (10,2)), BURDEN_PERCENT = case
		  when lt.[type] = 'S' then srs.bur_percent_setup
		  when lt.[type] = 'R' then srs.bur_percent_run
    end
from labor_ticket lt
inner join shop_resource_site srs
	on srs.resource_id = lt.resource_id
where lt.transaction_date >= '8/1/2017'
    and lt.workorder_type = 'W'		
    and lt.act_labor_cost > 0		
    and (lt.ACT_BURDEN_COST - cast((lt.HOURLY_COST * lt.HOURS_WORKED * 
		  (case
				when lt.[type] = 'S' then srs.bur_percent_setup
				when lt.[type] = 'R' then srs.bur_percent_run
			end) / 100) as decimal (10,2)
		  )
	   > 0.01
	   or lt.ACT_BURDEN_COST - cast((lt.HOURLY_COST * lt.HOURS_WORKED * 
		  (case
			 when lt.[type] = 'S' then srs.bur_percent_setup
			 when lt.[type] = 'R' then srs.bur_percent_run
		  end) / 100) as decimal (10,2)
		  )
	   < -(0.01)
	   )
	AND EXISTS(SELECT 1 FROM WORK_ORDER wo
		WHERE lt.WORKORDER_TYPE = wo.[TYPE]
		and lt.WORKORDER_BASE_ID = wo.base_id
		and lt.WORKORDER_LOT_ID = wo.lot_id
		and lt.WORKORDER_SPLIT_ID = wo.split_id
		and lt.WORKORDER_SUB_ID = wo.sub_id
		)

--> TOOLING
SELECT WO.PART_ID
	, P.[DESCRIPTION]
	, WO.BASE_ID
	, WO.LOT_ID
	, WO.SPLIT_ID
	, WO.SUB_ID
	, WO.[STATUS]
	, WO.DESIRED_WANT_DATE
	, WO.CLOSE_DATE
	, P.COMMODITY_CODE
	, P.TOOL_OR_FIXTURE
FROM WORK_ORDER WO
INNER JOIN PART P
	ON P.ID = WO.PART_ID
WHERE (P.COMMODITY_CODE = 'TOOLS'
	AND P.TOOL_OR_FIXTURE = 'Y'
	AND WO.STATUS IN ('C')
	AND WO.SUB_ID = '0'
	)

--> PR UPDATES
;WITH CTE_GO AS
(SELECT EC_ID, TASK_NO, SEQ_NO
FROM [LIVE].[dbo].[TASK]
WHERE USER_ID = 'TRACY'
AND [TYPE] = 'REQ'
AND [STATUS] NOT IN ('C', 'X')
)

UPDATE TASK
SET [STATUS] = 'P'
, [USER_ID] = 'TRACEY'
FROM TASK T
INNER JOIN CTE_GO CTE
ON T.EC_ID = CTE.EC_ID
AND T.TASK_NO = CTE.TASK_NO
AND T.SEQ_NO = CTE.SEQ_NO

--> SSRS issues
SELECT CAT.[PATH]
	, CAT.[NAME]
	, S.[DESCRIPTION]
	, JS.LAST_RUN_DATE
	, JS.LAST_RUN_TIME
	, LASTSTATUS 
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
	AND LEFT(LASTSTATUS, 19) <> 'Completed Streaming'
	AND LEFT(LASTSTATUS, 24) <> 'New Cache Refresh Plan'
	AND LEFT(LASTSTATUS, 17) <> 'New Subscription'
	AND LASTSTATUS <> 'Streaming model to Analysis Server'
	AND LEFT(LASTSTATUS, 5) NOT IN ('READY', 'DONE:')
	AND LASTSTATUS NOT IN ('Saving model to the catalog', 'Refreshing data', 'Thread was being aborted.')
	AND LEFT(S.[DESCRIPTION],9) <> 'Wallboard'
	AND PATH NOT LIKE '/Users Folders/SKILLS viviane/%'
	AND PATH NOT LIKE '/Unapproved Items/%'
	AND PATH NOT LIKE '/ITDA/Test/%'
	AND PATH NOT LIKE '/Datasets/zOLD_%'
	AND CAT.[NAME] NOT LIKE '%zOLD_%'

--> REPORTING ISSUES
SELECT [PATH]
	, [NAME]
	, [DESCRIPTION]
	, [HIDDEN]
FROM [REPORTSERVER].[DBO].CATALOG AS CAT 
WHERE [DESCRIPTION] = 'ERRORS'
	AND [TYPE] = '2'
	AND HIDDEN = 0
```