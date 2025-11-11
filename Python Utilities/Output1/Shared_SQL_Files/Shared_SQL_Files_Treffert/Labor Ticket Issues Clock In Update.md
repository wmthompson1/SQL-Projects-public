# Labor Ticket Issues Clock In Update

```sql
use live
go

select * from labor_ticket where transaction_id = '18652062'

update labor_ticket
set clock_in = act_clock_in
where transaction_id = '18652062'
```