use live
go

/*
select cast(cast(BITS as binary) as varchar(max)),  *
from work_order w
inner join operation o
ON W.TYPE = O.WORKORDER_TYPE
AND W.BASE_ID = O.WORKORDER_BASE_ID
AND W.LOT_ID = O.WORKORDER_LOT_ID
AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
AND W.SUB_ID = O.WORKORDER_SUB_ID
inner join operation_type ot
on ot.id = o.operation_type
inner join oper_type_binary b
on ot.id = b.OPERATION_TYPE_ID
where ot.id in ('5749', 'MASK-ETCH A', '30907A', '30907B', 'ABP 8-1290', 'AIPI 09-01-002', 'GAMPS4105', 'AIPI 09-01-003', '80-T-35-0020', 'CLEAN', '5750ALUM', 'CLTHRDS', '31408B', '5765', '5744', 'ABP 8-1296', 'ABP 8-2297', 'DPS9.301', '5786', '31408C', '31408A', 'PS12050.1', 'SCLEAN', 'MASK-ETCH', '5750', 'GAMPS4122', 'SETUP 24')
and w.close_date >= '1/1/2015'
--cast(cast(BITS as binary) as varchar(max)) like '%clean%'
order by cast(cast(BITS as binary) as varchar(max)) 
*/


select 
	'main' as msg,
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
	O.Sequence_No, o.resource_id, o.OPERATION_TYPE, cast(cast(BITS as binary) as varchar(max)),
	TransDate,
	PSA.Alloy,
	w2.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	PSA.SURFACE_AREA Surf_AreaEA,
	w2.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS Total_SURF_AREA
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
inner join 
	operation_type ot
		on ot.id = o.operation_type
inner join 
	oper_type_binary b
		on ot.id = b.OPERATION_TYPE_ID
		and ot.id in ('5749', 'MASK-ETCH A', '30907A', '30907B', 'ABP 8-1290', 'AIPI 09-01-002', 'GAMPS4105', 'AIPI 09-01-003', '80-T-35-0020', 'CLEAN', '5750ALUM', 'CLTHRDS', '31408B', '5765', '5744', 'ABP 8-1296', 'ABP 8-2297', 'DPS9.301', '5786', '31408C', '31408A', 'PS12050.1', 'SCLEAN', 'MASK-ETCH', '5750', 'GAMPS4122', 'SETUP 24')
INNER JOIN
    (select
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID,
	   LT.OPERATION_SEQ_NO,
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
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON w2.PART_ID = PSA.Part_ID
where
    w.TYPE = 'W'
	AND TransDate >= '1/1/2015'
	and o.resource_id not like 'BAL%'
    and (w.status = 'C' or (w.status in ('R', 'X') and LT.transdate is not null))

union

-- Co-Products

select 
	'co-product' as msg,
    w.BASE_ID,
    w.LOT_ID,
    w.SPLIT_ID,
    w.SUB_ID,
	w.[status],
    --case
	   --when w.part_id like '%rework%' then w2.part_id
	   --when w.part_id like '%tooling%' then w2.part_id
	   --when w.part_id is NULL then w2.part_id
	   --else w.part_ID
    --end as PartID,
    cp.part_id as PartID, 'Co-Product' as ChildPart,
	O.Sequence_No, o.resource_id, o.OPERATION_TYPE, cast(cast(BITS as binary) as varchar(max)),
	TransDate,
	PSA.Alloy,
	w2.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	PSA.SURFACE_AREA Surf_AreaEA,
	w2.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS Total_SURF_AREA
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
inner join 
	operation_type ot
		on ot.id = o.operation_type
inner join 
	oper_type_binary b
		on ot.id = b.OPERATION_TYPE_ID
		and ot.id in ('5749', 'MASK-ETCH A', '30907A', '30907B', 'ABP 8-1290', 'AIPI 09-01-002', 'GAMPS4105', 'AIPI 09-01-003', '80-T-35-0020', 'CLEAN', '5750ALUM', 'CLTHRDS', '31408B', '5765', '5744', 'ABP 8-1296', 'ABP 8-2297', 'DPS9.301', '5786', '31408C', '31408A', 'PS12050.1', 'SCLEAN', 'MASK-ETCH', '5750', 'GAMPS4122', 'SETUP 24')
INNER JOIN
    (select
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID,
	   LT.OPERATION_SEQ_NO,
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
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON cp.PART_ID = PSA.Part_ID
where
    w.TYPE = 'W'
	AND TransDate >= '1/1/2015'
	and o.resource_id not like 'BAL%'
    and (w.status = 'C' or (w.status in ('R', 'X') and LT.transdate is not null))
order by W.base_id, w.lot_id, w.sub_id, o.SEQUENCE_NO 
