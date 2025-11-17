# PPD Inspections (Luke)

```sql
use live
go

select 
	ppd.workorder,
	LT.TRANSACTION_ID, 
	LT.WORKORDER_BASE_ID, 
	LT.WORKORDER_LOT_ID, 
	LT.WORKORDER_SPLIT_ID, 
	LT.WORKORDER_SUB_ID, 
	LT.OPERATION_SEQ_NO, 
	LT.EMPLOYEE_ID, 
	ee.first_name,
	ee.last_name,
	LT.RESOURCE_ID, 
	LT.CLOCK_IN, 
	LT.CLOCK_OUT, 
	LT.HOURS_WORKED, 
	LT.TRANSACTION_DATE, 
	LT.HOURS_OVERALL, 
	LT.ACT_LABOR_COST, 
	LT.ACT_BURDEN_COST, 
	PPD.Customer, 
	PPD.PartNumber, 
	PPD.RejectTag, 
	PPD.ReceivedQTY, 
	PPD.RejectedQTY, 
	PPD.IntDate, 
	PPD.DispositionAuthor, 
	PPD.ReworkAuthor, 
	PPD.DispDateTime, 
	PPD.QtyReworked, 
	PPD.QTYAcceptedReInsp, 
	PPD.TagCloseDate, 
	PPD.TotalAccepted, 
	PPD.TotalRejected, 
	PPD.NonconformanceSite, 
	Operation, 
	PPD.Opp, 
	PPD.CauseNC

from operation o
inner join 
		labor_ticket lt
	on o.workorder_base_id = lt.workorder_base_id
	and o.workorder_lot_id = lt.workorder_lot_id
	and o.workorder_split_id = lt.workorder_split_id
	and o.workorder_sub_id = lt.workorder_sub_id
	and o.sequence_no = lt.OPERATION_SEQ_NO
	and lt.RESOURCE_ID in ('AUB-assyINSP', 'AUB-FINALinsp', 'AUB-insp', 'AUB-NrthMFGinsp', 'BAL-FINALinsp', 'BAL-insp', 'BAL-MFGinsp', 'AUB-Insp-Cargo', 'insp', 'ANM-insp', 'ANM-FINALinsp')
inner join
	nc2012.dbo.tblNonconformances ppd
	on o.workorder_base_id = ppd.workorder
	and o.workorder_lot_id = ppd.lot
	and o.workorder_split_id = ppd.split
	and o.workorder_sub_id = ppd.sub
--	and o.sequence_no = ppd.opp
inner join 
	employee ee
	on lt.employee_id = ee.id
where
	ppd.intdate >= '1/1/2017'
	and o.sequence_no >= ppd.opp
	and DetectionSite = 'Customer'
	and operation not like '%review'
Order by 
o.WORKORDER_BASE_ID,
o.WORKORDER_lot_ID,
o.WORKORDER_split_ID,
o.WORKORDER_sub_ID,
o.SEQUENCE_NO


/*
select *
--workorder, lot, split, sub, ppd.opp, ppd.operation, o.sequence_no, resource_id
from nc2012.dbo.tblNonconformances ppd
inner join operation o
	on o.workorder_base_id = ppd.workorder
	and o.workorder_lot_id = ppd.lot
	and o.workorder_split_id = ppd.split
	and o.workorder_sub_id = ppd.sub
	and o.sequence_no = ppd.opp
where intdate >= '1/1/2017'
order by [rejecttag]

select * from nc2012.dbo.tblNonconformances ppd where operation like '%review%' and DetectionSite = 'Customer'
*/
```