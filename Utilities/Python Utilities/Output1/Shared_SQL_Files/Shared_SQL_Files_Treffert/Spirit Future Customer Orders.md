# Spirit Future Customer Orders

```sql
use DataWarehouse
go

select *
from cust_order_line col
inner join customer_order co
on col.CUST_ORDER_ID = co.id
where co.CUSTOMER_ID = 'spiaer'
and coalesce(col.DESIRED_SHIP_DATE, co.desired_ship_date) > getdate()

```