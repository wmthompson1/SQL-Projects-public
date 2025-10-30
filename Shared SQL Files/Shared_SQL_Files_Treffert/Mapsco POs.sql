use live
go

select --*
po.VENDOR_ID, po.ID, po.TOTAL_AMT_ORDERED, po.CREATE_DATE, pol.LINE_NO, pol.PART_ID, pol.VENDOR_PART_ID, pol.SERVICE_ID, pol.TOTAL_AMT_ORDERED

--po.ID, po.VENDOR_ID, po.ORDER_DATE, po.DESIRED_RECV_DATE, po.BUYER, po.SHIPTO_ID, 
--pol.part_id, pol.user_order_qty, pol.order_qty, status
from purchase_order po
inner join purc_order_line pol
on pol.purc_order_id = po.id
where vendor_id like'%mapsco%'
and order_date >= '12/29/2017'
--and status not in ('C', 'X')
order by po.id

--select * from purc_order_line where purc_order_id = '106620'