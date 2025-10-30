select c.id
, c.salesrep_id
, cb.[user_ID]
, col.CUST_ORDER_ID 
, col.line_no
from cust_order_line col
inner join CUSTOMER_BOOKINGS cb
on col. CUST_ORDER_ID = cb.CUST_ORDER_ID
inner join customer_order co
on col.CUST_ORDER_ID = co.id
inner join CUSTOMER c
on co.CUSTOMER_ID = c.id
WHERE COALESCE(col.PART_ID, col.MISC_REFERENCE, col.SERVICE_CHARGE_ID, 'NOTHING') = 'NOTHING' 
	AND col.STATUS_EFF_DATE > '1/1/2018'
