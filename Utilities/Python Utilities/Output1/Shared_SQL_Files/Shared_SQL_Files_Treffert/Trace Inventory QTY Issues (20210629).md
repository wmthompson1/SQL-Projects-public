# Trace Inventory QTY Issues (20210629)

```sql
select * from inventory_trans where part_id = '143T0033-10' order by transaction_id desc
select * from trace_inv_trans where part_id = '143T0033-10' and transaction_id in ('2970388', '2970387') order by transaction_id desc
select * from trace where part_id = '143T0033-10' and id in ('1280554/1/0', '1656108/1')

update trace_inv_trans
set qty = -12
where transaction_id = '2970388'
and trace_id = '1656108/1'

update trace_inv_trans
set qty = 12
where transaction_id = '2970387'
and trace_id = '1656108/1'

delete from trace_inv_trans where transaction_id = '2970388' and trace_id = '1280554/1/0'

update trace 
set out_qty = 26
where part_id = '143T0033-10' 
and id in ('1280554/1/0')

update trace 
set out_qty = 12
, in_qty = 12
where part_id = '143T0033-10' 
and id in ('1656108/1')
```