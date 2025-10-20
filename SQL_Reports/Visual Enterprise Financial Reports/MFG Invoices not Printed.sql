Select a.INVOICE_ID, a.PACKLIST_ID, b.SHIPPED_DATE, b.CUST_ORDER_ID, d.NAME, c.CUSTOMER_ID
from SHIPPER_INVOICE a 
inner join SHIPPER b on a.PACKLIST_ID = b.PACKLIST_ID
inner join CUSTOMER_ORDER c on b.CUST_ORDER_ID = c.ID
inner join CUSTOMER d on c.CUSTOMER_ID = d.ID
where a.INVOICE_ID is null and b.SHIPPED_DATE >= @Date1 and b.SHIPPED_DATE <= @Date2
order by b.SHIPPED_DATE desc
