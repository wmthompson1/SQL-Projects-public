# Inventory Trace Issues

```sql
USE live
GO

WITH CTE_MAIN AS
(select 
	--case
	--	when 
	--	else ''
	--end as TraceIssues
	case
		when in_qty - out_qty <> t2.TIXTraceTotal Then 'Trace Totals'
		when CLASS = 'R' and Type = 'I' and t3.TIXTransTotal < 0 Then 'Neg Receipt'
		when CLASS = 'I' and Type = 'O' and t3.TIXTransTotal > 0 Then 'Pos Issue'
		when CLASS = 'A' and Type = 'O' and t3.TIXTransTotal > 0 Then 'Pos Adjust Out'
		when CLASS = 'A' and Type = 'I' and t3.TIXTransTotal < 0 Then 'Neg Adjust In'
		when CLASS = 'I' and Type = 'I' and t3.TIXTransTotal < 0 Then 'Neg Ret Issue'
		when CLASS = 'O' and Type = 'R' and t3.TIXTransTotal > 0 Then 'Pos Rtn Rec'
		when t3.TIXTransTotal <> case
				when Type = 'I' and Class = 'R' then 1
				when Type = 'O' and Class = 'I' then -1
				when Type = 'O' and Class = 'A' then -1
				when Type = 'I' and Class = 'A' then 1
				when Type = 'I' and Class = 'I' then 1
				when Type = 'O' and Class = 'R' then -1
				else 0
			end * i.qty
				Then 'Xct Totals'
		when p.QTY_ON_HAND <> t4.TIXPartTotal Then 'Part Total'
--		when in_qty - out_qty <> REPORTED_QTY Then 'Trace Issues'
		else ''
	end as QTYIssues
	, a.id
	, a.part_id
	, p.QTY_ON_HAND
	, t4.TIXPartTotal
	, warehouse_id
	, location_id
	, in_qty 
	, out_qty
	, in_qty - out_qty as TraceRem
--	, a.REPORTED_QTY
	, t2.TIXTraceTotal
	, case
		when Type = 'I' and Class = 'R' then 'Receipt'
		when Type = 'O' and Class = 'I' then 'Issue'
		when Type = 'O' and Class = 'A' then 'Adjust Out'
		when Type = 'I' and Class = 'A' then 'Adjust In'
		when Type = 'I' and Class = 'I' then 'Return Issue'
		when Type = 'O' and Class = 'R' then 'Return Receipt'
		else 'Fix'
	end as XctType
	, [type]
	, class
	, t3.TIXTransTotal
	, t.[QTY] as TIXQty
	, case
		when Type = 'I' and Class = 'R' then 1
		when Type = 'O' and Class = 'I' then -1
		when Type = 'O' and Class = 'A' then -1
		when Type = 'I' and Class = 'A' then 1
		when Type = 'I' and Class = 'I' then 1
		when Type = 'O' and Class = 'R' then -1
		else 0
	end * i.qty as InvXQTY
	, i.qty as IXQty
	, I.[DESCRIPTION] AS INV_NOTES
	, i.[TRANSACTION_ID]
	, i.TRANSACTION_DATE
	, I.WORKORDER_BASE_ID
	, I.WORKORDER_LOT_ID
	, I.WORKORDER_SPLIT_ID
	, I.WORKORDER_SUB_ID
	, I.CUST_ORDER_ID
	, I.CUST_ORDER_LINE_NO
	, I.PURC_ORDER_ID
	, I.PURC_ORDER_LINE_NO
	, i.[USER_ID]
from trace_inv_trans t
inner join part p
	on p.id = t.part_id
inner join 
	(select trace_id as T2ID
		, part_id
		, sum(t2.qty) as TIXTraceTotal
	from trace_inv_trans t2
	group by trace_id
		, part_id
	) t2
	on t.trace_id = t2.t2id
	and t.part_id = t2.part_id
inner join 
	(select transaction_id as TXctID
		, part_id
		, sum(t3.qty) as TIXTransTotal
	from trace_inv_trans t3
	group by transaction_id
		, part_id
	) t3
	on t.transaction_id = t3.TXctID
	and t.part_id = t2.part_id
inner join 
	(select part_id
		, sum(t4.qty) as TIXPartTotal
	from trace_inv_trans t4
	group by part_id
	) t4
	on t.part_id = t4.part_id
inner join trace a
	on t.trace_id = a.id
	and t.part_id = a.part_id
inner join inventory_trans i
	on t.transaction_id = i.transaction_id
	and t.part_id = i.part_id
--where a.part_id = '145T1059-1'
--	i.TRANSACTION_DATE >= '1/1/2016'
),

CTE_PARTS AS
(SELECT PART_ID
	, COUNT(*) AS TOTALS
FROM CTE_MAIN
WHERE QTYIssues <> ''
AND TRANSACTION_DATE >= '1/1/2017'
GROUP BY PART_ID
HAVING COUNT(*) > 1
)

SELECT *
FROM CTE_MAIN M
INNER JOIN CTE_PARTS P
ON P.PART_ID = M.PART_ID
ORDER BY M.PART_ID
	, ID
	, QTYIssues



--SELECT * FROM CTE_MAIN WHERE PART_ID = '09507-01000'

/*

select * from trace where IN_qty - out_qty <> reported_qty
select * from trace_inv_trans where trace_id = '1471830/1'

select * from inventory_trans where part_id = 'BACR15BA3AD4C' order by transaction_ID
select * from trace_inv_trans where part_id = 'BACR15BA3AD4C' order by transaction_ID
select * from trace where part_id = 'BACR15BA3AD4C'
*/
```