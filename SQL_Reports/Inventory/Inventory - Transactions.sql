-- run at sql-lab-2 in prod
-- dw in stage on sql-bi-1

-- C:\SQL\Uber Query\1.2 Inventory\1.2.4 Part Trace Reconciled\part trace reconciled.1.sql
-- C:\SQL\Uber Query\1.2 Inventory\1.2.4 Part Trace Reconciled\part trace reconciled.2 xacts.sql
-- C:\SQL\Uber Query\1.2 Inventory\1.2.4 Part Trace Reconciled\part trace reconciled.2 xacts.sql
-- C:\SQL\Uber Query\1.2 Inventory\1.2.4 Part Trace Reconciled\part trace reconciled.4 xacts ETL.sql
-- C:\SQL\Uber Query\1.2 Inventory\1.2.4 Part Trace Reconciled\part trace reconciled.40 xacts ETL.sql

/**********************************************************************************************
Code Base 3.2
Description:   Reconcile trace inventory trans to inventory trans to On hand
Note:   allows maintainable code with grain to transaction id.
        There are two levels of aggregation 1 - xact id 2 - part
        Whether or not all transactions trace does not impact test,
        but rather allows a dataset to render the difference in transaction
        in case the is a variance with the amounts.    
Code Base: 3.2.4 Inventory - On Hand Reconciled    

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
08/03/20    William Thompson    Created.

TESTING:
sql agent:
  ETL Standard - Load Inventory_On_Hand_Reconcilable
ssis package - source @sql-lab-x
Visual_Load Tables Inventory On Hand Reconciled.dtsx
load Staging.dbo.Inventory_On_Hand_Reconcilable
-- select * FROM Staging.dbo.Inventory_On_Hand_Reconcilable
transform to Inventory_On_Hand_Reconcilable base table
select * from Datawarehouse.managedData.Inventory_On_Hand_Reconcilable
stored procedure
managedData.usp_Load_Inventory_On_Hand_Reconcilable
select * from Datawarehouse.managedData.Inventory_On_Hand_Reconcilable where is_reconciled = 'n'

**********************************************************************************************/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results
IF OBJECT_ID('tempdb..#trace_inv_trans') IS NOT NULL DROP TABLE #trace_inv_trans
IF OBJECT_ID('tempdb..#trace_profile') IS NOT NULL DROP TABLE #trace_profile
IF OBJECT_ID('tempdb..#Trace') IS NOT NULL DROP TABLE #Trace
IF OBJECT_ID('tempdb..#part_trace_maint') IS NOT NULL DROP TABLE #part_trace_maint

IF OBJECT_ID('tempdb..#inventory_trans') IS NOT NULL DROP TABLE #inventory_trans
IF OBJECT_ID('tempdb..#ixact_agg_by_part') IS NOT NULL DROP TABLE #ixact_agg_by_part

IF OBJECT_ID('tempdb..#planning_on_hand') IS NOT NULL DROP TABLE #planning_on_hand
IF OBJECT_ID('tempdb..#tixact_agg_by_xact_id') IS NOT NULL DROP TABLE #tixact_agg_by_xact_id
IF OBJECT_ID('tempdb..#tixact_agg_by_part_id') IS NOT NULL DROP TABLE #tixact_agg_by_part_id
IF OBJECT_ID('tempdb..#results_agg') IS NOT NULL DROP TABLE #results_agg

IF OBJECT_ID('Datawarehouse.managedData.Inventory_On_Hand_Reconcilable') IS NOT NULL DROP TABLE Datawarehouse.managedData.Inventory_On_Hand_Reconcilable
-- #Inventory_On_Hand_Reconcilable
IF OBJECT_ID('tempdb..#Inventory_On_Hand_Reconcilable') IS NOT NULL DROP TABLE #Inventory_On_Hand_Reconcilable

IF OBJECT_ID('tempdb..#temp1') IS NOT NULL DROP TABLE #temp1
IF OBJECT_ID('tempdb..#temp2') IS NOT NULL DROP TABLE #temp2
IF OBJECT_ID('tempdb..#temp3') IS NOT NULL DROP TABLE #temp3
IF OBJECT_ID('tempdb..#temp4') IS NOT NULL DROP TABLE #temp4
IF OBJECT_ID('tempdb..#temp5') IS NOT NULL DROP TABLE #temp5


