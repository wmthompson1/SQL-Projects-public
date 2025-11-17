# InventoryTrans to WIPIssueDist

```sql
select * from INV_trans_dist where IN_TRANS_ID = 2568030
select * from INV_trans_dist where out_TRANS_ID = 2568031

select * from INVENTORY_TRANS where TRANSACTION_ID = 2568031

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
left outer join wip_issue_dist ad
on it.workorder_base_ID = ad.workorder_base_ID
and it.workorder_lot_ID = ad.workorder_lot_ID
and it.workorder_split_ID = ad.workorder_split_ID
and it.workorder_sub_ID = ad.workorder_sub_ID
and it.workorder_type = ad.workorder_type
and it.OPERATION_SEQ_NO = ad.
and ad.GL_ACCOUNT_ID in ('161', '162')
where it.TRANSACTION_DATE >= '4/1/2019'
and class = 'i'
and part_id is not null
and it.workorder_base_ID is not null
AND ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST <> 0
AND (CASE
	WHEN [TYPE] = 'O' THEN (ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST) * -1
	ELSE ACT_MATERIAL_COST + ACT_LABOR_COST + ACT_BURDEN_COST + ACT_SERVICE_COST
END - CASE
	WHEN AMOUNT_TYPE = 'DR' THEN AMOUNT
	ELSE AMOUNT * -1
END <> 0)

```