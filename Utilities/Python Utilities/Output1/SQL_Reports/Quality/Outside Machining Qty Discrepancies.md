# Outside Machining Qty Discrepancies

```sql
with cteBase as (
select o.workorder_base_id + '/' + o.workorder_lot_id + case when o.workorder_split_id = '0' then '' else '.' + o.workorder_split_id end as JobID
    , o.status as OpStatus
    , w.status as WOStatus
    , w.ROWID
    , w.create_date as WOCreated
    , o.calc_end_qty as OpQty 
    , o.completed_qty as RcvdQty
    , o.workorder_sub_id as OpSubID
    , o.workorder_base_id as BaseID
    , o.workorder_lot_id as LotID
    , o.workorder_split_id as SplitID
    , o.workorder_sub_id as SubID
    , o.sequence_no as SeqNo
    , o.resource_id as ResourceID
    , (select top 1 sequence_no from operation (nolock) 
                 where workorder_type = o.workorder_type 
                    and workorder_base_id = o.workorder_base_id 
                    and workorder_lot_id = o.workorder_lot_id 
                    and workorder_split_id = o.workorder_split_id 
                    and workorder_sub_id = o.workorder_sub_id 
                    and sequence_no < o.sequence_no
                    order by sequence_no desc) as PriorSvcOp
    , (select top 1 resource_id from operation (nolock) 
                 where workorder_type = o.workorder_type 
                    and workorder_base_id = o.workorder_base_id 
                    and workorder_lot_id = o.workorder_lot_id 
                    and workorder_split_id = o.workorder_split_id 
                    and workorder_sub_id = o.workorder_sub_id 
                    and sequence_no > o.sequence_no
                    order by sequence_no) as InspResource
    , (select top 1 sequence_no from operation (nolock) 
                 where workorder_type = o.workorder_type 
                    and workorder_base_id = o.workorder_base_id 
                    and workorder_lot_id = o.workorder_lot_id 
                    and workorder_split_id = o.workorder_split_id 
                    and workorder_sub_id = o.workorder_sub_id 
                    and sequence_no > o.sequence_no
                    order by sequence_no) as NextOpSeqNo
    , (select top 1 completed_qty from operation (nolock) 
                 where workorder_type = o.workorder_type 
                    and workorder_base_id = o.workorder_base_id 
                    and workorder_lot_id = o.workorder_lot_id 
                    and workorder_split_id = o.workorder_split_id 
                    and workorder_sub_id = o.workorder_sub_id 
                    and sequence_no > o.sequence_no
                    order by sequence_no) as InspQty
from 
operation o (nolock)
join work_order w (nolock)
    on w.type = 'W'
    and o.workorder_type = w.type
    and o.workorder_base_id = w.base_id 
    and o.workorder_lot_id = w.lot_id 
    and o.workorder_split_id = w.split_id 
    and w.sub_id = 0 
    and (w.status in ('r','f','u') or (isnull(w.close_date,getdate()) > getdate()-182)) --reduces cycle time from 1 minute to 22 seconds)
where charindex('REC',o.resource_id) > 0 
    and o.completed_qty > 0
    and o.workorder_type = 'W' 
    and (select top 1 service_id from operation 
         where workorder_type = o.workorder_type 
                    and workorder_base_id = o.workorder_base_id 
                    and workorder_lot_id = o.workorder_lot_id 
                    and workorder_split_id = o.workorder_split_id 
                    and workorder_sub_id = o.workorder_sub_id 
                    and sequence_no < o.sequence_no
                    order by sequence_no desc) is not null
) 
select b.JobID
    , b.WOStatus
    , b.WOCreated
    , b.rowid 
    , b.RcvdQty
    , b.SeqNo
    , b.ResourceID
    , b.InspResource 
    , b.InspQty
    , pl.service_id as ServiceID
    , pl.purc_order_id + '/' + cast(pl.line_no as varchar) as PoLn    
    --, coalesce(ncm1.ncm_id, ncm2.ncm_id, ncm3.ncm_id) as NcmID
    --, coalesce(ncm1.status,ncm2.status,ncm3.status,'No NCM Found') as NcmStatus
    --, coalesce(ncm1.accepted,ncm2.accepted,ncm3.accepted) as AcceptedQty
    --, coalesce(ncm1.rejected,ncm2.rejected,ncm3.rejected) as RejectedQty
    , rl.receiver_id + '/' + cast(rl.line_no as varchar) as RcvrLn
    , rl.received_qty as RcvrQty
    , r.received_date
    , apl.voucher_id as VoucherID
    , coalesce(ncm1.ncm_id, ncm2.ncm_id, ncm3.ncm_id) as NcmTag
    , coalesce(cast(cast(ncm1.lot_size as decimal(14,0))as varchar),cast(cast(ncm2.lot_size as decimal(14,0))as varchar),cast(cast(ncm3.lot_size as decimal(14,0))as varchar)) + ' / ' +
        coalesce(cast(cast(ncm1.accepted as decimal(14,0))as varchar),cast(cast(ncm2.accepted as decimal(14,0))as varchar),cast(cast(ncm3.accepted as decimal(14,0))as varchar)) + ' / ' +
        coalesce(cast(cast(ncm1.rejected as decimal(14,0))as varchar),cast(cast(ncm2.rejected as decimal(14,0))as varchar),cast(cast(ncm3.rejected as decimal(14,0))as varchar)) as NcmQtys
from cteBase b
join demand_supply_link dsl (nolock) 
    on b.JobID = dsl.demand_base_id + '/' + dsl.demand_lot_id + case when dsl.demand_split_id = '0' then '' else '.' + dsl.demand_split_id end
    and b.OpSubID = dsl.demand_sub_id 
    and b.PriorSvcOp = dsl.demand_seq_no 
join purc_order_line pl (nolock)
    on dsl.supply_base_id = pl.purc_order_id 
    and dsl.supply_seq_no = pl.line_no
    and dsl.supply_type = 'PO'
    and dsl.demand_type = 'OP'
join receiver_line rl (nolock)
    on pl.purc_order_id = rl.purc_order_id 
    and pl.line_no = rl.purc_order_line_no
join receiver r (nolock) on rl.receiver_id = r.id 
    --and r.received_date >= getdate()-182 --doesn't improve processing time
    and not exists (select apl.rowid from [sql-lab-2].[live].[dbo].payable_line apl (nolock) 
                                 join [sql-lab-2].[live].[dbo].payable ap (nolock) 
                                    on apl.voucher_id = ap.voucher_id and ap.pay_status != 'X'
                    where receiver_id = rl.receiver_id and receiver_line_no = rl.line_no)
left join ([sql-lab-2].[live].[dbo].[payable_line] apl (nolock) 
            join [sql-lab-2].[live].[dbo].[payable] ap 
                on apl.voucher_id = ap.voucher_id and ap.pay_status != 'x') 
    on rl.receiver_id = apl.receiver_id and rl.line_no = apl.receiver_line_no
left join (vq_operation vo1 (nolock)
            join vq_nonconformance ncm1 (nolock) 
                on vo1.record_id = ncm1.operation_rec_id)
    on 'W~' + b.BaseID + '~' + b.LotID + '~' + b.SplitID + '~' + b.SubID + '~' + cast(b.SeqNo as varchar) = vo1.id 
left join (vq_operation vo2 (nolock)
            join vq_nonconformance ncm2 (nolock) 
                on vo2.record_id = ncm2.operation_rec_id)
    on 'W~' + b.BaseID + '~' + b.LotID + '~' + b.SplitID + '~' + b.SubID + '~' + cast(b.PriorSvcOp as varchar) = vo2.id 
left join (vq_operation vo3 (nolock)
            join vq_nonconformance ncm3 (nolock) 
                on vo3.record_id = ncm3.operation_rec_id)
    on 'W~' + b.BaseID + '~' + b.LotID + '~' + b.SplitID + '~' + b.SubID + '~' + cast(b.NextOpSeqNo as varchar) = vo3.id 
where InspQty < RcvdQty and InspQty <> 0 
and pl.purc_order_id is not null
--and coalesce(ncm1.ncm_id, ncm2.ncm_id, ncm3.ncm_id) is null
and apl.voucher_id is null
and InspResource in ('P2M1-IN-DIM-OM','P2M1-IN-CMM-OM')

```