DECLARE @Tester int
 -- ,@Part_ID nvarchar(30) = '143T0033-7' --'65B83903-7' -- '315A6015-14'  -- '287T4518-27' -- 315A6015-14 --  'BACR10AK10C'  -- '212A1214-13'  -- 'BACR10AK10C'
 -- ,@SITE_id nvarchar(30) -- = 'SK01'
 ,@TRANSACTION_id nvarchar(30) = '16499' -- Filter all datasets by this transaction ID
 -- ,@EndDate datetime = getdate() --
 Set @Tester = 0
 --Set @SITE_id = 'SK01'

SELECT 
 [PART_ID]
 ,t.APPLY_TO_ADJ,t.APPLY_TO_ISSUE,t.APPLY_TO_LABOR,t.APPLY_TO_SERVDISP,t.APPLY_TO_SERVREC
,TRACE_ID_LABEL, APROPERTY_1_REQD, APROPERTY_2_REQD, APROPERTY_3_REQD
, APROPERTY_4_REQD, APROPERTY_5_REQD, APROPERTY_LABEL_1, APROPERTY_LABEL_2
, APROPERTY_LABEL_3, APROPERTY_LABEL_4, APROPERTY_LABEL_5, NPROPERTY_1_REQD
, NPROPERTY_2_REQD, NPROPERTY_3_REQD, NPROPERTY_4_REQD, NPROPERTY_5_REQD
, NPROPERTY_LABEL_1, NPROPERTY_LABEL_2, NPROPERTY_LABEL_3, NPROPERTY_LABEL_4, NPROPERTY_LABEL_5
, APROPERTY_1_EDIT, APROPERTY_2_EDIT, APROPERTY_3_EDIT, APROPERTY_4_EDIT, APROPERTY_5_EDIT
, NPROPERTY_1_EDIT, NPROPERTY_2_EDIT, NPROPERTY_3_EDIT, NPROPERTY_4_EDIT, NPROPERTY_5_EDIT
, APROPERTY_1_VIS, APROPERTY_2_VIS, APROPERTY_3_VIS, APROPERTY_4_VIS, APROPERTY_5_VIS
, NPROPERTY_1_VIS, NPROPERTY_2_VIS, NPROPERTY_3_VIS, NPROPERTY_4_VIS, NPROPERTY_5_VIS
, EDIT_EXP_DATE, [OWNERSHIP], SERIAL, LOT, PRODUCTION, RECEIVE_BY, AVAILABLE, SHIP_BY, EXPIRATION 
  into #trace_profile
FROM [sql-lab-2].live.dbo.TRACE_PROFILE t
--WHERE PART_ID = @PART_id
-- where 1=2 SET FMTONLY OFF
Create clustered index ci_tp12 on #trace_profile (part_id)
-- select * FROM TRACE_profile where apply_to_labor is not null

-- add net field
SELECT 
  id, part_id
, serial_id, lot_id, owner_id, in_qty, out_qty
, net_qty = in_qty - out_qty
, reported_qty, assigned_qty, numbering_id, aproperty_1, aproperty_2, aproperty_3
, aproperty_4, aproperty_5, nproperty_1, nproperty_2, nproperty_3, nproperty_4, nproperty_5
, comments, production_date, receive_by_date, available_date, ship_by_date, expiration_date, disp_in_qty
, disp_out_qty, committed_qty 
  into #Trace
FROM TRACE T  
--WHERE T.PART_ID = @Part_id
ORDER BY PART_ID, ID 

