use live 
go
select 
id, name, SALESREP_ID
from customer
where 
    name like '%Damar%'
    or name like '%AMT%'
    or name like '%Absolute%'
    or name like '%Senior Aerospace Mexico%'
    or name like '%Rantech%'
    or name like '%Treske%'
    or name like '%Quality Stamping%'
    or name like '%Rainier Rubber%'
    or name like '%Versa Form%'
    or name like '%Steve stead%'
    or name like '%Compass%'
    or name like '%Neumeier%'
    or id like '%Damar%'
    or id like '%AMT%'
    or id like '%Absolute%'
    or id like '%SenAer%'
    or id like '%Rantec%'
    or id like '%Treske%'
    or id like '%Quality Stamping%'
    or id like '%Rainier Rubber%'
    or id like '%Vers%'
    or id like '%Stev%'
    or id like '%Compass%'
    or id like '%Neumeier %'



use livesupplemental
go

select *
from [dbo].[customer_reps]


