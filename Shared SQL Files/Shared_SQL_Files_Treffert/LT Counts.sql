use DataWarehouse
go

select EMPLOYEE_id, transaction_date, transaction_id, workorder_base_id, workorder_lot_id, workorder_split_id, workorder_sub_id, HOURS_WORKED
from LABOR_TICKET lt
where TRANSACTION_DATE >= '3/1/2018'
and employee_id in ('3705', '3341')
and WORKORDER_BASE_ID is not null