-- add net qty field
SELECT 
    ID, PART_ID, SERIAL_ID, LOT_ID, OWNER_ID, IN_QTY, OUT_QTY 
    , net_qty = IN_QTY - OUT_QTY
    , REPORTED_QTY, ASSIGNED_QTY
    , NUMBERING_ID, APROPERTY_1, APROPERTY_2, APROPERTY_3, APROPERTY_4, APROPERTY_5, NPROPERTY_1, NPROPERTY_2, NPROPERTY_3
    , NPROPERTY_4, NPROPERTY_5, COMMENTS, PRODUCTION_DATE, RECEIVE_BY_DATE, AVAILABLE_DATE, SHIP_BY_DATE, EXPIRATION_DATE
    , DISP_IN_QTY, DISP_OUT_QTY, COMMITTED_QTY
 into #part_trace_maint
 FROM TRACE T 
 WHERE (1=1)
    --and PART_ID = @PART_ID -- @P1 
            and ( t.id in ( 
            select distinct v.trace_id 
            from trace_inv_trans v, inventory_trans i 
        -- wnt testing 8/3
            where v.part_id = t.part_id -- @part_id -- @p2 
            and v.part_id = i.part_id and i.site_id = 'SK01'
            and (@TRANSACTION_id IS NULL OR i.TRANSACTION_ID = @TRANSACTION_id))

             or t.id in (
              select distinct ( x.trace_id ) from [sql-lab-2].live.dbo.trace_labor_trans x
              , labor_ticket l, work_order w 
               where w.part_id = t.part_id 
               and x.transaction_id = l.transaction_id 
               and l.site_id =  'SK01' -- @site_id 
               and w.base_id = l.workorder_base_id 
               and w.lot_id = l.workorder_lot_id 
               and w.split_id = l.workorder_split_id 
               and w.sub_id = l.workorder_sub_id 
               and w.[type] = l.workorder_type ) or ( t.assigned_qty >= 0 and t.out_qty = 0 
               and t.in_qty = 0 ) ) order by part_id, id


-- note the transaction_id join for foreign key
select 
     x.qty, t.workorder_type
    ,t.workorder_base_id, t.workorder_lot_id
    ,t.workorder_split_id, t.workorder_sub_id, t.operation_seq_no, t.req_piece_no, t.purc_order_id
    ,t.purc_order_line_no, t.cust_order_id, t.cust_order_line_no, t.transaction_date
    ,t.type, t.class, t.warehouse_id, t.location_id 
    ,x.part_id
    ,x.trace_id
    ,x.transaction_id
  into #trace_inv_trans
from trace_inv_trans x
join inventory_trans t 
on x.transaction_id = t.transaction_id 
and t.site_id = 'SK01' -- @site_id 
--where x.part_id = @part_id 
where x.part_id = t.part_id
AND (@TRANSACTION_id IS NULL OR t.TRANSACTION_ID = @TRANSACTION_id) -- Filter by specific transaction ID
 

ORDER BY T.TRANSACTION_DATE, T.TRANSACTION_ID

-- select workorder_type from #trace_inv_trans group by workorder_type

create clustered index [ci_x_tra_inv_trans_12] on #trace_inv_trans
(   part_id,
    trace_id,
    transaction_id
)

-- by id for comparison
select
    sum(qty) qty
   ,tx.part_id
   ,tx.[transaction_id]
   into #tixact_agg_by_xact_id
from #trace_inv_trans tx
group by 
    tx.part_id
    ,tx.transaction_id

-- by part
select
    sum(qty) qty
   ,tx.part_id
   ,tx.[transaction_id]
   into #tixact_agg_by_part_id
from #tixact_agg_by_xact_id tx
group by 
    tx.part_id
    ,tx.transaction_id

---- PRB: nulled aggregaTE ~~ ------------------------------------------------
--select part_id,* from  #trace_inv_trans tx where part_id = '65B83903-7'
--select part_id,* from  #tixact_agg_by_xact_id tx where part_id = '65B83903-7'
--select * from #results_agg where part_id = '65B83903-7'
---- -------------------------------------//////////////////////////////////

create clustered index [ci_tixact_aggs_12] on #tixact_agg_by_xact_id
(
    part_id,
    transaction_id
)

--  inventory trans
select  
      t.part_id
    , t.transaction_id
    , t.transaction_date
    , t.class, t.type
    , t.qty, t.costed_qty, t.act_material_cost, t.act_labor_cost
    , t.act_burden_cost, t.act_service_cost
    , t.workorder_base_id
    , t.workorder_lot_id, t.workorder_split_id
    , t.workorder_sub_id, t.operation_seq_no, t.req_piece_no, t.cust_order_id
    , t.cust_order_line_no, t.purc_order_id
    , t.purc_order_line_no, t.warehouse_id
    , t.location_id, w.[description] warehouse_description
    --, l.description
    --, t.description
    ,t.issue_reas_id, t.site_id
    , (case when t.type = 'i' then t.qty else t.qty * -1 end) as effect_on_qty_on_hand
    into #inventory_trans
from inventory_trans t  ---, warehouse w, location l
join [sql-lab-2].live.dbo.warehouse w
on w.id = t.warehouse_id
join [sql-lab-2].live.dbo.[location] l
on w.id = l.warehouse_id 
and t.location_id = l.id  

 --AND TRANSACTION_DATE < @EndDate AND T.PART_ID IS NOT NULL 
