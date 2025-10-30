use live
go


WITH CTE_EMP AS
(select PPD_PROCESS
       , Month_Trans
       , Year_Trans
       , count(*) as EmpCnt
from
       (select PPD_PROCESS
              , month(transaction_date) as Month_Trans
              , Year(transaction_date) as Year_Trans
              , employee_id
              , count(*) as OpCnt
       from labor_ticket lt
       inner join LIVESupplemental.dbo.ResourceID_Assignments ra
              on ra.Resource_ID = lt.RESOURCE_ID
              AND RA.PPD_PROCESS IS NOT NULL
              AND RA.PPD_PROCESS <> 'N/A'
       where 
              lt.TRANSACTION_DATE >= '1/1/2017'
              and lt.TRANSACTION_DATE < '1/1/2018'
       group by PPD_PROCESS
              , month(transaction_date)
              , Year(transaction_date)
              , employee_id
       HAVING COUNT(*) > 20
       ) A
group by PPD_PROCESS
       , Month_Trans
       , Year_Trans
)

, CTE_OPS AS
(select PPD_PROCESS
       , month(transaction_date) as Month_Trans
       , Year(transaction_date) as Year_Trans
       , SUM(WO.DESIRED_QTY) AS QTYCnt
       , count(*) as OPSCnt
FROM OPERATION O
       INNER JOIN 
              (select workorder_type
                     , workorder_base_ID
                     , workorder_lot_ID
                     , workorder_split_ID
                     , workorder_sub_ID
                     , OPERATION_SEQ_NO
                     , max(transaction_date) transaction_date
              from LABOR_TICKET lt
              where lt.ACT_CLOCK_IN >= '1/1/2017'
                     and lt.ACT_CLOCK_IN < '1/1/2018'
              group by workorder_type
                     , workorder_base_ID
                     , workorder_lot_ID
                     , workorder_split_ID
                     , workorder_sub_ID
                     , OPERATION_SEQ_NO
              ) LT
              on o.WORKORDER_TYPE = lt.WORKORDER_TYPE
              AND o.WORKORDER_BASE_ID = lt.WORKORDER_BASE_ID
              and o.WORKORDER_LOT_ID = lt.WORKORDER_LOT_ID
              and o.WORKORDER_SUB_ID = lt.WORKORDER_SUB_ID
              and o.WORKORDER_SPLIT_ID = lt.WORKORDER_SPLIT_ID
              and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
       INNER JOIN WORK_ORDER WO
              on o.WORKORDER_TYPE = WO.[TYPE]
              AND o.WORKORDER_BASE_ID = WO.BASE_ID
              and o.WORKORDER_LOT_ID = WO.LOT_ID
              and o.WORKORDER_SUB_ID = WO.SUB_ID
              and o.WORKORDER_SPLIT_ID = WO.SPLIT_ID
       inner join LIVESupplemental.dbo.ResourceID_Assignments ra
              on ra.Resource_ID = O.RESOURCE_ID
              AND RA.PPD_PROCESS IS NOT NULL
              AND RA.PPD_PROCESS <> 'N/A'
group by PPD_PROCESS
       , month(transaction_date)
       , Year(transaction_date)
)

select o.ppd_process
       , o.Month_TRANS
       , o.Year_TRANS
       , OPSCnt
       , QTYCnt
       , EmpCnt
from CTE_OPS o
       inner join CTE_EMP e
              on o.ppd_process = e.ppd_process
              and o.Month_Trans = e.Month_Trans
              and o.Year_Trans = e.Year_Trans
--order by o.ppd_process
--       , o.Month_TRANS
--       , o.Year_Trans
