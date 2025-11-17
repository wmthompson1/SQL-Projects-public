# Document Revision Change

```sql
use live
go

select * from document where id = 'MY875M PL'
select * from REVISION_HISTORY where history_id = 'MY875M PL'

--delete from REVISION_HISTORY where history_id = 'MY875M PL' and revision_id = 'F'

```