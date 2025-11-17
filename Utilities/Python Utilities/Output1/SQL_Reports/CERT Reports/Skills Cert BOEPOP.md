# Skills Cert BOEPOP

```sql
-- Visual Enterprise Reports > CERT Reports > Skills Cert BOEPOP
--declare @packlist_id as nvarchar(30)
--set @packlist_id  = '1041064'

;with cte_shippercontents
    AS (
SELECT 
    CASE WHEN CHARINDEX('-',trt.trace_id) <> '0'  -- SUB
        THEN left(trt.trace_id, CHARINDEX('-',trt.trace_id)-1)
        ELSE 
        CASE 
            WHEN CHARINDEX('/',trt.trace_id) <> '0'
            THEN left(trt.trace_id, CHARINDEX('/',trt.trace_id)-1)
            ELSE 
            CASE 
                WHEN isnull(dbo.udf_getnthcharacteroccurrence(trt.trace_id,'/',2),0) = '0'
                THEN '0'
                ELSE substring(trt.trace_id, dbo.udf_getnthcharacteroccurrence(trt.trace_id,'/',2)+1,dbo.udf_getnthcharacteroccurrence(trt.trace_id,'/',2)+2) 
            END
        END
    END AS workorder_base_ID,
    substring(trt.trace_id, CHARINDEX('/',trt.trace_id)+1, 1) as workorder_lot_id,
    case when isnull(dbo.udf_getnthcharacteroccurrence(trt.trace_id,'.',1),0) = '0'
        then '0'
        else substring(trt.trace_id, CHARINDEX('.',trt.trace_id)+1, 1)
    end  as workorder_split_id,
    CASE WHEN CHARINDEX('-',trt.trace_id) <> '0'  -- SUB
        THEN substring(trt.trace_id, CHARINDEX('/',trt.trace_id)+1, 1)
        ELSE '0'
    END AS workorder_sub_ID,
    trt.transaction_id,
    trt.trace_id,
    col.part_id,
    psv.description as part_description, 
    s.user_1,
    s.user_2,
    s.user_3,
    s.user_4,
    s.user_5,
    s.user_6,
    s.user_7,
    s.user_8,
    s.user_9,
    s.user_10,
    DBO.fnFormatDate(S.SHIPPED_DATE,'M/D/YYYY') AS SHIPPED_DATE,
                   w.name + CHAR(10)+CHAR(13) 
         + w.ADDR_1 +  CHAR(10)+CHAR(13)  
        + w.city + ', ' +  w.STATE + ' ' + w.zipcode + ' ' + 'USA' + CHAR(10)+CHAR(13) 
        +  CHAR(10)+CHAR(13) + w.ADDR_3 AS SHIPFROM_aub,
    sl.cust_order_id,
    sl.cust_order_line_no,
    col.customer_part_id ,
    co.customer_po_ref,
    co.customer_id,
    co.ship_to_addr_no,
    CASE
        WHEN col.user_2 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
    END AS                                  cust_poln_print,
    col.user_2 AS                           cust_po_ln,
    ISNULL(ABS(trt.qty), sl.shipped_qty) AS wo_shipped_qty
FROM   shipper_line AS sl
        INNER JOIN shipper AS s
        ON sl.packlist_id = s.packlist_id
        INNER JOIN cust_order_line AS col
        ON sl.cust_order_id = col.cust_order_id
        AND sl.cust_order_line_no = col.line_no
        INNER JOIN customer_order AS co
        ON col.cust_order_id = co.id
        AND CO.CUSTOMER_ID like 'BOE%'
        INNER JOIN trace_inv_trans AS trt
        ON  sl.transaction_id=trt.transaction_id
        INNER JOIN inventory_trans it
        on it.transaction_id = trt.TRANSACTION_ID
        LEFT OUTER JOIN PART_SITE_VIEW PSV
        ON PSV.PART_ID = COL.PART_ID
        left outer join WAREHOUSE w
         on it.WAREHOUSE_ID = w.ID
WHERE  sl.packlist_id = @packlist_id
        AND ISNULL(ABS(trt.qty), sl.shipped_qty) > 0
    )
,
    cte_customerinfo
    AS (SELECT
             ca.*,
             c.id AS                    cust_id,
             ISNULL(c.name, NULL) AS    soldto_name,
             ISNULL(c.addr_1, NULL) AS  soldto_addr1,
             ISNULL(c.addr_2, NULL) AS  soldto_addr2,
             ISNULL(c.city, NULL) AS    soldto_city,
             ISNULL(c.state, NULL) AS   soldto_state,
             ISNULL(c.zipcode, NULL) AS soldto_zipcode
        FROM
        (
             SELECT TOP 1
                   customer_id,
                   ship_to_addr_no
             FROM   cte_shippercontents
        ) AS sc
        inner JOIN cust_address AS ca
        ON sc.customer_id = ca.customer_id
          AND ca.addr_no = sc.ship_to_addr_no
        INNER JOIN customer AS c
        ON sc.customer_id = c.id
      )
     ,
    cte_operations
    AS (SELECT
             *
        FROM   operation o
        WHERE EXISTS(
             SELECT 1 
             FROM cte_shippercontents s
             WHERE s.workorder_base_ID = o.WORKORDER_BASE_ID
                AND s.workorder_lot_id = o.WORKORDER_LOT_ID
                AND s.workorder_split_id = o.WORKORDER_SPLIT_ID
                AND s.workorder_sub_id = o.WORKORDER_SUB_ID
                
            )
            AND o.workorder_type = 'W'
            and operation_type = 'BOENOTE')
     ,
    cte_workorders
    AS (SELECT
             *
        FROM   work_order
        WHERE  base_id IN
        (
             SELECT
                   workorder_base_id
             FROM   cte_shippercontents
        )
             AND type = 'W')

--select * from cte_workorders
--select * from cte_shippercontents
/******************************
GET SPLITS - UNLINKED
******************************/
,    
     cte_workorder_ops_breakdown
    AS (
    SELECT
          sc.*,
          x.stepsfromchild,
          x.sequenceno,
          x.base_id,
          x.lot_id,
          x.sub_id,
          x.split_id AS sourcewo_split_id ,
          wo.split_id AS current_split_id,
          x.operation_type,
          x.resource_id,
          x.service_id
          
    FROM     cte_shippercontents AS sc
    INNER JOIN cte_operations o
      ON sc.workorder_base_id = o.workorder_base_id
      AND sc.workorder_lot_id = o.workorder_lot_id
      AND sc.workorder_sub_id = o.workorder_sub_id
      AND sc.workorder_split_id = o.workorder_split_id
      AND o.workorder_type = 'W'
    LEFT JOIN cte_workorders AS wo
            ON  wo.copy_from_split_id IS NOT NULL
            and wo.split_id <> '0'
            AND wo.part_id = sc.part_id 

    CROSS APPLY ( SELECT * FROM dbo.sfngetsplitparentoperations( sc.workorder_base_id,sc.workorder_lot_id,sc.workorder_sub_id,sc.workorder_split_id) s
            WHERE s.BASE_ID = wo.BASE_ID
                AND s.LOT_ID = wo.LOT_ID
                AND s.SUB_ID = wo.SUB_ID

        )AS x


UNION ALL

/*****************************
GET NON-SPLITS Unlinked Orders
*****************************/

    SELECT
          sc.*,
          0,
          o.sequence_no,
          wo.base_id,
          wo.lot_id,
          wo.sub_id,
          wo.split_id AS sourcewo_split_id,
          wo.split_id AS current_split_id,
          o.operation_type,
          o.resource_id,
          o.service_id
    FROM   cte_shippercontents AS sc
    INNER JOIN cte_workorders AS wo
       ON sc.workorder_base_id = wo.base_id
      AND sc.workorder_lot_id = wo.lot_id
      AND sc.workorder_split_id = wo.split_id 
      AND sc.workorder_sub_id = wo.sub_id 
      AND wo.copy_from_split_id IS NULL
      AND wo.split_id = '0'
      AND wo.part_id = sc.part_id 

/*************************************
ADDED TO PREVENT RETURN OF CO-PRODUCTS
*************************************/

    left outer JOIN cte_operations AS o
       ON wo.base_id = o.workorder_base_id
      AND wo.lot_id = o.workorder_lot_id
      AND wo.sub_id = o.workorder_sub_id
      AND wo.split_id = o.workorder_split_id
      AND o.workorder_type = 'W'
)
           -- select * from cte_workorder_ops_breakdown
        

--select * from cte_shippercontents

SELECT
          sc.*,
          dbo.sfnSKILLS_WO_DOC_LINK_NO_LOC_BYPARTID (sc.PART_ID) AS skills_wo_doc_no_loc,
          --dbo.sfnskills_wo_doc_link_no_loc(sc.workorder_base_id, sc.workorder_lot_id, sc.workorder_sub_id, sc.workorder_split_id, 'W') AS  skills_wo_doc_no_loc,
          dbo.sfnskills_wo_doc_link(sc.workorder_base_id, sc.workorder_lot_id, sc.workorder_sub_id, sc.workorder_split_id, 'W') AS       skills_wo_doc,
          ISNULL(ci.name, '')+CHAR(10)+CHAR(13)+ISNULL(ci.addr_1, '')+' '+ISNULL(ci.addr_2, '')+CHAR(10)+CHAR(13)+ISNULL(ci.city, '')+' '+ISNULL(ci.state, '')+' '+ISNULL(ci.zipcode, '')+' '+ISNULL(ci.country, '') AS              shipto,
          ISNULL(ci.soldto_name, '')+CHAR(10)+CHAR(13)+ISNULL(ci.soldto_addr1, '')+' '+ISNULL(ci.soldto_addr2, '')+CHAR(10)+CHAR(13)+ISNULL(ci.soldto_city, '')+' '+ISNULL(ci.soldto_state, '')+' '+ISNULL(ci.soldto_zipcode, '') AS soldto,
          CONVERT(NVARCHAR(MAX), CONVERT(VARBINARY(MAX), ob.bits)) AS  operationdescription,
/*****
*************************************/                 
                CASE WHEN CI.CUSTOMER_ID LIKE 'BOE%' 
              THEN CASE WHEN W.OPERATION_TYPE IN ('BOENOTE')  --'cocp' 
                          THEN 'SHOW'
                             ELSE 'HIDE'
                       END
           ELSE 'SHOW'
          END AS BOECONTROL,
          CASE WHEN  (
                     CASE WHEN W.OPERATION_TYPE IN ('BOENOTE')
                                   THEN 'MFG-PRINT'
                                   ELSE 'FIN-NO PRINT'
                 END 
                ) = 'MFG-PRINT' 
                THEN 'SHOW'
                ELSE 'HIDE'
             END AS OPTYPCONTROL, 
           --ISNULL(SCD.CUST_FILTER_APPLIED, 'N') AS OP_FILTER,
            ISNULL(CI.USER_7, 'N') AS CUST_FILTER,
          (select sum(abs(trt.qty)) 
                from shipper_line sl
              inner join TRACE_INV_TRANS AS TRT
                  ON SL.TRANSACTION_ID = TRT.TRANSACTION_ID
               and sl.PACKLIST_ID =  @packlist_id)--'959932')--
               as totqty,

/*****
*************************************/    
          ci.name,
          ci.addr_1,
          ci.addr_2,
          ci.addr_3,
          ci.city,
          ci.state,
          ci.zipcode,
          ci.country,
          ci.salesrep_id, 
          w.sourcewo_split_id,

          dbo.sfngetlastwolocation(sc.workorder_base_ID, sc.workorder_lot_id, sc.workorder_sub_ID, sc.workorder_split_id) AS    ship_from
     FROM cte_shippercontents sc
    INNER JOIN cte_customerinfo AS ci
        ON ci.customer_id = sc.customer_id
     left outer join cte_workorder_ops_breakdown AS w
      ON w.base_id = sc.workorder_base_id
      AND w.lot_id = sc.workorder_lot_id
      AND w.sub_id = sc.workorder_sub_id

     left outer JOIN operation_binary AS ob
        ON w.base_id = ob.workorder_base_id
      AND w.lot_id = ob.workorder_lot_id
      AND w.sub_id = ob.workorder_sub_id
      AND w.sourcewo_split_id = ob.workorder_split_id
      AND ob.workorder_type = 'W'
      AND w.sequenceno = ob.sequence_no

```