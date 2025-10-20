exec('
select ''TxBySplit'' as Qry, ''MatlIssue'' as sub, workorder_split_id, class, type, sum(case when type = ''I'' then act_material_cost else act_material_cost*-1 end) as matl,
    sum(case when type = ''I'' then act_labor_cost else act_labor_cost*-1 end)  as labr,
    sum(case when type = ''I'' then act_burden_cost else act_burden_cost*-1 end) as burd,
    sum(case when type = ''I'' then act_service_cost else act_service_cost*-1 end) as serv
from ' + @DB + '.dbo.inventory_trans where workorder_base_id = ''' + @WO + '''
group by workorder_split_id, class, type
union all
select ''TxBySplit'' as Qry, ''LaborTickets'' as Cat, workorder_split_id, null, null, null, sum(act_labor_cost) as labr, sum(act_burden_cost), null
from ' + @DB + '.dbo.labor_ticket where workorder_base_id = ''' + @WO + '''
group by workorder_split_id
union all
select ''TxBySplit'' as Qry, ''OP Recpt'' as Cat, workorder_split_id, null, null, null, null, null, sum(act_service_cost)
from ' + @DB + '.dbo.service_receipt where workorder_base_id = ''' + @WO + '''
group by workorder_split_id 
union all 
select ''TxBySplit'' as Qry, ''Payable'' as Cat, workorder_split_id, null, null, 
sum(case when cost_category = ''M'' then amount else 0 end), null, null, 
sum(case when cost_category = ''S'' then amount else 0 end) 
from ' + @DB + '.dbo.payable_line where workorder_base_id = ''' + @WO + '''
group by workorder_split_id ')
