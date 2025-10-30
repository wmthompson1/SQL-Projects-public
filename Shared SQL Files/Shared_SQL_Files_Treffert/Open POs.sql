use live
go

select 
po.ID, po.VENDOR_ID, po.ORDER_DATE, po.DESIRED_RECV_DATE, po.BUYER, po.SHIPTO_ID, 
pol.part_id, pol.user_order_qty, pol.order_qty, status
from purchase_order po
inner join purc_order_line pol
on pol.purc_order_id = po.id
where vendor_id like'%HERPRO%'
--and order_date >= '9/1/2015'
and status not in ('C', 'X')