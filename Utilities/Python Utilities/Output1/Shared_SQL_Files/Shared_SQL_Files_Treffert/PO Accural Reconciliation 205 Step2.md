# PO Accural Reconciliation 205 Step2

```sql
use july19
go

select [PURC_ORDER_ID]	
, sum(case	
	when [AMOUNT_TYPE] = 'CR' then [AMOUNT]
	when [AMOUNT_TYPE] = 'DR' then [AMOUNT] * -1
	end)
from purchase_dist pd	
where posting_date between '2019-07-01' and '2019-07-31'
	and GL_ACCOUNT_ID = '205'
group by [PURC_ORDER_ID]	



--> step 2
select poid, sum(dist) as dist from (
	select d.voucher_id, 
	case when amount_type = 'DR' then amount else amount*-1 end as dist,
	isnull((select top 1 purc_order_id from payable_line where voucher_id = d.voucher_id 
			and purc_order_id is not null),'') as poid
	from payable_dist d
	where posting_date between '2019-07-01' and '2019-07-31' and gl_account_id = '205'
)q group by poid 
order by poid


select * from payable where voucher_id = '173296'
select * from payable_line where voucher_id = '173296'
select * from payable_dist where voucher_id = '173296' and gl_account_id = '205'

```