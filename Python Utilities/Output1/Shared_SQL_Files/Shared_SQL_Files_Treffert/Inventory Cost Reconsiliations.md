# Inventory Cost Reconsiliations

```sql
use crunch0419
go

/*
select * from inventory_trans 
where GL_ADJ_ACCT_ID in ('161', '162')
and year(transaction_date) = 2019

select *
from purc_order_line
where GL_EXPENSE_ACCT_ID in ('161', '162')

select * from product where INV_MAT_GL_ACCT_ID = '154'
select * from part where product_code = 'proj'

select * from INVENTORY_BALANCE where posting_date >= '1/1/2019' and MAT_GL_ACCT_ID = '154'

select *
from purc_order_line
where product_code = 'proj'
*/

select IT.TRANSACTION_ID
, PART_ID
, [TYPE]
, CLASS
, QTY
, COSTED_QTY
, TRANSACTION_DATE
, CASE
	WHEN [TYPE] = 'O' THEN (ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST) * -1
	ELSE ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST
END AS COSTS
, DIST_NO
, ENTRY_NO
, CASE
	WHEN AMOUNT_TYPE = 'DR' THEN AMOUNT
	ELSE AMOUNT * -1
END AS GL_AMOUNTS
, GL_ACCOUNT_ID
, BATCH_ID
from inventory_trans it
left outer join ADJUSTMENT_DIST ad
on it.TRANSACTION_ID = ad.TRANSACTION_ID
and ad.GL_ACCOUNT_ID in ('161', '162')
where it.TRANSACTION_DATE >= '4/1/2019'
and class = 'a'
and TRANSFER_TRANS_ID is null
AND ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST <> 0
AND (CASE
	WHEN [TYPE] = 'O' THEN (ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST) * -1
	ELSE ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST
END - CASE
	WHEN AMOUNT_TYPE = 'DR' THEN AMOUNT
	ELSE AMOUNT * -1
END <> 0)


select * 
from part
where (MAT_GL_ACCT_ID not in ('161', '162')
or bur_GL_ACCT_ID not in ('161', '162')
or lab_GL_ACCT_ID not in ('161', '162')
or ser_GL_ACCT_ID not in ('161', '162'))

select * from part_site where part_id in ('7034-1', '7034-2')

select * from ADJUSTMENT_DETAIL where TRANSACTION_ID = 2568030

select top 100 * from WIP_ISSUE_DETAIL order by WORKORDER_BASE_ID desc
```