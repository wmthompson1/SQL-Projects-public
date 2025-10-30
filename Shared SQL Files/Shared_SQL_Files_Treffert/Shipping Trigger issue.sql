use live
go

select * from demand_supply_link where demand_base_id = '443742'

select * from demand_supply_link where demand_base_id = '132950'

select * from inv_receipt_dist ird where ird.demand_supply_id = '443742'

select * from inventory_trans where part_id = '111a3210-602'  --transaction_id = '231330'

select * from inventory_trans where transaction_id = '231330'


/*
delete from demand_supply_link
where demand_base_id = :dfsORDER_ID
and demand_type in ('CO', 'CD')
and issued_qty = 0
and (supply_type = 'I' or (supply_type != 'I' and received_qty = 0))
and not exists (select ird.inv_trans_id from inv_receipt_dist ird where ird.demand_supply_id = id)
*/