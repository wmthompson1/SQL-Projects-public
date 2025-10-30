use live
go

/*
DROP TABLE #TEMP1
*/

select distinct
    w.BASE_ID,
    w.LOT_ID,
    w.SPLIT_ID,
    w.SUB_ID,
    w.part_id as MainPartID,
    w2.part_id as JoinPartID,
    
    w.status_eff_date,
    case
	   when o2.WORKORDER_BASE_ID is null  then 'No'
	   else 'Yes'
    end as ShotPeen,
    case
	   when o3.WORKORDER_BASE_ID is null  then 'No'
	   else 'Yes'
    end as Penetrant
INTO	   #TEMP1
from	   WORK_ORDER W
left outer JOIN 
	WORK_ORDER W2
		ON  W.TYPE             = w2.TYPE
		AND W.BASE_ID          = w2.BASE_ID
		AND W.LOT_ID           = w2.LOT_ID
		AND W.SPLIT_ID         = w2.SPLIT_ID
		AND w2.SUB_ID = '0'
left outer JOIN 
	OPERATION O2
		ON  W.TYPE             = O2.WORKORDER_TYPE
		AND W.BASE_ID          = O2.WORKORDER_BASE_ID
		AND W.LOT_ID           = O2.WORKORDER_LOT_ID
		AND W.SPLIT_ID         = O2.WORKORDER_SPLIT_ID
		AND W.SUB_ID           = O2.WORKORDER_SUB_ID
		and o2.RESOURCE_ID in ('AUB-msp', 'AUB-sp', 'BAL-sp', 'msp', 'sp')
left outer JOIN 
	OPERATION O3
		ON  W.TYPE             = O3.WORKORDER_TYPE
		AND W.BASE_ID          = O3.WORKORDER_BASE_ID
		AND W.LOT_ID           = O3.WORKORDER_LOT_ID
		AND W.SPLIT_ID         = O3.WORKORDER_SPLIT_ID
		AND W.SUB_ID           = O3.WORKORDER_SUB_ID
		and o3.RESOURCE_ID in ('AUB-pen', 'BAL-pen', 'AUB-PENetch', 'BAL-PENetch')
where
    w.TYPE = 'W'
--    and datediff(mm, w.status_eff_DATE, getdate()) <= 1
--		AND w.status_eff_DATE >= @STARTDATE 
--		AND w.status_eff_DATE < @ENDDATE  order by W.base_id 

--select * from #temp1 where base_id = '1359073' --datediff(mm, w.status_eff_DATE, getdate()) <= 1

SELECT distinct
	'main part' as rept,
	cast(W.status_eff_DATE as date) TRANSACTION_DATE,
	DATEPART(yyyy, W.status_eff_DATE) TRANSACTION_DATE_YEAR,
	DATEPART(wk, W.status_eff_DATE) TRANSACTION_DATE_WEEK,
	DATEPART(d, W.status_eff_DATE) TRANSACTION_DATE_DAY,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	w.SUB_ID,
	PSA.part_id,
	w.status,
	--o.SEQUENCE_NO,
	--o.RESOURCE_ID,
	w.ENGINEERED_BY,  
	RA.Location,
	CASE 
		WHEN psa.Material_Type is null THEN 'Need dimensions' 
		ELSE psa.Material_Type
	END AS Material_Type,
	PSA.Alloy,
	w.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	W.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS SURFACE_AREA, 
	T.ShotPeen,
	T.Penetrant
FROM	   WORK_ORDER AS W
INNER JOIN
    #TEMP1 T
		ON  W.TYPE             = 'W'
		AND W.BASE_ID          = T.BASE_ID
		AND W.LOT_ID           = T.LOT_ID
		AND W.SPLIT_ID         = T.SPLIT_ID
		AND W.SUB_ID           = T.SUB_ID
INNER JOIN 
	OPERATION O
		ON W.TYPE             = O.WORKORDER_TYPE
		AND W.BASE_ID          = O.WORKORDER_BASE_ID
		AND W.LOT_ID           = O.WORKORDER_LOT_ID
		AND W.SPLIT_ID         = O.WORKORDER_SPLIT_ID
		AND W.SUB_ID           = O.WORKORDER_SUB_ID
INNER JOIN 
	LIVESupplemental.DBO.ResourceID_Assignments RA
		ON RA.Resource_ID = O.RESOURCE_ID
		AND  RA.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf') 
LEFT OUTER JOIN 
	PART AS P
		ON W.PART_ID = P.ID
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON W.PART_ID = PSA.Part_ID
WHERE
	(W.TYPE = 'W')
	and w.status = 'C'
--	AND (W.SUB_ID = 0)     --> Steve wants to see reworks (tlt 8/16/2016)
    and datediff(mm, w.status_eff_DATE, getdate()) <= 12
--		AND w.status_eff_DATE >= @STARTDATE 
--		AND w.status_eff_DATE < @ENDDATE  

union

