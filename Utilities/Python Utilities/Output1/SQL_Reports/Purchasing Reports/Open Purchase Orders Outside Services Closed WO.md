# Open Purchase Orders Outside Services Closed WO

```sql
SELECT distinct
    po.ID 
    , po.VENDOR_ID
    , po.ORDER_DATE 
    , pol.LINE_NO
    , pol.DESIRED_RECV_DATE
    , pol.ORDER_QTY
    , pol.PART_ID
    , 'W' as [type] 
    , DSL.DEMAND_BASE_ID as base_id
    , DSL.DEMAND_LOT_ID as lot_id
    , DSL.DEMAND_SPLIT_ID as split_id
    , DSL.DEMAND_SUB_ID as sub_id
    , (select REPLACE(REPLACE(CAST(CAST(n.note AS varbinary(max)) AS nvarchar(max)), CHAR(10),''),CHAR(13),'') AS note  
        from notation n
        where 
            n.owner_id = wo.base_id + '/'+ wo.lot_id
            and n.type = 'E' 
        FOR XML PATH('')
    ) AS notes
FROM PURCHASE_ORDER AS po
inner JOIN PURC_ORDER_LINE AS Pol
    ON po.ID = pol.PURC_ORDER_ID 
INNER JOIN DEMAND_SUPPLY_LINK AS DSL
    ON pol.PURC_ORDER_ID = DSL.SUPPLY_BASE_ID
    AND pol.LINE_NO = DSL.SUPPLY_SEQ_NO
INNER join work_order wo
    on dsl.demand_base_id = wo.BASE_ID
    and dsl.DEMAND_LOT_ID = wo.LOT_ID
    and dsl.DEMAND_SPLIT_ID = wo.SPLIT_ID
    and dsl.DEMAND_SUB_ID = wo.SUB_ID
    and wo.STATUS = 'C'
LEFT OUTER JOIN RECEIVER AS R
    ON po.ID = R.PURC_ORDER_ID 
WHERE 
    po.VENDOR_ID NOT IN ('ANALAB', 'OLYSCI', 'VECTOR')
    AND DSL.DEMAND_BASE_ID IS NOT NULL
    and R.PURC_ORDER_ID is null
    AND pol.DESIRED_RECV_DATE > GETDATE()-60
ORDER BY pol.DESIRED_RECV_DATE

```