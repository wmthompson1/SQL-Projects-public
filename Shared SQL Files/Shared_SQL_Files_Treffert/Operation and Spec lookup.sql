use live
go

select 
o.[WORKORDER_TYPE],
o.[WORKORDER_BASE_ID],
o.[WORKORDER_LOT_ID],
o.[WORKORDER_SPLIT_ID],
o.[WORKORDER_SUB_ID],
wo.part_id,
UDF.STRING_VAL,
o.[SEQUENCE_NO],
o.[RESOURCE_ID],
O.[OPERATION_TYPE],
V.SPECS
from	   Operation o
left outer join 
	[SKILL_OPERATION_BINARY] v
    on  o.[WORKORDER_TYPE] = 'M'
    and o.[WORKORDER_BASE_ID] = v.[WORKORDER_BASE_ID]
    and o.[WORKORDER_LOT_ID] = v.[WORKORDER_LOT_ID]
    and o.[WORKORDER_SPLIT_ID] = v.[WORKORDER_SPLIT_ID]
    and o.[WORKORDER_SUB_ID] = v.[WORKORDER_SUB_ID]
    and o.[SEQUENCE_NO] = v.[SEQUENCE_NO]
left outer join 
	[work_order] wo
	on  wo.[TYPE] = 'M'
	and o.[WORKORDER_BASE_ID] = wo.[BASE_ID]
	and o.[WORKORDER_LOT_ID] = wo.[LOT_ID]
	and o.[WORKORDER_SPLIT_ID] = wo.[SPLIT_ID]
	and o.[WORKORDER_SUB_ID] = wo.[SUB_ID]
left JOIN 
	LIVE.dbo.USER_DEF_FIELDS AS UDF 
	ON wo.part_ID = UDF.DOCUMENT_ID
where o.workorder_type = 'M'
and o.resource_id like '%contractor%'
--and specs like '%BAC%5763%'
and specs like '%Mapsco%' 
--and (specs like '%Mapsco%' or o.OPERATION_TYPE like '%Mapsco%')
and UDF.ID = 'UDF-0000035' 
AND UDF.STRING_VAL LIKE '%titan%'