-- cancelled/WIP with labor tickets
SELECT distinct
	'labor tickets main' as rept,
	cast(W.status_eff_DATE as date) TRANSACTION_DATE,
	DATEPART(yyyy, W.status_eff_DATE) TRANSACTION_DATE_YEAR,
	DATEPART(wk, W.status_eff_DATE) TRANSACTION_DATE_WEEK,
	DATEPART(d, W.status_eff_DATE) TRANSACTION_DATE_DAY,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	w.SUB_ID,
	PSA.part_id,
	w.status,
	--o.SEQUENCE_NO,
	--o.RESOURCE_ID,
	w.ENGINEERED_BY,  
	RA.Location,
	CASE 
		WHEN psa.Material_Type is null THEN 'Need dimensions' 
		ELSE psa.Material_Type
	END AS Material_Type,
	PSA.Alloy,
	W.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	w.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS SURFACE_AREA,
	T.ShotPeen,
	T.Penetrant
FROM
    dbo.WORK_ORDER AS W
INNER JOIN
    #TEMP1 T
		ON  W.TYPE = 'W'
		AND W.BASE_ID = T.BASE_ID
		AND W.LOT_ID = T.LOT_ID
		AND W.SPLIT_ID = T.SPLIT_ID
		AND W.SUB_ID = T.SUB_ID
INNER JOIN 
	OPERATION O
		ON W.TYPE = O.WORKORDER_TYPE
		AND W.BASE_ID = O.WORKORDER_BASE_ID
		AND W.LOT_ID = O.WORKORDER_LOT_ID
		AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
		AND W.SUB_ID = O.WORKORDER_SUB_ID
INNER JOIN
    (select
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID,
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
		  and o.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			 'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf')
		  and o.status = 'C'
    where
	   datediff(mm, lt.transaction_DATE, getdate()) <= 12
    group by 	   
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID
    ) as lt
		ON  O.WORKORDER_TYPE       = LT.WORKORDER_TYPE
		AND O.WORKORDER_BASE_ID    = LT.WORKORDER_BASE_ID
		AND O.WORKORDER_LOT_ID     = LT.WORKORDER_LOT_ID
		AND O.WORKORDER_SPLIT_ID   = LT.WORKORDER_SPLIT_ID
		AND O.WORKORDER_SUB_ID     = LT.WORKORDER_SUB_ID
--		AND O.SEQUENCE_NO          = LT.OPERATION_SEQ_NO
INNER JOIN 
	LIVESupplemental.DBO.ResourceID_Assignments RA
		ON  RA.Resource_ID = O.RESOURCE_ID
		AND RA.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf') 
LEFT OUTER JOIN 
	PART AS P
		ON w.PART_ID = P.ID
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON w.PART_ID = PSA.Part_ID
WHERE
	(W.TYPE = 'W')
	and w.status <> 'C'
    and datediff(mm, W.status_eff_DATE, getdate()) <= 12
--		AND w.status_eff_DATE >= @STARTDATE 
--		AND w.status_eff_DATE < @ENDDATE  
 
union

-- Co-Products
SELECT distinct 
	'co-products' as rept,
	cast(W.status_eff_DATE as date) TRANSACTION_DATE,
	DATEPART(yyyy, W.status_eff_DATE) TRANSACTION_DATE_YEAR,
	DATEPART(wk, W.status_eff_DATE) TRANSACTION_DATE_WEEK,
	DATEPART(d, W.status_eff_DATE) TRANSACTION_DATE_DAY,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	w.SUB_ID,
	PSA.part_id,
	w.status,
	--o.SEQUENCE_NO,
	--o.RESOURCE_ID,
	w.ENGINEERED_BY,  
	RA.Location,
	CASE 
		WHEN psa.Material_Type is null THEN 'Need dimensions' 
		ELSE psa.Material_Type
	END AS Material_Type,
	PSA.Alloy,
	cp.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	CP.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS SURFACE_AREA,
	T.ShotPeen,
	T.Penetrant
FROM	   CO_PRODUCT AS CP
inner join
    WORK_ORDER AS W
	   on  (CP.WORKORDER_TYPE = 'W')
	   AND (CP.WORKORDER_BASE_ID = W.BASE_ID)
	   AND (CP.WORKORDER_LOT_ID = W.LOT_ID)
	   AND (CP.WORKORDER_SPLIT_ID = W.SPLIT_ID)
INNER JOIN
    #TEMP1 T
		ON  W.TYPE = 'W'
		AND W.BASE_ID = T.BASE_ID
		AND W.LOT_ID = T.LOT_ID
		AND W.SPLIT_ID = T.SPLIT_ID
		AND W.SUB_ID = T.SUB_ID
INNER JOIN 
	OPERATION O
		ON W.TYPE = O.WORKORDER_TYPE
		AND W.BASE_ID = O.WORKORDER_BASE_ID
		AND W.LOT_ID = O.WORKORDER_LOT_ID
		AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
		AND W.SUB_ID = O.WORKORDER_SUB_ID
