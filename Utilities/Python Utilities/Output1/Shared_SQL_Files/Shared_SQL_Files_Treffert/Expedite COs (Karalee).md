# Expedite COs (Karalee)

```sql
use DataWarehouse
go

select co.CUSTOMER_ID
       , co.ID
       , co.[ORDER_DATE]
       , co.[DESIRED_SHIP_DATE]
       , case
              when col.cust_ORDER_ID is not null then 'Expedite'
              else ''
       end as Expedite
       , datediff(d, co.Order_Date, co.[DESIRED_SHIP_DATE]) as [TrueTurnTime]
       , sum(col.unit_price)
from customer_order co
left outer join cust_ORDER_LINE col
       on co.id = col.cust_ORDER_ID
       and col.misc_reference like 'Exped%'
where order_date >= '1/1/2018'
group by co.CUSTOMER_ID
       , co.ID
       , co.[ORDER_DATE]
       , co.[DESIRED_SHIP_DATE]
       , case
              when col.cust_ORDER_ID is not null then 'Expedite'
              else ''
       end
order by co.CUSTOMER_ID
       , co.ID
       , co.[ORDER_DATE]
       , co.[DESIRED_SHIP_DATE]
       , case
              when col.cust_ORDER_ID is not null then 'Expedite'
              else ''
       end

```