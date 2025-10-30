SELECT
	wo.type, 
	wo.base_id, 
	wo.lot_id, 
	wo.split_id, 
	wo.sub_id, 
	wo.part_id,
	Case 
		when PLANNER_USER_ID = 'NA' then 'FIN'
		else 'MFG'
	end as business_stream, 
	p.planner_user_id, 
	p.commodity_code, 
	CASE 
		WHEN wo.DESIRED_WANT_DATE IS NULL 
			THEN (select max(wo1.DESIRED_WANT_DATE) 
			from work_order wo1 
			where  wo.TYPE = wo1.TYPE
			and wO.BASE_ID = wo1.BASE_ID
			)
		ELSE wo.DESIRED_WANT_DATE
	END AS due_date,
	wo.DESIRED_QTY, 
	dbo.sfn_surface_area_for_part(wo.PART_ID) as surface_area
FROM 
	work_order wo
INNER JOIN 
	part p
	on p.id = part_id
INNER JOIN 
	dbo.skills_part_surface_area AS psa
	ON wo.part_id = psa.part_id
WHERE 
	wo.STATUS = 'R'
	and dbo.sfn_surface_area_for_part(wo.PART_ID) = 0
	and wo.part_id not like '%rew%'
	and p.PLANNER_USER_ID <> 'TOOLING'
	and wo.part_id not like '%boltboards%'
GROUP BY  
	wo.type, 
	wo.base_id, 
	wo.lot_id, 
	wo.split_id, 
	wo.sub_id, 
	wo.part_id,
	p.planner_user_id, 
	p.commodity_code, 
	wo.DESIRED_QTY, 
	wo.desired_want_date


