select co.CUSTOMER_ID 
	, co.id
, line_no
--, co.DESIRED_SHIP_DATE
, isnull(col.DESIRED_SHIP_DATE, co.DESIRED_SHIP_DATE) ship_date
from customer_order co
inner join cust_order_line col
on co.id = col.CUST_ORDER_ID

where CUSTOMER_ID in ('GLOMAC', 'KURMAN','PNJMAC') and co.status not in ('c', 'x')
order by co.id
	, col.line_no