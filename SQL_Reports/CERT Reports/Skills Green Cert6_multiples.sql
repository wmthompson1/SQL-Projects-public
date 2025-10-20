-- Visual Enterprise Reports > CERT Reports > Skills Green Cert6_multiples
--DECLARE @PACKLIST NVARCHAR(30) = '985822'
;With cte_shippercontents AS
(
        SELECT s.PACKLIST_ID, col.* 
        , ISNULL(dsl.SUPPLY_BASE_ID, dbo.sfnGetBaseFromTraceID(TRT.TRACE_ID)) AS BASE_ID
        , ISNULL(dsl.SUPPLY_LOT_ID,  dbo.sfnGetLOTIDFromTraceID(TRT.TRACE_ID)) AS LOT_ID
        , COALESCE(dsl.SUPPLY_LOT_ID,  dbo.sfnGetSplitIDFromTraceID(TRT.TRACE_ID), '0') AS SPLIT_ID
        , ISNULL(dsl.SUPPLY_SUB_ID, '0') AS SUB_ID

        , CASE 
            WHEN col.USER_2 IS NOT NULL 
            THEN col.USER_2
            ELSE NULL 
        END AS CUST_PO_LN
        , CASE 
            WHEN col.USER_2 IS NOT NULL THEN 'Y' 
            ELSE 'N' 
        END AS CUST_POLN_PRINT
        , co.CUSTOMER_PO_REF
        
        , s.SHIPPED_DATE
        , s.SHIPPED_TIME
        --, sl.SHIPPED_QTY
        , co.CUSTOMER_ID
        , ABS(TRT.QTY) AS SHIPPED_QTY
        , co.SHIP_TO_ADDR_NO
        , w.name + CHAR(10)+CHAR(13) 
                   + w.ADDR_1 +  CHAR(10)+CHAR(13)  
                  + w.city + ', ' +  w.STATE + ' ' + w.zipcode + ' ' + 'USA' + CHAR(10)+CHAR(13) 
                  +  CHAR(10)+CHAR(13) + w.ADDR_3 
          AS SHIPFROM_aub
        , TRT.TRACE_ID
    FROM SHIPPER s
        JOIN SHIPPER_LINE sl
            ON s.PACKLIST_ID = sl.PACKLIST_ID
        JOIN CUST_ORDER_LINE col
            ON col.CUST_ORDER_ID = sl.CUST_ORDER_ID
                AND col.LINE_NO = sl.CUST_ORDER_LINE_NO
        LEFT JOIN DEMAND_SUPPLY_LINK dsl 
            ON dsl.DEMAND_BASE_ID = col.CUST_ORDER_ID
                AND dsl.DEMAND_SEQ_NO = col.LINE_NO
        LEFT JOIN TRACE_INV_TRANS TRT
            ON TRT.TRANSACTION_ID = sl.TRANSACTION_ID
            AND TRT.PART_ID = col.PART_ID
         left join INVENTORY_TRANS it
           on it.TRANSACTION_ID = sl.TRANSACTION_ID
          AND it.PART_ID = col.PART_ID
          left outer join WAREHOUSE W 
              ON IT.WAREHOUSE_ID = W.ID
        LEFT JOIN CUSTOMER_ORDER co 
            ON col.CUST_ORDER_ID = co.ID 
    WHERE s.PACKLIST_ID = @PACKLIST
        AND sl.SHIPPED_QTY <> 0
)
--SELECT * 
--FROM cte_shippercontents
, cte_WOinShipper AS
(
    SELECT DISTINCT BASE_ID, LOT_ID, SPLIT_ID , SUB_ID
    from cte_shippercontents
)
--SELECT * FROM cte_WOinShipper

