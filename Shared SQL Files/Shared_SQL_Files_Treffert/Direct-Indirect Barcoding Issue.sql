use DataWarehouse
go

with cte_indirect as
(select * from labor_ticket lt
where workorder_base_id is null
and transaction_date >= '1/1/2016'
)

, cte_direct as
(select * from labor_ticket lt
where workorder_base_id is not null
and transaction_date >= '1/1/2016'
)

select i.employee_id
, i.TRANSACTION_ID as IndirectXct
, d.TRANSACTION_ID as DirectXct
, i.transaction_date
, d.CLOCK_IN
, i.CLOCK_IN
, d.workorder_base_id
, d.workorder_lot_id
, d.workorder_split_id
, d.workorder_sub_id
, d.OPERATION_SEQ_NO
, d.RESOURCE_ID
, d.HOURS_WORKED as DirectHours
, i.HOURS_WORKED as IndirectHours
from cte_direct d
inner join cte_indirect i
on i.employee_id = d.employee_id
and datepart(year, i.TRANSACTION_DATE) = datepart(year, d.TRANSACTION_DATE)
and datepart(month, i.TRANSACTION_DATE) = datepart(month, d.TRANSACTION_DATE)
and datepart(day, i.TRANSACTION_DATE) = datepart(day, d.TRANSACTION_DATE)
and datepart(hour, i.TRANSACTION_DATE) = datepart(hour, d.TRANSACTION_DATE)
and datepart(minute, i.TRANSACTION_DATE) = datepart(minute, d.TRANSACTION_DATE)
and datepart(year, i.clock_in) = datepart(year, d.clock_in)
and datepart(month, i.clock_in) = datepart(month, d.clock_in)
and datepart(day, i.clock_in) = datepart(day, d.clock_in)
and datepart(hour, i.clock_in) = datepart(hour, d.clock_in)
and datepart(minute, i.clock_in) = datepart(minute, d.clock_in)
order by d.employee_id
, d.transaction_date


--select * from labor_ticket where transaction_id in ('13288687', '13290553', '13290556', '13290564')

use live
go

select * from EMPLOYEE where id = '3100'

select * from PREFERENCES where section like 'barcodelaborentry' and [entry] = 'autostopindirect'