INNER JOIN 
	LIVESupplemental.DBO.ResourceID_Assignments RA
		ON  RA.Resource_ID = O.RESOURCE_ID
		AND RA.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf') 
LEFT OUTER JOIN 
	PART AS P
		ON CP.PART_ID = P.ID
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON CP.PART_ID = PSA.Part_ID
WHERE
	(W.TYPE = 'W')
	and w.status = 'C'
    and datediff(mm, W.status_eff_DATE, getdate()) <= 12
--		AND w.status_eff_DATE >= @STARTDATE 
--		AND w.status_eff_DATE < @ENDDATE  

union

-- cancelled/WIP with labor tickets co-products
SELECT distinct
	'labor tickets co-products' as rept,
	cast(W.status_eff_DATE as date) TRANSACTION_DATE,
	DATEPART(yyyy, W.status_eff_DATE) TRANSACTION_DATE_YEAR,
	DATEPART(wk, W.status_eff_DATE) TRANSACTION_DATE_WEEK,
	DATEPART(d, W.status_eff_DATE) TRANSACTION_DATE_DAY,
	W.BASE_ID,
	W.LOT_ID,
	W.SPLIT_ID,
	w.SUB_ID,
	PSA.part_id,
	w.status,
	--o.SEQUENCE_NO,
	--o.RESOURCE_ID,
	w.ENGINEERED_BY,  
	RA.Location,
	CASE 
		WHEN psa.Material_Type is null THEN 'Need dimensions' 
		ELSE psa.Material_Type
	END AS Material_Type,
	PSA.Alloy,
	W.[DESIRED_QTY],
	PSA.Thickness_val,
	PSA.Length_val,
	PSA.Width_val,
	w.DESIRED_QTY * ISNULL(PSA.SURFACE_AREA, 0) AS SURFACE_AREA,
	T.ShotPeen,
	T.Penetrant
FROM	   CO_PRODUCT AS CP
inner join
    WORK_ORDER AS W
	   on  (CP.WORKORDER_TYPE = 'W')
	   AND (CP.WORKORDER_BASE_ID = W.BASE_ID)
	   AND (CP.WORKORDER_LOT_ID = W.LOT_ID)
	   AND (CP.WORKORDER_SPLIT_ID = W.SPLIT_ID)
INNER JOIN
    #TEMP1 T
		ON  W.TYPE = 'W'
		AND W.BASE_ID = T.BASE_ID
		AND W.LOT_ID = T.LOT_ID
		AND W.SPLIT_ID = T.SPLIT_ID
		AND W.SUB_ID = T.SUB_ID
INNER JOIN 
	OPERATION O
		ON W.TYPE = O.WORKORDER_TYPE
		AND W.BASE_ID = O.WORKORDER_BASE_ID
		AND W.LOT_ID = O.WORKORDER_LOT_ID
		AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
		AND W.SUB_ID = O.WORKORDER_SUB_ID
INNER JOIN 
	LIVESupplemental.DBO.ResourceID_Assignments RA
		ON  RA.Resource_ID = O.RESOURCE_ID
		AND RA.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf') 
LEFT OUTER JOIN 
	PART AS P
		ON CP.PART_ID = P.ID
LEFT OUTER JOIN 
	SKILLS_PART_SURFACE_AREA AS PSA
		ON CP.PART_ID = PSA.Part_ID
INNER JOIN
    (select
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID,
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
		  and o.Resource_ID in ('AUB-alo','AUB-ano','AUB-600','AUB-1000','AUB-boric',
			 'sulf','BAL-alo','BAL-ano','BAL-600', 'BAL-1000','BAL-boric','BAL-sulf')
		  and o.status = 'C'
    where
	   datediff(mm, lt.transaction_DATE, getdate()) <= 12
    group by 	   
	   LT.WORKORDER_TYPE,
	   LT.WORKORDER_BASE_ID,
	   LT.WORKORDER_LOT_ID,
	   LT.WORKORDER_SPLIT_ID,
	   LT.WORKORDER_SUB_ID
    ) as lt
		ON  O.WORKORDER_TYPE       = LT.WORKORDER_TYPE
		AND O.WORKORDER_BASE_ID    = LT.WORKORDER_BASE_ID
		AND O.WORKORDER_LOT_ID     = LT.WORKORDER_LOT_ID
		AND O.WORKORDER_SPLIT_ID   = LT.WORKORDER_SPLIT_ID
		AND O.WORKORDER_SUB_ID     = LT.WORKORDER_SUB_ID
WHERE
	(W.TYPE = 'W')
	and w.status <> 'C'
    and datediff(mm, W.status_eff_DATE, getdate()) <= 12
--		AND w.status_eff_DATE >= @STARTDATE 
--		AND w.status_eff_DATE < @ENDDATE  

order by 
    w.base_id, w.LOT_ID, w.SUB_ID --, o.SEQUENCE_NO