--AND T.PART_ID = @Part_ID  
AND ( T.SITE_ID IN ( N'SK01' ) ) 
AND (@TRANSACTION_id IS NULL OR T.TRANSACTION_ID = @TRANSACTION_id) -- Filter by specific transaction ID 
ORDER BY T.SITE_ID, T.PART_ID, T.TRANSACTION_ID


-- select * from #inventory_trans
create clustered index [ci_x_inv_trans_12] on #inventory_trans
(
    [transaction_id] asc
)

create nonclustered index [nci_x_inv_trans_12] on #inventory_trans
(
    [part_id] asc
) 
include([transaction_date]
,[workorder_base_id]
,[cust_order_id]
,[class]
)

-- Version update - need logical comparison between txact ans ixact
-- first put trsace maintenande into a set for now, then aggregate next step
select 
  ixact.PART_ID
  ,tx_agg.PART_ID txact_PART_id
  ,ixact.TRANSACTION_ID
  ,ixact.EFFECT_ON_QTY_ON_HAND
  ,tx_agg.QTY
  into #results
FROM #inventory_trans ixact
join PART p
on ixact.PART_ID = p.id
-- filter on this table for the comparison
JOIN [sql-lab-2].[live].dbo.TRACE_PROFILE TP
    ON ixact.PART_ID = TP.PART_ID
--left join #trace_inv_trans txact
left join #tixact_agg_by_xact_id tx_agg
on ixact.TRANSACTION_ID = tx_agg.TRANSACTION_ID
and ixact.PART_ID =tx_agg.PART_ID
--where tx_agg.TRANSACTION_ID is not null
where isnull(p.status,'') != 'O'

select 
     part_id, sum(effect_on_qty_on_hand) effect_on_qty_on_hand 
     into #ixact_agg_by_part
from #inventory_trans
--where part_id = @Part_ID 
group by part_id



-- select * from #inventory_trans where part_id = '143T0033-7' --'65B83903-7'
-- select * from #inventory_trans where transaction_id = '2831365' --'65B83903-7'
-- select * from inventory_trans where transaction_id = '2831365' --'65B83903-7'
-- 2831365  
--select * from #results where part_ID = '143T0033-7'
---- PRB: nulled aggregaTE ~~ ------------------------------------------------
--select part_id,* from  #inventory_trans tx where part_id = '65B83903-7'
--select part_id,* from  #trace_inv_trans tx where part_id = '65B83903-7'
--select part_id,* from  #tixact_agg_by_xact_id tx where part_id = '65B83903-7'
--select part_id,* from #results where part_id = '65B83903-7'
--select * from #results_agg where part_id = '65B83903-7'

---- -------------------------------------//////////////////////////////////


select 
   r.part_id
  ,r.txact_part_id
 -- ,r.transaction_id
  ,sum(r.effect_on_qty_on_hand) effect_on_qty_on_hand
  ,sum(r.qty) qty
  into #results_agg
from #results r
join part p
on r.part_id = p.id

JOIN [sql-lab-2].[live].dbo.TRACE_PROFILE TP
    ON r.PART_ID = TP.PART_ID
where isnull(p.status,'') != 'O'
group by
   r.PART_ID
  ,r.txact_PART_id

--select * from #results_agg where part_id = '143T0033-7'  -- '315A6015-14' -- @Part_ID



--select * from #part_trace_maint where PART_ID = '65B83903-7' -- '315A6015-14'

--SELECT *
--FROM TRACE T (NOLOCK)
--WHERE T.PART_ID = '315A6015-14'

profile_ix:
/*
select
   ix.EFFECT_ON_QTY_ON_HAND 
  ,ix.*
FROM #inventory_trans ix
where ix.PART_ID = '65B83903-7' -- '315A6015-14'
order by 2
*/


--select * from #tixact_agg_by_xact_id tx_agg where tx_agg.PART_ID = '65B83903-7' order by TRANSACTION_ID


---- are all of the transactions in trace_inv_trans?
---- if not, are they net zero?
--select 
--   part_id
--   ,sum(EFFECT_ON_QTY_ON_HAND) AS EFFECT_ON_QTY_ON_HAND
--   into #temp3
--from #inventory_trans ix
--  where transaction_id not in ( select 
--                                TRANSACTION_ID from #trace_inv_trans tix2
--                                WHERE tix2.PART_ID = ix.PART_ID
--                                and tix2.TRANSACTION_ID = ix.TRANSACTION_ID )
--group by PART_ID

