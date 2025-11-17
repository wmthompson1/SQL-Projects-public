# Null Labor Tickets Resource Updates.

```sql
use LIVESupplemental
go

--delete
select * 
from ResourceID_ReportSettings 
where Report_Name = 'null labor tickets'
and resource_id not in ('arl-cert', 'arl-review', 'bal-cert', 'bal-finalinsp', 'bal-panel', 'aub-cert', 'aub-etch', 'aub-finalinsp', 'aub-panel', 'anm-finalinsp', 'P1F1-IN-CERT', 'P1F1-IN-FNL', 'P1F2-IN-FNL-CMP', 'P1M1-CP-FNL', 'P2M1-IN-FNL', 'P3M1-IN-FNL', 'P3M1-IN-FNL-CMP')

insert into ResourceID_ReportSettings values ('arl-cert', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('arl-review', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('bal-cert', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('bal-finalinsp', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('bal-panel', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('aub-cert', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('aub-etch', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('aub-finalinsp', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('aub-panel', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('anm-finalinsp', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P1F1-IN-CERT', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P1F1-IN-FNL', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P1F2-IN-FNL-CMP', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P1M1-CP-FNL', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P2M1-IN-FNL', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P3M1-IN-FNL', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)
insert into ResourceID_ReportSettings values ('P3M1-IN-FNL-CMP', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 2/12/2018', 0)

```