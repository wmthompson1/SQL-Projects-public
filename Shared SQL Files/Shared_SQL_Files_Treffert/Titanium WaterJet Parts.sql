use live
go

SELECT 
	wo.part_id, p.[description], UDF.STRING_VAL, wo.type, wo.status, wo.close_date, wo.*
FROM 
	LIVE.dbo.PART AS P 
inner JOIN 
	LIVE.dbo.USER_DEF_FIELDS AS UDF 
		ON P.ID = UDF.DOCUMENT_ID
		and UDF.ID = 'UDF-0000035' 
		AND UDF.STRING_VAL LIKE '%titan%'
inner join 
	work_order wo
		on wo.part_id = p.id
inner join 
	operation
		on wo.[BASE_ID] = [WORKORDER_BASE_ID]
		and wo.[LOT_ID] = [WORKORDER_LOT_ID]
		and wo.[SPLIT_ID] = [WORKORDER_SPLIT_ID]
		and wo.[SUB_ID] = [WORKORDER_SUB_ID]
		and wo.[type] = [WORKORDER_TYPE]
where 
	[RESOURCE_ID] = 'Waterjet'

order by p.id, wo.[type]

