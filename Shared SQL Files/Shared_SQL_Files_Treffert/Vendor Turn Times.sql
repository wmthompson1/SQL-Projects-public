use live
go


select 
	a.VendorID, 
	a.PurchOrder,
	a.LINE_NO,
	a.part_id, 
	a.ORDER_QTY,
	case
		when pol.PURC_ORDER_ID is not null then 'Expedite'
		else ''
	end as Expedite,
	a.OrderDate, 
	a.DESIRED_RECV_DATE,
	max(a.RECEIVED_DATE) as RecvdDate,
	datediff(d, a.OrderDate, max(a.RECEIVED_DATE)) as [TrueTurnTime],
	datediff(d, a.DESIRED_RECV_DATE, max(a.RECEIVED_DATE)) as [PromiseTimeDiff]
from
(select 
	po.vendor_id as VendorID, 
	po.id as PurchOrder, 
	pol.LINE_NO, 
	pol.part_id,
	pol.ORDER_QTY,
	po.order_date as OrderDate, 
	pol.DESIRED_RECV_DATE,
	r.RECEIVED_DATE
from purchase_order po
left outer join PURC_ORDER_LINE pol
on po.id = pol.PURC_ORDER_ID
left outer join RECEIVER_LINE rl
on  rl.PURC_ORDER_LINE_NO = pol.line_no
and rl.PURC_ORDER_ID = po.id
left outer join RECEIVER r
on rl.RECEIVER_ID = r.ID
where
	po.vendor_id in ('STAMET', 'MAPSCO', 'PACMET')	
	and part_id is not null
) as A
left outer join 
	PURC_ORDER_LINE pol
	on  a.PurchOrder = pol.PURC_ORDER_ID
	and vendor_part_id like 'Expedite%'
group by 
	a.VendorID, 
	a.PurchOrder,
	a.LINE_NO,
	a.part_id, 
	a.ORDER_QTY,
	case
		when pol.PURC_ORDER_ID is not null then 'Expedite'
		else ''
	end,
	a.OrderDate, 
	a.DESIRED_RECV_DATE
order by 
	a.VendorID, 
	a.PurchOrder,
	a.LINE_NO,
	a.part_id, 
	a.ORDER_QTY,
	case
		when pol.PURC_ORDER_ID is not null then 'Expedite'
		else ''
	end,
	a.OrderDate, 
	a.DESIRED_RECV_DATE
