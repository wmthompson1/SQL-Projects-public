# Inventory Trace Reconciliations

```sql
IF OBJECT_ID('tempdb..#temp1t')IS NOT NULL DROP TABLE #temp1t
/* Step # 1: Send the totalized information  PART, TRACE and PART_LOCATION to the temporary table */
select distinct p.ID as 'PART_ID', p.DESCRIPTION, p.QTY_ON_HAND, tt.Trace_Total, pl.Part_Loc_Stock
into #temp1t
from TRACE t with (nolock) inner join PART p with (nolock) on t.PART_ID =  p.ID 
inner join (
    select PART_ID, sum(IN_QTY)-sum(OUT_QTY) as 'Trace_Total' from TRACE with (nolock) group by PART_ID
) tt on t.PART_ID = tt.PART_ID
inner join (
    select PART_ID, sum(QTY) as 'Part_Loc_Stock' from PART_LOCATION with (nolock) group by PART_ID
) pl on t.PART_ID = pl.PART_ID
where p.QTY_ON_HAND > 0 and p.QTY_ON_HAND != tt.Trace_Total

/* Main query */
select a.PART_ID, a.DESCRIPTION, a.QTY_ON_HAND, a.Trace_Total, a.Part_Loc_Stock, 
    b.WAREHOUSE_ID, b.LOCATION_ID, b.TRACE_ID, b.QTY
from #temp1t a 
left join ( /* Join warehose and location stock from trace transactions to main query*/
    select i.PART_ID, i.WAREHOUSE_ID, i.LOCATION_ID, it.TRACE_ID, sum(it.QTY) as 'QTY'
    from INVENTORY_TRANS i with (nolock) 
    inner join TRACE_INV_TRANS it with (nolock) on i.TRANSACTION_ID = it.TRANSACTION_ID
    where i.PART_ID in (select PART_ID from #temp1t)
    group by i.PART_ID, i.WAREHOUSE_ID, i.LOCATION_ID, it.TRACE_ID
    having sum(it.QTY) > 0
) b on a.PART_ID = b.PART_ID

```