# Negative Inventory Valuations

```sql
use live
go

select SUM(QTY) from inventory_trans where part_id = '143T5925-73' AND TYPE = 'I'
select SUM(QTY) from inventory_trans where part_id = '143T5925-73' AND TYPE = 'O'

select * from part_location where part_id = '143T5925-73'
--select * from part_site where part_id = '143T5925-73'
select * from part where id = '143T5925-73'

SELECT * FROM INVENTORY_TRANS WHERE PART_ID = '143T5925-73' AND QTY <> COSTED_QTY
```