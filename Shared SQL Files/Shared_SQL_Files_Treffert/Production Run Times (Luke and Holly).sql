use live      
go     
       
SELECT        
	WO.PART_ID, 
	WO.BASE_ID, 
	WO.LOT_ID, 
	WO.SPLIT_ID,
	WO.SUB_ID,
	WO.DESIRED_QTY, 
	WO.RECEIVED_QTY, 
	WO.CREATE_DATE, 
	o.close_date,
	O.SEQUENCE_NO, 
	O.RESOURCE_ID, 
	lt.TRANSACTION_DATE,
	co.CUSTOMER_ID,
	--     SR.SKILLS_TYPE,
	sum(LT.Hours_Worked) HrsWorked,
	sum(LT.Hours_Worked) / WO.DESIRED_QTY AvgHrsWorked

FROM   WORK_ORDER WO 
INNER JOIN OPERATION O     
	ON  WO.[TYPE] = O.WORKORDER_TYPE 
	AND WO.BASE_ID = O.WORKORDER_BASE_ID
	AND WO.LOT_ID = O.WORKORDER_LOT_ID
	AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND WO.SUB_ID = O.WORKORDER_SUB_ID
	and O.RESOURCE_ID in ('P3M-WATERJET', 'Timesaver', 'Waterjet', 'bandsaw', 'cncmill', 'cncmill-12', 'cncmill-4', 'cncmill-5', 'cncrouter', 'cutoffsaw', 'mlathe', 'okuma', 'punch press', 'shear', 'tablesaw', 'tpunch', 'trouter')
INNER JOIN LABOR_TICKET LT 
	ON  LT.WORKORDER_TYPE = O.WORKORDER_TYPE 
	AND LT.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID
	AND LT.WORKORDER_LOT_ID = O.WORKORDER_LOT_ID
	AND LT.WORKORDER_SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND LT.WORKORDER_SUB_ID = O.WORKORDER_SUB_ID
	AND LT.OPERATION_SEQ_NO = O.SEQUENCE_NO
INNER JOIN SHOP_RESOURCE SR 
	ON O.RESOURCE_ID = SR.ID
left outer join DEMAND_supply_link dsl
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id
left outer join customer_order co
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id 

WHERE         
	(LT.TRANSACTION_DATE >= '8/1/2017'   
		AND LT.TRANSACTION_DATE < '11/1/2017') 
	and WO.DESIRED_QTY > 0
	and WO.[STATUS] <> 'X'
	AND WO.[TYPE] = 'W'
	and sr.SKILLS_TYPE = 'M'

GROUP BY      
	WO.PART_ID, 
	WO.BASE_ID, 
	WO.LOT_ID, 
	WO.SPLIT_ID,
	WO.SUB_ID,
	WO.DESIRED_QTY, 
	WO.RECEIVED_QTY, 
	WO.CREATE_DATE, 
	o.close_date,
	O.SEQUENCE_NO, 
	O.RESOURCE_ID,
	lt.TRANSACTION_DATE, 
	co.CUSTOMER_ID
	--SR.SKILLS_TYPE

ORDER BY      
	WO.PART_ID, 
	WO.BASE_ID, 
	WO.LOT_ID, 
	WO.SPLIT_ID,
	WO.SUB_ID,
	WO.DESIRED_QTY, 
	WO.RECEIVED_QTY, 
	WO.CREATE_DATE, 
	o.close_date,
	O.SEQUENCE_NO, 
	O.RESOURCE_ID--, 
	--SR.SKILLS_TYPE
