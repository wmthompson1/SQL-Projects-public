use live
go

select user_id, count(*)
from shipper 
where create_date > '7/1/2015'
group by user_id

select user_id, count(*)
from INVENTORY_TRANS
where create_date > '7/1/2015'
group by user_id