, SPLIT_TREE AS 
(
    SELECT WO.BASE_ID, WO.LOT_ID, WO.SUB_ID,  WO.SPLIT_ID, WO.COPY_FROM_SPLIT_ID 
        , dbo.ufn_GetFirstOperation(WO.BASE_ID, WO.LOT_ID, WO.SUB_ID, WO.SPLIT_ID, 'W') AS First_Sequence
        , 1 as [distance from child]
    FROM WORK_ORDER WO
        JOIN cte_WOinShipper sc
            ON WO.BASE_ID = sc.BASE_ID
                AND wo.LOT_ID = sc.LOT_ID
                AND wo.SPLIT_ID = sc.SPLIT_ID
                AND wo.SUB_ID = sc.SUB_ID
                AND wo.TYPE = 'W'
    WHERE WO.[COPY_FROM_SPLIT_ID] IS NOT NULL
        AND WO.BASE_ID = sc.BASE_ID
        AND WO.LOT_ID = sc.LOT_ID
        AND WO.SUB_ID = sc.SUB_ID
        AND WO.SPLIT_ID = sc.SPLIT_ID
    UNION ALL
    SELECT WO2.BASE_ID, WO2.LOT_ID, WO2.SUB_ID, WO2.SPLIT_ID, WO2.COPY_FROM_SPLIT_ID
        , dbo.ufn_GetFirstOperation(WO2.BASE_ID, WO2.LOT_ID, WO2.SUB_ID, WO2.SPLIT_ID, 'W')
        , [distance from child] + 1
    FROM WORK_ORDER WO2
        JOIN SPLIT_TREE s  
            ON WO2.BASE_ID = s.BASE_ID
            AND WO2.SUB_ID = s.SUB_ID
            AND WO2.LOT_ID = s.LOT_ID
            AND WO2.SPLIT_ID = s.COPY_FROM_SPLIT_ID
            AND WO2.TYPE = 'W'
)
--SELECT * FROM SPLIT_TREE
, cte_ALL_Wos AS
(
    SELECT * 
    FROM SPLIT_TREE
    UNION ALL 
    SELECT * 
        , NULL, 0,0
    FROM cte_WOinShipper w
    WHERE NOT EXISTS(
        SELECT * FROM SPLIT_TREE s
        WHERE s.BASE_ID = w.BASE_ID
            AND s.LOT_ID = w.LOT_ID
            AND s.SUB_ID = w.SUB_ID
            AND s.SPLIT_ID = w.SPLIT_ID
        )
)
--SELECT * FROM cte_ALL_Wos
, cte_splithierarchyOps AS 
(
    SELECT st.BASE_ID, st.LOT_ID, st.SUB_ID, st.SPLIT_ID, st.[distance from child], COALESCE(O.SEQUENCE_NO, O2.SEQUENCE_NO, O3.SEQUENCE_NO) as SequenceNo
        , COALESCE(O.OPERATION_TYPE, O2.OPERATION_TYPE, O3.OPERATION_TYPE) AS OPERATION_TYPE
        , COALESCE(O.RESOURCE_ID, O2.RESOURCE_ID, O3.RESOURCE_ID) AS RESOURCE_ID
        , COALESCE(O.SERVICE_ID, O2.SERVICE_ID, O3.SERVICE_ID) AS SERVICE_ID
        , st.[distance from child] as StepsFromChild
        
    FROM cte_ALL_Wos st
    
        LEFT JOIN OPERATION O --split children ops
            ON st.BASE_ID = O.WORKORDER_BASE_ID
            AND st.LOT_ID = O.WORKORDER_LOT_ID
            AND st.SUB_ID = O.WORKORDER_SUB_ID
            AND st.SPLIT_ID = O.WORKORDER_SPLIT_ID
            AND O.WORKORDER_TYPE = 'W'
            AND st.COPY_FROM_SPLIT_ID IS NOT NULL
            AND EXISTS(
                    SELECT 1 FROM SPLIT_TREE s
                    WHERE s.BASE_ID = O.WORKORDER_BASE_ID
                        AND s.LOT_ID = o.WORKORDER_LOT_ID
                        AND s.SPLIT_ID = o.WORKORDER_SPLIT_ID
                        AND s.SUB_ID = o.WORKORDER_SUB_ID
                )
        LEFT JOIN OPERATION O2 --split parent ops
            ON st.BASE_ID = O2.WORKORDER_BASE_ID
            AND st.LOT_ID = O2.WORKORDER_LOT_ID
            AND st.SUB_ID = O2.WORKORDER_SUB_ID
            AND st.SPLIT_ID = O2.WORKORDER_SPLIT_ID
            AND O2.WORKORDER_TYPE = 'W'
            AND st.COPY_FROM_SPLIT_ID IS NULL
            AND O2.SEQUENCE_NO < ISNULL((SELECT TOP 1 st.First_Sequence FROM SPLIT_TREE st WHERE COPY_FROM_SPLIT_ID IS NOT NULL),0)
            AND st.First_Sequence <> 0
            --AND O2.SEQUENCE_NO <> O.SEQUENCE_NO
        LEFT JOIN OPERATION O3 --NON split ops
            ON st.BASE_ID = O3.WORKORDER_BASE_ID
                AND st.LOT_ID = O3.WORKORDER_LOT_ID
                AND st.SPLIT_ID = O3.WORKORDER_SPLIT_ID
                AND st.SUB_ID = O3.WORKORDER_SUB_ID
                AND O3.WORKORDER_TYPE = 'W'
                AND st.First_Sequence = '0'
                
)
--SELECT * FROM cte_splithierarchyOps
SELECT w.BASE_ID, w.LOT_ID, w.SPLIT_ID
    , dbo.sfnWONUMFormat(sc.BASE_ID, sc.LOT_ID, sc.SPLIT_ID, sc.SUB_ID) AS WONUM
    , dbo.sfnWONUMFormat_OLD(sc.BASE_ID, sc.LOT_ID, sc.SPLIT_ID, sc.SUB_ID) AS WONUMOld
    , w.SUB_ID
    , w.SUB_ID AS WORKORDER_SUB_ID
    , sc.CUST_PO_LN
    , w.SequenceNo
    , sc.CUST_POLN_PRINT
    , sc.CUSTOMER_PO_REF
    , sc.CUST_ORDER_ID AS Cust_order_id
    , sc.SHIPPED_QTY AS SHIP_QTY
    , CASE WHEN w.OPERATION_TYPE LIKE 'COC%' THEN CAST(CAST(sob.BITS AS VARBINARY(MAX)) AS NVARCHAR(MAX)) ELSE NULL END AS specs
    , CASE 
        WHEN sc.CUSTOMER_ID LIKE 'BOE%' and sc.CUSTOMER_ID NOT like 'BOETRN' THEN NULL
        ELSE CD.DESCRIPTION 
    END AS DESCRIPTION 
    , cd.PRINT_
    , sc.SHIPPED_QTY
    , sc.SHIPPED_DATE
    , sc.PART_ID
    , sc.USER_1
    , sc.PACKLIST_ID
    , sc.CUSTOMER_PART_ID
    
    , C.ID AS CUSTOMER_ID
    , C.NAME
    , C.ADDR_1
    , C.ADDR_2
    , C.STATE
    , C.ZIPCODE
    , C.CITY
     , CASE WHEN C.USER_9 = '3' 
           THEN 'NOSHOWFAA'
           ELSE 'SHOWFAA' 
       END AS FAA
            ,ISNULL(C.NAME,'') + CHAR(10)+CHAR(13)
                   + ISNULL(C.ADDR_1,'') +  CHAR(10)+CHAR(13)
                + ISNULL(C.ADDR_2,'') +  CHAR(10)+CHAR(13) 
                  +ISNULL(c.city + ', ' +  c.STATE + ' ' + c.zipcode + ' ' + 'USA','') AS SOLDTO2
        ,CONCAT(C.NAME,CHAR(10),CHAR(13),C.ADDR_1,CHAR(10),CHAR(13))+
         CASE WHEN C.ADDR_2 IS NOT NULL 
         THEN CONCAT(C.ADDR_2,CHAR(10),CHAR(13),C.CITY, ', ', C.STATE,' ', C.ZIPCODE, ' USA')
        ELSE CONCAT(COALESCE(C.CITY,NULL,'',C.CITY + ', '), COALESCE(C.STATE,NULL,'',C.STATE + '  '), COALESCE(C.ZIPCODE,NULL,'',C.ZIPCODE,' USA'))
        END     AS SOLDTO
    , CA.SHIPTO_ID
    , CA.NAME AS ShipName 
    , CA.ADDR_1 AS ShipAddr1
    , CA.ADDR_2 AS ShipAddr2
    , CA.CITY AS ShipCity
    , CA.STATE AS ShipState
    , CA.ZIPCODE AS ShipZip
    , CA.COUNTRY
     , CONCAT(CA.NAME,CHAR(10),CHAR(13),CA.ADDR_1,CHAR(10),CHAR(13)) +
      CASE WHEN CA.ADDR_2 IS NOT NULL 
           THEN CONCAT(CHAR(10),CHAR(13), CA.CITY, ', ', CA.STATE,' ', CA.ZIPCODE)
          ELSE ISNULL(CONCAT(CA.CITY, ', ', CA.STATE,' ', CA.ZIPCODE),'')
          END      
      + CONCAT(CHAR(10),CHAR(13),CA.COUNTRY) AS SHIPADDR
    , sc.LINE_NO
    , sc.SHIPFROM_aub
    , CASE
        WHEN R.PART_ID IS NULL THEN null
        ELSE WOD.WO_LINK
    END AS WO_LINK
    , WOD.WO_LINK AS WOLINK2
    , R.PART_ID AS REQ_PART_ID
    , R.PART_ID + ' ' + P2.DESCRIPTION AS COMPONENT
    , tp.APROPERTY_LABEL_1
    , tp.APROPERTY_LABEL_2
    , t.TRACE_ID
    , t.QTY
    , t.PROPERTY_1
    , t.PROPERTY_2
    , t.PROPERTY_3
    , t.PROPERTY_4
    , ISNULL(C.USER_7, N'N') AS CUST_FILTER
    , sc.SPLIT_ID AS TrcSPLIT_ID
    , sc.LOT_ID AS TrcLOT_ID
    , w.SequenceNo AS SEQUENCE_NO
    --, sc.SHIPPED_QTY
    , w.OPERATION_TYPE
