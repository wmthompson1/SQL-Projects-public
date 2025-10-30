use july19
go

select *
from payable_line pl
inner join payable p
on pl.voucher_id = p.voucher_id
and p.posting_date between '7/1/2019' and '7/31/2019'
where (pl.receiver_id is null and pl.gl_account_id = '205')
or (pl.receiver_id is not null and pl.gl_account_id <> '205')
--> bypassing gl_account for detail account or vice versa

