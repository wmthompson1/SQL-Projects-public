use crunch0619
go

declare @baseid nvarchar(15) = '1517711';

with cte_base as (
select dtl.workorder_base_id
, dtl.workorder_lot_id
, dtl.workorder_split_id
, dtl.transaction_id
, dtl.dist_no
, dtl.act_service_cost
, isnull((select top 1 act_service_cost from wip_service_detail 
		  where transaction_id = dtl.transaction_id and dist_no < dtl.dist_no
		  order by dist_no desc),0) prior_dist
from wip_service_detail dtl
where workorder_base_id = @baseid
)

select sum(cte_base.act_service_cost) svc_cost
, sum(cte_base.prior_dist) prior_dist
, sum(cte_base.act_service_cost)-sum(cte_base.prior_dist) as post_amt
, dist.amount
, dist.amount_type
, cte_base.workorder_base_id
, cte_base.workorder_lot_id
, cte_base.WORKORDER_SPLIT_ID
, cte_base.dist_no
, dist.create_date
, dist.posting_date 
 from cte_base
 join wip_issue_dist dist 
	on cte_base.workorder_base_id = dist.workorder_base_id
	and cte_base.workorder_lot_id = dist.workorder_lot_id
	and cte_base.workorder_split_id = dist.workorder_split_id
	and cte_base.dist_no = dist.dist_no 
	and dist.gl_account_id = '210'
group by cte_base.workorder_base_id
, cte_base.workorder_lot_id
, cte_base.workorder_split_id
, cte_base.dist_no
, dist.amount
, dist.amount_type
, dist.create_date
, dist.posting_date 
having (sum(cte_base.act_service_cost)-sum(cte_base.prior_dist))- dist.amount <> 0
order by cte_base.workorder_base_id
, cte_base.workorder_lot_id
, cte_base.workorder_split_id
, cte_base.dist_no

select * from wip_service_detail where workorder_base_id = @baseid --and dist_no in (2,3,4) 
order by dist_no, transaction_id
select * from wip_issue_dist where workorder_base_id = @baseid --and gl_account_id = '210'

select * from PURC_SERV_DETAIL where transaction_id in ('49823', '51142', '51754', '51982')
select * from purchase_dist where purc_order_id in ('119924', '120611', '122827') and gl_account_id = '210'

/*
USE CRUNCH0619
GO

select top 50 * from RECEIVER_LINE where SERV_TRANS_ID in (19117, 19116, 20648, 20649) --<> 0
order by serv_trans_id desc

select * from PAYABLE_LINE where RECEIVER_ID in ('81431', '77627') order by  rowid
SELECT * FROM PURCHASE_ORDER WHERE ID = '53285'

select * from purchase_DIST where purc_order_id = '53285' and GL_ACCOUNT_ID in ('210', '205') order by rowid
select * from wip_issue_DIST where WORKORDER_BASE_ID = '1142751'  and GL_ACCOUNT_ID in ('210', '205') --and dist_no in (2,4) order by rowid
select * from PAYABLE_DIST where voucher_id = '105209' --and GL_ACCOUNT_ID in ('210', '205') order by rowid

select * from SERVICE_RECEIPT where transaction_id = '52475'

select * from SPLIT_TRANS where FROM_WO_BASE_ID = '1523909'

*/