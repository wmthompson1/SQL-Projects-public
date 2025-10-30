USE [LIVE]
GO

DROP TABLE #T1
DROP TABLE #T2
DROP TABLE #division
DROP TABLE #T3



SELECT DISTINCT 
	WO.BASE_ID, 
	WO.[STATUS], 
	WO.PART_ID, 
	O.SEQUENCE_NO, 
	O.RESOURCE_ID, 
	O.OPERATION_TYPE, 
    case
	   when o.resource_ID like '%assy%' then 'M'
	   when o.resource_ID like '%Assembly%'  then 'M'
	   when o.resource_ID like 'rivet'   then 'M'
	   when o.resource_ID like 'glue'   then 'M'
	   when o.resource_ID like 'contractor'   then 'OS'
	   else SR.SKILLS_TYPE
    end as SKILLS_TYPE1,
	--case
	--   when o.resource_ID = 'FAI' and o.sequence_no < 200 then 1
	--   else 0
	--end as FAICount, 
	case
	   when o.RESOURCE_ID in ('pm', 'BAL-pm', 'AUB-pm', 'AUB-assyPM') then 1
	   else 0
	end as PMCount, 
	case
	   when o.resource_ID = 'BAL-Ship' and o.operation_type = 'REVISION' then 1
	   when o.resource_ID = 'BAL-Ship' then 0
	   when o.resource_ID = 'Aub-Ship' then 0
	   else 1
	end as DivCount
INTO	   #t1
FROM   WORK_ORDER WO
LEFT OUTER JOIN 
	OPERATION O
	ON  WO.TYPE = O.WORKORDER_TYPE
	AND WO.BASE_ID = O.WORKORDER_BASE_ID
	AND WO.LOT_ID = O.WORKORDER_LOT_ID 
	AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
	AND WO.SUB_ID = O.WORKORDER_SUB_ID
LEFT OUTER JOIN 
	SHOP_RESOURCE SR
	ON O.RESOURCE_ID = SR.ID
LEFT OUTER JOIN 
	PART P
	ON WO.PART_ID = P.ID
WHERE  
	WO.[STATUS] in ('C', 'R') 
	and wo.[type] = 'W'
	AND NOT (WO.BASE_ID LIKE '%R' OR WO.BASE_ID LIKE '%RW' OR WO.BASE_ID LIKE 'R%') 
	AND WO.SUB_ID='0' 
--	AND WO.DESIRED_WANT_DATE >= '2015-12-01'
	AND NOT (O.RESOURCE_ID LIKE '%ship' OR O.RESOURCE_ID LIKE 'rwec')
ORDER BY 
	WO.BASE_ID, 
	O.SEQUENCE_NO

select 
	BASE_ID, 
	[STATUS], 
	PART_ID, 
	(select sum(PMCount)
	from #t1 pm
	where 
	   SKILLS_TYPE1 = 'A'
    AND pm.base_id = t1.base_id
    and pm.part_id = t1.part_id
    ) PMCount,
	(select sum(DivCount)
	from #t1 A
	where 
	   SKILLS_TYPE1 = 'A'
    AND A.base_id = t1.base_id
    and A.part_id = t1.part_id
    ) ACount,
	(select sum(DivCount)
	from #t1 B
	where 
	   SKILLS_TYPE1 = 'B'
    AND B.base_id = t1.base_id
    and B.part_id = t1.part_id
    ) BCount,
	(select sum(DivCount)
	from #t1 M
	where 
	   SKILLS_TYPE1 = 'M'
    AND M.base_id = t1.base_id
    and M.part_id = t1.part_id
    ) mCount,
	(select sum(DivCount)
	from #t1 O
	where 
	   SKILLS_TYPE1 = 'O'
    AND O.base_id = t1.base_id
    and O.part_id = t1.part_id
    ) OCount,
	(select sum(DivCount)
	from #t1 OS
	where 
	   SKILLS_TYPE1 = 'OS'
    AND OS.base_id = t1.base_id
    and OS.part_id = t1.part_id
    ) OSCount
into #t2
from #t1 t1
group by 
	BASE_ID, 
	[STATUS], 
	PART_ID
order by 
	BASE_ID, 
	[STATUS], 
	PART_ID

