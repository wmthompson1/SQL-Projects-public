# Supplier Performance Rating_PoDetail

```sql
/*PO Detail*/

DECLARE @startdate datetime  
DECLARE @enddate datetime 
--DECLARE @Vendor_id varchar(10) = 'LKPREC'

SELECT @startdate = CAST(DATEADD(MONTH, 0, DATEADD(YEAR, -1, DATEADD(dd, -DAY(GETDATE())+1, GETDATE()))) AS DATE)
SELECT @enddate = CAST(DATEADD(dd,-DAY(GETDATE()), GETDATE()) AS DATE)

IF OBJECT_ID('tempdb..#TMP_DETAILS_1')IS NOT NULL DROP TABLE #TMP_DETAILS_1
/************   Only PO with QPL where PART_ID is not = 'Not Controlled'  **************/
--SELECT * FROM Datamart.dbo.SK_SUPPLIER_PERFORMANCE_DETAILS
SELECT t.VENDOR_ID, PURC_ORDER_ID, PURC_ORDER_LINE_NO, PO_LINE_STATUS, PO_STATUS, PO_LINE_ORDERQTY, 
    rDate, TotReceivedQty, TotRejected, DATEADD(DAY, 3, DUE_DATE) AS 'DUE_DATE', 
    YrMth, OnTimeQty, LateQty, TotQty, T.PART_ID 
 INTO #TMP_DETAILS_1
   FROM Datamart.dbo.SK_SUPPLIER_PERFORMANCE_DETAILS T
   INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO, udf.STRING_VAL
        FROM PURCHASE_ORDER p with (nolock) 
        INNER JOIN PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
        INNER JOIN USER_DEF_FIELDS udf with (nolock) on l.PART_ID = udf.DOCUMENT_ID
        WHERE l.PART_ID IS NOT NULL AND udf.PROGRAM_ID = 'VMPRTMNT' AND udf.ID = 'UDF-0000082'
        --and udf.STRING_VAL like '%Controlled%'
                AND udf.STRING_VAL IN ('Specification Controlled', 'QPL Controlled', 'Controlled')
   ) po ON t.PURC_ORDER_ID = po.ID AND t.PURC_ORDER_LINE_NO = po.LINE_NO
WHERE DUE_DATE >= '2024-12-01'
UNION
    /* UNION PART CONTROLER LIVEARC*/
 SELECT  s.VENDOR_ID, S.PURC_ORDER_ID, PURC_ORDER_LINE_NO, PO_LINE_STATUS, PO_STATUS, PO_LINE_ORDERQTY, 
    rDate, TotReceivedQty, TotRejected, DATEADD(DAY,3, DUE_DATE) AS 'DUE_DATE', 
    YrMth, OnTimeQty, LateQty, TotQty, s.PART_ID
    FROM [SQL-Lab-2].[Datamart].dbo.SK_SUPPLIER_PERFORMANCE_DETAILS s WITH (NOLOCK) 
    INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].[PURC_ORDER_LINE]  p WITH (NOLOCK) on
    s.PURC_ORDER_ID=p.PURC_ORDER_ID and s.PURC_ORDER_LINE_NO=p.LINE_NO
    INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO, udf.STRING_VAL
        FROM [SQL-Lab-2].[LIVEARC].[dbo].PURCHASE_ORDER p with (nolock) 
        INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].PURC_ORDER_LINE l with (nolock)  ON p.id = l.PURC_ORDER_ID
        INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].USER_DEF_FIELDS udf with (nolock)  ON l.PART_ID = udf.DOCUMENT_ID
        WHERE l.PART_ID IS NOT NULL AND udf.PROGRAM_ID = 'VMPRTMNT' AND udf.ID = 'UDF-0000082'
            AND udf.STRING_VAL IN ('Specification Controlled', 'QPL Controlled', 'Controlled')
    ) po ON s.PURC_ORDER_ID = po.ID and s.PURC_ORDER_LINE_NO = po.LINE_NO
    where DUE_DATE < '2024-12-01'  --and s.PURC_ORDER_ID in ('169333', '174758', '177055')
    --AND s.VENDOR_ID = 'AERCOA'
UNION
--Join to add parts services tied to WO. 
 SELECT t.VENDOR_ID, PURC_ORDER_ID, PURC_ORDER_LINE_NO, PO_LINE_STATUS, PO_STATUS, PO_LINE_ORDERQTY, 
    rDate, TotReceivedQty, TotRejected, DATEADD(DAY, 3, DUE_DATE) AS 'DUE_DATE', 
    YrMth, OnTimeQty, LateQty, TotQty, T.PART_ID 
 FROM Datamart.dbo.SK_SUPPLIER_PERFORMANCE_DETAILS T 
 INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO--, udf.STRING_VAL
        FROM PURCHASE_ORDER p with (nolock) 
        INNER JOIN PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
        INNER JOIN DEMAND_SUPPLY_LINK dsl with (nolock) on l.PART_ID = dsl.SUPPLY_PART_ID
            and l.PURC_ORDER_ID = dsl.SUPPLY_BASE_ID and l.LINE_NO = dsl.SUPPLY_SEQ_NO
        WHERE l.PART_ID IS NOT NULL 
   ) po ON T.PURC_ORDER_ID = po.ID AND T.PURC_ORDER_LINE_NO = po.LINE_NO
 WHERE T.DUE_DATE >= '2024-12-01'
 UNION
-- [SQL-Lab-2].[LIVEARC] Join to add parts services tied to WO. 
SELECT p.VENDOR_ID, p.ID as 'PO_Id', l.LINE_NO as 'PO_Line', l.LINE_STATUS as 'POL_Status',
    p.STATUS as 'PO_Status', l.USER_ORDER_QTY as 'POL_Order_Qty', Rl.rDate, 
    IIF(Rl.TotReceivedQty IS NULL, 0, Rl.TotReceivedQty) as 'TotReceivedQty', 
    ISNULL(Rlrj.TotalRejected*-1, 0) as 'TotalRejected', 
    convert(varchar(10), DATEADD(DAY, 3, p.LAST_RECEIVED_DATE), 23) as 'DUE_DATE', 
    convert(varchar(4), DATEPART(YEAR, p.LAST_RECEIVED_DATE)) + 
    ( right('0'+convert(varchar(2), DATEPART(MONTH, p.LAST_RECEIVED_DATE)), 2) ) as 'YrMth',
    case when Rl.rDate <= p.DESIRED_RECV_DATE then 1
    else 0 end as 'OnTimeQty',
    case when Rl.rDate > p.DESIRED_RECV_DATE then 1
    else 0 end as 'LateQty',
    case when l.USER_ORDER_QTY <= l.TOTAL_USR_RECD_QTY then 1
    else 0 end as 'TotQty',
    l.PART_ID
FROM [SQL-Lab-2].[LIVEARC].[dbo].PURCHASE_ORDER p with (nolock) 
INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
LEFT JOIN (Select PURC_ORDER_ID as 'PO', PURC_ORDER_LINE_NO as 'PO_Line',  
    ISNULL(SUM(USER_RECEIVED_QTY), 0) as 'TotalRejected'
    from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER_LINE with (nolock) where USER_RECEIVED_QTY < 0
    group by PURC_ORDER_ID, PURC_ORDER_LINE_NO
) Rlrj on l.PURC_ORDER_ID = Rlrj.PO and l.LINE_NO = Rlrj.PO_Line
INNER JOIN (
    Select a.PURC_ORDER_ID as 'PO', a.PURC_ORDER_LINE_NO as 'PO_Line',  
        b.RECEIVED_DATE as 'rDate', SUM(a.USER_RECEIVED_QTY) as 'TotReceivedQty'
    from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER_LINE a with (nolock) 
    INNER JOIN (select distinct PURC_ORDER_ID, MIN(RECEIVED_DATE) as 'RECEIVED_DATE' 
        from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER with (nolock) group by PURC_ORDER_ID
    ) b on a.PURC_ORDER_ID = b.PURC_ORDER_ID
    where a.USER_RECEIVED_QTY > 0 
    group by a.PURC_ORDER_ID, a.PURC_ORDER_LINE_NO, b.RECEIVED_DATE
) Rl on l.PURC_ORDER_ID = Rl.PO and l.LINE_NO = Rl.PO_Line
INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].DEMAND_SUPPLY_LINK dsl with (nolock) on l.PART_ID = dsl.SUPPLY_PART_ID
            and l.PURC_ORDER_ID = dsl.SUPPLY_BASE_ID and l.LINE_NO = dsl.SUPPLY_SEQ_NO
WHERE l.PART_ID IS NOT NULL --AND p.VENDOR_ID = 'AERCOA'
and p.ORDER_DATE >= '2024-01-01' and p.ORDER_DATE < '2024-11-01'
   

;WITH VendorMonths AS
(
    SELECT a.vendor_id, mths.YearMth
    FROM ( SELECT DISTINCT vendor_id FROM  #TMP_DETAILS_1 T ) a
        CROSS APPLY LIVESupplemental.dbo.sfnMonths(@startdate, @enddate) mths
)
--SELECT * FROM VendorMonths
, FinalResults AS
(    SELECT ISNULL(v.BUYER, '00') as buyer_name
    , v.NAME vendor_name, vm.vendor_id, v.ACTIVE_FLAG, vm.YearMth YrMth
    , ISNULL(SUM(t.OntimeQty), 0) AS OntimeQuantity
    , ISNULL(SUM(t.LateQty), 0) AS LateQuantity
    , ISNULL(SUM(t.TotQty), 0) AS TotalQuantity
    , CAST(SUM(ISNULL(t.TotRejected,0)) AS NUMERIC) RejectedQty
    , CAST(SUM(ISNULL(t.TotReceivedQty,0)) AS NUMERIC) ReceivedQty
    , CAST(SUM(ISNULL(t.TotReceivedQty,0)) - SUM(ISNULL(t.TotRejected,0)) AS NUMERIC) AcceptedQty
    , SUM(ISNULL(SUM(t.OntimeQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS OntimeQuantity_RTotal
    , SUM(ISNULL(SUM(t.LateQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS LateQuantity_RTotal
    , SUM(ISNULL(SUM(t.TotQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS TotalQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotRejected,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS RejectedQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotReceivedQty,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS ReceivedQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotReceivedQty,0)) - SUM(ISNULL(t.TotRejected,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS AcceptedQuantity_RTotal
    , GETDATE() AS PrintDate, t.PURC_ORDER_ID
    FROM VendorMonths vm 
    LEFT JOIN #TMP_DETAILS_1 t ON vm.vendor_id = t.vendor_id  AND vm.YearMth = t.YrMth
    LEFT JOIN VENDOR v ON vm.vendor_id = v.ID
    GROUP BY v.BUYER, v.NAME, vm.vendor_id, v.ACTIVE_FLAG, vm.YearMth, t.PURC_ORDER_ID 
)

SELECT DISTINCT f.buyer_name, f.vendor_name, f.vendor_id, f.ACTIVE_FLAG, f.YrMth, 
    f.OntimeQuantity, f.TotalQuantity, f.AcceptedQty, f.ReceivedQty, 
    CASE 
        WHEN f.TotalQuantity > 0 THEN 1 
        ELSE 0 
    END AS 'CountTotQty',
    CASE 
        WHEN f.TotalQuantity > 0 
        THEN CAST(ROUND(CAST(f.OntimeQuantity AS NUMERIC) / NULLIF(CAST(f.TotalQuantity AS NUMERIC), 0), 4, 1) AS DECIMAL(20,4))  
        ELSE 0.00 
    END AS 'TotQty',
    CASE 
        WHEN f.ReceivedQty > 0 THEN 1 
        ELSE 0 
    END AS 'CountAcceptedQty',
    CASE 
        WHEN f.ReceivedQty > 0 
        THEN CAST(ROUND(f.AcceptedQty / NULLIF(f.ReceivedQty, 0), 4, 1) AS DECIMAL(20,4)) 
        ELSE 0.00 
    END AS 'TotAcceptedQty',
    f.LateQuantity, f.RejectedQty, f.OntimeQuantity_RTotal, f.LateQuantity_RTotal, f.TotalQuantity_RTotal, 
    f.RejectedQuantity_RTotal, f.ReceivedQuantity_RTotal, f.AcceptedQuantity_RTotal, f.PrintDate,
    mx.VendID, mx.LastOntimeQuantity_RTotal, mx.LastLateQuantity_RTotal, mx.LastTotalQuantity_RTotal, 
    mx.LastRejectedQuantity_RTotal, mx.LastReceivedQuantity_RTotal, mx.LastAcceptedQuantity_RTotal, 
    f.PURC_ORDER_ID, 
    CASE 
        WHEN f.TotalQuantity > 0 
        THEN f.OntimeQuantity / NULLIF(f.TotalQuantity, 0) 
        ELSE 0.00 
    END AS 'PercetOnTimeQty'
FROM FinalResults f
INNER JOIN (
    SELECT vendor_id AS VendID, OntimeQuantity_RTotal AS LastOntimeQuantity_RTotal,
           LateQuantity_RTotal AS LastLateQuantity_RTotal, TotalQuantity_RTotal AS LastTotalQuantity_RTotal,
           RejectedQuantity_RTotal AS LastRejectedQuantity_RTotal,
           ReceivedQuantity_RTotal AS LastReceivedQuantity_RTotal,
           AcceptedQuantity_RTotal AS LastAcceptedQuantity_RTotal
    FROM FinalResults a
    WHERE a.YrMth = (SELECT MAX(YrMth) FROM FinalResults)
) mx ON mx.VendID = f.vendor_id
WHERE f.vendor_id = @Vendor_id
ORDER BY f.vendor_id, f.YrMth, f.PURC_ORDER_ID;


/*
/************************************************************************************************************/
/************************************************************************************************************/

IF OBJECT_ID('tempdb..#TMP_DETAILS_1')IS NOT NULL DROP TABLE #TMP_DETAILS_1
/************   Only PO with QPL where PART_ID is not = 'Not Controlled'  **************/
SELECT t.* 
 INTO #TMP_DETAILS_1
   FROM Datamart.dbo.SK_SUPPLIER_PERFORMANCE_DETAILS T
   INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO, udf.STRING_VAL
        FROM PURCHASE_ORDER p with (nolock) 
        INNER JOIN PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
        INNER JOIN USER_DEF_FIELDS udf with (nolock) on l.PART_ID = udf.DOCUMENT_ID
        WHERE l.PART_ID IS NOT NULL AND udf.PROGRAM_ID = 'VMPRTMNT' AND udf.ID = 'UDF-0000082'
        --and udf.STRING_VAL like '%Controlled%'
                AND udf.STRING_VAL  != 'Not Controlled' 
   ) po ON t.PURC_ORDER_ID = po.ID AND t.PURC_ORDER_LINE_NO = po.LINE_NO
WHERE DUE_DATE >= '2024-12-01'
UNION
 SELECT t.* 
   FROM [SQL-Lab-2].[Datamart].dbo.SK_SUPPLIER_PERFORMANCE_DETAILS T
   INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO, udf.STRING_VAL
        FROM [SQL-Lab-2].[LIVEARC].[dbo].PURCHASE_ORDER p with (nolock) 
        INNER JOIN PURC_ORDER_LINE l with (nolock) ON p.id = l.PURC_ORDER_ID
        INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].USER_DEF_FIELDS udf with (nolock) ON l.PART_ID = udf.DOCUMENT_ID
        WHERE l.PART_ID IS NOT NULL AND udf.PROGRAM_ID = 'VMPRTMNT' AND udf.ID = 'UDF-0000082'
        --and udf.STRING_VAL like '%Controlled%'
                and udf.STRING_VAL  != 'Not Controlled' 
   ) po ON t.PURC_ORDER_ID = po.ID and t.PURC_ORDER_LINE_NO = po.LINE_NO
WHERE DUE_DATE < '2024-12-01'
UNION
--Join to add parts services tied to WO. 
 SELECT T.* FROM Datamart.dbo.SK_SUPPLIER_PERFORMANCE_DETAILS T 
 INNER JOIN (
        SELECT p.ID, p.VENDOR_ID, l.PART_ID, l.LINE_NO--, udf.STRING_VAL
        FROM PURCHASE_ORDER p with (nolock) 
        INNER JOIN PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
        INNER JOIN DEMAND_SUPPLY_LINK dsl with (nolock) on l.PART_ID = dsl.SUPPLY_PART_ID
            and l.PURC_ORDER_ID = dsl.SUPPLY_BASE_ID and l.LINE_NO = dsl.SUPPLY_SEQ_NO
        WHERE l.PART_ID IS NOT NULL 
   ) po ON T.PURC_ORDER_ID = po.ID AND T.PURC_ORDER_LINE_NO = po.LINE_NO
 WHERE T.DUE_DATE >= '2024-12-01'
 UNION
-- [SQL-Lab-2].[LIVEARC] Join to add parts services tied to WO. 
SELECT p.VENDOR_ID, p.ID as 'PO_Id', l.LINE_NO as 'PO_Line', l.LINE_STATUS as 'POL_Status',
    p.STATUS as 'PO_Status', l.USER_ORDER_QTY as 'POL_Order_Qty', Rl.rDate, 
    IIF(Rl.TotReceivedQty IS NULL, 0, Rl.TotReceivedQty) as 'TotReceivedQty', 
    ISNULL(Rlrj.TotalRejected*-1, 0) as 'TotalRejected', 
    convert(varchar(10), p.LAST_RECEIVED_DATE, 23) as 'DUE_DATE', 
    convert(varchar(4), DATEPART(YEAR, p.LAST_RECEIVED_DATE)) + 
    ( right('0'+convert(varchar(2), DATEPART(MONTH, p.LAST_RECEIVED_DATE)), 2) ) as 'YrMth',
    case when Rl.rDate <= p.DESIRED_RECV_DATE then 1
    else 0 end as 'OnTimeQty',
    case when Rl.rDate > p.DESIRED_RECV_DATE then 1
    else 0 end as 'LateQty',
    case when l.USER_ORDER_QTY <= l.TOTAL_USR_RECD_QTY then 1
    else 0 end as 'TotQty',
    l.PART_ID
FROM [SQL-Lab-2].[LIVEARC].[dbo].PURCHASE_ORDER p with (nolock) 
INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].PURC_ORDER_LINE l with (nolock) on p.id = l.PURC_ORDER_ID
LEFT JOIN (Select PURC_ORDER_ID as 'PO', PURC_ORDER_LINE_NO as 'PO_Line',  
    ISNULL(SUM(USER_RECEIVED_QTY), 0) as 'TotalRejected'
    from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER_LINE with (nolock) where USER_RECEIVED_QTY < 0
    group by PURC_ORDER_ID, PURC_ORDER_LINE_NO
) Rlrj on l.PURC_ORDER_ID = Rlrj.PO and l.LINE_NO = Rlrj.PO_Line
INNER JOIN (
    Select a.PURC_ORDER_ID as 'PO', a.PURC_ORDER_LINE_NO as 'PO_Line',  
        b.RECEIVED_DATE as 'rDate', SUM(a.USER_RECEIVED_QTY) as 'TotReceivedQty'
    from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER_LINE a with (nolock) 
    INNER JOIN (select distinct PURC_ORDER_ID, MIN(RECEIVED_DATE) as 'RECEIVED_DATE' 
        from [SQL-Lab-2].[LIVEARC].[dbo].RECEIVER with (nolock) group by PURC_ORDER_ID
    ) b on a.PURC_ORDER_ID = b.PURC_ORDER_ID
    where a.USER_RECEIVED_QTY > 0 --and d.id = 'METTEC' and a.PURC_ORDER_ID = '173860'
    group by a.PURC_ORDER_ID, a.PURC_ORDER_LINE_NO, b.RECEIVED_DATE
) Rl on l.PURC_ORDER_ID = Rl.PO and l.LINE_NO = Rl.PO_Line
INNER JOIN [SQL-Lab-2].[LIVEARC].[dbo].DEMAND_SUPPLY_LINK dsl with (nolock) on l.PART_ID = dsl.SUPPLY_PART_ID
            and l.PURC_ORDER_ID = dsl.SUPPLY_BASE_ID and l.LINE_NO = dsl.SUPPLY_SEQ_NO
WHERE l.PART_ID IS NOT NULL --AND p.VENDOR_ID = 'LKPREC'
and p.ORDER_DATE >= '2024-01-01' and p.ORDER_DATE < '2024-11-01'
   

;WITH VendorMonths AS
(
    SELECT a.vendor_id, mths.YearMth
    FROM ( SELECT DISTINCT vendor_id FROM  #TMP_DETAILS_1 T ) a
        CROSS APPLY LIVESupplemental.dbo.sfnMonths(@startdate, @enddate) mths
)
--SELECT * FROM VendorMonths
, FinalResults AS
(    SELECT ISNULL(v.BUYER, '00') as buyer_name
    , v.NAME vendor_name, vm.vendor_id, v.ACTIVE_FLAG, vm.YearMth YrMth
    , ISNULL(SUM(t.OntimeQty), 0) AS OntimeQuantity
    , ISNULL(SUM(t.LateQty), 0) AS LateQuantity
    , ISNULL(SUM(t.TotQty), 0) AS TotalQuantity
    , CAST(SUM(ISNULL(t.TotRejected,0)) AS NUMERIC) RejectedQty
    , CAST(SUM(ISNULL(t.TotReceivedQty,0)) AS NUMERIC) ReceivedQty
    , CAST(SUM(ISNULL(t.TotReceivedQty,0)) - SUM(ISNULL(t.TotRejected,0)) AS NUMERIC) AcceptedQty
    , SUM(ISNULL(SUM(t.OntimeQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS OntimeQuantity_RTotal
    , SUM(ISNULL(SUM(t.LateQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS LateQuantity_RTotal
    , SUM(ISNULL(SUM(t.TotQty), 0)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS TotalQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotRejected,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS RejectedQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotReceivedQty,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS ReceivedQuantity_RTotal
    , SUM(CAST(SUM(ISNULL(t.TotReceivedQty,0)) - SUM(ISNULL(t.TotRejected,0)) AS NUMERIC)) OVER (PARTITION BY vm.vendor_id ORDER BY vm.YearMth) AS AcceptedQuantity_RTotal
    , GETDATE() AS PrintDate, t.PURC_ORDER_ID
    FROM VendorMonths vm 
    LEFT JOIN #TMP_DETAILS_1 t ON vm.vendor_id = t.vendor_id  AND vm.YearMth = t.YrMth
    LEFT JOIN VENDOR v ON vm.vendor_id = v.ID
    GROUP BY v.BUYER, v.NAME, vm.vendor_id, v.ACTIVE_FLAG, vm.YearMth, t.PURC_ORDER_ID 
)

SELECT DISTINCT f.buyer_name, f.vendor_name, f.vendor_id, f.ACTIVE_FLAG, f.YrMth, 
    f.OntimeQuantity, f.TotalQuantity, f.AcceptedQty, f.ReceivedQty, 
    CASE 
        WHEN f.TotalQuantity > 0 THEN 1 
        ELSE 0 
    END AS 'CountTotQty',
    CASE 
        WHEN f.TotalQuantity > 0 
        THEN CAST(ROUND(CAST(f.OntimeQuantity AS NUMERIC) / NULLIF(CAST(f.TotalQuantity AS NUMERIC), 0), 4, 1) AS DECIMAL(20,4))  
        ELSE 0.00 
    END AS 'TotQty',
    CASE 
        WHEN f.ReceivedQty > 0 THEN 1 
        ELSE 0 
    END AS 'CountAcceptedQty',
    CASE 
        WHEN f.ReceivedQty > 0 
        THEN CAST(ROUND(f.AcceptedQty / NULLIF(f.ReceivedQty, 0), 4, 1) AS DECIMAL(20,4)) 
        ELSE 0.00 
    END AS 'TotAcceptedQty',
    f.LateQuantity, f.RejectedQty, f.OntimeQuantity_RTotal, f.LateQuantity_RTotal, f.TotalQuantity_RTotal, 
    f.RejectedQuantity_RTotal, f.ReceivedQuantity_RTotal, f.AcceptedQuantity_RTotal, f.PrintDate,
    mx.VendID, mx.LastOntimeQuantity_RTotal, mx.LastLateQuantity_RTotal, mx.LastTotalQuantity_RTotal, 
    mx.LastRejectedQuantity_RTotal, mx.LastReceivedQuantity_RTotal, mx.LastAcceptedQuantity_RTotal, 
    f.PURC_ORDER_ID, 
    CASE 
        WHEN f.TotalQuantity > 0 
        THEN f.OntimeQuantity / NULLIF(f.TotalQuantity, 0) 
        ELSE 0.00 
    END AS 'PercetOnTimeQty'
FROM FinalResults f
INNER JOIN (
    SELECT vendor_id AS VendID, OntimeQuantity_RTotal AS LastOntimeQuantity_RTotal,
           LateQuantity_RTotal AS LastLateQuantity_RTotal, TotalQuantity_RTotal AS LastTotalQuantity_RTotal,
           RejectedQuantity_RTotal AS LastRejectedQuantity_RTotal,
           ReceivedQuantity_RTotal AS LastReceivedQuantity_RTotal,
           AcceptedQuantity_RTotal AS LastAcceptedQuantity_RTotal
    FROM FinalResults a
    WHERE a.YrMth = (SELECT MAX(YrMth) FROM FinalResults)
) mx ON mx.VendID = f.vendor_id
WHERE f.vendor_id = @Vendor_id
ORDER BY f.vendor_id, f.YrMth, f.PURC_ORDER_ID;
*/

```