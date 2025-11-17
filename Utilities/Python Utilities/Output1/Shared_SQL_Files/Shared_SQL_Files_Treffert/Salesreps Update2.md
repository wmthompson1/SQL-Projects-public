# Salesreps Update2

```sql
use LIVESupplemental 
go

--> Customer_Orders SalesrepIDs are assigned using the salesrepIDs on the Customer_Address Records. These need to be updated as well.

select *
from [dbo].[customer_reps]
where id in ('ABSMAN', 'AMTMFG', 'COMAER', 'DAMAR', 'NEUENG', 'QUASTA', 'RAIRUB', 'RANTEC', 'SEALEC', 'SEAMFG', 'SENAER', 'TRESKE', 'VERSAF', 'STEMAC')

--insert into [customer_reps] values ('AMTMFG', 'AEROSPACE MANUFACTURING TECH', 'Meg', 'Y', '8/1/2016', 'Per 7/29 Email from Charlie', NULL)

/*
update [customer_reps] 
set salesrep_id = 'Joe',
    [datechanged] = '8/1/2016',
    comments = comments + '; Per 7/29 Email from Charlie (tlt)'
where ID in ('COMAER', 'NEUENG', 'SEALEC', 'SEAMFG')

update [customer_reps] 
set salesrep_id = 'Meg',
    [datechanged] = '8/1/2016',
    comments = comments + '; Per 7/29 Email from Charlie (tlt)'
where ID in ('ABSMAN', 'DAMAR', 'SENAER')

update [customer_reps] 
set salesrep_id = 'Tracy',
    [datechanged] = '8/1/2016',
    comments = comments + '; Per 7/29 Email from Charlie (tlt)'
where ID in ('QUASTA', 'RAIRUB', 'RANTEC', 'TRESKE', 'VERSAF', 'STEMAC')

update [customer_reps] 
set comments = 'Per 7/29 Email from Charlie (tlt)'
where id in ('ABSMAN', 'AMTMFG', 'COMAER', 'DAMAR', 'NEUENG', 'QUASTA', 'RAIRUB', 'RANTEC', 'SEALEC', 'SEAMFG', 'SENAER', 'TRESKE', 'VERSAF', 'STEMAC')
and comments is null
*/

select c.id, c.name, c.salesrep_id, cr.*
from [LIVE].dbo.customer c
left outer join [LIVESupplemental].dbo.[customer_reps] cr
    on cr.id = c.id
where 
    (c.name not like '%DO NOT USE%' or cr.name not like '%DO NOT USE%')
    and (cr.id is null or c.salesrep_id <> cr.salesrep_id )
    and active_flag = 'Y'



```