--select * from #temp3
--where EFFECT_ON_QTY_ON_HAND > 0
--order by part_id


-- planning oh

SELECT 
      pl.PART_ID
    , ISNULL ( SUM ( PL.QTY ), 0 ) QTY
   into #planning_on_hand
FROM PART_LOCATION PL
JOIN [sql-lab-2].[live].dbo.WAREHOUSE W 
ON PL.WAREHOUSE_ID = W.ID 
join [sql-lab-2].[live].dbo.TRACE_PROFILE tp
on pl.PART_ID = tp.PART_ID
join part p
on p.id = pl.PART_ID
WHERE (1=1)
and isnull(p.status,'') != 'O'
-- and PL.PART_ID = @part_id 
AND W.SITE_ID = 'SK01' -- @SITE_id 
group by pl.PART_ID

-- select * FROM #planning_on_hand where part_id = '453W3432-1'

select *
   into #temp1
FROM (
select
 r.PART_ID
 ,r.qty
 ,oh.qty oh_qty
 , r.qty - oh.qty Variance

from #results_agg r
join #planning_on_hand oh
on r.PART_ID = oh.PART_ID
) AS V

render_chosen_dataset1:

-- decimal(14,4)
-- 8277/ 8266
-- select part_id, sum(EFFECT_ON_QTY_ON_HAND) EFFECT_ON_QTY_ON_HAND from #inventory_trans where PART_ID = '453W3432-1' GROUP BY Part_id
select 
  t.*
  into #temp2
from (
select
    ix.part_id, ix.effect_on_qty_on_hand  ix_qty
    ,poh.qty oh_qty
    ,tx.qty tx_qty

from #ixact_agg_by_part ix

--select part_id, sum(qty) qty select * from  #tixact_agg_by_part_id tx where part_id = '453W3432-1' group by part_id
join
 (
 select part_id, sum(qty) qty from  #tixact_agg_by_part_id tx group by part_id

 ) tx
 on ix.PART_ID = tx.PART_ID

-- select part_id, qty FROM #planning_on_hand where part_id = '453W3432-1'
join #planning_on_hand poh
on ix.PART_ID = poh.PART_ID
) t
--where ix_qty = oh_qty
--  and oh_qty = tx_qty
--  and tx_qty = ix_qty

select *
  into #temp3
FROM #temp2
WHERE IX_QTY = OH_QTY
  AND OH_QTY = TX_QTY
  AND TX_QTY = IX_QTY
ORDER BY part_id



--select * from #temp2
--select * from #temp3  -- excludes parts not reconciled
-- Determine problems --------------------------------------
-- select TodaysDate = FORMAT( getdate(), N'yyyy-MM-dd'), t.* from #temp2 t where part_id not in (select part_id from #temp3) ORDER BY part_id



profile_part_reconcile:

