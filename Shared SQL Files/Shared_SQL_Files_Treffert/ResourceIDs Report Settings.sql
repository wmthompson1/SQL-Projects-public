use DataWarehouse
go

select * from SHOP_RESOURCE_site

use LIVESupplemental
go

select * from ResourceID_ReportSettings where Report_Name = 'null labor tickets'

insert into ResourceID_ReportSettings  values ('Contractor', 'Null Labor Tickets', 'ALL', 'Non-billed BOE Resources', 'exclusion - tlt 9/5/2018', '0')