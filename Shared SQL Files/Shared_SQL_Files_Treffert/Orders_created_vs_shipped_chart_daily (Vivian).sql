DECLARE @START_DATE DATE = GETDATE() - 1
DECLARE @END_DATE DATE = GETDATE() 

;
with CTE_ship
AS
( 
SELECT 
	   C.ID AS CUSTID,
	   COL.CUST_ORDER_ID,
	   COL.LINE_NO,
	   COL.PART_ID,
	   case when p.planner_user_id not in ('NA', 'FIN', '605F','609F')
             then 'MFG'
		   else 'FIN'
	   end  as busi_steam,
	   ltrim(rtrim(isnull(COL.MISC_REFERENCE,''))) AS [DESCRIPTION],
	   max(s.SHIPPED_DATE) as ShipDate,
	   sum(sl.SHIPPED_QTY) as ShippedQTY
FROM	CUSTOMER C
    INNER JOIN
	   CUSTOMER_ORDER CO 
	   ON C.ID = CO.CUSTOMER_ID
    inner JOIN 
	   CUST_ORDER_LINE COL 
	   ON CO.ID = COL.CUST_ORDER_ID
   inner join PART p
     on col.part_id = p.id
    LEFT OUTER JOIN  -- linked orders
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
		   AND W.TYPE = 'W'
		   AND DSL.SUPPLY_TYPE IN ('WO', 'CP') 
    left outer JOIN 
	   SHIPPER_LINE SL 
	   ON  COL.CUST_ORDER_ID = SL.CUST_ORDER_ID
	   AND COL.LINE_NO = SL.CUST_ORDER_LINE_NO 
    left outer JOIN 
	   SHIPPER S
	   ON SL.PACKLIST_ID = S.PACKLIST_ID
WHERE  
	   COL.PART_ID NOT LIKE 'UP%' 
	   AND C.USER_9 NOT LIKE 'o%' 
	   AND SL.SHIPPED_QTY <> 0 
	   AND (S.SHIPPED_DATE >= @Start_Date
		  AND S.SHIPPED_DATE < @End_Date)
GROUP BY
	   C.ID,
	   COL.CUST_ORDER_ID,
	   COL.LINE_NO,
	   COL.PART_ID,
	   CASE WHEN p.planner_user_id  not in ('NA', 'FIN', '605F','609F')
             THEN 'MFG'
		   ELSE 'FIN'
	   END,
	   ltrim(rtrim(isnull(COL.MISC_REFERENCE,'')))
)
--select * from CTE_ship 

, 

cte_cust
as 
(
SELECT  C.ID AS CUSTID,
	   COL.CUST_ORDER_ID,
	   COL.LINE_NO,
	   co.CREATE_DATE, 
	    COL.PART_ID,
	   CASE WHEN p.planner_user_id  not in ('NA', 'FIN', '605F','609F')
             THEN 'MFG'
		   ELSE 'FIN'
	   END AS busi_steam
FROM	CUSTOMER C
    INNER JOIN
	   CUSTOMER_ORDER CO 
	   ON C.ID = CO.CUSTOMER_ID
    inner JOIN 
	   CUST_ORDER_LINE COL 
		ON CO.ID = COL.CUST_ORDER_ID
	INNER JOIN PART p
		ON col.part_id = p.id
WHERE (co.create_DATE >= @Start_Date
		  AND co.create_DATE <= @End_Date)
)
--SELECT * FROM cte_cust where cust_order_id = '001521097'

--select * from CUSTOMER_ORDER where id = '001521097'



SELECT category, COUNT(cntline) AS cntline, cmp, busi_steam
FROM 
(
SELECT 'Shipped' as category, 
       busi_steam,  
    --CUSTID,    
    CASE
    
	   WHEN PART_ID is not null and SHIPPEDQTY <= 0 
	   THEN 0  --'Return' 
	   WHEN [DESCRIPTION] is not null 
	   THEN 0  --	   like 'Minimum%' then 'Min' 
	   ELSE 1
	END as cntline, 
    CASE
	   WHEN CUSTID = 'BOE609' 
	   THEN 'CMP'
	   ELSE 'Non-CMP'
    END AS CMP
FROM cte_ship
UNION ALL 
SELECT 'Incoming Cust Orders' as category, 
    busi_steam, 
	CASE WHEN PART_ID is not null 
	       THEN 1 
	       ELSE 0 
    END cntline,
	CASE WHEN CUSTID = 'BOE609' 
		THEN 'CMP'
	    ELSE 'NON-CMP'
    END AS CMP
FROM cte_cust
 ) as a 
GROUP BY a.category,a.cmp, a.busi_steam
