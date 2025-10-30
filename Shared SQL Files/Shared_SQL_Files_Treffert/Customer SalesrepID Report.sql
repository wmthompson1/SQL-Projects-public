use live 
go

SELECT 
	id, 
	CustRep,
	SALESREP_ID,
	RepLocation,
	COCount,
	LastCODate,
	LastShipDate,
	LastInvDate,
	iif (MFG > 3, 'Yes', 'No') as MFGCust,
	iif (Finish > 0, 'Yes', 'No') as FinishCust
From
(SELECT 
	c.id, 
	c.SALESREP_ID as CustRep,
	cr.SALESREP_ID,
	RepLocation,
	ACTIVE_FLAG,
	COCount,
	LastCODate,
	LastShipDate,
	LastInvDate,
	sum(case
	   when o.resource_ID like 'ANM-%' then 1
	   when RA.[LOCATION] = 'Auburn South'  then 1
	   else 0
    end) as MFG,
    sum(case
	   when RA.[LOCATION] = 'Auburn North' and o.resource_ID <> 'ANM-%' then 1
	   when RA.[LOCATION] = 'Ballard'  then 1
	   else 0
    end) as Finish
FROM	WORK_ORDER WO 
inner JOIN 
	OPERATION O 
	ON  WO.TYPE = O.WORKORDER_TYPE
	AND WO.BASE_ID = O.WORKORDER_BASE_ID
	AND WO.LOT_ID = O.WORKORDER_LOT_ID
	AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND WO.SUB_ID = O.WORKORDER_SUB_ID
inner JOIN 
	SHOP_RESOURCE SR 
	ON O.RESOURCE_ID = SR.ID 
inner JOIN
    DEMAND_SUPPLY_LINK AS DSL 
    ON DSL.SUPPLY_BASE_ID = WO.BASE_ID 
    AND DSL.SUPPLY_LOT_ID = WO.LOT_ID 
    AND DSL.SUPPLY_SPLIT_ID = WO.SPLIT_ID 
    AND DSL.SUPPLY_SUB_ID = WO.SUB_ID 
    AND DSL.SUPPLY_TYPE  = 'WO'
inner JOIN 
	CUST_ORDER_LINE COL 
	ON  DSL.DEMAND_BASE_ID = COL.CUST_ORDER_ID
	AND DSL.DEMAND_SEQ_NO = COL.LINE_NO
inner JOIN 
	CUSTOMER_ORDER CO 
	ON COL.CUST_ORDER_ID = CO.ID
inner join
	customer c
	on c.id = co.customer_id
inner join 
	(select co.customer_id, max(order_date) as LastCODate, count(id) as COCount
	from customer_order co
	group by co.customer_id
	) co2
	on c.id = co2.customer_id
inner join 
	(select r.customer_id, max(INVOICE_DATE) as LastInvDate
	from receivable r
	group by r.customer_id
	) r2
	on c.id = r2.customer_id
inner join 
	(select co.customer_id, max(SHIPPED_DATE) as LastShipDate
	from shipper s
	inner join customer_order co
	on s.cust_order_id = co.id
	group by co.customer_id
	) s2
	on c.id = s2.customer_id
inner JOIN
	LIVESupplemental.DBO.RESOURCEID_ASSIGNMENTS RA
	ON RA.RESOURCE_ID = O.RESOURCE_ID
inner join 
	LIVESupplemental.dbo.customer_reps cr
	on cr.id = c.id
WHERE  
	WO.[STATUS] in ('C', 'R')
	and wo.[type] = 'W' 
	AND ISNUMERIC(wo.base_id) = 1
	and co.order_date >= '1/1/2013'
	and ACTIVE_FLAG = 'Y'
group  by 
	c.id, 
	c.SALESREP_ID,
	cr.SALESREP_ID,
	RepLocation,
	ACTIVE_FLAG,
	COCount,
	LastCODate,
	LastShipDate,
	LastInvDate
) Initial
