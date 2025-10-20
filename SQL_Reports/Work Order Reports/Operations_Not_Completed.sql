/* Clear table if those objets exist */
IF OBJECT_ID('tempdb..#TEMP')IS NOT NULL DROP TABLE #TEMP
IF OBJECT_ID('tempdb..#TEMP2')IS NOT NULL DROP TABLE #TEMP2
IF OBJECT_ID('tempdb..#TEMP3')IS NOT NULL DROP TABLE #TEMP3
IF OBJECT_ID('tempdb..#TEMP4')IS NOT NULL DROP TABLE #TEMP4
IF OBJECT_ID('tempdb..#TEMP5')IS NOT NULL DROP TABLE #TEMP5
IF OBJECT_ID('tempdb..#TEMP6')IS NOT NULL DROP TABLE #TEMP6
IF OBJECT_ID('tempdb..#TEMP7')IS NOT NULL DROP TABLE #TEMP7
IF OBJECT_ID('tempdb..#TEMP8')IS NOT NULL DROP TABLE #TEMP8
IF OBJECT_ID('tempdb..#TEMP9')IS NOT NULL DROP TABLE #TEMP9
IF OBJECT_ID('tempdb..#TEMP10')IS NOT NULL DROP TABLE #TEMP10
IF OBJECT_ID('tempdb..#TEMP_Final')IS NOT NULL DROP TABLE #TEMP_Final

/* Step #1 Create temp table #1 to add WO's with status R */
SELECT 
    DISTINCT wo.BASE_ID, wo.LOT_ID, wo.SPLIT_ID, wo.SUB_ID,
    ops2.SEQUENCE_NO, mls.MAX_SEQUENCE, ops2.RN, wo.PART_ID
    INTO #TEMP
FROM WORK_ORDER wo with (nolock)
JOIN ( SELECT lt.WORKORDER_TYPE, lt.WORKORDER_BASE_ID, lt.WORKORDER_LOT_ID,
            lt.WORKORDER_SPLIT_ID, lt.WORKORDER_SUB_ID,
            MAX(lt.OPERATION_SEQ_NO) AS MAX_SEQUENCE
        FROM LABOR_TICKET lt with (nolock)
        GROUP BY lt.WORKORDER_TYPE, lt.WORKORDER_BASE_ID,lt.WORKORDER_LOT_ID,
            lt.WORKORDER_SPLIT_ID, lt.WORKORDER_SUB_ID
    ) mls ON  wo.TYPE = mls.WORKORDER_TYPE AND wo.BASE_ID = mls.WORKORDER_BASE_ID
    AND wo.LOT_ID = mls.WORKORDER_LOT_ID AND wo.SPLIT_ID = mls.WORKORDER_SPLIT_ID
    AND wo.SUB_ID = mls.WORKORDER_SUB_ID

JOIN ( SELECT o.WORKORDER_TYPE, o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID,
            o.WORKORDER_SPLIT_ID, o.WORKORDER_SUB_ID, o.SEQUENCE_NO
        FROM OPERATION o where RESOURCE_ID != 'CONTRACTOR'
    ) ops ON  wo.TYPE = ops.WORKORDER_TYPE AND wo.BASE_ID = ops.WORKORDER_BASE_ID
    AND wo.LOT_ID = ops.WORKORDER_LOT_ID AND wo.SPLIT_ID = ops.WORKORDER_SPLIT_ID
    AND wo.SUB_ID = ops.WORKORDER_SUB_ID

JOIN ( SELECT o.WORKORDER_TYPE, o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID, 
            o.WORKORDER_SPLIT_ID, o.WORKORDER_SUB_ID, o.SEQUENCE_NO,
            ROW_NUMBER() OVER ( PARTITION BY o.WORKORDER_TYPE,
                    o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID,
                    o.WORKORDER_SPLIT_ID, o.WORKORDER_SUB_ID
                ORDER BY o.SEQUENCE_NO ASC
            ) AS RN FROM OPERATION o
    ) ops2    ON wo.TYPE = ops2.WORKORDER_TYPE
    AND wo.BASE_ID = ops2.WORKORDER_BASE_ID AND wo.LOT_ID = ops2.WORKORDER_LOT_ID
    AND wo.SPLIT_ID = ops2.WORKORDER_SPLIT_ID AND wo.SUB_ID = ops2.WORKORDER_SUB_ID
    
