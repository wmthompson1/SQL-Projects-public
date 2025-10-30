/*
select *
from REQUIREMENT
where WORKORDER_BASE_ID = '1330531'
*/

SELECT
	base_id,
	lot_id,
	o.WORKORDER_TYPE, o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID, o.WORKORDER_SPLIT_ID, o.WORKORDER_SUB_ID, o.SEQUENCE_NO, o.RESOURCE_ID, o.SERVICE_ID, o.VENDOR_ID, 
	r.PIECE_NO, r.SUBORD_WO_SUB_ID, r.PART_ID,
	v.specs
FROM 
	work_order wo
INNER JOIN
	operation o
        on wo.[type] = o.[WORKORDER_TYPE]
		and wo.base_id = o.workorder_base_id
        and wo.[LOT_ID] = o.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = o.WORKORDER_SPLIT_ID
		and wo.[SUB_ID] = o.WORKORDER_SUB_ID
left outer join
	requirement r
        on wo.[type] = r.[WORKORDER_TYPE]
		and wo.base_id = r.workorder_base_id
        and wo.[LOT_ID] = r.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = r.WORKORDER_SPLIT_ID
		and wo.[SUB_ID] = r.WORKORDER_SUB_ID
		and r.[OPERATION_SEQ_NO] = o.SEQUENCE_NO
left outer join
	[SKILL_OPERATION_BINARY] v
        on wo.[type] = v.[WORKORDER_TYPE]
		and wo.base_id = v.workorder_base_id
        and wo.[LOT_ID] = v.[WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = v.WORKORDER_SPLIT_ID
		and wo.[SUB_ID] = v.WORKORDER_SUB_ID
		and o.SEQUENCE_NO = v.SEQUENCE_NO
WHERE 
	base_id = '1330531'
ORDER BY 
	o.workorder_sub_id, sequence_no