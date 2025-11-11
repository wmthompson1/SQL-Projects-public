# Planners Insert

```sql
use LIVESupplemental
go

select *
from planners
order by string_id

insert into planners values 
('171', 'KNB', 'Auburn', '2727', 'Kim Blakely', 'FIN', 'N', 'Jeff Thiessen'),
('172', '/KNB', 'Auburn', '2727', 'Kim Blakely', 'FIN', 'N', 'Jeff Thiessen'),
('173', 'KNB/', 'Auburn', '2727', 'Kim Blakely', 'FIN', 'N', 'Jeff Thiessen'),
('174', '/KNB/', 'Auburn', '2727', 'Kim Blakely', 'FIN', 'N', 'Jeff Thiessen')

```