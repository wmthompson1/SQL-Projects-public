SELECT 
	d.ID as DocumentID, 
	REFERENCE_TYPE, 
	CATEGORY_ID, 
	[DESCRIPTION], 
	REVISION_ID, 
	STAGE_ID, 
	u31.string_val as Location,
	u32.string_val as ADCN,
	u33.string_val as SerialNum,
	u34.string_val as MFGNote,
	u50.string_val as Property,
	case
		when u51.bool_val is NULL  then 'No'
		else 'Yes'
	end as ITAR,
	u52.string_val as Status,
	u53.date_val as RecDate,
	u54.string_val as StampRev,
	u55.number_val as PieceNum,
	u57.string_val as AUTM,
	u58.string_val as Cat,
	u59.string_val as CurrLoc
from	DOCUMENT d	
LEFT OUTER JOIN 
	user_def_fields u31
	on d.id = u31.document_id
	and u31.program_id = 'vmdocmnt'
	and u31.id = 'udf-0000031'	
LEFT OUTER JOIN 
	user_def_fields u32
	on d.id = u32.document_id
	and u32.program_id = 'vmdocmnt'
	and u32.id = 'udf-0000032'	
LEFT OUTER JOIN 
	user_def_fields u33
	on d.id = u33.document_id
	and u33.program_id = 'vmdocmnt'
	and u33.id = 'udf-0000033'	
LEFT OUTER JOIN 
	user_def_fields u34
	on d.id = u34.document_id
	and u34.program_id = 'vmdocmnt'
	and u34.id = 'udf-0000034'	
LEFT OUTER JOIN 
	user_def_fields u50
	on d.id = u50.document_id
	and u50.program_id = 'vmdocmnt'
	and u50.id = 'udf-0000050'	
LEFT OUTER JOIN 
	user_def_fields u51
	on d.id = u51.document_id
	and u51.program_id = 'vmdocmnt'
	and u51.id = 'udf-0000051'	
LEFT OUTER JOIN 
	user_def_fields u52
	on d.id = u52.document_id
	and u52.program_id = 'vmdocmnt'
	and u52.id = 'udf-0000052'	
LEFT OUTER JOIN 
	user_def_fields u53
	on d.id = u53.document_id
	and u53.program_id = 'vmdocmnt'
	and u53.id = 'udf-0000053'	
LEFT OUTER JOIN 
	user_def_fields u54
	on d.id = u54.document_id
	and u54.program_id = 'vmdocmnt'
	and u54.id = 'udf-0000054'	
LEFT OUTER JOIN 
	user_def_fields u55
	on d.id = u55.document_id
	and u55.program_id = 'vmdocmnt'
	and u55.id = 'udf-0000055'	
LEFT OUTER JOIN 
	user_def_fields u57
	on d.id = u57.document_id
	and u57.program_id = 'vmdocmnt'
	and u57.id = 'udf-0000057'	
LEFT OUTER JOIN 
	user_def_fields u58
	on d.id = u58.document_id
	and u58.program_id = 'vmdocmnt'
	and u58.id = 'udf-0000058'	
LEFT OUTER JOIN 
	user_def_fields u59
	on d.id = u59.document_id
	and u59.program_id = 'vmdocmnt'
	and u59.id = 'udf-0000059'