JOIN ( SELECT o.WORKORDER_TYPE, o.WORKORDER_BASE_ID, o.WORKORDER_LOT_ID,
            o.WORKORDER_SPLIT_ID, o.WORKORDER_SUB_ID, o.SEQUENCE_NO
        FROM OPERATION o
        LEFT JOIN LABOR_TICKET lt with (nolock) ON o.WORKORDER_TYPE = lt.WORKORDER_TYPE
            AND o.WORKORDER_BASE_ID = lt.WORKORDER_BASE_ID
            AND o.WORKORDER_LOT_ID = lt.WORKORDER_LOT_ID
            AND o.WORKORDER_SPLIT_ID = lt.WORKORDER_SPLIT_ID
            AND o.WORKORDER_SUB_ID = lt.WORKORDER_SUB_ID
            AND o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
        WHERE lt.OPERATION_SEQ_NO IS NULL and o.RESOURCE_ID != 'CONTRACTOR'
    ) missing_ops ON ops.WORKORDER_TYPE = missing_ops.WORKORDER_TYPE
    AND ops.WORKORDER_BASE_ID = missing_ops.WORKORDER_BASE_ID
    AND ops.WORKORDER_LOT_ID = missing_ops.WORKORDER_LOT_ID
    AND ops.WORKORDER_SPLIT_ID = missing_ops.WORKORDER_SPLIT_ID
    AND ops.WORKORDER_SUB_ID = missing_ops.WORKORDER_SUB_ID
    AND ops.SEQUENCE_NO = missing_ops.SEQUENCE_NO
WHERE 
    missing_ops.SEQUENCE_NO < mls.MAX_SEQUENCE 
    and wo.CREATE_DATE>= getdate() -730 and wo.STATUS='R'
    
/* Step #2 Create temp table #2 to add Max SeqOp with status C */
SELECT BASE_ID, LOT_ID, SPLIT_ID, SUB_ID, SEQUENCE_NO, MAX_SEQUENCE, RN 
INTO #TEMP2
FROM #TEMP
WHERE SEQUENCE_NO = ( SELECT MAX(t.SEQUENCE_NO) FROM  #TEMP AS t
            WHERE t.BASE_ID = #TEMP.BASE_ID AND t.SEQUENCE_NO < #TEMP.MAX_SEQUENCE
        )

/* Step #3 Create temp table #3 to add SeqOp with status R and 0 qty */
SELECT distinct T1.BASE_ID, t1.LOT_ID, t1.SPLIT_ID, t1.SUB_ID, t1.MAX_SEQUENCE, T1.PART_ID
into #TEMP3
FROM #TEMP T1 
INNER JOIN ( SELECT BASE_ID, LOT_ID, SPLIT_ID, SUB_ID, SEQUENCE_NO, MAX_SEQUENCE, RN
                FROM #TEMP2  T LEFT JOIN LABOR_TICKET LT with (nolock) ON LT.WORKORDER_TYPE='W' AND
                lt.WORKORDER_BASE_ID = T.BASE_ID AND lt.WORKORDER_LOT_ID = T.LOT_ID
                AND lt.WORKORDER_SPLIT_ID = T.SPLIT_ID AND lt.WORKORDER_SUB_ID = T.SUB_ID
                AND lt.OPERATION_SEQ_NO =T.SEQUENCE_NO
            WHERE LT.OPERATION_SEQ_NO IS NULL)  AS OPS_penultimate ON  OPS_penultimate.BASE_ID = T1.BASE_ID
    AND OPS_penultimate.LOT_ID = T1.LOT_ID AND OPS_penultimate.SPLIT_ID = T1.SPLIT_ID
    AND OPS_penultimate.SUB_ID = T1.SUB_ID AND OPS_penultimate.SEQUENCE_NO =T1.SEQUENCE_NO

/* Step #4 Seq prev1 */
select distinct t.BASE_ID, t.LOT_ID, t.BASE_ID+' / '+t.LOT_ID as 'WO_LOT', 
t.MAX_SEQUENCE, t.SPLIT_ID, t.SUB_ID, t.PART_ID, p.DESCRIPTION, max(o.PREV1_MAX_SEQ_NO) as 'PREV1_MAX_SEQ_NO'--,  
into #TEMP4
from #TEMP3 t 
inner join PART p with (nolock) on t.PART_ID = ID
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, max(SEQUENCE_NO) as 'PREV1_MAX_SEQ_NO'--, 
    from  OPERATION o with (nolock) join #TEMP3 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.MAX_SEQUENCE
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP3)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV1_MAX_SEQ_NO < t.MAX_SEQUENCE
group by t.BASE_ID, t.LOT_ID, t.SPLIT_ID, t.SUB_ID, t.MAX_SEQUENCE, t.PART_ID, p.DESCRIPTION

