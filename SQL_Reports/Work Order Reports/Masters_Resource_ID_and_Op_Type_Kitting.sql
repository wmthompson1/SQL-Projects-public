

WITH CTE_PARTSPLIT
AS (
select W.TYPE,
       W.BASE_ID,
       W.LOT_ID,
       W.SUB_ID,
       W.SPLIT_ID,
       w.PART_ID, 
      w.ENGINEERED_BY, 
       w.CREATE_DATE,
       O.OPERATION_TYPE,
      O.SEQUENCE_NO,
      OB.SPECS,
       f.Id, 
      f.value AS DESCR
 from SKILL_OPERATION_BINARY ob
INNER JOIN OPERATION O
   ON  O.WORKORDER_TYPE = ob.WORKORDER_TYPE
  AND O.WORKORDER_BASE_ID = ob.WORKORDER_BASE_ID
  AND O.WORKORDER_LOT_ID = ob.WORKORDER_LOT_ID
  AND O.WORKORDER_SPLIT_ID = ob.WORKORDER_SPLIT_ID
  AND O.WORKORDER_SUB_ID = ob.WORKORDER_SUB_ID
  and o.SEQUENCE_NO = ob.SEQUENCE_NO
INNER JOIN  WORK_ORDER W
    ON W.TYPE     = O.WORKORDER_TYPE
   AND W.BASE_ID  = O.WORKORDER_BASE_ID
   AND W.LOT_ID   = O.WORKORDER_LOT_ID
   AND W.SPLIT_ID = O.WORKORDER_SPLIT_ID
   AND W.SUB_ID   = O.WORKORDER_SUB_ID
 inner join LIVESupplemental.dbo.[kitting_parts_20180730$] k
   on k.base_id = w.BASE_ID
 inner join DEMAND_SUPPLY_LINK dsl
  on w.PART_ID = dsl.SUPPLY_PART_ID
  inner join cust_order_line col
   on dsl.DEMAND_BASE_ID = col.cust_order_id 
   and dsl.DEMAND_SEQ_NO = col.line_no
   inner join customer_order co
   on col.CUST_ORDER_ID = co.id
      
cross apply dbo.fnsplit(ob.specs, CHAR(13)) f
 
 WHERE O.OPERATION_TYPE in ('Kitting')
    and co.customer_id = 'BOE609'
    AND W.TYPE ='m'
--      AND ob.workorder_BASE_ID in (

--'232W2001-3B',
--'439W3278-480B',
--'232A8103-30',
--'232W2001-3B',
--'232U2150-37B',
--'232T2130-72B',
--'214T6418-8'
--8th set
)
    --and         len(specs) < 200
   -- AND ob.workorder_BASE_ID = '112T3015-1'--'213T4002-23' --'232A3503-13'
 -- and OB.SEQUENCE_NO = '470'
    --)


SELECT TYPE,
       BASE_ID,
       LOT_ID,
       SUB_ID,
       SPLIT_ID,
       PART_ID, 
      ENGINEERED_BY, 
       CREATE_DATE,
       OPERATION_TYPE,
      SEQUENCE_NO,
      SPECS,
  --dbo.UFN_SEPARATES_COLUMNS(DESCR, 1, ' ') AS QTY,

  case when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '4'
       then substring(descr, 3,1)
      when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '5'
       then substring(descr, 3,2)
             when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '6'
       then substring(descr, 3,3)
        when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '7'
       then substring(descr, 3,4)
      else '0'
      end as qty3,

  dbo.UFN_SEPARATES_COLUMNS(DESCR, 2, ' ') AS SPEC_PART_ID,
  substring(DESCR,dbo.udf_getnthcharacteroccurrence(DESCR, ' ', 2),len(descr)-1) AS DESCRIPTION
  FROM CTE_PARTSPLIT
  WHERE 
  dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) <> 0
  and   dbo.UFN_SEPARATES_COLUMNS(DESCR, 1, ' ') <> 'KIT '

  group by  TYPE,
       BASE_ID,
       LOT_ID,
       SUB_ID,
       SPLIT_ID,
       PART_ID, 
      ENGINEERED_BY, 
       CREATE_DATE,
       OPERATION_TYPE,
      SEQUENCE_NO,
            SPECS,
       dbo.UFN_SEPARATES_COLUMNS(DESCR, 1, ' '),

  case when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '4'
       then substring(descr, 3,1)
      when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '5'
       then substring(descr, 3,2)
             when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '6'
       then substring(descr, 3,3)
        when dbo.udf_getnthcharacteroccurrence(DESCR, ')', 1) = '7'
       then substring(descr, 3,4)
      else '0'
      end,

  dbo.UFN_SEPARATES_COLUMNS(DESCR, 2, ' '),
  substring(DESCR,dbo.udf_getnthcharacteroccurrence(DESCR, ' ', 2),len(descr)-1)

