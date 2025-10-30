use live
go


select 
	[year],
	[month],
	[location],
	sum(Desired_Qty) as Desired_Qty
FROM
	(select
		msg,
	--    PartID + '~' + BASE_ID + '-' + LOT_ID + '-' + SPLIT_ID + '-' + SUB_ID as [Key],
		PartID + '~' + BASE_ID + '-' + LOT_ID + '-' + SUB_ID as [Key],
		PartID,
		ChildPart,
		[status],
		Desired_Qty,
		DESIRED_WANT_DATE,
		year(DESIRED_WANT_DATE) as [Year],
		datename(mm, DESIRED_WANT_DATE) as [Month],
		location, 
		sum(HoursWorked) as HoursWorked	
	from
		(select 
			'wo' as msg,
			w.BASE_ID,
			w.LOT_ID,
			w.SPLIT_ID,
			w.SUB_ID,
			w.[status],
			case
			   when w.part_id like '%rework%' then w2.part_id
			   when w.part_id like '%tooling%' then w2.part_id
			   when w.part_id is NULL then w2.part_id
			   else w.part_ID
			end as PartID,
			w.part_id as ChildPart,
			O.Sequence_No, 
			o.resource_id, 
			case
			   when w.part_id like '%rework%' then w2.[DESIRED_QTY]
			   when w.part_id like '%tooling%' then w2.[DESIRED_QTY]
			   when w.part_id is NULL then w2.[DESIRED_QTY]
			   else w.[DESIRED_QTY]
			end as Desired_Qty,
			case
			   when w.part_id like '%rework%' then w2.[DESIRED_WANT_DATE]
			   when w.part_id like '%tooling%' then w2.[DESIRED_WANT_DATE]
			   when w.part_id is NULL then w2.[DESIRED_WANT_DATE]
			   when w.sub_id <> '0' then w2.[DESIRED_WANT_DATE]
			   else w.[DESIRED_WANT_DATE]
			end as DESIRED_WANT_DATE,
			ra.[location], 
			lt.HoursWorked,
			lt.transdate
		from	   
			WORK_ORDER W
		inner JOIN 
			work_order w2
				ON  W.TYPE             = w2.TYPE
				AND W.BASE_ID          = w2.BASE_ID
				AND W.LOT_ID           = w2.LOT_ID
				AND W.SPLIT_ID         = w2.SPLIT_ID
				AND W2.SUB_ID           = '0'
		INNER JOIN 
			OPERATION O
				ON W.TYPE = O.WORKORDER_TYPE
				AND W.BASE_ID = O.WORKORDER_BASE_ID
				AND W.LOT_ID = O.WORKORDER_LOT_ID
				AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
				AND W.SUB_ID = O.WORKORDER_SUB_ID
		INNER JOIN
				LIVESupplemental.dbo.ResourceID_Assignments ra
				on ra.Resource_ID = o.Resource_ID
		left outer JOIN
			(select
			   LT.WORKORDER_TYPE,
			   LT.WORKORDER_BASE_ID,
			   LT.WORKORDER_LOT_ID,
			   LT.WORKORDER_SPLIT_ID,
			   LT.WORKORDER_SUB_ID,
			   LT.OPERATION_SEQ_NO,
			   sum(hours_worked) as HoursWorked,
			   min(lt.transaction_date) as TransDate
			from	  LABOR_TICKET LT
			INNER JOIN 
			   OPERATION O
				  ON LT.WORKORDER_TYPE = O.WORKORDER_TYPE
				  AND LT.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID
				  AND LT.WORKORDER_LOT_ID = O.WORKORDER_LOT_ID
				  AND LT.WORKORDER_SPLIT_ID = O.WORKORDER_SPLIT_ID
				  AND LT.WORKORDER_SUB_ID = O.WORKORDER_SUB_ID
				  AND LT.OPERATION_SEQ_NO = O.SEQUENCE_NO
			group by 	   
			   LT.WORKORDER_TYPE,
			   LT.WORKORDER_BASE_ID,
			   LT.WORKORDER_LOT_ID,
			   LT.WORKORDER_SPLIT_ID,
			   LT.WORKORDER_SUB_ID,
			   LT.OPERATION_SEQ_NO
			) as lt
				ON  O.WORKORDER_TYPE       = LT.WORKORDER_TYPE
				AND O.WORKORDER_BASE_ID    = LT.WORKORDER_BASE_ID
				AND O.WORKORDER_LOT_ID     = LT.WORKORDER_LOT_ID
				AND O.WORKORDER_SPLIT_ID   = LT.WORKORDER_SPLIT_ID
				AND O.WORKORDER_SUB_ID     = LT.WORKORDER_SUB_ID
				and O.sequence_no          = LT.OPERATION_SEQ_NO
		where
			w.TYPE = 'W'
			and (w.status = 'C' or (w.status in ('R', 'X') and LT.transdate is not null))

		union

		-- Co-Products
		select 
			'cp' as msg,
			w.BASE_ID,
			w.LOT_ID,
			w.SPLIT_ID,
			w.SUB_ID,
			w.[status],
			cp.part_id as PartID, 
			'Co-Product' as ChildPart,
			O.Sequence_No, 
			o.resource_id, 
			--case
			--   when w.part_id like '%rework%' then w2.[DESIRED_QTY]
			--   when w.part_id like '%tooling%' then w2.[DESIRED_QTY]
			--   when w.part_id is NULL then w2.[DESIRED_QTY]
			--   else w.[DESIRED_QTY]
			--end as Desired_Qty,
			cp.Desired_Qty,
			case
			   when w.part_id like '%rework%' then w2.[DESIRED_WANT_DATE]
			   when w.part_id like '%tooling%' then w2.[DESIRED_WANT_DATE]
			   when w.part_id is NULL then w2.[DESIRED_WANT_DATE]
			   when w.sub_id <> '0' then w2.[DESIRED_WANT_DATE]
			   else w.[DESIRED_WANT_DATE]
			end as DESIRED_WANT_DATE,
			ra.[location], 
			lt.HoursWorked,
			lt.transdate
		FROM	   
			CO_PRODUCT AS CP
		inner join
			WORK_ORDER AS W
			   on  (CP.WORKORDER_TYPE = 'W')
			   AND (CP.WORKORDER_BASE_ID = W.BASE_ID)
			   AND (CP.WORKORDER_LOT_ID = W.LOT_ID)
			   AND (CP.WORKORDER_SPLIT_ID = W.SPLIT_ID)
		inner JOIN 
			work_order w2
				ON  W.TYPE             = w2.TYPE
				AND W.BASE_ID          = w2.BASE_ID
				AND W.LOT_ID           = w2.LOT_ID
				AND W.SPLIT_ID         = w2.SPLIT_ID
				AND W2.SUB_ID           = '0'
		INNER JOIN 
			OPERATION O
				ON W.TYPE = O.WORKORDER_TYPE
				AND W.BASE_ID = O.WORKORDER_BASE_ID
				AND W.LOT_ID = O.WORKORDER_LOT_ID
				AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
				AND W.SUB_ID = O.WORKORDER_SUB_ID
		INNER JOIN
				LIVESupplemental.dbo.ResourceID_Assignments ra
				on ra.Resource_ID = o.Resource_ID
		left outer JOIN
			(select
			   LT.WORKORDER_TYPE,
			   LT.WORKORDER_BASE_ID,
			   LT.WORKORDER_LOT_ID,
			   LT.WORKORDER_SPLIT_ID,
			   LT.WORKORDER_SUB_ID,
			   LT.OPERATION_SEQ_NO,
			   sum(hours_worked) as HoursWorked,
			   min(lt.transaction_date) as TransDate
			from	  LABOR_TICKET LT
			INNER JOIN 
			   OPERATION O
				  ON LT.WORKORDER_TYPE = O.WORKORDER_TYPE
				  AND LT.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID
				  AND LT.WORKORDER_LOT_ID = O.WORKORDER_LOT_ID
				  AND LT.WORKORDER_SPLIT_ID = O.WORKORDER_SPLIT_ID
				  AND LT.WORKORDER_SUB_ID = O.WORKORDER_SUB_ID
				  AND LT.OPERATION_SEQ_NO = O.SEQUENCE_NO
			group by 	   
			   LT.WORKORDER_TYPE,
			   LT.WORKORDER_BASE_ID,
			   LT.WORKORDER_LOT_ID,
			   LT.WORKORDER_SPLIT_ID,
			   LT.WORKORDER_SUB_ID,
			   LT.OPERATION_SEQ_NO
			) as lt
				ON  O.WORKORDER_TYPE       = LT.WORKORDER_TYPE
				AND O.WORKORDER_BASE_ID    = LT.WORKORDER_BASE_ID
				AND O.WORKORDER_LOT_ID     = LT.WORKORDER_LOT_ID
				AND O.WORKORDER_SPLIT_ID   = LT.WORKORDER_SPLIT_ID
				AND O.WORKORDER_SUB_ID     = LT.WORKORDER_SUB_ID
				and O.sequence_no          = LT.OPERATION_SEQ_NO
		where
			w.TYPE = 'W'
			and (w.status = 'C' or (w.status in ('R', 'X') and LT.transdate is not null))
		) Pull1
	where
		partID is not null
--		and DESIRED_WANT_DATE >= @StartDate
--		and DESIRED_WANT_DATE <= @EndDate
		and childpart not like '%rework%'
	--	and TransDate >= '1/1/2013'
	--	and year(DESIRED_WANT_DATE) = '2015'
	--	and month(DESIRED_WANT_DATE) = '7'
	group by 
	--    PartID + '~' + BASE_ID + '-' + LOT_ID + '-' + SPLIT_ID + '-' + SUB_ID,
		PartID + '~' + BASE_ID + '-' + LOT_ID + '-' + SUB_ID,
		PartID,
		ChildPart,
		msg,
		[status],
		Desired_Qty,
		DESIRED_WANT_DATE,
		[location]
	) Pull2
group by 
	[year],
	[month],
	[location]
order by 
	[year],
	[month],
	[location]