FROM cte_splithierarchyOps w
    JOIN cte_shippercontents sc
        ON sc.BASE_ID = w.BASE_ID
            AND sc.LOT_ID = w.LOT_ID
            AND sc.SUB_ID = w.SUB_ID
            --AND sc.SPLIT_ID = w.SPLIT_ID
            --AND sc.TYPE = 'W'
    JOIN OPERATION_BINARY sob    
        ON sob.WORKORDER_BASE_ID = w.BASE_ID
            AND sob.WORKORDER_LOT_ID = w.LOT_ID
            AND sob.WORKORDER_SPLIT_ID = w.SPLIT_ID
            AND sob.WORKORDER_SUB_ID = w.SUB_ID
            AND sob.WORKORDER_TYPE = 'W'
            AND sob.SEQUENCE_NO = w.SequenceNo
    LEFT JOIN SKILLS_CERT_DESC cd
        ON cd.OP_TYPE = w.OPERATION_TYPE
    INNER JOIN SKILLS_WO_OPS_first_last_loc CLO
        ON CLO.TYPE = 'W'
        AND CLO.BASE_ID = sc.BASE_ID
        AND CLO.LOT_ID = sc.LOT_ID
        AND CLO.SPLIT_ID = sc.SPLIT_ID
        AND CLO.SUB_ID = sc.SUB_ID 
    INNER JOIN CUSTOMER CS
        ON CS.ID = CLO.CERTENDLOC
    INNER JOIN CUSTOMER C
        ON c.ID = sc.CUSTOMER_ID
    INNER JOIN CUST_ADDRESS AS CA 
        ON sc.CUSTOMER_ID = CA.CUSTOMER_ID 
        AND sc.SHIP_TO_ADDR_NO = CA.ADDR_NO
    LEFT OUTER JOIN SKILLS_WO_DOC WOD
        ON w.BASE_ID = WOD.BASE_ID
        AND w.LOT_ID = WOD.LOT_ID
        AND w.SPLIT_ID = WOD.SPLIT_ID
        AND WOD.type = 'W'
        AND sc.PART_ID = WOD.part_id
        --AND WOD.type = 'M' 
        

        --AND WOD.type = 'M'
    LEFT OUTER JOIN REQUIREMENT AS R 
        INNER JOIN PART AS P2 
            ON R.PART_ID = P2.ID 
        ON 'W' = R.WORKORDER_TYPE 
        AND w.BASE_ID = R.WORKORDER_BASE_ID
        AND w.LOT_ID = R.WORKORDER_LOT_ID 
        AND w.SPLIT_ID = R.WORKORDER_SPLIT_ID 
        AND w.SUB_ID = R.WORKORDER_SUB_ID
        AND w.SequenceNo = R.OPERATION_SEQ_NO
        AND R.SUBORD_WO_SUB_ID IS NULL
    LEFT JOIN TRACE_PROFILE tp
        ON r.PART_ID = tp.PART_ID
            AND r.SITE_ID = tp.SITE_ID
    LEFT JOIN 
    (
        SELECT SUM(TRT.QTY * - 1) AS QTY
            , CASE 
                WHEN LEFT(TP.TRACE_ID_LABEL, 5) = 'Cert#' THEN 'Cert#' 
                ELSE TP.TRACE_ID_LABEL 
            END + ': ' + TRT.TRACE_ID AS TRACE_ID
            , TRT.PART_ID
            , IT.WORKORDER_BASE_ID
            , IT.WORKORDER_LOT_ID
            , IT.WORKORDER_SPLIT_ID
            , IT.WORKORDER_SUB_ID
            , IT.OPERATION_SEQ_NO
            , IT.REQ_PIECE_NO
            , IT.WORKORDER_TYPE
            , CASE 
                WHEN T .APROPERTY_1 IS NOT NULL THEN TP.APROPERTY_LABEL_1 + ': ' + T .APROPERTY_1 
                ELSE NULL 
            END AS PROPERTY_1
            , CASE 
                WHEN T .APROPERTY_1 IS NOT NULL THEN TP.APROPERTY_LABEL_2 + ': ' + T .APROPERTY_2 
                ELSE NULL 
            END AS PROPERTY_2
            , CASE 
                WHEN T .APROPERTY_1 IS NOT NULL THEN TP.APROPERTY_LABEL_3 + ': ' + T .APROPERTY_3 
                ELSE NULL 
            END AS PROPERTY_3
            , CASE 
                WHEN T .APROPERTY_1 IS NOT NULL THEN TP.APROPERTY_LABEL_4 + ': ' + T .APROPERTY_4 
                ELSE NULL 
            END AS PROPERTY_4
        FROM INVENTORY_TRANS AS IT 
            INNER JOIN TRACE_INV_TRANS AS TRT 
                ON IT.TRANSACTION_ID = TRT.TRANSACTION_ID 
                    AND TRT.PART_ID = IT.PART_ID
                    
            INNER JOIN TRACE_PROFILE AS TP 
                ON TRT.PART_ID = TP.PART_ID 
                AND TP.SITE_ID = 'SK01'
            INNER JOIN TRACE AS T 
                ON TRT.TRACE_ID = T.ID
                AND TRT.PART_ID = T.PART_ID 
        GROUP BY TP.TRACE_ID_LABEL
            , TRT.TRACE_ID
            , TRT.PART_ID
            , IT.WORKORDER_BASE_ID
            , IT.WORKORDER_LOT_ID
            , IT.WORKORDER_SPLIT_ID 
            , T.APROPERTY_1
            , TP.APROPERTY_LABEL_1
            , T.APROPERTY_2
            , TP.APROPERTY_LABEL_2
            , T.APROPERTY_3
            , TP.APROPERTY_LABEL_3
            , T.APROPERTY_4
            , TP.APROPERTY_LABEL_4
            , IT.OPERATION_SEQ_NO
            , IT.REQ_PIECE_NO
            , IT.WORKORDER_TYPE
            , IT.WORKORDER_SUB_ID
        HAVING (SUM(TRT.QTY) <> 0)

    ) t
    ON t.WORKORDER_BASE_ID = w.BASE_ID
        AND t.WORKORDER_LOT_ID = w.LOT_ID
        AND t.WORKORDER_SPLIT_ID = w.SPLIT_ID
        AND t.WORKORDER_SUB_ID = w.SUB_ID
        AND t.WORKORDER_TYPE = 'W' 
        AND t.OPERATION_SEQ_NO = w.SequenceNo
        AND t.REQ_PIECE_NO = r.PIECE_NO
