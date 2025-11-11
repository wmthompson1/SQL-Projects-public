# Division Shipping OnTime Percentage

```sql
declare @startdate datetime = '1/1/2016',
	@enddate datetime = '12/31/2016'

drop table #t1

SELECT
	CUSTID, 
	CASE 
		WHEN BASE_ID LIKE ('%R%') THEN 'Rework' 
		WHEN PART_ID IS NOT NULL AND SHIPPEDQTY <= 0 THEN 'Return' 
		WHEN BASE_ID IS NOT NULL THEN 'Parts' 
		WHEN A.[DESCRIPTION] LIKE 'Minimum%' THEN 'Min' 
		WHEN A.[DESCRIPTION] LIKE ('NRE%') OR A.[DESCRIPTION] LIKE ('NON RECUR%') OR A.[DESCRIPTION] LIKE ('NON_RECUR%') OR A.[DESCRIPTION] LIKE ('COST%') THEN 'NRE' 
		WHEN A.[DESCRIPTION] LIKE 'Exp%' THEN 'Exp' 
		WHEN (A.[DESCRIPTION] LIKE ('%pene%') OR A.[DESCRIPTION] LIKE ('%pena%')) AND TotalCost < 0 THEN 'Pen Credit' 
		WHEN (A.[DESCRIPTION] LIKE ('%credit%')) AND TotalCost < 0 THEN 'Credit' 
		WHEN TotalCost < 0 THEN 'Credit' 
	END AS [Type], 
	CAST(CUST_ORDER_ID AS VARCHAR) AS CUST_ORDER, 
	LINE_NO, 
	COLINE, 
	CAST(CUST_PO AS VARCHAR) AS CUST_PO, 
	CASE 
		WHEN CUSTID = 'BOE609' THEN 'CMP' 
		ELSE 'Other' 
	END AS CMP, 
	PART_ID, 
	A.[DESCRIPTION], 
	ShippedQTY, 
	BASE_ID, 
	CAST(ShipDate AS DATE) AS [Ship Date], 
	CAST(DueDate AS DATE) AS [DUE DATE], 
	CASE 
		WHEN SHIPDATE > DUEDATE THEN 'No' 
		ELSE 'Yes' 
	END AS [ON TIME], 
	CASE 
		WHEN DATEDIFF(d, ORDERDATE, CreateShipDate) - (DATEDIFF(wk, ORDERDATE, CreateShipDate) + 
			CASE 
				WHEN DATEPART(dw, ORDERDATE) = 1 THEN 1 
				ELSE 0 
			END) - (DATEDIFF(wk, ORDERDATE, CreateShipDate) + 
				CASE 
					WHEN DATEPART(dw, CreateShipDate) = 7 THEN 1 
					ELSE 0 
				END) < 1 THEN 1 
		ELSE DATEDIFF(d, ORDERDATE, CreateShipDate) - (DATEDIFF(wk, ORDERDATE, CreateShipDate) + 
			CASE 
				WHEN DATEPART(dw, ORDERDATE) = 1 THEN 1 
				ELSE 0 
			END) - (DATEDIFF(wk, ORDERDATE, CreateShipDate) + 
				CASE 
					WHEN DATEPART(dw, CreateShipDate) = 7 THEN 1 
					ELSE 0 
				END) 
	END AS [turn-wkdys], 
	o2.resource_ID, 
	ra.[location]
INTO #T1
FROM
	(SELECT
	C.ID AS CUSTID, 
	COL.CUST_ORDER_ID, 
	COL.LINE_NO, 
	cast(COL.CUST_ORDER_ID AS varchar) + '/' + cast(COL.LINE_NO AS varchar) AS COLine, 
	CO.CUSTOMER_PO_REF AS CUST_PO, 
	isnull(COL.DESIRED_SHIP_DATE, co.DESIRED_SHIP_DATE) AS DueDate, 
	COL.PART_ID, 
	ltrim(rtrim(isnull(COL.MISC_REFERENCE, ''))) AS [DESCRIPTION], 
	isnull(W.BASE_ID,max(WO2.BASE_ID)) as Base_ID,
	isnull(W.Lot_ID,max(WO2.Lot_ID)) as LotID, 
	sum(SL.SHIPPED_QTY * COL.UNIT_PRICE) AS TotalCost, 
	max(co.order_date) AS OrderDate, 
	max(s.create_DATE) AS CreateShipDate, 
	max(s.SHIPPED_DATE) AS ShipDate, 
	sum(sl.SHIPPED_QTY) AS ShippedQTY
	FROM CUSTOMER C 
	INNER JOIN
		CUSTOMER_ORDER CO 
		ON C.ID = CO.CUSTOMER_ID 
	LEFT OUTER JOIN
		CUST_ORDER_LINE COL 
		ON CO.ID = COL.CUST_ORDER_ID 
	LEFT OUTER JOIN
		DEMAND_SUPPLY_LINK AS DSL 
		ON COL.CUST_ORDER_ID = DSL.DEMAND_BASE_ID 
		AND COL.LINE_NO = DSL.DEMAND_SEQ_NO 
		AND DSL.DEMAND_TYPE = 'CO' 
	LEFT OUTER JOIN
		WORK_ORDER AS W 
		ON DSL.SUPPLY_BASE_ID = W.BASE_ID 
		AND DSL.SUPPLY_LOT_ID = W.LOT_ID 
		AND DSL.SUPPLY_SPLIT_ID = W.SPLIT_ID 
		AND DSL.SUPPLY_SUB_ID = W.SUB_ID 
		AND DSL.SUPPLY_TYPE IN ('WO', 'CP') 
	LEFT OUTER JOIN
		SHIPPER_LINE SL 
		ON COL.CUST_ORDER_ID = SL.CUST_ORDER_ID 
		AND COL.LINE_NO = SL.CUST_ORDER_LINE_NO 
	LEFT OUTER JOIN
		SHIPPER S 
		ON SL.PACKLIST_ID = S.PACKLIST_ID 
	LEFT OUTER JOIN
		TRACE_INV_TRANS T 
		ON SL.TRANSACTION_ID = T .TRANSACTION_ID 
	LEFT OUTER JOIN
		WORK_ORDER AS WO2 
		ON T .TRACE_ID = WO2.BASE_ID + '/' + WO2.LOT_ID + '/' + CAST(WO2.SPLIT_ID AS VARCHAR)
	WHERE        
		COL.PART_ID NOT LIKE 'UP%' 
		AND C.USER_9 NOT LIKE 'o%' 
		AND SL.SHIPPED_QTY <> 0 
		AND (S.SHIPPED_DATE >= @StartDate AND S.SHIPPED_DATE <= @EndDate)
	GROUP BY 
		C.ID, 
		COL.CUST_ORDER_ID, 
		COL.LINE_NO, 
		cast(COL.CUST_ORDER_ID AS varchar) + '/' + cast(COL.LINE_NO AS varchar), 
		CO.CUSTOMER_PO_REF, 
		isnull(COL.DESIRED_SHIP_DATE, 
		co.DESIRED_SHIP_DATE), 
		COL.PART_ID, 
		COL.MISC_REFERENCE, 
		W.BASE_ID, 
		W.LOT_ID, 
		WO2.LOT_ID
	) A 
LEFT OUTER JOIN
	(select 
		WORKORDER_BASE_ID,
		WORKORDER_lot_ID,
		WORKORDER_split_ID,
		WORKORDER_sub_ID,
		WORKORDER_type,
		max(SEQUENCE_NO) as LastOp
	from		
		OPERATION O 
	group by
		WORKORDER_BASE_ID,
		WORKORDER_lot_ID,
		WORKORDER_split_ID,
		WORKORDER_sub_ID,
		WORKORDER_type
	) O	
	ON O.WORKORDER_TYPE = 'W' 
	AND A.BASE_ID = O.WORKORDER_BASE_ID 
	AND A.LOTID = O.WORKORDER_LOT_ID 
	AND O.WORKORDER_SPLIT_ID = '0' 
	AND O.WORKORDER_SUB_ID = '0' 
inner JOIN
	OPERATION O2
	ON  O2.WORKORDER_TYPE = 'W' 
	AND O2.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID 
	AND O2.WORKORDER_LOT_ID  = O.WORKORDER_LOT_ID
	AND O2.WORKORDER_SPLIT_ID = O.WORKORDER_split_ID 
	AND O2.WORKORDER_SUB_ID = o.WORKORDER_SUB_ID
	AND O2.SEQUENCE_No = o.LastOp
LEFT OUTER JOIN
	livesupplemental.dbo.resourceid_assignments ra
	ON O2.RESOURCE_ID = ra.RESOURCE_ID
where
	ISNUMERIC(base_id) = 1
	and
	(
	(CUSTID in ('aerman', 'a&gmac', 'tecaer', 'imainc', 'TRISTR') 
		and [location] = 'Auburn North')
	or
	(CUSTID in ('primus', 'TRICOM', 'TRISTR' , 'boepop', 'amtrib', 'amtmfg') 
		and [location] = 'Auburn South')
	or
	(CUSTID in ('aerman', 'gidind', 'royfab', 'roymfg', 'damar') 
		and [location] = 'Ballard')
	)
--	and CUSTID in ('primus', 'tristr', 'boepop', 'amtrib', 'tecaer', 'imainc', 'aerman', 'gidind', 'royfab', 'roymfg', 'a&gmac', 'damar')


select * from #t1

/*SELECT
CustID,
COLine,
[Type], 
CMP, 
[turn-wkdys] AS Turn,
[ON TIME]
FROM            
(SELECT
	CUSTID, 
	[Type], 
	CUST_ORDER, 
	LINE_NO, 
	COLINE, 
	CUST_PO, 
	CMP, 
	PART_ID, 
	[DESCRIPTION], 
	ShippedQTY, 
	base_id, 
	[Ship Date], 
	[DUE DATE], 
	[ON TIME], 
	[turn-wkdys],
	[location]
FROM #t1 t1
GROUP BY 
	CUSTID, 
	[Type], 
	CUST_ORDER, 
	LINE_NO, 
	COLINE, 
	CUST_PO, 
	CMP, 
	PART_ID, 
	[DESCRIPTION], 
	ShippedQTY, 
	base_id, 
	[Ship Date], 
	[DUE DATE], 
	[ON TIME], 
	[turn-wkdys]
) Counts
WHERE        
	([SHIP DATE] >= @StartDate AND [SHIP DATE] <= @EndDate) 
	AND SKILLS_TYPE1 IN (@DIV)
*/
```