--select * from #t1 where BASE_ID = '1051111'
--select distinct SKILLS_TYPE1 from #t1 

select 
	BASE_ID, 
	[STATUS], 
	PART_ID, 
    PMCount,
    case
	   when mcount > 1 and acount > 4 and bcount > 4 then 'MAB'
	   when mcount > 1 and acount > 3 then 'MA'
	   when mcount > 1 and bcount > 3 then 'MB'
	   when mcount > 1 and acount < 3 and bcount < 3 then 'M'
	   when acount > 4 and bcount > 4 then 'AB'
	   when mcount > 1 then 'M'
	   when acount > 1 then 'A'
	   when bcount > 1 then 'B'
	   when Ocount >= 1 then 'O'
    end as DIV
into #division
from #t2

/*
select 
    [Cust ID], 
    [Type], 
    [CO], 
    [CO Line], 
    [co-line], 
    [Cust PO], 
    [CMP], 
    [PART ID], 
    [Descr], 
    sum([SHIPPED_QTY]) as [SHIPPED_QTY], 
    -- [SHIPPED_QTY], 
    max([WO]) as [WO], 
    --[Division], 
    --[WC], 
    max([ship date]) as [ship date], 
    -- [ship date], 
    [due], 
	CASE
		WHEN max([ship date]) > Due THEN 'No' 
		ELSE 'Yes'
	END as [on time], 
    --[on time], 
    avg([turn-wkdys]) as [turn-wkdys]
from 
(SELECT distinct
	CO.CUSTOMER_ID as [Cust ID], 
	CASE
		WHEN (COL.MISC_REFERENCE) is null and (DSL2.WO_BASE) is not null then 'Parts' 
		WHEN (DSL2.WO_BASE) is not null then 'Parts' 
		WHEN (IT.TRACE_ID) is not null then 'Parts' 
		WHEN (COL.PART_ID) is not null and SL.SHIPPED_QTY < 0 then 'Return' 
		WHEN (COL.MISC_REFERENCE) like 'Minimum%' then 'Min' 
		WHEN (COL.MISC_REFERENCE) like ('NRE%') 
			or (COL.MISC_REFERENCE) like ('NON RECUR%') 
			or (COL.MISC_REFERENCE) like ('NON_RECUR%') 
			or (COL.MISC_REFERENCE) like ('COST%') 
				then 'NRE'
		WHEN (COL.MISC_REFERENCE) like 'Exp%' then 'Exp' 
		WHEN ((COL.MISC_REFERENCE) like ('%pene%') OR (COL.MISC_REFERENCE) like ('%pena%')) and (SL.SHIPPED_QTY * COL.UNIT_PRICE) < 0 then 'Pen Credit' 
		WHEN ((COL.MISC_REFERENCE) like ('%credit%')) and (SL.SHIPPED_QTY * COL.UNIT_PRICE) < 0 then 'Credit' 
		WHEN (SL.SHIPPED_QTY * COL.UNIT_PRICE) < 0 then 'Credit' 
		WHEN ((DSL2.WO_BASE) like ('R*') or (DSL2.WO_BASE) like ('*R*')) then 'Rework'
		WHEN (COL.MISC_REFERENCE) is null and (DSL2.WO_BASE) is not null then 'Parts'
	END as [Type], 
	COL.CUST_ORDER_ID as [CO], 
	COL.LINE_NO as [CO Line], 
	COL.CUST_ORDER_ID + '/' + cast(COL.LINE_NO as nvarchar) as [co-line], 
	CO.CUSTOMER_PO_REF as [Cust PO], 
	CASE
		WHEN CO.CUSTOMER_ID = 'BOE609' THEN 'CMP'
		ELSE 'Other'
	END as [CMP], 
	COL.PART_ID as [PART ID], 
	COL.MISC_REFERENCE as [Descr], 
	SL.SHIPPED_QTY as [SHIPPED_QTY], 
--    (select max(WO_BASE)
--     from	  DEMAND_SUPPLY_LINK_2 DSL2 
--     where
--	    SL.CUST_ORDER_ID = DSL2.CUST_ORDER_ID
--	    AND SL.CUST_ORDER_LINE_NO = DSL2.LINE_NO
--    ) 
	DSL2.WO_BASE as [WO], 
--	[Division], 
--	[WC], 
	cast(S.SHIPPED_DATE as date) as [ship date], 
	cast(isnull(COL.DESIRED_SHIP_DATE, CO.DESIRED_SHIP_DATE) as date) as [due], 
	--CASE
	--	WHEN S.SHIPPED_DATE > isnull(COL.DESIRED_SHIP_DATE, CO.DESIRED_SHIP_DATE) THEN 'No' 
	--	ELSE 'Yes'
	--END as [on time], 
	   --(DATEDIFF(wk,CO.ORDER_DATE,S.CREATE_DATE)*5
	   --+ (DATEPART(dw,S.CREATE_DATE))
	   --- (DATEPART(dw,CO.ORDER_DATE)))
	   --as [turn-wkdys]
	CASE
	   WHEN DATEDIFF(d, CO.ORDER_DATE, S.CREATE_DATE) 
			- (DATEDIFF(wk, CO.ORDER_DATE, S.CREATE_DATE) 
				+ CASE 
					WHEN DATEPART(dw, CO.ORDER_DATE) = 1 then 1 
					else 0 
				End )
			- (DATEDIFF(wk, CO.ORDER_DATE, S.CREATE_DATE) 
				+ CASE 
					WHEN DATEPART(dw, S.CREATE_DATE)=7 then 1 
					else 0 
				End ) < 1 then 1
	   ELSE DATEDIFF(d, CO.ORDER_DATE, S.CREATE_DATE) 
			- (DATEDIFF(wk, CO.ORDER_DATE, S.CREATE_DATE) 
				+ CASE 
					WHEN DATEPART(dw, CO.ORDER_DATE) = 1 then 1 
					else 0 
				End )
			- (DATEDIFF(wk, CO.ORDER_DATE, S.CREATE_DATE) 
				+ CASE 
					WHEN DATEPART(dw, S.CREATE_DATE)=7 then 1 
					else 0 
				End )
	END as [turn-wkdys]
FROM   	CUSTOMER C
LEFT OUTER JOIN 
	CUSTOMER_ORDER CO
	ON C.ID = CO.CUSTOMER_ID
LEFT OUTER JOIN 
	CUST_ORDER_LINE COL
	ON CO.ID = COL.CUST_ORDER_ID
LEFT OUTER JOIN 
	SHIPPER_LINE SL
	ON COL.CUST_ORDER_ID = SL.CUST_ORDER_ID
	AND COL.LINE_NO = SL.CUST_ORDER_LINE_NO
LEFT OUTER JOIN 
	DEMAND_SUPPLY_LINK_3 DSL2 
     ON SL.CUST_ORDER_ID = DSL2.CUST_ORDER_ID
 	AND SL.CUST_ORDER_LINE_NO = DSL2.LINE_NO
RIGHT OUTER JOIN 
	SHIPPER S 
	ON SL.PACKLIST_ID = S.PACKLIST_ID
LEFT OUTER JOIN 
	TRACE_INV_TRANS IT
	ON SL.TRANSACTION_ID = IT.TRANSACTION_ID
WHERE  
	COL.PART_ID NOT LIKE ('UP%')
	AND C.USER_9 NOT LIKE ('o%')
	AND SL.SHIPPED_QTY <> 0 
	AND (S.SHIPPED_DATE >= '2016-09-26'
		AND S.SHIPPED_DATE <= '2016-10-02')
--and col.cust_order_id = '381165' and col.line_no = '4'
) Base
Group by 
    [Cust ID], 
    [Type], 
    [CO], 
    [CO Line], 
    [co-line], 
    [Cust PO], 
    [CMP], 
    [PART ID], 
    [Descr], 
--    [SHIPPED_QTY], 
--    [ship date], 
    [due]--, 
--    [on time], 
--    [turn-wkdys]
order by
    [Cust ID], 
    [Type], 
    [CO], 
    [CO Line], 
    [co-line], 
    [Cust PO], 
    [CMP], 
    [PART ID], 
    [Descr], 
--    [SHIPPED_QTY], 
--    [ship date], 
    [due]--, 
--    [on time], 
--    [turn-wkdys]

*/