---- PRB: nulled aggregaTE ~~ ------------------------------------------------
--select part_id,* from  #inventory_trans tx where part_id = '143T0033-7' order by transaction_date -- '453W3432-1' --  '65B83903-7'
--select part_id,* from  #trace_inv_trans tx where part_id = '143T0033-7' order by transaction_date -- '65B83903-7'
--select part_id,* from  #tixact_agg_by_xact_id tx where part_id = '453W3432-1' -- '65B83903-7'
--select part_id,* from #results where part_id = '453W3432-1' -- '65B83903-7'
--select * from #results_agg where part_id = '453W3432-1' -- '65B83903-7'
--select * from #results_agg where txact_PART_id is null and abs(EFFECT_ON_QTY_ON_HAND) > 0
--select * from #results_agg where txact_PART_id is null and (EFFECT_ON_QTY_ON_HAND) > 0 order by 1
--select * FROM #planning_on_hand where part_id in (select part_id 
--                      from #results_agg where txact_PART_id is null and (EFFECT_ON_QTY_ON_HAND) > 0) order by 1
--select * FROM #planning_on_hand where part_id in ('453W3432-1')
--select status from part 
--where id in (
--'3043-01'
--,'343A9121-55'
--,'453W3432-1'
--,'70507P-0500 X 2.40 X 5.44'
--,'BAC5010-C60')
--select PART_ID, SUM(net_qty) net_qty from #part_trace_maint where part_ID = '453W3432-1' GROUP by part_id
--select * from #inventory_trans where TRANSACTION_ID = '1653225'
--select part_id,* from  #trace_inv_trans tx where TRANSACTION_ID = '1653225'
--select part_id, SUM(QTY) Qty from  #trace_inv_trans tx where PART_ID = '143T0033-7'  group by part_id
--select transaction_id, EFFECT_ON_QTY_ON_HAND, * from #inventory_trans where PART_ID = '143T0033-7'
--select part_id, sum(EFFECT_ON_QTY_ON_HAND) EFFECT_ON_QTY_ON_HAND 
--         from #inventory_trans where PART_ID = '143T0033-7' GROUP BY Part_id
--select part_id, sum(in_qty - out_qty) from trace where PART_ID = '143T0033-7' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_xact_id tx where part_id = '143T0033-7' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_part_id tx where part_id = '143T0033-7' group by part_id
--select part_id, sum(qty) qty from  #trace_inv_trans tx where part_id = '143T0033-7' group by part_id
--select part_id, sum(net_qty) from #part_trace_maint  where part_id = '143T0033-7' group by part_id
--select * from #part_trace_maint Where part_id = '143T0033-7'
-- -------------------------------------//////////////////////////////////
-- -------------------------------------//////////////////////////////////

--select part_id, sum(in_qty - out_qty) from trace where PART_ID = 'x' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_xact_id tx where part_id = 'x' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_part_id tx where part_id = 'x' group by part_id
--select part_id, sum(qty) qty from  #trace_inv_trans tx where part_id = 'x' group by part_id
--select part_id, sum(net_qty) from #part_trace_maint  where part_id = 'x' group by part_id
--select part_id,* from  #inventory_trans tx where part_id = 'x' order by transaction_date   
--select part_id,* from  #trace_inv_trans tx where part_id = 'x' order by transaction_date  
--select * from #temp2 where part_id = 'x'

--'143T0033-7'
--'146T7262-8'
--'65B06036-11'
--'65B07652-311'
--'65B11212-63'
-- 2020-08-07    65B06036-11    4.0000    5.0000    4.0000
--select part_id, sum(in_qty - out_qty) from trace where PART_ID = '65B06036-11' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_xact_id tx where part_id = '65B06036-11' group by part_id
--select part_id, sum(qty) qty from  #tixact_agg_by_part_id tx where part_id = '65B06036-11' group by part_id
--select part_id, sum(qty) qty from  #trace_inv_trans tx where part_id = '65B06036-11' group by part_id
--select part_id, sum(net_qty) from #part_trace_maint  where part_id = '65B06036-11' group by part_id
--select part_id,* from  #inventory_trans tx where part_id = '65B06036-11' order by transaction_date   
--select part_id,* from  #trace_inv_trans tx where part_id = '65B06036-11' order by transaction_date  
--select * from #temp2 where part_id = '65B06036-11'

--


-- Determine problems --------------------------------------
-- select TodaysDate = FORMAT( getdate(), N'yyyy-MM-dd'), t.* from #temp2 t where part_id not in (select part_id from #temp3) ORDER BY part_id

-- select part_id, sum(EFFECT_ON_QTY_ON_HAND) EFFECT_ON_QTY_ON_HAND from #inventory_trans where PART_ID = '453W3432-1' GROUP BY Part_id
-- select part_id, sum(qty) qty from  #tixact_agg_by_part_id tx where part_id = '453W3432-1' group by part_id
-- select part_id, qty FROM #planning_on_hand where part_id = '453W3432-1'

---- Work order reconciliation --------------------------------------
----
----
---- -----------------------------------------------------------------
---- 2020-08-07    143T0033-7    0.0000    2.0000    0.0000
--select * from work_order
--where part_id in ('~~'
--, '143T0033-7'
----,'65B06036-11'
----,'65B07652-311'
----,'65B11212-63'
--)
--and [type] = 'w'
--order by ISNULL(CLOSE_DATE,'2099-12-31')  -- RW1354373/1/0 -  currently 2 released wo's

--    --0000000000>>>>>>>>>>>>>0000000
--    --select part_id,* from  #inventory_trans tx where part_id = 'x' order by transaction_date   
--    --select part_id,* from  #trace_inv_trans tx where part_id = 'x' order by transaction_date  
--    --select * from #temp2 where part_id = 'x'

