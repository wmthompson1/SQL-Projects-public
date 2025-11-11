# Blank Product Codes

```sql
use live
go

select --*,
	cb.user_id,
	c.id,
	co.ID as COID, 
	LINE_NO, 
	[STATUS],
	PART_ID, 
	MISC_REFERENCE, 
	PRODUCT_CODE, 
	co.SALESREP_ID, 
	co.ORDER_DATE, 
	isnull(col.DESIRED_SHIP_DATE, co.DESIRED_SHIP_DATE) as DESIRED_SHIP_DATE
from 
	cust_order_line col
inner join 
	customer_order co
	on co.id = col.cust_order_id
inner join 
	customer c
	on c.id = co.customer_id
LEFT OUTER JOIN 
	CUSTOMER_BOOKINGS cb
	ON cb.CUST_ORDER_ID = co.ID

where 
	co.[status] not in ('C', 'X')	
	and part_id is not null
	and product_code is null
	and col.total_shipped_qty = 0
--	and col.ORDER_QTY > col.total_shipped_qty
--	and co.id = '354241'

```