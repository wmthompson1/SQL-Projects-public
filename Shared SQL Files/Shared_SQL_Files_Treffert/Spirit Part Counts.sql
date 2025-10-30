use DataWarehouse
go

select * 
from shipper_line sl
inner join shipper s
on sl.packlist_id = s.PACKLIST_ID
inner join cust_order_line col
on sl.CUST_ORDER_ID = col.cust_order_id
and sl.CUST_ORDER_LINE_NO = col.LINE_NO
inner join customer_order co
on co.id = col.cust_order_id
where co.ORDER_DATE >= '4/1/2018'
and co.customer_id = 'SPIAER'
