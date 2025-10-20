exec('select workorder_base_id BaseID, workorder_lot_id LotID, workorder_split_id SplitID, 
(material_amount+labor_amount+burden_amount+service_amount) as ttl_amount,
material_amount, labor_amount, burden_amount, service_amount, posting_date 
from ' + @DB + '.dbo.wip_balance where workorder_base_id = ''' + @WO + ''' and posting_date >= getdate()-90
and workorder_sub_id = 0')
