use live
go

select 
	id, 
	[description],
	[status]
from
	part
where 
	id in ('7200-112', '7200-231', '7200-850', 'NAS1922-01750-1H')
	or [description] like '%obsolete%'
order by 
	[status]

--update part
--	set 
--		[status] = 'O',
--		[description] = 'OBSOLETE DO NOT USE'
--where 
--	id = '7200-112'

--update part
--	set 
--		[status] = 'O',
--		[description] = 'OBSOLETE Aldox V- Quarterly IGA'
--where 
--	id = '7200-231'

--update part
--	set 
--		[status] = 'O',
--		[description] = 'OBSOLETE DO NOT USE'
--where 
--	id = '7200-850'

--update part
--	set 
--		[status] = 'O',
--		[description] = 'OBSOLETE CLAMP'
--where 
--	id = 'NAS1922-01750-1H';

--update part
--	set 
--		[status] = 'O'
--where 
--	id in ('70507P-1250x3.25x8.75', '70507P-1500X17.70X17.70');

select 
	id, 
	[description],
	[status]
from
	part
where 
	id in ('7200-112', '7200-231', '7200-850', 'NAS1922-01750-1H')
	or [description] like '%obsolete%'
order by 
	[status]