/* Step #5 Seq prev2 */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
max(PREV2_MAX_SEQ) as 'PREV2_MAX_SEQ_NO'
    into #TEMP5
from #TEMP4 t
left join (    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, 
    max(SEQUENCE_NO) as 'PREV2_MAX_SEQ' 
    from  OPERATION o with (nolock) join #TEMP4 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.PREV1_MAX_SEQ_NO 
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID 
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV2_MAX_SEQ < t.PREV1_MAX_SEQ_NO
group by BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO

/* Step #6 Seq prev3 */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
t.PREV2_MAX_SEQ_NO, max(PREV3_MAX_SEQ) as 'PREV3_MAX_SEQ_NO'
    into #TEMP6
from #TEMP5 t
left join (     select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, 
    max(SEQUENCE_NO) as 'PREV3_MAX_SEQ'
    from  OPERATION o with (nolock) join #TEMP5 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.PREV2_MAX_SEQ_NO
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID 
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV3_MAX_SEQ < t.PREV2_MAX_SEQ_NO
group by BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
t.PREV2_MAX_SEQ_NO

/* Step #7 Seq prev4 */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO, max(PREV4_MAX_SEQ) as 'PREV4_MAX_SEQ_NO'
    into #TEMP7
from #TEMP6 t
left join (     select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, 
    max(SEQUENCE_NO) as 'PREV4_MAX_SEQ'
    from  OPERATION o with (nolock) join #TEMP6 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.PREV3_MAX_SEQ_NO
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID 
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV4_MAX_SEQ < t.PREV3_MAX_SEQ_NO
group by BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, 
t.PREV1_MAX_SEQ_NO, t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO

/* Step #8 Seq prev5 */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO, PREV4_MAX_SEQ_NO, max(PREV5_MAX_SEQ) as 'PREV5_MAX_SEQ_NO'
    into #TEMP8
from #TEMP7 t
left join (     select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, 
    max(SEQUENCE_NO) as 'PREV5_MAX_SEQ'
    from  OPERATION o with (nolock) join #TEMP7 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.PREV4_MAX_SEQ_NO
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID 
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV5_MAX_SEQ < t.PREV4_MAX_SEQ_NO
group by BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, 
t.PREV1_MAX_SEQ_NO, t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO, PREV4_MAX_SEQ_NO
    
/* Step #9 Seq prev5 */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO, PREV4_MAX_SEQ_NO, PREV5_MAX_SEQ_NO, 
max(PREV6_MAX_SEQ) as 'PREV6_MAX_SEQ_NO'
    into #TEMP9
from #TEMP8 t
left join (     select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, 
    max(SEQUENCE_NO) as 'PREV6_MAX_SEQ'
    from  OPERATION o with (nolock) join #TEMP8 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID and SEQUENCE_NO < t.PREV5_MAX_SEQ_NO
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID 
) o on t.BASE_ID = WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID and 
t.SPLIT_ID = o.WORKORDER_SPLIT_ID and o.PREV6_MAX_SEQ < t.PREV5_MAX_SEQ_NO
group by BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, 
t.PREV1_MAX_SEQ_NO, t.PREV2_MAX_SEQ_NO, PREV3_MAX_SEQ_NO, PREV4_MAX_SEQ_NO, PREV5_MAX_SEQ_NO


/************************************/
/* Step #10 Last Insert */
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, t.PREV1_MAX_SEQ_NO,
case when o1.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when o1.Run_1 > 0 then 0
    when o1.Status_Prev1 = 'R' and o1.Compl_Qty_Prev1 = 0 then 1
    else 0
end as 'Prev1_Max_SeqNo', 
t.PREV2_MAX_SEQ_NO, 
case when o2.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when LT2 is not null then 0
    when o1.Run_1 > 0 then 0
    when o2.Run_2 > 0 then 0
    when o2.Status_Prev2 = 'R' and o2.Compl_Qty_Prev2 = 0 then 1
    else 0
end as 'Prev2_Max_SeqNo',
t.PREV3_MAX_SEQ_NO, 
case when o3.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when LT2 is not null then 0
    when LT3 is not null then 0
    when o1.Run_1 > 0 then 0
    when o2.Run_2 > 0 then 0
    when o3.Run_3 > 0 then 0
    when o3.Status_Prev3 = 'R' and o3.Compl_Qty_Prev3 = 0 then 1
    else 0
end as 'Prev3_Max_SeqNo',
t.PREV4_MAX_SEQ_NO,
case when o4.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when LT2 is not null then 0
    when LT3 is not null then 0
    when LT4 is not null then 0
    when o1.Run_1 > 0 then 0
    when o2.Run_2 > 0 then 0
    when o3.Run_3 > 0 then 0
    when o4.Run_4 > 0 then 0
    when o4.Status_Prev4 = 'R' and o4.Compl_Qty_Prev4 = 0 then 1
    else 0
end as 'Prev4_Max_SeqNo',
t.PREV5_MAX_SEQ_NO,
case when o5.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when LT2 is not null then 0
    when LT3 is not null then 0
    when LT4 is not null then 0
    when LT5 is not null then 0
    when o1.Run_1 > 0 then 0
    when o2.Run_2 > 0 then 0
    when o3.Run_3 > 0 then 0
    when o4.Run_4 > 0 then 0
    when o5.Run_5 > 0 then 0
    when o5.Status_Prev5 = 'R' and o5.Compl_Qty_Prev5 = 0 then 1
    else 0
end as 'Prev5_Max_SeqNo',
t.PREV6_MAX_SEQ_NO,
case when o6.RESOURCE_ID = 'CONTRACTOR' then 0 
    when LT1 is not null then 0
    when LT2 is not null then 0
    when LT3 is not null then 0
    when LT4 is not null then 0
    when LT5 is not null then 0
    when LT6 is not null then 0
    when o1.Run_1 > 0 then 0
    when o2.Run_2 > 0 then 0
    when o3.Run_3 > 0 then 0
    when o4.Run_4 > 0 then 0
    when o5.Run_5 > 0 then 0
    when o6.Status_Prev6 = 'R' and o6.Compl_Qty_Prev6 = 0 then 1
    else 0
end as 'Prev6_Max_SeqNo',
case when o1.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o1_P1',
case when o1.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o1_P2',
case when o2.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o2_P1',
case when o2.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o2_P2',
case when o3.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o3_P1',
case when o3.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o3_P2',
case when o4.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o4_P1',
case when o4.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o4_P2',
case when o5.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o5_P1',
case when o5.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o5_P2',
case when o6.RESOURCE_ID like 'P1%' then 1 else 0 end as 'o6_P1',
case when o6.RESOURCE_ID like 'P2%' then 1 else 0 end as 'o6_P2',
p.PLANNER_USER_ID, o.RESOURCE_ID
    
    into #TEMP10
    
from #TEMP9 t
inner join OPERATION o with (nolock) on t.BASE_ID = o.WORKORDER_BASE_ID and t.LOT_ID = o.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o.WORKORDER_SPLIT_ID and t.MAX_SEQUENCE = o.SEQUENCE_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev1', COMPLETED_QTY as 'Compl_Qty_Prev1', ACT_RUN_HRS as 'Run_1'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o1 on t.BASE_ID = o1.WORKORDER_BASE_ID and t.LOT_ID = o1.WORKORDER_LOT_ID and 
t.SPLIT_ID = o1.WORKORDER_SPLIT_ID and o1.SEQUENCE_NO = t.PREV1_MAX_SEQ_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev2', COMPLETED_QTY as 'Compl_Qty_Prev2', ACT_RUN_HRS as 'Run_2'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o2 on t.BASE_ID = o2.WORKORDER_BASE_ID and t.LOT_ID = o2.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o2.WORKORDER_SPLIT_ID and t.PREV2_MAX_SEQ_NO = o2.SEQUENCE_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev3', COMPLETED_QTY as 'Compl_Qty_Prev3', ACT_RUN_HRS as 'Run_3'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o3 on t.BASE_ID = o3.WORKORDER_BASE_ID and t.LOT_ID = o3.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o3.WORKORDER_SPLIT_ID and t.PREV3_MAX_SEQ_NO = o3.SEQUENCE_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev4', COMPLETED_QTY as 'Compl_Qty_Prev4', ACT_RUN_HRS as 'Run_4'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o4 on t.BASE_ID = o4.WORKORDER_BASE_ID and t.LOT_ID = o4.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o4.WORKORDER_SPLIT_ID and t.PREV4_MAX_SEQ_NO = o4.SEQUENCE_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev5', COMPLETED_QTY as 'Compl_Qty_Prev5', ACT_RUN_HRS as 'Run_5'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o5 on t.BASE_ID = o5.WORKORDER_BASE_ID and t.LOT_ID = o5.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o5.WORKORDER_SPLIT_ID and t.PREV5_MAX_SEQ_NO = o5.SEQUENCE_NO
left join (
    select WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, SEQUENCE_NO, 
    RESOURCE_ID, STATUS as 'Status_Prev6', COMPLETED_QTY as 'Compl_Qty_Prev6', ACT_RUN_HRS as 'Run_6'
    from  OPERATION o with (nolock) join #TEMP9 t on WORKORDER_BASE_ID = BASE_ID and 
    WORKORDER_LOT_ID = t.LOT_ID and WORKORDER_SPLIT_ID = t.SPLIT_ID  
    and o.WORKORDER_SUB_ID = t.SUB_ID 
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
) o6 on t.BASE_ID = o6.WORKORDER_BASE_ID and t.LOT_ID = o6.WORKORDER_LOT_ID 
    and t.SPLIT_ID = o6.WORKORDER_SPLIT_ID and t.PREV6_MAX_SEQ_NO = o6.SEQUENCE_NO
left join (
    select id, PLANNER_USER_ID from PART with (nolock)
) p on t.PART_ID = p.ID
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT1'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L1 on t.BASE_ID = L1.wo and t.LOT_ID = L1.lot and t.SPLIT_ID = L1.split and t.PREV1_MAX_SEQ_NO = L1.Seq_NO
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT2'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L2 on t.BASE_ID = L2.wo and t.LOT_ID = L2.lot and t.SPLIT_ID = L2.split and t.PREV2_MAX_SEQ_NO = L2.Seq_NO
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT3'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L3 on t.BASE_ID = L3.wo and t.LOT_ID = L3.lot and t.SPLIT_ID = L3.split and t.PREV3_MAX_SEQ_NO = L3.Seq_NO
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT4'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L4 on t.BASE_ID = L4.wo and t.LOT_ID = L4.lot and t.SPLIT_ID = L4.split and t.PREV4_MAX_SEQ_NO = L4.Seq_NO
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT5'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L5 on t.BASE_ID = L5.wo and t.LOT_ID = L5.lot and t.SPLIT_ID = L5.split and t.PREV5_MAX_SEQ_NO = L5.Seq_NO
left join (
    select WORKORDER_BASE_ID as wo, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        OPERATION_SEQ_NO as Seq_NO, Max(TRANSACTION_ID) as 'LT6'
    from  LABOR_TICKET l with (nolock) join #TEMP9 t on l.WORKORDER_BASE_ID = BASE_ID and 
        l.WORKORDER_LOT_ID = t.LOT_ID and l.WORKORDER_SPLIT_ID = t.SPLIT_ID  
    where WORKORDER_BASE_ID in (select distinct BASE_ID from #TEMP9)
    group by WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, OPERATION_SEQ_NO
) L6 on t.BASE_ID = L6.wo and t.LOT_ID = L6.lot and t.SPLIT_ID = L6.split and t.PREV6_MAX_SEQ_NO = L6.Seq_NO

    -- select * from #TEMP_Final where BASE_ID = '1750210'

        /*MAIN QUERY*/
select BASE_ID, LOT_ID, WO_LOT, MAX_SEQUENCE, SPLIT_ID, SUB_ID, PART_ID, DESCRIPTION, 
Prev1_Max_SeqNo+Prev2_Max_SeqNo+Prev3_Max_SeqNo+Prev4_Max_SeqNo+Prev5_Max_SeqNo+Prev6_Max_SeqNo as 'Transctions',
case when o1_P1+o2_P1+o3_P1+o4_P1+o5_P1+o6_P1 > 0 and o1_P2+o2_P2+o3_P2+o4_P2+o5_P2+o6_P2 = 0 then 'P1'
    when o1_P1+o2_P1+o3_P1+o4_P1+o5_P1+o6_P1 = 0 and o1_P2+o2_P2+o3_P2+o4_P2+o5_P2+o6_P2 > 0 then 'P2'
    when o1_P1+o2_P1+o3_P1+o4_P1+o5_P1+o6_P1 > 0 and o1_P2+o2_P2+o3_P2+o4_P2+o5_P2+o6_P2 > 0 then 'P1 - P2'
end as 'Plant',
PLANNER_USER_ID, RESOURCE_ID
    into #TEMP_Final
from  #TEMP10
where Prev1_Max_SeqNo+Prev2_Max_SeqNo+Prev3_Max_SeqNo+Prev4_Max_SeqNo > 1 --and BASE_ID = '1750210'
order by Prev1_Max_SeqNo+Prev2_Max_SeqNo+Prev3_Max_SeqNo+Prev4_Max_SeqNo+Prev5_Max_SeqNo+Prev6_Max_SeqNo desc, BASE_ID asc

select * from #TEMP_Final where Plant in (@Plant) 
order by Transctions desc
