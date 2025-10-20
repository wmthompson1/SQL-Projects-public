exec('select base_id, lot_id, split_id, (act_material_cost+act_labor_cost+act_burden_cost+act_service_cost) as ttl_cost, act_material_cost, act_labor_cost, act_burden_cost, act_service_cost, 
status, close_date, posting_Candidate, desired_qty, received_qty
, ''' + @DB + ''' as dbxs
from ' + @DB + '.dbo.work_order where base_id = ''' + @WO + ''' and sub_id = 0')