---- 2020-08-07    65B06036-11    4.0000    5.0000    4.0000
--select * from work_order
--where part_id in ('~~'
----, '143T0033-7'
--,'65B06036-11'
----,'65B07652-311'
----,'65B11212-63'
--)
--and [type] = 'w'
--order by ISNULL(CLOSE_DATE,'2099-12-31')  -- wo 1611880 was split, the split /1.1 was cancelled. Status X. Observed some one sided xactions.

--    --0000000000>>>>>>>>>>>>>0000000
--    -- select part_id,* from  #inventory_trans tx where part_id = '65B06036-11' order by transaction_date   
--    -- select part_id,* from  #trace_inv_trans tx where part_id = '65B06036-11' order by transaction_date  
--    -- select * from #temp2 where part_id = '65B06036-11'

--select * from work_order
--where part_id in ('~~'
----, '143T0033-7'
----,'65B06036-11'
--,'65B07652-311'
----,'65B11212-63'
--)
--and [type] = 'w'
--order by ISNULL(CLOSE_DATE,'2099-12-31')  -- -- wo 1528537 was split, the split /1.1 was closed 4/8 Status X

--    --0000000000>>>>>>>>>>>>>0000000
--    --select part_id,* from  #inventory_trans tx where part_id = 'x' order by transaction_date   
--    --select part_id,* from  #trace_inv_trans tx where part_id = 'x' order by transaction_date  
--    --select * from #temp2 where part_id = 'x'


--select * from work_order
--where part_id in ('~~'
----, '143T0033-7'
----,'65B06036-11'
----,'65B07652-311'
--,'65B11212-63'
--)
--and [type] = 'w'
--order by ISNULL(CLOSE_DATE,'2099-12-31') -- wo 1578129 was cancelled, a new wo created after w/ same qty of 7

--    --0000000000>>>>>>>>>>>>>0000000
--    --select part_id,* from  #inventory_trans tx where part_id = 'x' order by transaction_date   
--    --select part_id,* from  #trace_inv_trans tx where part_id = 'x' order by transaction_date  
--    --select * from #temp2 where part_id = 'x'

--select 
--    t.PART_ID,p.[DESCRIPTION] 
--  , t.ix_qty inv_xactn
--  , t.oh_qty on_hand 
--  , t.tx_qty trace_xactn
--  , Is_Reconciled = case 
--  when IX_QTY = OH_QTY
--  AND OH_QTY = TX_QTY
--  AND TX_QTY = IX_QTY then
--    'Y'
--  ELSE
--    'N' END

--  , p.status, MRP_REQUIRED, p.commodity_code, p.STOCK_UM, p.FABRICATED, p.PURCHASED, p.STOCKED, MRP_EXCEPTIONS
-- --into Datawarehouse.managedData.Inventory_On_Hand_Reconcilable
--from #temp2 t
--join part p
--on t.PART_ID = p.id
--order by part_id

-- sql agent General - MPS 1.1 - Child - Inventory Reconciled
-- drop table Datawarehouse.managedData.Inventory_On_Hand_Reconcilable

-- Create Proc managedData.usp_Load_Inventory_On_Hand_Reconcilable as select 1 go
-- select * from Datawarehouse.managedData.Inventory_On_Hand_Reconcilable WHERE Is_Reconciled='N'



/****** Object:  Table [managedData].[Inventory_On_Hand_Reconcilable]    Script Date: 8/7/2020 3:46:02 PM ******/

-- Step 0. in test, drop table #Inventory_On_Hand_Reconcilable

