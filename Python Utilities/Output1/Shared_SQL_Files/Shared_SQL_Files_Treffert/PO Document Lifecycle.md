# PO Document Lifecycle

```sql
with cteBase as (
select pl.purc_order_id as PoID
	, pl.line_no as PoLn
	, pl.part_id as PartID
	, pl.service_id as ServiceID
	, coalesce(p.description,pl.user_1) as Description
	, s.description as serv_desc
	, cast(cast(cast(plb.bits as varbinary(4000)) as nvarchar(4000)) as varchar(4000)) as ExtDescription
	, pl.vendor_part_id as VendorPN
	, pl.mfg_name as MfgName
	, pl.mfg_part_id as MfgPartID
	, wo.base_id + '/' + wo.lot_id + case when wo.split_id = '0' then '' else '.' + cast(wo.split_id as varchar) end as JobID
	, wo.desired_want_date as JobWantDate
	, dsl.demand_seq_no as OpNo
	, dsl.demand_sub_id as OpSub
	, (select top 1 so.status from operation so (nolock) join shop_resource sr (nolock) on so.resource_id = sr.id and charindex('receiving',sr.description)=0 
		where so.workorder_type = wo.type and so.workorder_base_id = dsl.demand_base_id 
		and so.workorder_lot_id = dsl.demand_lot_id and so.workorder_split_id = dsl.demand_split_id and so.workorder_sub_id = dsl.demand_sub_id 
		and so.sequence_no > dsl.demand_seq_no order by so.sequence_no) as NextOpStatus
	, (select top 1 sr.description from operation so (nolock) join shop_resource sr (nolock) on so.resource_id = sr.id and charindex('receiving',sr.description)=0 
		where so.workorder_type = wo.type and so.workorder_base_id = dsl.demand_base_id 
		and so.workorder_lot_id = dsl.demand_lot_id and so.workorder_split_id = dsl.demand_split_id and so.workorder_sub_id = dsl.demand_sub_id 
		and so.sequence_no > dsl.demand_seq_no order by so.sequence_no) as NextOpResDesc
	, case when dsl.DEMAND_NO = 0 then null else demand_no end as PcNo
	, r.received_date as RecvrDate
	, rl.receiver_id as RecvrID
	, rl.line_no as RecvrLine
	, rl.user_received_qty 
	, pl.gl_expense_acct_id + ' (' + a.description + ')' as gl_expense_acct_id
	, rl.inspect_qty
	, (rl.unit_price * rl.user_received_qty) + rl.fixed_charge as RecvAmount
	, case when (pl.unit_price * rl.user_received_qty) + pl.fixed_charge < pl.minimum_charge
		   then pl.minimum_charge
		   else (pl.unit_price * rl.user_received_qty) + pl.fixed_charge
		   end as PORcvAmount
	, po.vendor_id as VendorID
	, v.name as VendorName
	, apl.voucher_id as VoucherID
	, ap.invoice_id as InvoiceID
	, ap.invoice_date as InvoiceDate 
	, cd.check_no as CheckNo
	, cd.check_date as CheckDate
	, cdl.amount as VoucherPaidAmt
	, cd.amount as CheckAmount
	--, case when isnull(pr.status,'-') in ('O','V') then 'Y' else 'N' end as RfqApproved
	, pr.id PurcReqID
from purc_order_line pl (nolock)
join purchase_order po (nolock) on pl.purc_order_id = po.id 
join vendor v (nolock) on po.vendor_id = v.id 
left join part p (nolock) on pl.part_id = p.id 
left join service s (nolock) on pl.service_id = s.id 
left join purc_line_binary plb (nolock) on pl.purc_order_id = plb.purc_order_id and pl.line_no = plb.purc_order_line_no 
left join demand_supply_link (nolock) dsl on pl.purc_order_id = dsl.supply_base_id and pl.line_no = dsl.supply_seq_no and dsl.supply_type = 'PO' and dsl.demand_type in ('OP','RQ')
left join work_order (nolock) wo on dsl.demand_base_id = wo.base_id and dsl.demand_lot_id = wo.lot_id and dsl.demand_split_id = wo.split_id and wo.sub_id = 0 and wo.type = 'W'
left join receiver_line rl (nolock) on pl.purc_order_id = rl.purc_order_id and pl.line_no = rl.purc_order_line_no
left join inventory_trans it (nolock) on rl.transaction_id = it.transaction_id 
left join service_receipt sr (nolock) on rl.serv_trans_id = sr.transaction_id 
left join receiver r (nolock) on rl.receiver_id = r.id
left join account a (nolock) on pl.gl_expense_acct_id = a.id 
left join payable_line apl (nolock) on rl.receiver_id = apl.receiver_id and rl.line_no = apl.receiver_line_no		
left join payable ap (nolock) on apl.voucher_id = ap.voucher_id 
left join cash_disburse_line cdl (nolock) on apl.voucher_id = cdl.voucher_id 
left join cash_disbursement cd (nolock) on cdl.bank_account_id = cd.bank_account_id and cdl.control_no = cd.control_no 
left join purc_order_req prl (nolock) on pl.purc_order_id = prl.purc_ord_id and pl.line_no = prl.purc_ord_line_no 
left join purc_requisition pr (nolock) on prl.purc_req_id = pr.id 

where pl.purc_order_id = @PO 
), 
cteTask as (
select t.ec_id
	, @PO as Purc_ord_id 
	, case when t.sub_type = 'A2' then 1 else 0 end as Appv
	, case when t.sub_type = 'A2' and t.completed_date is not null then 1 else 0 end as AppvComp
	, case when t.sub_type = 'A3' then 1 else 0 end as AppvEl1 
	, case when t.sub_type = 'A3' and t.completed_date is not null then 1 else 0 end as AppvEl1Comp
	, case when t.sub_type = 'A4' then 1 else 0 end as AppvEl2
	, case when t.sub_type = 'A4' and t.completed_date is not null then 1 else 0 end as AppvEl2Comp
from task t 
join (select distinct purc_req_id from purc_order_req where purc_ord_id = @PO) l on t.ec_id = l.purc_req_id
where t.type = 'REQ' and t.sub_type not in ('A1','H','AT') 
), 
cteTaskSumm as (
select ec_id
	, purc_ord_id 
	, sum(appv) as Appv
	, sum(AppvComp) as AppvCom
	, sum(AppvEl1) as AppvEl1
	, sum(AppvEl1Comp) as AppvEl1Comp
	, sum(appvEl2) as AppvEl2
	, sum(appvEl2Comp) as AppvEl2Comp
from cteTask 
group by ec_id, purc_ord_id 
)
select b.*
	, case when isnull(inspect_qty,0) > 0 then 'Yes'
		   when RecvrDate is not null and ServiceID is not null 
				and (charindex('Insp',NextOpResDesc)>0 or charindex('Receiv',NextOpResDesc)>0) 
				and NextOpStatus in ('F','R') then 'Yes' 
		   else '' end as Inspect
	, case when s.AppvEl2 > 0 and AppvEl2Comp > 0 then 'Y'
		   when s.AppvEl2 > 0 and AppvEl2Comp = 0 then 'N'
		   when s.AppvEl1 > 0 and AppvEl1Comp > 0 then 'Y'
		   when s.AppvEl1 > 0 and AppvEl1Comp = 0 then 'N'
		   when s.AppvCom > 0 and AppvEl2 = 0 and AppvEl1Comp = 0 then 'Y'
		   else 'N' end as RfqApproved
from cteBase b 
--> tt20210209: updated for not Req POs
LEFT OUTER join cteTaskSumm s on b.PoID = s.purc_ord_id
```