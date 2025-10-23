/**********************************************************************************************
Description: Code Base 2.1.0 - Work Order
Sample:			

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
6/30/2020						Created.

**********************************************************************************************/
--~
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW
 
if object_id('tempdb..#results') is not null drop table #results

if object_id('tempdb..#work_order') is not null drop table #work_order
if object_id('tempdb..#user_def_fields') is not null drop table #user_def_fields

SELECT *
  INTO #WORK_ORDER 
FROM dbo.WORK_ORDER wo (NOLOCK)
WHERE EXISTS(
		SELECT 1 FROM dbo.WORK_ORDER wo2 (NOLOCK)
		WHERE (
			wo2.[TYPE] = wo.[TYPE]
			AND wo2.[BASE_ID] = wo.[BASE_ID]
			AND wo2.[LOT_ID] = wo.[LOT_ID]
			AND wo2.[SPLIT_ID] = wo.[SPLIT_ID]
			AND wo2.[SUB_ID] = wo.[SUB_ID]
     

		AND wo2.[STATUS] IN (N'R', N'F', N'U')
		AND wo2.[TYPE] = N'W'
		))

CREATE CLUSTERED INDEX CIDX_WO2 ON #WORK_ORDER
(
		[BASE_ID]
		,[LOT_ID]
		,[SPLIT_ID]
		,[SUB_ID]
		,[TYPE]

)

SELECT * 
   INTO #USER_DEF_FIELDS
FROM dbo.USER_DEF_FIELDS pud
WHERE (1=1)
AND ( --
		pUD.PROGRAM_ID	IN (N'VMPRTMNT', N'VMMFGWIN_WO', N'VMMFGWIN_OP')
	)

CREATE CLUSTERED INDEX CIDX_PUD ON #USER_DEF_FIELDS (
			 DOCUMENT_ID
			,ID 
			,PROGRAM_ID 
			)

select 
	  wonum.wonum
	, w.STATUS  -- work order status
	, w.part_id
	, w.desired_want_date
	, p.buyer_user_id buyer_user_id
	, rtrim(p.planner_user_id) planner_user_id
	, p.commodity_code
	, p.[description]
	, b.Salesperson_ID
from #work_order w
left join #work_order enditem
	on enditem.[type] = w.[type]
	and enditem.[base_id] = w.[base_id]
	and enditem.[lot_id] = w.[lot_id]
	and enditem.[split_id] = w.[split_id]
	and enditem.[sub_id] = '0'
inner join part p
on w.part_id = p.id
left outer join [sql-lab-2].livesupplemental.dbo.buyer_assn b
on left(p.buyer_user_id, 2) = b.account_id
outer APPLY
	(
	-- material
	select top 1
		 pud2.document_id
		,pud2.id
		,pud2.label
		,nullif(pud2.string_val,'') material
		,pud2.program_id
		,p2.id part_id
	from #user_def_fields pud2
	join part p2 
	on pud2.document_id = p2.id
	where (1=1)
	and pud2.id in ('udf-0000035') -- material
	and pud2.program_id = 'vmprtmnt'
	and pud2.document_id is not null
	and w.part_id = pud2.document_id
	) material

	outer APPLY (
	-- alloy
		select top 1
				pud3.document_id
			,pud3.id
			,pud3.label
			,nullif(pud3.string_val,'') alloy
			,pud3.program_id
			,p3.id part_id
		from #user_def_fields pud3
		join part p3 
		on pud3.document_id = p3.id
		where (1=1)
		and pUD3.ID in ('UDF-0000036')  -- prtMnt Alloy
		AND pUD3.PROGRAM_ID = 'VMPRTMNT'
		and pUD3.DOCUMENT_ID is not null
		AND w.PART_ID = pUD3.DOCUMENT_ID
	) alloy

cross apply (
   -- wonum
   select
     w.base_id 
	    + case when isnull(w.sub_id,'0') = '0' then 
			''
			else '-'+ w.sub_id  end
	    + '/' + w.lot_id
	    + case when isnull(w.split_id,'0') = '0' then 
			''
			else '.'+ w.split_id end

		as wonum
     
	 ) wonum
where (1=1)