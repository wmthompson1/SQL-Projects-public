# WorkOrder Monitor

```sql
select 
    base_id, lot_id, split_id, sub_id, part_id,
    CURR_OP,
    o.RESOURCE_ID,
    o.OPERATION_TYPE,
    REMAINING_OPS
From
(select base_id, lot_id, split_id, sub_id, part_id,
    (SELECT SEQUENCE_NO 
    FROM 
    LIVESupplemental.dbo.WO_CURRENTLY_AT 
    WHERE 
    WORKORDER_TYPE = W.TYPE 
    AND WORKORDER_BASE_ID = W.BASE_ID
    AND WORKORDER_LOT_ID = W.LOT_ID 
    AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
    AND WORKORDER_SUB_ID = W.SUB_ID
    ) AS CURR_OP,
    (SELECT REMAINING_OPS 
    FROM 
    LIVESupplemental.dbo.WO_CURRENTLY_AT 
    WHERE 
    WORKORDER_TYPE = W.TYPE 
    AND WORKORDER_BASE_ID = W.BASE_ID 
    AND WORKORDER_LOT_ID = W.LOT_ID 
    AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
    AND WORKORDER_SUB_ID = W.SUB_ID
    ) AS REMAINING_OPS
FROM 
    WORK_ORDER W 
where 
    w.base_id in ('1416168', '1416489', '1416970', '1417170', '1417172', '1417736', '1417796', '1418734', '1418745', '1418889', '1418891')
) Base
inner join 
    operation o
    on o.WORKORDER_type = 'W'
    and base.base_id = o.WORKORDER_BASE_ID
    and base.lot_id = o.WORKORDER_LOT_ID
    and base.split_id = o.WORKORDER_split_ID
    and base.sub_id = o.WORKORDER_sub_ID
    and base.curr_op = o.SEQUENCE_NO
order by base_id

```