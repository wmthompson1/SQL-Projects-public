# Average Turn (Weekdays)

```sql
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
    CUST_ORDER_ID AS CUST_ORDER, 
    LINE_NO, COLINE, 
    CUST_PO AS CUST_PO, 
    CASE 
        WHEN CUSTID = 'BOE609' THEN 'CMP' 
        ELSE 'Other' 
    END AS CMP, PART_ID, 
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
    o.resource_ID, 
    o.operation_type, 
    CASE 
        WHEN o.resource_ID LIKE '%assy%' THEN 'M' 
        WHEN o.resource_ID LIKE '%Assembly%' THEN 'M' 
        WHEN o.resource_ID LIKE 'rivet' THEN 'M' 
        WHEN o.resource_ID LIKE 'glue' THEN 'M' 
        WHEN o.resource_ID LIKE 'contractor' THEN 'OS' 
        ELSE SR.SKILLS_TYPE 
    END AS SKILLS_TYPE1, 
    CASE 
        WHEN o.RESOURCE_ID IN ('pm', 'BAL-pm', 'AUB-pm', 'AUB-assyPM') THEN 1 
        ELSE 0 
    END AS PMCount, 
    CASE 
        WHEN o.resource_ID = 'BAL-Ship' AND o.operation_type = 'REVISION' THEN 1 
        WHEN o.resource_ID LIKE '%-Ship' OR O.RESOURCE_ID LIKE 'rwec' THEN 0 ELSE 1 
    END AS DivCount
INTO #T1
FROM
    (SELECT
        C.ID AS CUSTID, 
        COL.CUST_ORDER_ID, 
        COL.LINE_NO, 
        COL.CUST_ORDER_ID + '/' + cast(COL.LINE_NO AS nvarchar(3)) AS COLine, 
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
        CUSTOMER_ORDER CO ON C.ID = CO.CUSTOMER_ID 
        LEFT OUTER JOIN
        CUST_ORDER_LINE COL ON CO.ID = COL.CUST_ORDER_ID 
        LEFT OUTER JOIN
        DEMAND_SUPPLY_LINK AS DSL ON COL.CUST_ORDER_ID = DSL.DEMAND_BASE_ID AND COL.LINE_NO = DSL.DEMAND_SEQ_NO AND DSL.DEMAND_TYPE = 'CO' 
        LEFT OUTER JOIN
        WORK_ORDER AS W ON DSL.SUPPLY_BASE_ID = W.BASE_ID AND DSL.SUPPLY_LOT_ID = W.LOT_ID AND DSL.SUPPLY_SPLIT_ID = W.SPLIT_ID AND DSL.SUPPLY_SUB_ID = W.SUB_ID AND DSL.SUPPLY_TYPE IN ('WO', 'CP') 
        LEFT OUTER JOIN
        SHIPPER_LINE SL ON COL.CUST_ORDER_ID = SL.CUST_ORDER_ID AND COL.LINE_NO = SL.CUST_ORDER_LINE_NO 
        LEFT OUTER JOIN
        SHIPPER S ON SL.PACKLIST_ID = S.PACKLIST_ID 
        LEFT OUTER JOIN
        TRACE_INV_TRANS T ON SL.TRANSACTION_ID = T .TRANSACTION_ID 
        LEFT OUTER JOIN
        WORK_ORDER AS WO2 ON T .TRACE_ID = WO2.BASE_ID + '/' + WO2.LOT_ID + '/' + WO2.SPLIT_ID
    WHERE        
        COL.PART_ID NOT LIKE 'UP%' 
        AND C.USER_9 NOT LIKE 'o%' 
        AND SL.SHIPPED_QTY <> 0 
        AND (S.SHIPPED_DATE >= @StartDate AND S.SHIPPED_DATE <= @EndDate)
    GROUP BY 
        C.ID, 
        COL.CUST_ORDER_ID, 
        COL.LINE_NO, 
        COL.CUST_ORDER_ID + '/' + cast(COL.LINE_NO AS nvarchar(3)), 
        CO.CUSTOMER_PO_REF, 
        isnull(COL.DESIRED_SHIP_DATE, 
        co.DESIRED_SHIP_DATE), 
        COL.PART_ID, 
        COL.MISC_REFERENCE, 
        W.BASE_ID, 
        W.LOT_ID
    ) A 
    LEFT OUTER JOIN
    OPERATION O ON O.WORKORDER_TYPE = 'W' AND A.BASE_ID = O.WORKORDER_BASE_ID AND A.LOTID = O.WORKORDER_LOT_ID AND O.WORKORDER_SPLIT_ID = '0' AND O.WORKORDER_SUB_ID = '0' 
    LEFT OUTER JOIN
    SHOP_RESOURCE SR ON O.RESOURCE_ID = SR.ID


SELECT
COLine,
[Type], 
CMP, 
CASE 
    WHEN mcount >= 1 AND acount >= 4 AND bcount >= 4 THEN 'MAB' 
    WHEN mcount >= 1 AND acount >= 3 THEN 'MA'
    WHEN mcount >= 1 AND bcount >= 3 THEN 'MB'
    WHEN mcount >= 1 AND acount <= 3 AND bcount <= 3 THEN 'M'
    WHEN acount >= 4 AND bcount >= 4 THEN 'AB'
    WHEN mcount >= 1 THEN 'M'
    WHEN acount >= 1 THEN 'A'
    WHEN bcount >= 1 THEN 'B'
    WHEN Ocount >= 1 THEN 'O' 
END AS DIV, 
CASE 
    WHEN mcount >= 1 AND acount >= 4 AND bcount >= 4 THEN 'MFG & Auburn North & Ballard' 
    WHEN mcount >= 1 AND acount >= 3 THEN 'MFG & Auburn North'
    WHEN mcount >= 1 AND bcount >= 3 THEN 'MFG & Ballard'
    WHEN mcount >= 1 AND acount <= 3 AND bcount <= 3 THEN 'MFG'
    WHEN acount >= 4 AND bcount >= 4 THEN 'Auburn North & Ballard'
    WHEN mcount >= 1 THEN 'MFG'
    WHEN acount >= 1 THEN 'Auburn North'
    WHEN bcount >= 1 THEN 'Ballard'
    WHEN Ocount >= 1 THEN 'Outreach' 
END AS Division, 
[turn-wkdys] AS Turn
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
    (SELECT sum(PMCount) FROM #t1 pm WHERE pm.base_id = t1.base_id) PMCount,
    (SELECT sum(DivCount) FROM #t1 A  WHERE SKILLS_TYPE1 = 'A'  AND  A.base_id = t1.base_id) ACount,
    (SELECT sum(DivCount) FROM #t1 B  WHERE SKILLS_TYPE1 = 'B'  AND  B.base_id = t1.base_id) BCount,
    (SELECT sum(DivCount) FROM #t1 M  WHERE SKILLS_TYPE1 = 'M'  AND  M.base_id = t1.base_id) mCount,
    (SELECT sum(DivCount) FROM #t1 O  WHERE SKILLS_TYPE1 = 'O'  AND  O.base_id = t1.base_id) OCount,
    (SELECT sum(DivCount) FROM #t1 OS WHERE SKILLS_TYPE1 = 'OS' AND OS.base_id = t1.base_id) OSCount
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
    AND CASE 
        WHEN mcount >= 1 AND acount >= 4 AND bcount >= 4 THEN 'MAB' 
        WHEN mcount >= 1 AND acount >= 3 THEN 'MA'
        WHEN mcount >= 1 AND bcount >= 3 THEN 'MB'
        WHEN mcount >= 1 AND acount <= 3 AND bcount <= 3 THEN 'M'
        WHEN acount >= 4 AND bcount >= 4 THEN 'AB'
        WHEN mcount >= 1 THEN 'M'
        WHEN acount >= 1 THEN 'A'
        WHEN bcount >= 1 THEN 'B'
        WHEN Ocount >= 1 THEN 'O' 
    END IN (@DIV) 
    AND CMP IN (@CMP)
    AND Type IN (@Type)

```