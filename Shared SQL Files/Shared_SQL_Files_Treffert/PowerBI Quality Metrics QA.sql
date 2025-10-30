use datawarehouse
go

with cte_initial as
(select 
	month(wo.desired_want_date) as [Month]
	, year(wo.desired_want_date) as [Year]
	, case	
		when wo.status = 'C' then
			case
				when woqty is null then desired_qty
				else woqty
			end
		else 0
	end as TotalQty
	, *
from work_order wo
left outer join tblNonconformances ppd
on  ppd.WorkOrder = wo.base_id
and ppd.lot = wo.lot_id
and ppd.split = wo.split_id
and ppd.sub = wo.sub_id
and ppd.PartNumber = wo.part_id
where wo.type = 'w'
and status = 'C'
) 

select [year]
	, [month]
	, sum(totalqty) as TotalQty
	, sum(rejectedqty) as RejectedQty
	, (1 - (sum(rejectedqty) / sum(totalqty))) * 100 as [Percentage]
from cte_initial
where [year] = 2018
group by [year]
	, [month]
order by [year]
	, [month]


--select * from tblNonconformances order by intdate desc
select year(intdate) 
	, month(intdate) 
	, sum(rejectedqty) as RejectedQty
from tblNonconformances 
where year(intdate) = 2018
group by year(intdate)	, month(intdate) 
order by year(intdate)	, month(intdate) 