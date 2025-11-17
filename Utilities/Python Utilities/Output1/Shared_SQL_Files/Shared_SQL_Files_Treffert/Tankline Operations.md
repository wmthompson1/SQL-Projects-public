# Tankline Operations

```sql
use live
go

--drop table #t1

select 'wo' as msg, part_id + '-' + base_id + '-' + lot_id + '-' + sub_id as [Key], part_id, 
--base_id, lot_id, sub_id, 
wo.[status], o.SEQUENCE_NO, o.resource_id, DESIRED_QTY, DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE) as [Year], month(wo.DESIRED_WANT_DATE) as [Month], sum(lt.HOURS_WORKED) as HoursWorked
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
	and (ra.dept = 'AUB-Tankline' or ra.resource_ID = 'AUB-PENetch')
where 
	wo.[type] = 'W'
--	and part_id in ('12 2410 0350', '12 4510 0350', '12 4511 6490', '12 4902 4350', '12 4903 2350', '12 4904 0350', '12 4904 8350', '12 4910 0350', '12 4911 6350', '12 4911 6490', '12 4913 2490', '12 5902 4350', '12 5903 2350', '12 5911 6350', '12 6102 4220', '12 6104 8280', '12 6113 2250', '12 6701 6280', '12 6702 4220', '12 6702 4280', '12 6703 2200', '12 6703 2220', '12 6703 2280', '12 6703 2350', '12 6704 0200', '12 6704 0350', '12 6704 8220', '12 6704 8280', '12 6710 0220', '12 6710 0280', '12 6710 0350', '12 6711 6280', '12 6711 6350', '12 6713 2200', '12 6713 2220', '12 6713 2250', '12 6713 2280', '12 6713 2350', '12 6714 8280', '12 6720 0350', '12 6723 2350', '12 6730 0350', '12 6733 2420', '12 6801 6280', '12 6802 4280', '12 6802 4281', '12 6802 4350', '12 6803 2280', '12 6803 2350', '12 6804 0200', '12 6804 0280', '12 6804 0350', '12 6804 8350', '12 6810 0350', '12 6902 4280', '12 6903 2280', '12 7011 6350')
	and wo.DESIRED_WANT_DATE >= '1/1/2015'
	and (wo.[status] in ('C', 'R') or (wo.[status] = 'X' and lt.hours_worked is not null))
	and wo.part_id is not null
group by wo.part_id + '-' + base_id + '-' + lot_id + '-' + sub_id, part_id, 
--base_id, lot_id, sub_id, 
wo.[status], o.SEQUENCE_NO, o.resource_id, DESIRED_QTY, DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE), month(wo.DESIRED_WANT_DATE)	
union 
select 'cp' as msg, cp.part_id + '-' + base_id + '-' + lot_id + '-' + sub_id as [Key], cp.part_id, 
--wo.base_id, wo.lot_id, wo.sub_id, 
wo.[status], o.SEQUENCE_NO, o.resource_id, cp.DESIRED_QTY, wo.DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE) as [Year], month(wo.DESIRED_WANT_DATE) as [Month], sum(lt.HOURS_WORKED) as HoursWorked
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
	and (ra.dept = 'AUB-Tankline' or ra.resource_ID = 'AUB-PENetch')
where 
	wo.[type] = 'W'
--	and cp.part_id in ('12 2410 0350', '12 4510 0350', '12 4511 6490', '12 4902 4350', '12 4903 2350', '12 4904 0350', '12 4904 8350', '12 4910 0350', '12 4911 6350', '12 4911 6490', '12 4913 2490', '12 5902 4350', '12 5903 2350', '12 5911 6350', '12 6102 4220', '12 6104 8280', '12 6113 2250', '12 6701 6280', '12 6702 4220', '12 6702 4280', '12 6703 2200', '12 6703 2220', '12 6703 2280', '12 6703 2350', '12 6704 0200', '12 6704 0350', '12 6704 8220', '12 6704 8280', '12 6710 0220', '12 6710 0280', '12 6710 0350', '12 6711 6280', '12 6711 6350', '12 6713 2200', '12 6713 2220', '12 6713 2250', '12 6713 2280', '12 6713 2350', '12 6714 8280', '12 6720 0350', '12 6723 2350', '12 6730 0350', '12 6733 2420', '12 6801 6280', '12 6802 4280', '12 6802 4281', '12 6802 4350', '12 6803 2280', '12 6803 2350', '12 6804 0200', '12 6804 0280', '12 6804 0350', '12 6804 8350', '12 6810 0350', '12 6902 4280', '12 6903 2280', '12 7011 6350')
	and wo.DESIRED_WANT_DATE >= '1/1/2015'
	and (wo.[status] in ('C', 'R') or (wo.[status] = 'X' and lt.hours_worked is not null))
	and wo.part_id is not null
group by cp.part_id + '-' + base_id + '-' + lot_id + '-' + sub_id, cp.part_id, 
--wo.base_id, wo.lot_id, wo.sub_id, 
wo.[status], o.SEQUENCE_NO, o.resource_id, cp.DESIRED_QTY, wo.DESIRED_WANT_DATE, year(wo.DESIRED_WANT_DATE), month(wo.DESIRED_WANT_DATE)

--select * from #t1

SELECT ROW_NUMBER() OVER (PARTITION BY [Key] ORDER BY [Key], sequence_no) AS Row, *
FROM #t1


```