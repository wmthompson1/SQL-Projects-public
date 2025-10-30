use live
go

drop table #t1

select 'wo' as msg, part_id, base_id, lot_id, sub_id, wo.[status], DESIRED_QTY, DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE) as [Year], month(wo.DESIRED_WANT_DATE) as [Month], ra.location, sum(lt.HOURS_WORKED) as HoursWorked
into #t1
from work_order wo
inner join operation o
	on  wo.[type] = o.workorder_type
	and wo.base_id = o.workorder_base_id
	and wo.lot_id = o.workorder_lot_id
	and wo.split_id = o.workorder_split_id
	and wo.sub_id = o.workorder_sub_id
left outer join labor_ticket lt
	on  wo.[type] = lt.workorder_type
	and wo.base_id = lt.workorder_base_id
	and wo.lot_id = lt.workorder_lot_id
	and wo.split_id = lt.workorder_split_id
	and wo.sub_id = lt.workorder_sub_id
	and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
inner join livesupplemental.dbo.resourceID_assignments ra
	on o.resource_id = ra.resource_id
where 
	wo.[type] = 'W'
	and wo.DESIRED_WANT_DATE >= '1/1/2015'
	and (wo.[status] in ('C', 'R') or (wo.[status] = 'X' and lt.hours_worked is not null))
	and wo.part_id is not null
group by wo.part_id, base_id, lot_id, sub_id, wo.[status], wo.DESIRED_QTY, DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE), month(wo.DESIRED_WANT_DATE), ra.location
union 
select 'cp' as msg, cp.part_id, base_id, lot_id, sub_id, wo.[status], cp.DESIRED_QTY, wo.DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE) as [Year], month(wo.DESIRED_WANT_DATE) as [Month], ra.location, sum(lt.HOURS_WORKED) as HoursWorked
from work_order wo
inner join co_product cp
	on  wo.[type] = cp.workorder_type
	and wo.base_id = cp.workorder_base_id
	and wo.lot_id = cp.workorder_lot_id
	and wo.split_id = cp.workorder_split_id
	and wo.sub_id = cp.workorder_sub_id
inner join operation o
	on  wo.[type] = o.workorder_type
	and wo.base_id = o.workorder_base_id
	and wo.lot_id = o.workorder_lot_id
	and wo.split_id = o.workorder_split_id
	and wo.sub_id = o.workorder_sub_id
left outer join labor_ticket lt
	on  wo.[type] = lt.workorder_type
	and wo.base_id = lt.workorder_base_id
	and wo.lot_id = lt.workorder_lot_id
	and wo.split_id = lt.workorder_split_id
	and wo.sub_id = lt.workorder_sub_id
	and o.SEQUENCE_NO = lt.OPERATION_SEQ_NO
inner join livesupplemental.dbo.resourceID_assignments ra
	on o.resource_id = ra.resource_id
where 
	wo.[type] = 'W'
	and wo.DESIRED_WANT_DATE >= '1/1/2015'
	and (wo.[status] in ('C', 'R') or (wo.[status] = 'X' and lt.hours_worked is not null))
	and wo.part_id is not null
group by cp.part_id, base_id, lot_id, sub_id, wo.[status], cp.DESIRED_QTY, DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE), month(wo.DESIRED_WANT_DATE), ra.location 

--select * from #t1





select t.*, PartNumber, PurchaseOrder, RejectTag, ReceivedQTY, RejectedQTY, IntDate, DetectionSite, ProcessNC, SubProcessNC, DefectNC, QtyReworked, QTYAcceptedReInsp, TagCloseDate, WoQty, TotalAccepted, TotalRejected, NonconformanceSite, Operation, CustomerID, NonconformanceDISPO1
from #t1 t
left outer join nc2012.dbo.tblNonconformances PPD
on ppd.workorder = t.base_id
and ppd.lot = t.lot_id
and ppd.sub = t.sub_id
and ppd.PartNumber = t.part_id
and NonconformanceDISPO1 like '%SNN%'
--and t.DESIRED_WANT_DATE >= '1/1/2015'



