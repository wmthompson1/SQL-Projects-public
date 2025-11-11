# WIP Reconciling Issues List

```sql
exec('
with cteBase as (
    select w.base_id BaseID
         , w.lot_id LotID
         , w.split_id SplitID
         , w.part_id PartID
         , w.desired_qty DesiredQty
         , w.received_qty ReceivedQty
         , (w.desired_qty - w.received_qty) as OpenQty
         , isnull((select sum(desired_qty)-sum(received_qty) 
                   from ' + @db + '.dbo.co_product where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id
                   and workorder_split_id = w.split_id and workorder_sub_id = w.sub_id),0) as OpenCPQ
         , w.desired_want_date
         , w.create_date
         , w.act_material_cost+w.act_labor_cost+w.act_burden_cost+w.act_service_cost as JobTotalCost
         --mnaterial detail
         , isnull((select sum((act_material_cost+act_labor_cost+act_burden_cost+act_service_cost)*case when type = ''O'' then 1 else -1 end)
                   from ' + @db + '.dbo.inventory_trans 
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id
                   and class = ''i''),0)
            + --labor detail
           isnull((select sum(act_labor_cost+act_burden_cost) 
                   from ' + @db + '.dbo.labor_ticket
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id),0)
            + --service detail 
           isnull((select sum(act_service_cost)
                   from ' + @db + '.dbo.service_receipt
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id),0)
            + --payable detail 
           isnull((select sum(amount)
                   from ' + @db + '.dbo.payable_line 
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id),0)
            - --splits detail (out)
           isnull((select sum(act_material_cost+act_labor_cost+act_burden_cost+act_service_cost)
                   from ' + @db + '.dbo.split_trans 
                   where from_wo_type = w.type and from_wo_base_id = w.base_id and from_wo_lot_id = w.lot_id and from_wo_split_id = w.split_id),0)
            + --splits detail (in)
           isnull((select sum(act_material_cost+act_labor_cost+act_burden_cost+act_service_cost)
                   from ' + @db + '.dbo.split_trans 
                   where to_wo_type = w.type and to_wo_base_id = w.base_id and to_wo_lot_id = w.lot_id and to_wo_split_id = w.split_id),0)
           as DetailTotalCost
         , isnull((select sum(case when amount_type = ''DR'' then amount else amount * -1 end)
                   from ' + @db + '.dbo.wip_issue_dist
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id
                   and gl_account_id in (''163'',''166'') and entry_no = 0),0) 
           as WipIssueDist
         , isnull((select sum((act_material_cost+act_labor_cost+act_burden_cost+act_service_cost)*case when type = ''I'' then 1 else -1 end)
                   from ' + @db + '.dbo.inventory_trans 
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id
                   and class = ''r''),0) 
           as DetailReceiptCost
         , isnull((select sum(case when amount_type = ''CR'' then amount else amount * -1 end)
                   from ' + @db + '.dbo.wip_receipt_dist
                   where workorder_type = w.type and workorder_base_id = w.base_id and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id
                   and gl_account_id in (''163'',''166'')),0) as WipReceiptDist
    from ' + @db + '.dbo.work_order w 
    where w.status in (''c'',''f'',''r'',''u'')
    and w.sub_id = ''0'' and w.type = ''W''
    and (
            (w.desired_qty = 0 and w.received_qty = 0 and (w.act_material_cost+w.act_labor_cost+w.act_burden_cost+w.act_service_cost) > 0)
            or 
            (w.desired_qty > w.received_qty and (w.act_material_cost+w.act_labor_cost+w.act_burden_cost+w.act_service_cost) > 0)
            or 
            (exists (select 1 from ' + @db + '.dbo.co_product where workorder_type = w.type and workorder_base_id = w.base_id
                        and workorder_lot_id = w.lot_id and workorder_split_id = w.split_id and workorder_sub_id = w.sub_id
                        and line_status = ''A'' and desired_qty > received_qty)
                    and (w.act_material_cost+w.act_labor_cost+w.act_burden_cost+w.act_service_cost)>0)
            )
        )
, sub as (
    select 
        *
        , WipIssueDist - DetailTotalCost as IssueDiscrepancy
        , WipReceiptDist - DetailReceiptCost as ReceiptDiscrepancy
        , DetailTotalCost - DetailReceiptCost as MfgBalance
        , WipIssueDist - WipReceiptDist as WipDistBalance
        , isnull((select sum(material_amount+labor_amount+burden_amount+service_amount)
                  from ' + @db + '.dbo.wip_balance
                  where workorder_type = ''w'' and workorder_base_id = c.BaseID and workorder_lot_id = c.LotID and workorder_split_id = c.SplitID
                  and posting_date = ''' + @PostingDate + '''),0) as FinWipBalance
        , ''' + @db + ''' as dbx
    from cteBase c
)
select ''Core'' Qry, *, 
    (FinWipBalance-MfgBalance-IssueDiscrepancy+ReceiptDiscrepancy) as WipBalRecalc
from sub s 
where 
    (
        IssueDiscrepancy <> 0
        or 
        ReceiptDiscrepancy <> 0
        or 
        MfgBalance <> FinWipBalance
        or 
        MfgBalance <> WipDistBalance
        or 
        WipDistBalance <> FinWipBalance
    ) ')

```