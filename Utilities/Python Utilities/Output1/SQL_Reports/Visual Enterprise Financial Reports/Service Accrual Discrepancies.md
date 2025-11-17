# Service Accrual Discrepancies

```sql
with cteBase as (
    select psd.transaction_id
        , psd.act_service_cost
        , isnull((select top 1 act_service_cost from purc_serv_detail where transaction_id = psd.transaction_id and dist_no < psd.dist_no order by dist_no desc),0) as PriorVal
        , d.amount_type
        , d.amount 
        , d.purc_order_id as PoID
        , d.BatchID 
        , d.dist_no 
        , sr.purc_order_id 
        , sr.workorder_base_id
        , sr.workorder_lot_id
        , sr.workorder_split_id
    from (select purc_order_id, isnull(batch_id,'UnPosted') as BatchID, dist_no, amount_type, amount 
          from purchase_dist 
          where year(posting_date) = @Yr and month(posting_date) = @Pd and gl_account_id = '210'
          ) d
    join purc_serv_detail psd on psd.purc_order_id = d.purc_order_id and psd.dist_no = d.dist_no
    join service_receipt sr on psd.transaction_id = sr.transaction_id 
) 
select *
    , isnull(PODistAmt,0)-Isnull(WODistAmt,0) as Delta
    , case when Pass = 'PO>WO'
           then (select distinct PoID + '; ' from cteBase where jobID = workorder_base_id + '/' + workorder_lot_id + '.' + workorder_split_id for xml path(''))
           else (select distinct Supply_base_id + '; ' from demand_supply_link where demand_base_id + '/' + demand_lot_id + '.' + demand_split_id = JobID 
                 and demand_type = 'OP' and supply_type = 'PO' and received_qty <> 0 for xml path(''))
           end as PO
from (
    select 'PO>WO' as Pass
        , b.Workorder_base_id + '/' + b.workorder_lot_id + '.' + b.workorder_split_id as JobID
        , sum(act_service_cost-PriorVal) as PODistAmt
        , avg(d.WODistAmt) as WODistAmt
    from cteBase b
    left join (select workorder_base_id
                    , workorder_lot_id
                    , workorder_split_id
                    , sum(case when amount_type = 'CR' then amount else amount *-1 end) as WODistAmt
               from wip_issue_dist where gl_account_id = '210' and year(posting_date) = @Yr and month(posting_date) = @Pd
               group by workorder_base_id, workorder_lot_id, workorder_split_id 
               ) d on b.workorder_base_id = d.workorder_base_id and b.workorder_lot_id = d.workorder_lot_id and b.workorder_split_id = d.workorder_split_id 
    group by b.workorder_base_id, b.workorder_lot_id, b.workorder_split_id 
    having sum(act_service_cost-PriorVal) != avg(isnull(d.WODistAmt,0))
    union all
    select 'WO>PO' as Pass
        , d.workorder_base_id + '/' + d.workorder_lot_id + '.' + d.workorder_split_id as JobID
        , b.POAmt
        , d.WODistAmt 
    from (select workorder_base_id
                    , workorder_lot_id
                    , workorder_split_id
                    , sum(case when amount_type = 'CR' then amount else amount *-1 end) as WODistAmt
               from wip_issue_dist where gl_account_id = '210' and year(posting_date) = @Yr and month(posting_date) = @Pd
               group by workorder_base_id, workorder_lot_id, workorder_split_id 
               ) d
    left join (select sum(act_service_cost-PriorVal) as POAmt
                    , workorder_base_id
                    , workorder_lot_id
                    , workorder_split_id 
                from cteBase 
                group by workorder_base_id
                    , workorder_lot_id
                    , workorder_split_id 
                ) b on d.workorder_base_id = b.workorder_base_id and d.workorder_lot_id = b.workorder_lot_id and d.workorder_split_id = b.workorder_split_id 
    where b.POAmt is null
)x order by jobID

```