-- File path: Shared SQL Files/Shared_SQL_Files_Treffert/PO Accural Reconciliation 205 Step1.sql

--> step1
use july19
go

select [PURC_ORDER_ID]
, sum(case
	when [AMOUNT_TYPE] = 'CR' then [AMOUNT]
	when [AMOUNT_TYPE] = 'DR' then [AMOUNT] * -1
	end)
from purchase_dist pd
where posting_date = '7/31/2019'
	and GL_ACCOUNT_ID = '205'
group by [PURC_ORDER_ID]

--select * from purchase_dist where purc_order_id = 'B-2019PACWEL' and gl_account_id = '205' and posting_date = '7/31/2019'
--select * from payable_line where purc_order_id = '118367' --and gl_account_id = '205' and posting_date = '7/31/2019'

select voucher_id, count(*) 
from (select pl.[VOUCHER_ID]
	, [PURC_ORDER_ID]
from payable_line pl
inner join payable p
	on pl.voucher_id = p.voucher_id
where posting_date >= '7/1/2019' and pl.purc_order_id is not null
group by pl.[VOUCHER_ID]
	, [PURC_ORDER_ID]
)q 
group by voucher_id
having count(*) > 0
--> check on number of POs per voucher.  easier if all 1 to 1 relationship

--select * from payable_line where voucher_id = '206124'
--select * from payable_dist where voucher_id = '206124' and gl_account_id = '205'