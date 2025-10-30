use july19
go

select *
from RECEIVER_LINE
where purc_order_id = '128871'

select * from receiver where id = '161644'

select * from purchase_dist where purc_order_id = '128871' and gl_account_id = '205'
select * from payable_line where purc_order_id = '128871'
select * from payable_dist where voucher_id = '205731' and gl_account_id = '205'
select * from payable where voucher_id = '205731' 

select * from payable where [pay_status] = 'x' and posting_date >= '7/1/2019'
select * from payable_line where purc_order_id in ('128871', '129073')
select * from payable_dist where voucher_id in ('205731', '205287') and gl_account_id = '205'