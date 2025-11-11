# WIP

```sql
SELECT 
    wo.BASE_ID, 
    wo.LOT_ID, 
    wo.SPLIT_ID, 
    wo.SUB_ID, 
    wo.CREATE_DATE, 
    wo.[STATUS],
    wo.DESIRED_WANT_DATE,
    wo.DESIRED_RLS_DATE,
    wo.PART_ID,
    wo.TYPE, 
    wo.ACT_MATERIAL_COST + wo.ACT_LABOR_COST + wo.ACT_SERVICE_COST as WIPvalue,
    'over 30' as Days30,
    T.lastTKTtransid,
    T.TRANSACTION_DATE,
    T.LASTEMPNAME,
    T.OPERATION_SEQ_NO,
    T.RESOURCE_ID,
    CASE 
        WHEN SKILLS_TYPE IS NULL THEN 'No Operations'
        WHEN SKILLS_TYPE = 'A' THEN 'Auburn'
        WHEN SKILLS_TYPE = 'B' THEN 'Ballard'
        WHEN SKILLS_TYPE = 'E' THEN 'MFG-AubNorth'
        WHEN SKILLS_TYPE = 'M' THEN 'MFG-AubSouth'
        WHEN SKILLS_TYPE = 'O' THEN 'Outreach'
        ELSE 'Contractor'
    END as [location],
    CO.CUSTOMER_ID
    , SKILLS_TYPE
FROM WORK_ORDER wo 
left outer join 
    svw_last_ticket_info_no_limit T 
    on wo.BASE_ID = t.WORKORDER_BASE_ID
    and wo.LOT_ID = t.WORKORDER_LOT_ID
    and wo.SPLIT_ID = t.WORKORDER_SPLIT_ID
    AND wo.SUB_ID = t.WORKORDER_SUB_ID
    and wo.[type] = t.WORKORDER_TYPE
LEFT OUTER JOIN 
    DEMAND_SUPPLY_LINK DSL
    ON SUPPLY_BASE_ID = wo.BASE_ID
    AND SUPPLY_LOT_ID = wo.LOT_ID
    AND SUPPLY_SPLIT_ID = wo.SPLIT_ID
    AND SUPPLY_SUB_ID = wo.SUB_ID
LEFT OUTER JOIN 
    CUST_ORDER_LINE COL
    ON DSL.DEMAND_BASE_ID = COL.CUST_ORDER_ID
    AND DSL.DEMAND_SEQ_NO = COL.LINE_NO
LEFT OUTER JOIN 
    CUSTOMER_ORDER CO
    ON CO.ID = COL.CUST_ORDER_ID
left outer join 
    OPERATION SO 
    on SO.WORKORDER_TYPE = wo.TYPE 
    AND SO.WORKORDER_BASE_ID = wo.BASE_ID 
    AND SO.WORKORDER_LOT_ID = wo.LOT_ID 
    AND SO.WORKORDER_SPLIT_ID = wo.SPLIT_ID 
    AND SO.WORKORDER_SUB_ID = wo.SUB_ID 
    and SO.SEQUENCE_NO = -- q2.MIN_OP
        dbo.ufn_GetFirstOperation(Wo.BASE_ID, Wo.lot_ID, Wo.sub_ID, Wo.split_ID, wo.[type])
INNER JOIN 
    SHOP_RESOURCE S
    ON SO.RESOURCE_ID = S.ID
WHERE 
    wo.STATUS IN ('F','R','U')
    and wo.TYPE = 'W'
    and wo.DESIRED_want_DATE <= convert(date, GETDATE()-31,(111))

```