--drop table #Inventory_On_Hand_Reconcilable
-- use global as needed to configure ssis
-- Step 1. Create temp table in 1) global, then 2) local
CREATE TABLE #Inventory_On_Hand_Reconcilable(
-- @sql-lab-x
-- drop table ##Inventory_On_Hand_Reconcilable
--CREATE TABLE ##Inventory_On_Hand_Reconcilable(
-- 1) Dev path: start with global temp table (two '#'s)
-- 2) When SSIS components built with meta, switch to local (one '#)
-- 2b) change table name in ssis as changes are done in ssis abvove.
-- select * from ##Inventory_On_Hand_Reconcilable
-- -- drop table Staging.dbo.Inventory_On_Hand_Reconcilable
--CREATE TABLE Staging.dbo.Inventory_On_Hand_Reconcilable(
--CREATE TABLE Datawarehouse.managedData.Inventory_On_Hand_Reconcilable(
    [PART_ID] [nvarchar](30) NULL,
    [DESCRIPTION] [nvarchar](120) NULL,
    [inv_xactn] [decimal](38, 4) NULL,
    [on_hand] [decimal](38, 4)  NULL,
    [trace_xactn] [decimal](38, 4) NULL,
    [Is_Reconciled] [varchar](1)  NULL,
    [status] [nchar](1) NULL,
    [MRP_REQUIRED] [nchar](1) NULL,
    [commodity_code] [nvarchar](15) NULL,
    [STOCK_UM] [nvarchar](15)  NULL,
    [FABRICATED] [nchar](1)  NULL,
    [PURCHASED] [nchar](1)  NULL,
    [STOCKED] [nchar](1)  NULL,
    [MRP_EXCEPTIONS] [nchar](1) NULL,

    [DWRowInsertDate] [datetime2](7) NOT NULL DEFAULT (sysdatetime()),
    [DWRowUpdateDate] [datetime2](7) NOT NULL DEFAULT (sysdatetime())
)  

--select * from Staging.dbo.Inventory_On_Hand_Reconcilable

-- truncate table Staging.dbo.Inventory_On_Hand_Reconcilable

--alter table [managedData].Inventory_On_Hand_Reconcilable add
--    [DWRowInsertDate] [datetime2](7) NOT NULL DEFAULT (sysdatetime()),
--    [DWRowUpdateDate] [datetime2](7) NOT NULL DEFAULT (sysdatetime())


    -- insert into table

INSERT INTO #Inventory_On_Hand_Reconcilable
           (
            [PART_ID]
           ,[DESCRIPTION]
           ,[inv_xactn]
           ,[on_hand]
           ,[trace_xactn]
           ,[Is_Reconciled]
           ,[status]
           ,[MRP_REQUIRED]
           ,[commodity_code]
           ,[STOCK_UM]
           ,[FABRICATED]
           ,[PURCHASED]
           ,[STOCKED]
           ,[MRP_EXCEPTIONS]
           --,[DWRowInsertDate]
           --,[DWRowUpdateDate]
           )

 select 
    t.PART_ID,p.[DESCRIPTION] 
  , t.ix_qty inv_xactn
  , t.oh_qty on_hand 
  , t.tx_qty trace_xactn
  , Is_Reconciled = case 
  when IX_QTY = OH_QTY
  AND OH_QTY = TX_QTY
  AND TX_QTY = IX_QTY then
    'Y'
  ELSE
    'N' END

  , p.status, MRP_REQUIRED, p.commodity_code, p.STOCK_UM, p.FABRICATED
  , p.PURCHASED, p.STOCKED, MRP_EXCEPTIONS
 --into Datawarehouse.managedData.Inventory_On_Hand_Reconcilable
 ----into Staging.dbo.Inventory_On_Hand_Reconcilable
from #temp2 t
join part p
on t.PART_ID = p.id
order by part_id

-- SELECT * FROM Staging.dbo.Inventory_On_Hand_Reconcilable
--truncate table Staging.dbo.Inventory_On_Hand_Reconcilable
--insert into
--Staging.dbo.Inventory_On_Hand_Reconcilable
--select *
--from #Inventory_On_Hand_Reconcilable

--select
--            [PART_ID]
--           ,[DESCRIPTION]
--           ,[inv_xactn]
--           ,[on_hand]
--           ,[trace_xactn]
--           ,[Is_Reconciled]
--           ,[status]
--           ,[MRP_REQUIRED]
--           ,[commodity_code]
--           ,[STOCK_UM]
--           ,[FABRICATED]
--           ,[PURCHASED]
--           ,[STOCKED]
--           ,[MRP_EXCEPTIONS]
--from Staging.dbo.Inventory_On_Hand_Reconcilable (nolock)
-- where isnull(Is_Reconciled,'') != 'Y'

-- -- '143T0033-7'
--select * from #part_trace_maint
select * from #inventory_trans
where 
(part_id = @Part_ID
or @Part_ID IS NULL )
AND (@TRANSACTION_id IS NULL OR TRANSACTION_ID = @TRANSACTION_id) -- Filter by specific transaction ID 

