USE live
go

/*
select skills_type, id from shop_resource where id like 'ANM%'

update sr
   set skills_type = 'E'
  from shop_resource sr 
 where id in ('ANM-handburr', 'ANM-stores', 'ANM-cncrouter', 'ANM-insp', 'ANM-FINALinsp', 'ANM-fladderburr', 'ANM-mask', 'ANM-pm', 'ANM-mylar', 'ANM-countersink')
*/

select 
	 ID, Skills_type, DESCRIPTION, TYPE, SHIFT_1_CAPACITY, SHIFT_2_CAPACITY, SHIFT_3_CAPACITY
from 
	shop_resource 
where 
	id in ('ANM-handburr', 
			'ANM-stores', 
			'ANM-cncrouter', 
			'ANM-insp', 
			'ANM-FINALinsp', 
			'ANM-fladderburr', 
			'ANM-mask', 
			'ANM-pm', 
			'ANM-mylar', 
			'ANM-countersink')
	--and shift_1_capacity = '0'
	--id like 
	--		'%handburr%'
	--		'%stores%'
	--		'%cncrouter%'
	--		'%insp%'  -- no South FinalInsp
	--		'%fladderburr%'  -- no South
	--		'%mask%'
	--		'%pm%'
	--		'%mylar%'  -- no South
	--		'%countersink%'  -- no South
order by 
	[description]

--use LIVESupplemental
--go
--select 
--	*
--from 
--	[dbo].[ResourceID_Assignments]
--where skills_type = 'E'
--order by 
--	Resource_ID


--delete from ResourceID_Assignments 
--where resource_id like 'anm-%'
--INSERT INTO ResourceID_Assignments VALUES ('ANM-cncrouter', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'CNC Router - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'Fabrication', 8, 'CNC', 'Skyflex', 99, 3, NULL, 8, 'CNC', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-handburr', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Hand burr - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'Fabrication', 8, 'Deburr', 'Skyflex', 99, 4, NULL, 14, 'Deburr', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-insp', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Dimensional inspection - Auburn North MF', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 4, NULL, 17, 'Inspection', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-mask', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Masking - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, 'N/A', 'Skyflex', 99, 0, NULL, 0, 'N/A', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-stores', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'material Issue to/from stores - Auburn N', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 4, NULL, 0, 'N/A', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-pm', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'part mark - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'Paint', 6, 'Part Mark', 'Skyflex', 99, 2, NULL, 6, 'Paint', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-FINALinsp', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Final inspection - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 0, NULL, 0, 'N/A', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-fladderburr', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Fladder deburr - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 0, NULL, 0, 'N/A', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-mylar', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Mylar Application - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 0, NULL, 0, 'N/A', 'Auburn North');
--INSERT INTO ResourceID_Assignments VALUES ('ANM-countersink', 'Skyflex', 'Skyflex', 'Ryan Shirts', 'E', 'N', 'Countersink - Auburn North MFG', NULL, NULL, NULL, NULL, NULL, 'N/A', 0, NULL, 'Skyflex', 99, 0, NULL, 0, 'N/A', 'Auburn North');
