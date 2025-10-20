exec('select  (act_material_cost+act_labor_cost+act_burden_cost+act_service_cost) as ttl_cost, act_material_cost, act_labor_cost, act_burden_cost, act_service_cost, 
transaction_date, create_date, from_wo_base_id, from_wo_lot_id, from_wo_split_id, to_wo_split_id
from ' + @DB + '.dbo.split_trans where from_wo_base_id = ''' + @WO + '''')
