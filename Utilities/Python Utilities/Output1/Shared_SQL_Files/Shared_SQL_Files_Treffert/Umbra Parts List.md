# Umbra Parts List

```sql
use live
go

select --dsl.*, 
--col.* 
	col.part_id, 
	MISC_REFERENCE, 
	col.UNIT_PRICE,
	--case
	--	when supply_base_id like '%r%' then 'Rework'
	--	else ''
	--end as Rework
	-- count(*)
	p.UNIT_PRICE,
	p.UNIT_MATERIAL_COST,
	p.UNIT_LABOR_COST,
	p.UNIT_burden_COST

from customer_order co
inner join cust_order_line col
on co.id = col.CUST_ORDER_ID
inner join DEMAND_SUPPLY_LINK dsl
on dsl.DEMAND_BASE_ID = col.CUST_ORDER_ID
and col.LINE_NO = demand_seq_no
inner join part_site p
on col.part_id = p.part_id
where CUSTOMER_ID = 'umbcus'
--and supply_base_id like '%r%'
--and unit_price = 0
--and part_id = '256W3724-5'

--group by col.part_id
--order by col.part_id

```