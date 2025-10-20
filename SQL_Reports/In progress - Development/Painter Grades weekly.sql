; with CTEpaiter as (
        /* Query para obtener conteo cuando el recurso es Painter */
        Select distinct ADP.[File Number], ADP.[First Name], 'PRI' as 'Class', sum(lt.GOOD_QTY) as 'Sum_Qty', sum(lt.GOOD_QTY)/Count(lt.RESOURCE_ID) as 'Tot_Parts',
            Count(lt.RESOURCE_ID) as 'Jobs', p.Tags, p.Total_Part, Sum(lt.BAD_QTY) as 'Sum_BadQty', lt.EMPLOYEE_ID, 
            DATEPART(YEAR, lt.CLOCK_IN) as 'Year', DATEPART(week, lt.CLOCK_IN) as 'Week', lt.WORKORDER_BASE_ID as 'WO'--, 

        From LABOR_TICKET lt INNER JOIN LIVESupplemental.dbo.VW_ADP_EMP ADP on RIGHT('00000'+lt.EMPLOYEE_ID, 6) = ADP.[File Number]
        LEFT JOIN (        SELECT ADP.[File Number], ADP.[First Name], DATEPART(WEEK, LT.CLOCK_IN) as 'Week',
            case when LT.RESOURCE_ID = 'P1F1-PNT-PRIME' then 'PRIMP'
                when LT.RESOURCE_ID = 'P1F2-PNT-PRIME' then 'PRIMP' else 'ND'
            End as 'Class', COUNT(distinct NCM.NCM_ID) as 'Tags', sum(LT.GOOD_QTY) as 'Total_Part'
            FROM LABOR_TICKET LT
            LEFT OUTER JOIN OPERATION O ON O.WORKORDER_BASE_ID = LT.WORKORDER_BASE_ID
                AND O.WORKORDER_LOT_ID = LT.WORKORDER_LOT_ID AND O.WORKORDER_SPLIT_ID = LT.WORKORDER_SPLIT_ID
                AND O.WORKORDER_SUB_ID = LT.WORKORDER_SUB_ID AND O.SEQUENCE_NO = LT.OPERATION_SEQ_NO
            LEFT OUTER JOIN OPERATION_TYPE OT ON O.OPERATION_TYPE = OT.ID
            LEFT OUTER JOIN VQ_PRODUCTION_ORDER PO ON O.WORKORDER_BASE_ID = PO.ALT_ID_2 AND O.WORKORDER_LOT_ID = PO.ALT_ID_3 
                AND O.WORKORDER_SPLIT_ID = PO.ALT_ID_4 AND O.WORKORDER_SUB_ID = PO.ALT_ID_5 AND O.WORKORDER_TYPE = PO.ALT_ID_1
            LEFT OUTER JOIN WORK_ORDER WO ON WO.BASE_ID = LT.WORKORDER_BASE_ID AND WO.LOT_ID = LT.WORKORDER_LOT_ID 
                AND WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID AND WO.SUB_ID = LT.WORKORDER_SUB_ID
            LEFT OUTER JOIN VQ_NONCONFORMANCE NCM ON PO.RECORD_ID = NCM.PROD_ORDER_REC_ID
            INNER JOIN LIVESupplemental.dbo.VW_ADP_EMP ADP on RIGHT('00000'+lt.EMPLOYEE_ID, 6) = ADP.[File Number]
            WHERE LT.ACT_CLOCK_IN >= dateadd(month, -2, dateadd(day, 1, eomonth(GETDATE(), -1)) )
                AND LT.RESOURCE_ID IN ('P1F1-PNT-PRIME', 'P1F2-PNT-PRIME')
                AND ADP.[Job Title Code] in ('PRIMP', 'TPCT') AND NCM.NCM_ID IS NOT NULL
            GROUP BY ADP.[File Number], ADP.[First Name], LT.RESOURCE_ID, DATEPART(WEEK, LT.CLOCK_IN) 
        ) p on ADP.[File Number] = p.[File Number] and DATEPART(week, lt.CLOCK_IN) = p.[Week]
        where CLOCK_IN >= dateadd(month, -2, dateadd(day, 1, eomonth(GETDATE(), -1)) ) AND ADP.[Job Title Code] in ('PRIMP', 'TPCT') 
        AND WORKORDER_BASE_ID is not null AND RESOURCE_ID IN ('P1F1-PNT-PRIME', 'P1F2-PNT-PRIME') --AND ADP.[First Name] = 'Shane' 
         --resource_id for PRIME
        group by ADP.[File Number], ADP.[First Name], lt.WORKORDER_BASE_ID, lt.EMPLOYEE_ID, DATEPART(week, lt.CLOCK_IN), 
        DATEPART(YEAR, lt.CLOCK_IN), p.Tags, p.Total_Part
        UNION
        /* Query para obtener conteo cuando el recurso es Top Coat */
        Select distinct ADP.[File Number], ADP.[First Name], 'TC' as 'Class', sum(lt.GOOD_QTY) as 'Sum_Qty', sum(lt.GOOD_QTY)/Count(lt.RESOURCE_ID) as 'Tot_Parts',
            Count(lt.RESOURCE_ID) as 'Jobs', p.Tags, p.Total_Part, sum(lt.BAD_QTY) as 'Sum_BadQty', lt.EMPLOYEE_ID, 
            DATEPART(YEAR, lt.CLOCK_IN) as 'Year', DATEPART(week, lt.CLOCK_IN) as 'Week', lt.WORKORDER_BASE_ID as 'WO'--, 
        From LABOR_TICKET lt INNER JOIN LIVESupplemental.dbo.VW_ADP_EMP ADP on RIGHT('00000'+lt.EMPLOYEE_ID, 6) = ADP.[File Number]
        LEFT JOIN (        SELECT ADP.[File Number], ADP.[First Name], DATEPART(WEEK, LT.CLOCK_IN) as 'Week',
            case when LT.RESOURCE_ID = 'P1F1-PNT-TC' then 'TPCT'
                when LT.RESOURCE_ID = 'P1F2-PNT-TC' then 'TPCT' else 'ND'
            End as 'Class', COUNT(distinct NCM.NCM_ID) as 'Tags', sum(LT.GOOD_QTY) as 'Total_Part'
            FROM LABOR_TICKET LT
            LEFT OUTER JOIN OPERATION O ON O.WORKORDER_BASE_ID = LT.WORKORDER_BASE_ID
                AND O.WORKORDER_LOT_ID = LT.WORKORDER_LOT_ID AND O.WORKORDER_SPLIT_ID = LT.WORKORDER_SPLIT_ID
                AND O.WORKORDER_SUB_ID = LT.WORKORDER_SUB_ID AND O.SEQUENCE_NO = LT.OPERATION_SEQ_NO
            LEFT OUTER JOIN OPERATION_TYPE OT ON O.OPERATION_TYPE = OT.ID
            LEFT OUTER JOIN VQ_PRODUCTION_ORDER PO ON O.WORKORDER_BASE_ID = PO.ALT_ID_2 AND O.WORKORDER_LOT_ID = PO.ALT_ID_3 
                AND O.WORKORDER_SPLIT_ID = PO.ALT_ID_4 AND O.WORKORDER_SUB_ID = PO.ALT_ID_5 AND O.WORKORDER_TYPE = PO.ALT_ID_1
            LEFT OUTER JOIN WORK_ORDER WO ON WO.BASE_ID = LT.WORKORDER_BASE_ID AND WO.LOT_ID = LT.WORKORDER_LOT_ID 
                AND WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID AND WO.SUB_ID = LT.WORKORDER_SUB_ID
            LEFT OUTER JOIN VQ_NONCONFORMANCE NCM ON PO.RECORD_ID = NCM.PROD_ORDER_REC_ID
            INNER JOIN LIVESupplemental.dbo.VW_ADP_EMP ADP on RIGHT('00000'+lt.EMPLOYEE_ID, 6) = ADP.[File Number]
            WHERE LT.ACT_CLOCK_IN >= dateadd(month, -2, dateadd(day, 1, eomonth(GETDATE(), -1)) )
                AND LT.RESOURCE_ID IN ('P1F1-PNT-TC', 'P1F2-PNT-TC')
                AND ADP.[Job Title Code] in ('PRIMP', 'TPCT') AND NCM.NCM_ID IS NOT NULL
            GROUP BY ADP.[File Number], ADP.[First Name], LT.RESOURCE_ID, DATEPART(WEEK, LT.CLOCK_IN) 
        ) p on ADP.[File Number] = p.[File Number] and DATEPART(week, lt.CLOCK_IN) = p.[Week]
        where CLOCK_IN >= dateadd(month, -2, dateadd(day, 1, eomonth(GETDATE(), -1)) ) AND ADP.[Job Title Code] in ('PRIMP', 'TPCT') 
        AND WORKORDER_BASE_ID is not null AND RESOURCE_ID IN ('P1F1-PNT-TC', 'P1F2-PNT-TC') --AND ADP.[First Name] = 'Shane' 
         --resource_id for Top Coat
        group by ADP.[File Number], ADP.[First Name], lt.WORKORDER_BASE_ID, lt.EMPLOYEE_ID, DATEPART(week, lt.CLOCK_IN), 
        DATEPART(YEAR, lt.CLOCK_IN), p.Tags, p.Total_Part
) 
select [File Number], [First Name], Class, count(WO) as 'Jobs', Tags, 
case when tags is null and count(WO) = 0 then 0
    when count(WO) > 0 and tags is null then 1 --when tags = 0 then 1 
    when count(WO) > 0 and tags > 0 then (count(WO)-tags)/count(WO) 
end as 'Percent_Jobs',
SUM(Tot_Parts) as 'Tot_Parts', Sum_BadQty, 
case when Sum_BadQty = 0 and SUM(Tot_Parts) = 0 then 0
    when Sum_BadQty = 0 and SUM(Tot_Parts) > 0 then 1
    when Sum_BadQty > 0 and SUM(Tot_Parts) > 0 then (SUM(Tot_Parts)-Sum_BadQty)/SUM(Tot_Parts) end as 'Percent_Part', 
[Week], 
(select Begin_W from DataWarehouse.dbo.SK_Days_of_Week where Week_Number = [Week] and Years = [Year]) as 'DateBegin',
(select End_W from DataWarehouse.dbo.SK_Days_of_Week where Week_Number = [Week] and Years = [Year]) as 'DateEnd'
from CTEpaiter
group by [File Number], [First Name], Class, [Week], [Year], Tags, Sum_BadQty
order by [Week], [First Name], Class ASC
