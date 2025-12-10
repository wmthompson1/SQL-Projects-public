/**


**/

--Use LIVE
--declare @Trace varchar(48) = '174081/1'

-- Visual Enterprise Reports> Raw Materials>Returned RM

; WITH CTE_Rw as (
Select P.ID as 'PartID'
, Max(Concat(IT.WOrkorder_base_ID,'/',IT.WOrkorder_Lot_ID)) as 'Workorder'
, Max(IT.Operation_Seq_no) as 'Opr_Seq_No'
, R.Workorder_base_ID as 'Next WO' 
, R.Calc_Qty as 'Required_Qty', RM.CALC_QTY as 'Minimum_Qty'
, max(IT.TRANSACTION_DATE) as 'Trans_Date', TIT.TRACE_ID
From Trace_Inv_Trans TIT WITH (NOLOCK)
INNER JOIN Inventory_Trans IT WITH (NOLOCK) on IT.Transaction_ID = TIT.Transaction_ID
INNER JOIN Part P WITH (NOLOCK) on P.ID = TIT.Part_ID 
Left Join (
    select WORKORDER_BASE_ID, r.PART_ID, CALC_QTY, r.STATUS, WORKORDER_TYPE, 
        w.PART_ID as 'EM', r.OPERATION_SEQ_NO as 'Op_Seq', r.PIECE_NO
    from REQUIREMENT r WITH (NOLOCK)
    INNER JOIN WORK_ORDER w WITH (NOLOCK) ON r.WORKORDER_BASE_ID = w.BASE_ID 
        and r.WORKORDER_LOT_ID = w.LOT_ID and r.WORKORDER_SPLIT_ID = w.SPLIT_ID
    where r.STATUS = 'R' and r.ISSUED_QTY = 0 and w.SUB_ID = 0
        and r.WORKORDER_TYPE = 'W' --and r.PART_ID = '70750B-063'
) R on R.Part_ID = TIT.Part_ID
Left Join (
    select WORKORDER_BASE_ID as wo, r.PART_ID, w.PART_ID as 'EM', 
        r.OPERATION_SEQ_NO as 'Op_Seq', r.PIECE_NO
    from REQUIREMENT r WITH (NOLOCK)
    INNER JOIN WORK_ORDER w WITH (NOLOCK) ON r.WORKORDER_BASE_ID = w.BASE_ID 
        and r.WORKORDER_LOT_ID = w.LOT_ID and r.WORKORDER_SPLIT_ID = w.SPLIT_ID
    where r.WORKORDER_TYPE = 'W' --and r.PART_ID = '70750B-063'
) M on M.Part_ID = IT.Part_ID and m.wo = IT.WORKORDER_BASE_ID
Left Join (
    select * from REQUIREMENT WITH (NOLOCK) where WORKORDER_TYPE = 'M' --and WORKORDER_BASE_ID = '140T2102-2609'
) RM on RM.WORKORDER_BASE_ID = M.EM and M.Op_Seq = RM.OPERATION_SEQ_NO 
    and M.PIECE_NO = RM.PIECE_NO

Where P.Commodity_Code = 'Raw Material' and IT.[Type] = 'O'
    and IT.Class = 'I' --and P.ID = '60616P-6000X9.80X10.375'
    and TIT.TRACE_ID = @Trace
group by p.ID, R.Workorder_base_ID, R.Calc_Qty, TIT.TRACE_ID, RM.CALC_QTY, M.EM
)
select  top 1 * from CTE_Rw order by Trans_Date desc
