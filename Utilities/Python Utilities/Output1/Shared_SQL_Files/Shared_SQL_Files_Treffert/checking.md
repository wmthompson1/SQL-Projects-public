# checking

```sql
use live
go

select *
from labor_ticket lt
where posting_candidate = 'y'
and transaction_date >= '9/1/2016'
order by create_date


select
    co.create_date, 
    co.customer_id,
    co.id,
    col.line_no,
    col.part_id, 
    col.order_qty,
    co.order_date,
    co.desired_ship_date,
    'Yes' as DeliverReport
from cust_order_line col
inner join customer_order co
on col.cust_order_id = co.id
where col.part_id in ('112U5885-45', '112W2820-3', '112W2820-59', '112W5130-2415', '112W8777-5', '115W3672-3', '140U5607-179', '140W9013-3080020', '140W9013-3080050', '140W9013-4760063', '140W9602-601', '212W1361-10', '214U2263-657', '232A1705-6', '232T2130-73B', '233A8380-16', '272T0237-1', '272W1511-5', '287T4150-567', '341T0026-2', '413U8212-41', '421W1182-7', '421W1282-28B', '421W1282-29B', '422W1143-3A', '422W1221-44B', '422W1221-79B', '422W1221-95B', '422W1222-137B', '436W5510-207', '436W5510-208', '436W5510-211', '439W3268-293', '449W1310-179B', '453W2012-300', '479W1101-108', '65B22652-923', 'BACC50AK2P', 'FS99025-6X24A', 'FS99050-6X22.5B', 'FS99063-6X22.5B', 'FS99090-6X22.5B', 'TS99100-6X21A', '866Z9008-1')
and DateDiff(n, co.create_date, getdate()) <= 1000
```