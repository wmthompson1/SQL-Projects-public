# Part Updates

```sql
use live
go

select --* 
 p.id
 , p.[description]
 , udf26.number_val as SurfaceArea 
 , udf35.string_val as MaterialType
 , udf36.string_val as Alloy
 , udf37.number_val as [Length]
 , udf38.number_val as [Width]
 , udf39.number_val as [Thickness]
 , udf40.number_val as [ITAR]
from part p
inner join work_order wo
 on  p.id = wo.part_id
 and DATEDIFF(year, close_date, GETDATE()) <= 2
left outer join 
 USER_DEF_FIELDS udf26
 on  p.id = udf26.document_id
 and udf26.program_id = 'VMPRTMNT'
 and udf26.id = 'UDF-0000026'
left outer join 
 USER_DEF_FIELDS udf35
 on  p.id = udf35.document_id
 and udf35.program_id = 'VMPRTMNT'
 and udf35.id = 'UDF-0000035'
left outer join 
 USER_DEF_FIELDS udf36
 on  p.id = udf36.document_id
 and udf36.program_id = 'VMPRTMNT'
 and udf36.id = 'UDF-0000036'
left outer join 
 USER_DEF_FIELDS udf37
 on  p.id = udf37.document_id
 and udf37.program_id = 'VMPRTMNT'
 and udf37.id = 'UDF-0000037'
left outer join 
 USER_DEF_FIELDS udf38
 on  p.id = udf38.document_id
 and udf38.program_id = 'VMPRTMNT'
 and udf38.id = 'UDF-0000038'
left outer join 
 USER_DEF_FIELDS udf39
 on  p.id = udf39.document_id
 and udf39.program_id = 'VMPRTMNT'
 and udf39.id = 'UDF-0000039'
left outer join 
 USER_DEF_FIELDS udf40
 on  p.id = udf40.document_id
 and udf40.program_id = 'VMPRTMNT'
 and udf40.id = 'UDF-0000040'
where 
udf26.number_val is null
-- udf37.number_val is null
 or udf38.number_val is null
 or udf39.number_val is null

group by
 p.id
 , p.[description]
 , udf26.number_val
 , udf35.string_val
 , udf36.string_val
 , udf37.number_val
 , udf38.number_val
 , udf39.number_val
 , udf40.number_val



 select string_val, count(*) from user_def_fields where id = 'UDF-0000035' group by string_val order by string_val

 select * from user_def_fields where document_id = '110T3212-152' --id = 'UDF-0000037' and order by rowid desc

 /*
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78406-3', 6.15)

update part set description = 'CVR PLT HSG' where id = '08ND78406-3'


insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78406-3', 6.15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78406-5', 6.14)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78591-905', 5.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78624-11', 7.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78837-8', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78838-8', 5.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78839-3', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78857-4', 12.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78858-1', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '08ND78862-1', 16)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '1', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '100-172-2042-PO1', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '100-360-1015', 2.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '110T3212-152', 5.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112A5100-923', 69.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112A5151-7', 51.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112A7321-405', 12.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112T2023-35', 13)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112T2023-50', 13.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112T2027-915', 10.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112T2027-932', 11.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112T4606-12', 4.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112W1630-3', 8.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '112W5017-88', 7.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '113T1576-24', 12.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '113T1608-120', 8.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '113T1666-312', 32.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '113T8313-7', 8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115A2152-911', 35.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115U2216-9002', 41.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115U2262-9016', 17)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115U6267-26', 23.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115U8207-1', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '115W5219-1', 17.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '116U3240-4', 86.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '12516-1', 6.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140T2102-1878', 4.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0051-2421', 7.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0051-2485', 6.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0051-2500', 6.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0051-3187', 6.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0061-1646', 5.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U0061-2111', 5.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U2303-51', 9.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U2402-61', 20.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U5703-133', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U9119-36', 60.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U9119-37', 35)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140U9120-12 IMA1', 11.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140W2415-29', 16)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140W9264-905A', 74.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140W9517-501', 10.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '140W9604-9019', 87.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141A1704-27', 78)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141A1704-47', 78)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141A5410-62', 17.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141T3223-43', 7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141T5604-5', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141T8210-30', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141U0037-22', 10)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141U8300-4', 19.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141W1156-3', 5.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '141W1187-1', 27)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142A6332-6', 4.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142U1023-212', 4.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142U5305-176-01', 92.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142U7776-16', 11)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142U7794-49-01', 4.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '142U8103-19', 6.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '143A9405-5M', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '143W2365-107', 2.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144A2618-22', 9.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144A2640-14', 3.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144A9753-11', 8.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144U0090-910', 13.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144U1011-7', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '144U4922-5', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146A8208-11', 100.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146A8208-15', 78.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146T0807-4', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146T5649-901', 21)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U1910-7', 17.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U6218-5', 132.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U7715-5', 235)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U8343-11', 131)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U8644-1', 98.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U8644-2', 98.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U9319-2', 78.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U9321-46', 14.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U9417-14', 28.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '146U9419-28', 66.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '147A5702-13', 9.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '149A7148-19 IMA1', 17.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '149A7510-28', 58.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '149U7051-9003', 53.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '149U7112-9169', 12.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '149U7220-43', 22)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '15-5PHP-025X7X14-CMP', 14)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '151W6899-5 IMA1', 22.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '151W7585-1', 40.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '152W0204-5', 12.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '161Z3940-1', 4.69)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '165Z3920-1', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '174A1201-908', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '17P1N5062-3', 2.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '17P8D9248-002', 6.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '17P8D9295-001-402', 26)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '204-18852-5', 7.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '204-37031-9', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '214W2467-72', 5.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '216T1010-1', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '217T2435-710', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '217T2435-712', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232T4244-2 MOD', 5.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232U4256-4', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232U4507-2', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232W4381-25B', 12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232W4381-26B', 12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '232W4392-2A', 8.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '233T5226-59', 22.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '251T1122-2', 5.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '251U2218-8', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '254A1305-1', 5.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '255T4175-30', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '256U5902-17', 4.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '270N2000-835', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '272T4570-14', 4.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '272U8112-6', 10.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '272W9152-94 IMA1', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284A3801-74', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284U1872U2', 9.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284U6014-52', 26.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284W1803-29', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284W1891-1', 41.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '284t0176-9028', 13.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T0015-1472', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T0015-1476', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T0020-1378', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T0020-424', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T0020-514', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T1030-29', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T1030-33', 6.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T4108-13 (-15)', 17.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287T4150-761', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287U0062-6', 6.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287W4507-21', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '287W5012-18', 5.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '313T2380-1152', 4.38)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '313T3360-289', 32.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '313U8224-1', 14.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '313W5813-3', 15.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '315T4019-101 (-108)', 3.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '343T0022-7', 4.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '3441B0054-3', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '345T0021-4', 3.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '348T2230-30', 4.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '352A2300-20', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '411U7119-260', 2.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '412A3200-29', 3.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413N3616-290', 55.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413T1057-58', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413T1057-79', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413T1057-81', 1.86)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U1193-5B', 4.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U1235-66', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U1235-7', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U1239-20C', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U1523-18', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U2180-29', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413U3165-210', 60)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413W1223-8A', 31.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '413W4121-89SK3', 98.82)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414U6311-137', 10.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414U6311-176B', 50)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414U6311-193C', 7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414U6311-29B', 27)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414U6311-93B', 38)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414W2525-214', 3.51)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414W2525-257', 5.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414W2525-353', 4.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '414W2525-354', 4.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416N1019-14 IMA1', 11.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416T2833-2', 30.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416T2833-3', 30.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416U1307-6', 9.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416U6011-13D', 6.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416U6011-17D', 32.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '416U6011-9D', 32.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '417A1130-44', 44.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '417T5074-52', 7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '418U3416-150 IMA1', 27.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '422W1135-33B', 12.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '432W1202-18B', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '436W5600-6', 10.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '439W3278-518B', 13.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451T1603-20', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451T1608-166', 3.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-26-02', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-26-03', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-26-04', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-89', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-96', 4.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '451U1113-99', 4.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453T7049-12 IMA1', 46.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453T7162-56', 58.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U1510-127', 101.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U1532-2', 44.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U1560-191', 101.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U7033-1026', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U7033-85', 5.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U7232-143L01', 115.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U7232-147L01', 136.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '453U7232-148L01', 136.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '481Z1130-7', 7.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '4X4-FT-COUPON', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '61B10009-113-20', 4.21)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65-49649U11', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65-82082-5', 4.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65-86021-15', 12.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B01705-116', 6.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B01836-226', 8.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B04347-179', 6.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B04715-3', 99.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B06314-265', 8.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B07627-110', 124.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B07653-9433', 19.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B07948-6', 36)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B08300-515 IMA2', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B08301-619 IMA1', 18.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B10098-145', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B10527-9051', 26.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B12300-12-07', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B12572-5', 13.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B14230-38', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B17415-27', 8.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B17656-2-05', 117)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B24840-285A', 125.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B26630-46', 21.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B38741-3', 25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B52991-6 IMA1', 7.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B52991-8 IMA1', 37.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B54152-4', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B56045-5', 5.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B56262-917', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B60307U10', 12.45)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65B83344-3', 22.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65C26275-73', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65C26845-703', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65C27481-8', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65C37284-6', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65Y18706-37', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '65Y18706-51', 24.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '66-13524-6', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '679Z7055-4', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '688-22850-15', 87.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69-40822-1', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69-43850-2', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69-60093-3', 1.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B03432-24', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B10412-18', 6.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B42059-3', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B54766-16 IMA1', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B54766-4', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B54766-5', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B56048-10', 0.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '69B98826-5', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '7-511A21558-33', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '7075-6', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '7075-T6-100-6X6-TRNG', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '710Z8611-23', 6.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '715Z8521-7', 76)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '72P7830317M003', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '749-24253-17', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-21356-1', 7.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34513-103', 24.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34513-119', 12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34515-103', 16)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34515-117', 25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34535-23', 15.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34542-25', 15.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34542-29', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34579-16', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34580-106', 50.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34580-108', 50.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '775-34653-105', 16.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '778-10017-41', 13.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '778-10017-48', 3.45)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '813A0025-1', 24.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '813A0026-2', 7.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '814B6523-15', 9.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '832Z7450-16', 23.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '841B1311-13', 13.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '9-65836-5', 6.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '901-031-109-157', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', '901-031-917-103', 8.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'FAUB-65-76487-11-125-6"X15"', 15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'FAUB-65-76487-11-160-6"X15"', 15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'K32079-113', 35.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'SPL111A3210-35M', 139.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'TS99050-2X30A', 30)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'TS99125-1X21A', 21)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'Tapered filler-TRNG', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'USC777-094-1T', 11.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000037', 'USC777-522-139T', 4.82)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78406-3', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78406-5', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78591-905', 4.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78624-11', 4.12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78837-8', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78838-8', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78839-3', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78857-4', 4.13)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78858-1', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '08ND78862-1', 7.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '1', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '100-172-2042-PO1', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '100-360-1015', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '110T3212-152', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112A5100-923', 14.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112A5151-7', 6.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112A7321-405', 10.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112T2023-35', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112T2023-50', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112T2027-915', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112T2027-932', 3.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112T4606-12', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112W1630-3', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '112W5017-88', 4.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '113T1576-24', 10.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '113T1608-120', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '113T1666-312', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '113T8313-7', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115A2152-911', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115U2216-9002', 3.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115U2262-9016', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115U6267-26', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115U8207-1', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '115W5219-1', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '116U3240-4', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '12516-1', 5.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140T2102-1878', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0051-2421', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0051-2485', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0051-2500', 3.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0051-3187', 3.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0061-1646', 1.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U0061-2111', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U2303-51', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U2402-61', 12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U5703-133', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U9119-36', 7.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U9119-37', 4.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140U9120-12 IMA1', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140W2415-29', 11.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140W9264-905A', 8.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140W9517-501', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '140W9604-9019', 11)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141A1704-27', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141A1704-47', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141A5410-62', 9.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141T3223-43', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141T5604-5', 2.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141T8210-30', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141U0037-22', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141U8300-4', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141W1156-3', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '141W1187-1', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142A6332-6', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142U1023-212', 2.33)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142U5305-176-01', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142U7776-16', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142U7794-49-01', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '142U8103-19', 5.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '143A9405-5M', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '143W2365-107', 0.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144A2618-22', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144A2640-14', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144A9753-11', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144U0090-910', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144U1011-7', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '144U4922-5', 2.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146A8208-11', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146A8208-15', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146T0807-4', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146T5649-901', 8.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U1910-7', 11)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U6218-5', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U7715-5', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U8343-11', 8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U8644-1', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U8644-2', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U9319-2', 5.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U9321-46', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U9417-14', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '146U9419-28', 5.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '147A5702-13', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '149A7148-19 IMA1', 7.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '149A7510-28', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '149U7051-9003', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '149U7112-9169', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '149U7220-43', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '15-5PHP-025X7X14-CMP', 7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '151W6899-5 IMA1', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '151W7585-1', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '152W0204-5', 3.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '161Z3940-1', 2.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '165Z3920-1', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '174A1201-908', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '17P1N5062-3', 1.35)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '17P8D9248-002', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '17P8D9295-001-402', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '204-18852-5', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '204-37031-9', 1.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '214W2467-72', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '216T1010-1', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '217T2435-710', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '217T2435-712', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232T4244-2 MOD', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232U4256-4', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232U4507-2', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232W4381-25B', 9.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232W4381-26B', 9.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '232W4392-2A', 6.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '233T5226-59', 5.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '251T1122-2', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '251U2218-8', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '254A1305-1', 1.55)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '255T4175-30', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '256U5902-17', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '270N2000-835', 0.78)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '272T4570-14', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '272U8112-6', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '272W9152-94 IMA1', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284A3801-74', 1.37)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284U1872U2', 5.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284U6014-52', 12.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284W1803-29', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284W1891-1', 0.95)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '284t0176-9028', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T0015-1472', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T0015-1476', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T0020-1378', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T0020-424', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T0020-514', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T1030-29', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T1030-33', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T4108-13 (-15)', 15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287T4150-761', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287U0062-6', 5.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287W4507-21', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '287W5012-18', 4.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '313T2380-1152', 1.73)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '313T3360-289', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '313U8224-1', 3.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '313W5813-3', 5.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '315T4019-101 (-108)', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '343T0022-7', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '3441B0054-3', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '345T0021-4', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '348T2230-30', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '352A2300-20', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '411U7119-260', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '412A3200-29', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413N3616-290', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413T1057-58', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413T1057-79', 1.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413T1057-81', 1.13)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U1193-5B', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U1235-66', 1.65)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U1235-7', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U1239-20C', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U1523-18', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U2180-29', 1.12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413U3165-210', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413W1223-8A', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '413W4121-89SK3', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414U6311-137', 4.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414U6311-176B', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414U6311-193C', 3.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414U6311-29B', 23)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414U6311-93B', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414W2525-214', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414W2525-257', 3.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414W2525-353', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '414W2525-354', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416N1019-14 IMA1', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416T2833-2', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416T2833-3', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416U1307-6', 7.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416U6011-13D', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416U6011-17D', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '416U6011-9D', 3.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '417A1130-44', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '417T5074-52', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '418U3416-150 IMA1', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '422W1135-33B', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '432W1202-18B', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '436W5600-6', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '439W3278-518B', 12.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451T1603-20', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451T1608-166', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-26-02', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-26-03', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-26-04', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-89', 2.28)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-96', 2.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '451U1113-99', 2.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453T7049-12 IMA1', 14)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453T7162-56', 1.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U1510-127', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U1532-2', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U1560-191', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U7033-1026', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U7033-85', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U7232-143L01', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U7232-147L01', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '453U7232-148L01', 3.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '481Z1130-7', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '4X4-FT-COUPON', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '61B10009-113-20', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65-49649U11', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65-82082-5', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65-86021-15', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B01705-116', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B01836-226', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B04347-179', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B04715-3', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B06314-265', 5.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B07627-110', 4.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B07653-9433', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B07948-6', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B08300-515 IMA2', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B08301-619 IMA1', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B10098-145', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B10527-9051', 20.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B12300-12-07', 1.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B12572-5', 6.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B14230-38', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B17415-27', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B17656-2-05', 9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B24840-285A', 5.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B26630-46', 8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B38741-3', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B52991-6 IMA1', 7.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B52991-8 IMA1', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B54152-4', 1.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B56045-5', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B56262-917', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B60307U10', 2.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65B83344-3', 0.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65C26275-73', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65C26845-703', 0.78)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65C27481-8', 4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65C37284-6', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65Y18706-37', 3.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '65Y18706-51', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '66-13524-6', 0.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '679Z7055-4', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '688-22850-15', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69-40822-1', 1.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69-43850-2', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69-60093-3', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B03432-24', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B10412-18', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B42059-3', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B54766-16 IMA1', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B54766-4', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B54766-5', 1.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B56048-10', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '69B98826-5', 0.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '7-511A21558-33', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '7075-6', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '7075-T6-100-6X6-TRNG', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '710Z8611-23', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '715Z8521-7', 10)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '72P7830317M003', 4.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '749-24253-17', 2.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-21356-1', 5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34513-103', 18)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34513-119', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34515-103', 10.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34515-117', 5.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34535-23', 6.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34542-25', 6.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34542-29', 3.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34579-16', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34580-106', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34580-108', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '775-34653-105', 4.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '778-10017-41', 8.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '778-10017-48', 1.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '813A0025-1', 2.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '813A0026-2', 4.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '814B6523-15', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '832Z7450-16', 11.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '841B1311-13', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '9-65836-5', 1.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '901-031-109-157', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', '901-031-917-103', 4.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'FAUB-65-76487-11-125-6"X15"', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'FAUB-65-76487-11-160-6"X15"', 6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'K32079-113', 16.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'SPL111A3210-35M', 6.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'TS99050-2X30A', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'TS99125-1X21A', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'Tapered filler-TRNG', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'USC777-094-1T', 0.81)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000038', 'USC777-522-139T', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78406-3', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78591-905', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78624-11', 2.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78837-8', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78839-3', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '08ND78862-1', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '1', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '100-172-2042-PO1', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '100-360-1015', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112A5100-923', 3.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112A5151-7', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112A7321-405', 5.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112T2023-35', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112T2027-915', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112T2027-932', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112T4606-12', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '112W1630-3', 0.27)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '113T1576-24', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '113T1666-312', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115A2152-911', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115U2216-9002', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115U2262-9016', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115U6267-26', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115U8207-1', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '115W5219-1', 2.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '116U3240-4', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '12516-1', 0.59)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140T2102-1878', 0.071)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U0051-2421', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U0051-2485', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U0051-2500', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U0061-1646', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U0061-2111', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U2303-51', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U2402-61', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U5703-133', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U9119-36', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140U9119-37', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140W2415-29', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140W9264-905A', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140W9517-501', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '140W9604-9019', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141A1704-27', 0.12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141A1704-47', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141A5410-62', 1.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141T3223-43', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141T5604-5', 0.12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141T8210-30', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141U0037-22', 0.13)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141U8300-4', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '141W1187-1', 0.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142A6332-6', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142U1023-212', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142U5305-176-01', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142U7776-16', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142U7794-49-01', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '142U8103-19', 0.056)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '143A9405-5M', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '144A2618-22', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '144A2640-14', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '144A9753-11', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '144U1011-7', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '144U4922-5', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146A8208-11', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146A8208-15', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146T0807-4', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146T5649-901', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U1910-7', 1.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U7715-5', 3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U8343-11', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U8644-1', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U8644-2', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U9417-14', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '146U9419-28', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '147A5702-13', 2.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '149A7148-19 IMA1', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '149A7510-28', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '149U7112-9169', 0.63)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '149U7220-43', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '151W6899-5 IMA1', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '151W7585-1', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '152W0204-5', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '161Z3940-1', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '165Z3920-1', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '174A1201-908', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '17P1N5062-3', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '17P8D9248-002', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '17P8D9295-001-402', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '204-18852-5', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '204-37031-9', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '214W2467-72', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '216T1010-1', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '217T2435-710', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '217T2435-712', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232T4244-2 MOD', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232U4256-4', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232U4507-2', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232W4381-25B', 8.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232W4381-26B', 0.11)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '232W4392-2A', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '233T5226-59', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '251T1122-2', 0.15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '251U2218-8', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '254A1305-1', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '255T4175-30', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '256U5902-17', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '270N2000-835', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '272T4570-14', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '272U8112-6', 0.15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '272W9152-94 IMA1', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284A3801-74', 1.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284U1872U2', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284U6014-52', 0.071)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284W1803-29', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284W1891-1', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '284t0176-9028', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T0015-1472', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T0015-1476', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T0020-1378', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T0020-424', 1.3)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T0020-514', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T1030-29', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T1030-33', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T4108-13 (-15)', 0.63)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287T4150-761', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287U0062-6', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287W4507-21', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '287W5012-18', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '313T2380-1152', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '313T3360-289', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '313U8224-1', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '313W5813-3', 1.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '315T4019-101 (-108)', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '343T0022-7', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '345T0021-4', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '348T2230-30', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '352A2300-20', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '412A3200-29', 0.16)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413N3616-290', 0.18)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413T1057-58', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413T1057-79', 1.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413T1057-81', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U1193-5B', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U1235-66', 0.03)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U1235-7', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U1239-20C', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U1523-18', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U2180-29', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413U3165-210', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '413W4121-89SK3', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414U6311-137', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414U6311-176B', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414U6311-193C', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414U6311-93B', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414W2525-214', 0.11)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414W2525-257', 2.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414W2525-353', 0.087)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '414W2525-354', 0.088)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '416U1307-6', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '416U6011-13D', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '416U6011-17D', 0.071)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '416U6011-9D', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '417A1130-44', 0.03)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '417T5074-52', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '418U3416-150 IMA1', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '422W1135-33B', 0.25)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '432W1202-18B', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '439W3278-518B', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451T1603-20', 0.24)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-26-02', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-26-03', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-26-04', 0.03)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-89', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-96', 0.02)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '451U1113-99', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453T7049-12 IMA1', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U1510-127', 1.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U1532-2', 0.63)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U1560-191', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U7033-1026', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U7232-143L01', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U7232-147L01', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '453U7232-148L01', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '481Z1130-7', 2.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '61B10009-113-20', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65-49649U11', 0.03)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65-82082-5', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65-86021-15', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B01705-116', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B01836-226', 0.52)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B04715-3', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B06314-265', 0.21)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B07627-110', 0.063)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B07653-9433', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B07948-6', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B08300-515 IMA2', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B08301-619 IMA1', 0.4)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B10098-145', 0.12)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B10527-9051', 0.025)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B12572-5', 0.14)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B14230-38', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B17415-27', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B17656-2-05', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B24840-285A', 0.16)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B26630-46', 0.75)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B38741-3', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B52991-6 IMA1', 0.01)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B56045-5', 0.05)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B56262-917', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B60307U10', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65B83344-3', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65C26275-73', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65C26845-703', 0.2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65C27481-8', 0.037)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65C37284-6', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65Y18706-37', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '65Y18706-51', 0.125)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '679Z7055-4', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69-43850-2', 1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69-60093-3', 0.036)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69B03432-24', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69B10412-18', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69B42059-3', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69B54766-16 IMA1', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '69B98826-5', 0.03)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '7-511A21558-33', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '710Z8611-23', 0.06)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '715Z8521-7', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '72P7830317M003', 3.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '749-24253-17', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-21356-1', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34513-103', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34515-117', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34535-23', 0.8)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34542-25', 0.6)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34542-29', 0.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34580-106', 1.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34580-108', 2)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '775-34653-105', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '778-10017-41', 0.15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '778-10017-48', 0.15)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '813A0025-1', 0.07)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '813A0026-2', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '832Z7450-16', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '9-65836-5', 0.1)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '901-031-109-157', 0.9)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', '901-031-917-103', 3.7)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', 'SPL111A3210-35M', 2.5)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', 'TS99050-2X30A', 0.04)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', 'TS99125-1X21A', 0.09)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', 'USC777-094-1T', 0.18)
insert into user_def_fields (Program_ID, ID, Document_ID, Number_Val) Values ('VMPRTMNT', 'UDF-0000039', 'USC777-522-139T', 0.08)
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78406-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78406-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78591-905', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78624-11', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78837-8', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78838-8', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78839-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78857-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78858-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '08ND78862-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '100-172-2042-PO1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '100-360-1015', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '110T3212-152', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112A5100-923', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112A5151-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112A7321-405', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112T2023-35', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112T2023-50', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112T2027-915', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112T2027-932', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112T4606-12', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112W1630-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '112W5017-88', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '113T1576-24', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '113T1608-120', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '113T1666-312', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '113T8313-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115A2152-911', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115U2216-9002', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115U2262-9016', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115U6267-26', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115U8207-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '115W5219-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '116U3240-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '12516-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140T2102-1878', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0051-2421', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0051-2485', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0051-2500', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0051-3187', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0061-1646', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U0061-2111', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U2303-51', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U2402-61', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U5703-133', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U9119-36', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U9119-37', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140U9120-12 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140W2415-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140W9264-905A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140W9517-501', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '140W9604-9019', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141A1704-27', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141A1704-47', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141A5410-62', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141T3223-43', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141T5604-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141T8210-30', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141U0037-22', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141U8300-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141W1156-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '141W1187-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142A6332-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142U1023-212', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142U5305-176-01', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142U7776-16', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142U7794-49-01', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '142U8103-19', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '143A9405-5M', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '143W2365-107', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144A2618-22', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144A2640-14', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144A9753-11', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144U0090-910', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144U1011-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '144U4922-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146A8208-11', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146A8208-15', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146T0807-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146T5649-901', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U1910-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U6218-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U7715-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U8343-11', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U8644-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U8644-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U9319-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U9321-46', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U9417-14', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '146U9419-28', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '147A5702-13', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '149A7148-19 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '149A7510-28', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '149U7051-9003', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '149U7112-9169', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '149U7220-43', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '15-5PHP-025X7X14-CMP', 'STEEL')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '151W6899-5 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '151W7585-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '152W0204-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '161Z3940-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '165Z3920-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '174A1201-908', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '17P1N5062-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '17P8D9248-002', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '17P8D9295-001-402', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '204-18852-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '204-37031-9', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '214W2467-72', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '216T1010-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '217T2435-710', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '217T2435-712', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '232T4244-2 MOD', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '232U4256-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '232U4507-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '232W4381-26B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '232W4392-2A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '233T5226-59', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '251T1122-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '251U2218-8', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '254A1305-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '255T4175-30', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '256U5902-17', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '270N2000-835', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '272T4570-14', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '272U8112-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '272W9152-94 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284A3801-74', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284U1872U2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284U6014-52', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284W1803-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284W1891-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '284t0176-9028', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T0015-1472', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T0015-1476', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T0020-1378', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T0020-424', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T0020-514', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T1030-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T1030-33', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T4108-13 (-15)', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287T4150-761', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287U0062-6', 'CRES')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287W4507-21', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '287W5012-18', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '313T2380-1152', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '313T3360-289', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '313U8224-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '313W5813-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '315T4019-101 (-108)', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '343T0022-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '3441B0054-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '345T0021-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '348T2230-30', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '352A2300-20', 'TITANIUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '411U7119-260', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '412A3200-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413N3616-290', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413T1057-58', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413T1057-79', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413T1057-81', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U1193-5B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U1235-66', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U1235-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U1239-20C', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U1523-18', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U2180-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413U3165-210', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413W1223-8A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '413W4121-89SK3', 'FOAM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414U6311-137', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414U6311-176B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414U6311-193C', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414U6311-29B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414U6311-93B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414W2525-214', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414W2525-257', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414W2525-353', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '414W2525-354', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416N1019-14 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416T2833-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416T2833-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416U1307-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416U6011-13D', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416U6011-17D', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '416U6011-9D', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '417A1130-44', 'ANNEALED STEEL')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '417T5074-52', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '418U3416-150 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '422W1135-33B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '432W1202-18B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '436W5600-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '439W3278-518B', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451T1603-20', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451T1608-166', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-26-02', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-26-03', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-26-04', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-89', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-96', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '451U1113-99', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453T7049-12 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453T7162-56', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U1510-127', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U1532-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U1560-191', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U7033-1026', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U7033-85', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U7232-143L01', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U7232-147L01', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '453U7232-148L01', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '481Z1130-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '61B10009-113-20', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65-49649U11', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65-82082-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65-86021-15', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B01705-116', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B01836-226', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B04347-179', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B04715-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B06314-265', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B07627-110', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B07653-9433', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B07948-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B08300-515 IMA2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B08301-619 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B10098-145', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B10527-9051', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B12300-12-07', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B12572-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B14230-38', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B17415-27', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B17656-2-05', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B24840-285A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B26630-46', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B38741-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B52991-6 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B52991-8 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B54152-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B56045-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B56262-917', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65B60307U10', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65C26275-73', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65C26845-703', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65C27481-8', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65C37284-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65Y18706-37', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '65Y18706-51', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '66-13524-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '679Z7055-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '688-22850-15', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69-40822-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69-43850-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69-60093-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B03432-24', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B10412-18', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B42059-3', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B54766-16 IMA1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B54766-4', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B54766-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B56048-10', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '69B98826-5', 'STAINLESS STEEL')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '7-511A21558-33', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '7075-6', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '7075-T6-100-6X6-TRNG', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '710Z8611-23', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '715Z8521-7', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '72P7830317M003', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '749-24253-17', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-21356-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34513-103', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34513-119', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34515-103', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34515-117', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34535-23', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34542-25', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34542-29', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34579-16', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34580-106', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34580-108', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '775-34653-105', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '778-10017-41', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '778-10017-48', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '813A0025-1', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '813A0026-2', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '814B6523-15', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '832Z7450-16', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '841B1311-13', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '9-65836-5', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '901-031-109-157', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', '901-031-917-103', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'K32079-113', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'SPL111A3210-35M', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'TS99050-2X30A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'TS99125-1X21A', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'USC777-094-1T', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000035', 'USC777-522-139T', 'ALUMINUM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78406-3', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78406-5', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78591-905', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78624-11', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78837-8', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78838-8', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78839-3', '7050-T7541 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78857-4', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78858-1', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '08ND78862-1', '7050-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '1', '6061')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '100-172-2042-PO1', '2024-T351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '100-360-1015', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '110T3212-152', '7075')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112A5100-923', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112A5151-7', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112A7321-405', '7075')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112T2023-35', '7050')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112T2023-50', '7050 T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112T2027-915', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112T2027-932', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112T4606-12', '7075')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112W1630-3', '2224-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '112W5017-88', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '113T1576-24', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '113T1608-120', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '113T1666-312', '2024 Clad')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '113T8313-7', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115A2152-911', '7075-T76 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115U2216-9002', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115U2262-9016', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115U6267-26', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115U8207-1', ' 7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '115W5219-1', '7075-T7351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '116U3240-4', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '12516-1', '6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140T2102-1878', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0051-2421', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0051-2485', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0051-2500', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0051-3187', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0061-1646', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U0061-2111', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U2303-51', '7075-T62 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U2402-61', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U5703-133', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U9119-36', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U9119-37', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140U9120-12 IMA1', '2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140W2415-29', '2024-T351  ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140W9264-905A', 'C188-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140W9517-501', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '140W9604-9019', '2524-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141A1704-27', '7075-T62 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141A1704-47', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141A5410-62', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141T3223-43', '7050-T7 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141T5604-5', 'TI-6AL-4V')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141T8210-30', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141U0037-22', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141U8300-4', '2024-T3511 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141W1156-3', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '141W1187-1', '7050-T7')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142A6332-6', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142U1023-212', ' 2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142U5305-176-01', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142U7776-16', '7055-T762')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142U7794-49-01', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '142U8103-19', '7075-T62 Clad')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '143A9405-5M', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '143W2365-107', '6013-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144A2618-22', '2024-T351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144A2640-14', '7050-T7651')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144A9753-11', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144U0090-910', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144U1011-7', '7075-T73 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '144U4922-5', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146A8208-11', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146A8208-15', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146T0807-4', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146T5649-901', '2024-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U1910-7', '7050-T7451 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U6218-5', '6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U7715-5', '7150-T77511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U8343-11', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U8644-1', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U8644-2', '7075-T6511 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U9319-2', '2524-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U9321-46', '7150-T77511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U9417-14', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '146U9419-28', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '147A5702-13', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '149A7148-19 IMA1', '2024-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '149U7051-9003', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '149U7112-9169', '2024-T42 Clad')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '149U7220-43', '7075-T7351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '15-5PHP-025X7X14-CMP', 'CMP .25 15-5PH ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '151W6899-5 IMA1', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '151W7585-1', ' 7075-0 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '152W0204-5', '7150-T77511 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '161Z3940-1', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '165Z3920-1', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '174A1201-908', '2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '17P1N5062-3', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '17P8D9248-002', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '17P8D9295-001-402', '2024-T351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '204-18852-5', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '204-37031-9', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '214W2467-72', '6013-T6 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '216T1010-1', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '217T2435-710', '6013-T6 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '217T2435-712', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '232T4244-2 MOD', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '232U4256-4', '6013-T6 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '232U4507-2', ' 2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '232W4392-2A', ' 6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '233T5226-59', '2024-T3 CL')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '251T1122-2', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '251U2218-8', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '254A1305-1', '7075-T73 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '255T4175-30', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '256U5902-17', '7050-T7451 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '270N2000-835', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '272T4570-14', '2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '272U8112-6', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '272W9152-94 IMA1', ' 2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284A3801-74', '2024-T8511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284U1872U2', '6013-T4 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284U6014-52', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284W1803-29', ' 2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284W1891-1', '6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '284t0176-9028', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T0015-1472', '6013-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T0015-1476', '6013-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T0020-1378', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T0020-424', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T0020-514', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T1030-29', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T1030-33', '2024-T3  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T4108-13 (-15)', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287T4150-761', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287U0062-6', 'CRES')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287W4507-21', ' 6013-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '287W5012-18', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '313T2380-1152', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '313T3360-289', '2024-T42 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '313U8224-1', ' 2024-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '313W5813-3', '2219-T851')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '315T4019-101 (-108)', '6061-T4 3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '343T0022-7', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '3441B0054-3', '2024-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '345T0021-4', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '348T2230-30', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '352A2300-20', 'TITANIUM  ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '411U7119-260', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '412A3200-29', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413T1057-58', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413T1057-81', '2024 T3  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U1193-5B', ' 2024-T3 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U1235-66', '6061-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U1235-7', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U1239-20C', ' 2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U1523-18', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U2180-29', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413U3165-210', '6061-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '413W4121-89SK3', 'FOAM')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414U6311-137', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414U6311-176B', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414U6311-193C', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414U6311-29B', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414U6311-93B', '6013-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414W2525-214', '7075-T62 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414W2525-257', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414W2525-353', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '414W2525-354', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416N1019-14 IMA1', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416T2833-2', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416T2833-3', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416U1307-6', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416U6011-13D', ' 2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416U6011-17D', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '416U6011-9D', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '417A1130-44', '304 ANL ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '417T5074-52', '2024-T42 CL')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '418U3416-150 IMA1', '6013-T6 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '422W1135-33B', '7075-T7351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '432W1202-18B', '6013-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '436W5600-6', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '439W3278-518B', ' 6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451T1603-20', '7075-T651  CLAD ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-26-02', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-26-03', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-26-04', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-89', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-96', ' 2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '451U1113-99', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453T7049-12 IMA1', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453T7162-56', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U1510-127', '7075-T6 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U1532-2', '7075-T6  Clad')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U7033-1026', '7075-T6  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U7033-85', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U7232-143L01', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U7232-147L01', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '453U7232-148L01', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '481Z1130-7', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '61B10009-113-20', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65-49649U11', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65-82082-5', '7075-T6 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65-86021-15', '2024-CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B01705-116', '2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B01836-226', '7075-T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B04347-179', '7075-T6 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B04715-3', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B06314-265', '7075- T73')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B07627-110', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B07653-9433', ' 2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B07948-6', '2024-T42  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B08300-515 IMA2', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B08301-619 IMA1', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B10098-145', '2024-T3511 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B10527-9051', '2024-T351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B12300-12-07', '7075-T6 CLAD ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B12572-5', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B14230-38', '2024 T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B17415-27', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B17656-2-05', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B24840-285A', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B26630-46', '7075-T651')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B38741-3', '7075-T651')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B52991-6 IMA1', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B52991-8 IMA1', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B54152-4', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B56045-5', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B56262-917', '2024-T42 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65B60307U10', '7075-T6 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65C26275-73', '7075-T6   CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65C26845-703', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65C27481-8', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65C37284-6', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65Y18706-37', '7075-T6511 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '65Y18706-51', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '66-13524-6', '2024-T4')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '679Z7055-4', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '688-22850-15', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69-40822-1', '2024')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69-43850-2', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69-60093-3', '2024-T3  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B03432-24', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B10412-18', '7075-T7351 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B42059-3', '2024-T3 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B54766-16 IMA1', '2024-T3 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B54766-4', '7075-T62 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B54766-5', '7075-T62')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B56048-10', '2024-T35 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '69B98826-5', '321 S.S. AMS5510')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '7-511A21558-33', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '7075-6', '7075 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '7075-T6-100-6X6-TRNG', '7075-T6.100')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '710Z8611-23', '2024-T42')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '715Z8521-7', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '72P7830317M003', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '749-24253-17', '6061-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-21356-1', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34513-103', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34513-119', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34515-103', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34515-117', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34535-23', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34542-25', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34542-29', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34579-16', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34580-106', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34580-108', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '775-34653-105', '7050-T7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '778-10017-41', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '778-10017-48', '7075-T7351')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '813A0025-1', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '813A0026-2', '7075-T62 CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '814B6523-15', '7075-T6511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '832Z7450-16', '6013-T4 BARE')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '841B1311-13', '2024-T4 ')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '9-65836-5', '7075-T6')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '901-031-109-157', '7075-T73511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', '901-031-917-103', '7050-7451')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'K32079-113', '2024-T3  CLAD')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'SPL111A3210-35M', '7055-T77511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'TS99050-2X30A', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'TS99125-1X21A', '2024-T3')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'USC777-094-1T', '2024-T3511')
insert into user_def_fields (Program_ID, ID, Document_ID, String_Val) Values ('VMPRTMNT', 'UDF-0000036', 'USC777-522-139T', '2024-T3')
update part set description = ' FAIRLEAD ASSY' where id = '287U0062-6'
update part set description = 'ALUMINUM W/O FINISH' where id = '7075-T6-100-6X6-TRNG'
update part set description = 'ANGLE ASSY' where id = '453U1560-191'
update part set description = 'ANGLE BRACKET' where id = '414U6311-193C'
update part set description = 'ANGLE' where id = '142U5305-176-01'
update part set description = 'ANGLE' where id = '251T1122-2'
update part set description = 'ANGLE' where id = '251U2218-8'
update part set description = 'ANGLE' where id = '65-49649U11'
update part set description = 'ANGLE' where id = '65B07627-110'
update part set description = 'ANGLE' where id = '65B52991-6 IMA1'
update part set description = 'ANGLE' where id = '65B52991-8 IMA1'
update part set description = 'ANGLE' where id = '65B56045-5'
update part set description = 'ANGLE' where id = '65B60307U10'
update part set description = 'ANGLE' where id = '69B56048-10'
update part set description = 'ANGLE-TEE' where id = '146U9417-14'
update part set description = 'APPROACH PLATE' where id = '232T4244-2 MOD'
update part set description = 'ASSY' where id = '147A5702-13'
update part set description = 'Aft Panel Closure' where id = '17P8D9295-001-402'
update part set description = 'Angle' where id = '778-10017-41'
update part set description = 'Angle' where id = '778-10017-48'
update part set description = 'BACKING PLATE' where id = '416U6011-13D'
update part set description = 'BACKING PLATE' where id = '416U6011-17D'
update part set description = 'BACKUP FTG ' where id = '08ND78839-3'
update part set description = 'BENCH ACCESS SPLICE' where id = '414U6311-93B'
update part set description = 'BLOCK' where id = '1'
update part set description = 'BMS1-68 Foam Assy' where id = '413W4121-89SK3'
update part set description = 'BRACKET .063' where id = '287W4507-21'
update part set description = 'BRACKET ASSY' where id = '414W2525-257'
update part set description = 'BRACKET ASSY' where id = '414W2525-353'
update part set description = 'BRACKET ASSY' where id = '414W2525-354'
update part set description = 'BRACKET ASSY' where id = '65B54152-4'
update part set description = 'BRACKET DOUBLER' where id = '414U6311-29B'
update part set description = 'BRACKET' where id = '140U2303-51'
update part set description = 'BRACKET' where id = '142U7794-49-01'
update part set description = 'BRACKET' where id = '214W2467-72'
update part set description = 'BRACKET' where id = '216T1010-1'
update part set description = 'BRACKET' where id = '217T2435-710'
update part set description = 'BRACKET' where id = '217T2435-712'
update part set description = 'BRACKET' where id = '256U5902-17'
update part set description = 'BRACKET' where id = '272T4570-14'
update part set description = 'BRACKET' where id = '272U8112-6'
update part set description = 'BRACKET' where id = '272W9152-94 IMA1'
update part set description = 'BRACKET' where id = '284U1872U2'
update part set description = 'BRACKET' where id = '284W1803-29'
update part set description = 'BRACKET' where id = '287T0020-1378'
update part set description = 'BRACKET' where id = '287T4150-761'
update part set description = 'BRACKET' where id = '315T4019-101 (-108)'
update part set description = 'BRACKET' where id = '343T0022-7'
update part set description = 'BRACKET' where id = '345T0021-4'
update part set description = 'BRACKET' where id = '348T2230-30'
update part set description = 'BRACKET' where id = '412A3200-29'
update part set description = 'BRACKET' where id = '413U1235-66'
update part set description = 'BRACKET' where id = '413U1235-7'
update part set description = 'BRACKET' where id = '413U1239-20C'
update part set description = 'BRACKET' where id = '413W1223-8A'
update part set description = 'BRACKET' where id = '414W2525-214'
update part set description = 'BRACKET' where id = '417T5074-52'
update part set description = 'BRACKET' where id = '439W3278-518B'
update part set description = 'BRACKET' where id = '65C37284-6'
update part set description = 'BRACKET' where id = '65Y18706-51'
update part set description = 'BRACKET' where id = '7-511A21558-33'
update part set description = 'BRACKET' where id = '841B1311-13'
update part set description = 'BRKT ASSY' where id = '233T5226-59'
update part set description = 'BRKT ASSY' where id = '287T4108-13 (-15)'
update part set description = 'BRKT SUPPORT' where id = '65C27481-8'
update part set description = 'BRKT' where id = '115U8207-1'
update part set description = 'BRKT' where id = '232U4256-4'
update part set description = 'BRKT' where id = '416N1019-14 IMA1'
update part set description = 'BRKT' where id = '69-60093-3'
update part set description = 'BUMPER' where id = '08ND78862-1'
update part set description = 'Back-up Fitting' where id = '72P7830317M003'
update part set description = 'Bracket Assy' where id = '149U7220-43'
update part set description = 'Bracket' where id = '284U6014-52'
update part set description = 'CHANNEL' where id = '141U8300-4'
update part set description = 'CHANNEL' where id = '270N2000-835'
update part set description = 'CHANNEL' where id = '453U1510-127'
update part set description = 'CHANNEL' where id = '65-86021-15'
update part set description = 'CHANNEL' where id = '65B56262-917'
update part set description = 'CHANNEL' where id = '65C26845-703'
update part set description = 'CHORD' where id = '141A1704-27'
update part set description = 'CHORD' where id = '141A1704-47'
update part set description = 'CHORD-INBD' where id = '65B08301-619 IMA1'
update part set description = 'CLEAT BACKUP' where id = '901-031-917-103'
update part set description = 'CLIP .063' where id = '69B54766-5'
update part set description = 'CLIP ASSY' where id = '413T1057-79'
update part set description = 'CLIP' where id = '143W2365-107'
update part set description = 'CLIP' where id = '144U4922-5'
update part set description = 'CLIP' where id = '255T4175-30'
update part set description = 'CLIP' where id = '413T1057-81'
update part set description = 'CLIP' where id = '69-40822-1'
update part set description = 'CLIP' where id = '69B42059-3'
update part set description = 'CLIP' where id = '69B54766-4'
update part set description = 'CLOSEOUT' where id = '775-34535-23'
update part set description = 'COVER' where id = '232W4392-2A'
update part set description = 'CVR PLT HSG' where id = '08ND78406-3'
update part set description = 'Channel' where id = '65Y18706-37'
update part set description = 'Clip Detail' where id = '142U8103-19'
update part set description = 'Clip Tee' where id = '901-031-109-157'
update part set description = 'Clip' where id = '204-37031-9'
update part set description = 'Clip' where id = '284A3801-74'
update part set description = 'Close Out' where id = '65B26630-46'
update part set description = 'DADO PANEL' where id = '453T7049-12 IMA1'
update part set description = 'DBLR BRACKET' where id = '161Z3940-1'
update part set description = 'DEFLECTOR' where id = '416U1307-6'
update part set description = 'DETAIL FTG' where id = '775-34542-29'
update part set description = 'DISCONNECT BRAC.' where id = '414U6311-137'
update part set description = 'DOOR' where id = '149A7148-19 IMA1'
update part set description = 'DOUBLER' where id = '65B01705-116'
update part set description = 'DOUBLER' where id = '65B08300-515 IMA2'
update part set description = 'DOUBLER-WEB' where id = '813A0026-2'
update part set description = 'Doubler Bracket' where id = '165Z3920-1'
update part set description = 'Doubler Hinge' where id = '775-34542-25'
update part set description = 'FAUB-65-76487-11-125-CLAD' where id = 'FAUB-65-76487-11-125-6"X15"'
update part set description = 'FAUB-65-76487-11-160 - CLAD' where id = 'FAUB-65-76487-11-160-6"X15"'
update part set description = 'FILLER PANEL ASSY' where id = '204-18852-5'
update part set description = 'FILLER' where id = '141T5604-5'
update part set description = 'FILLER' where id = '141U0037-22'
update part set description = 'FILLER' where id = '142U1023-212'
update part set description = 'FILLER' where id = '144U1011-7'
update part set description = 'FILLER' where id = '146T0807-4'
update part set description = 'FILLER' where id = '65B10098-145'
update part set description = 'FILLER' where id = '65B12300-12-07'
update part set description = 'FILLER' where id = '69B54766-16 IMA1'
update part set description = 'FITTING ASSY' where id = '08ND78838-8'
update part set description = 'FITTING UPR LOCKOUT' where id = '08ND78591-905'
update part set description = 'FITTING' where id = '110T3212-152'
update part set description = 'FITTING' where id = '113T8313-7'
update part set description = 'FITTING' where id = '142U7776-16'
update part set description = 'FITTING' where id = '146U1910-7'
update part set description = 'FITTING' where id = '146U8343-11'
update part set description = 'FITTING' where id = '284t0176-9028'
update part set description = 'FITTING' where id = '69B03432-24'
update part set description = 'FLAME SHIELD ' where id = '352A2300-20'
update part set description = 'FRAME ASSY' where id = '149A7510-28'
update part set description = 'FRAME END FITTING' where id = '144U0090-910'
update part set description = 'FRAME SPLICE' where id = '481Z1130-7'
update part set description = 'FRAME' where id = '313W5813-3'
update part set description = 'FRAME' where id = '65B17656-2-05'
update part set description = 'FRAME' where id = '749-24253-17'
update part set description = 'FTG ASSY' where id = '08ND78624-11'
update part set description = 'FTG ASSY' where id = '141W1156-3'
update part set description = 'FTG ASSY' where id = '144A2640-14'
update part set description = 'FTG DETAIL' where id = '112A7321-405'
update part set description = 'FTG' where id = '08ND78406-5'
update part set description = 'FTG' where id = '112W1630-3'
update part set description = 'FTG' where id = '141W1187-1'
update part set description = 'FTG' where id = '146U8644-1'
update part set description = 'FTG' where id = '146U8644-2'
update part set description = 'FTG' where id = '149U7051-9003'
update part set description = 'FTG' where id = '3441B0054-3'
update part set description = 'Fitting ASSY' where id = '149U7112-9169'
update part set description = 'Folding Table Coupon (Test)' where id = '4X4-FT-COUPON'
update part set description = 'GUSSET' where id = '174A1201-908'
update part set description = 'HINGE HALF' where id = '413N3616-290'
update part set description = 'HINGE HALF' where id = '416T2833-2'
update part set description = 'HINGE RIB' where id = '113T1576-24'
update part set description = 'HINGE SUPP' where id = '08ND78837-8'
update part set description = 'HINGE' where id = '17P1N5062-3'
update part set description = 'HINGE' where id = '416T2833-3'
update part set description = 'HOUSING' where id = '69-43850-2'
update part set description = 'INTERCOSTAL' where id = '146T5649-901'
update part set description = 'INTERCOSTAL' where id = '775-21356-1'
update part set description = 'Intercostal' where id = '141A5410-62'
update part set description = 'J BEAM ASSY' where id = '115A2152-911'
update part set description = 'Joint Strip' where id = '453U1532-2'
update part set description = 'KICKSTRIP' where id = '417A1130-44'
update part set description = 'LADDER' where id = '287W5012-18'
update part set description = 'LH CMN AREA SPLICE' where id = '414U6311-176B'
update part set description = 'LIGHT COVER' where id = '832Z7450-16'
update part set description = 'LINK' where id = '422W1135-33B'
update part set description = 'LOCK SUPPORT ' where id = '232U4507-2'
update part set description = 'LOWER CHORD' where id = '151W7585-1'
update part set description = 'LOWER CHORD' where id = '65B38741-3'
update part set description = 'LWR SPRT ASSY' where id = '432W1202-18B'
update part set description = 'NUTPLATE' where id = '65C26275-73'
update part set description = 'PANEL ASSY' where id = '08ND78857-4'
update part set description = 'PANEL INSTL' where id = '313T2380-1152'
update part set description = 'PANEL' where id = '08ND78858-1'
update part set description = 'PANEL' where id = '715Z8521-7'
update part set description = 'PANEL' where id = '775-34515-103'
update part set description = 'PIVOT SUPPORT' where id = '100-172-2042-PO1'
update part set description = 'PLATE' where id = '112T4606-12'
update part set description = 'PLATE' where id = '413U1193-5B'
update part set description = 'PLATE' where id = '451T1603-20'
update part set description = 'PLATE' where id = '775-34513-119'
update part set description = 'PLATE' where id = '775-34580-106'
update part set description = 'PROVAIL' where id = '413T1057-58'
update part set description = 'RAIL' where id = '775-34513-103'
update part set description = 'RETAINER ANGLE' where id = '65B04715-3'
update part set description = 'RETAINER' where id = '113T1608-120'
update part set description = 'RETAINER' where id = '146U6218-5'
update part set description = 'RETAINER' where id = '17P8D9248-002'
update part set description = 'RETAINER' where id = '284W1891-1'
update part set description = 'RETAINER' where id = '411U7119-260'
update part set description = 'RETAINER' where id = '65B07948-6'
update part set description = 'RIB ASSY 10' where id = '112A5100-923'
update part set description = 'RIB POST' where id = '112T2023-35'
update part set description = 'RIB POST' where id = '112T2023-50'
update part set description = 'RIB POST' where id = '112T2027-915'
update part set description = 'RIB' where id = '112A5151-7'
update part set description = 'RIB' where id = '115U2216-9002'
update part set description = 'RIBPOST' where id = '112T2027-932'
update part set description = 'ROD 356-T6' where id = '65B83344-3'
update part set description = 'ROD' where id = 'USC777-094-1T'
update part set description = 'ROD' where id = 'USC777-522-139T'
update part set description = 'Rib' where id = '115U2262-9016'
update part set description = 'SEAL RETAINER' where id = '115U6267-26'
update part set description = 'SEAL RETAINER' where id = '710Z8611-23'
update part set description = 'SHEAR FITTING' where id = '775-34579-16'
update part set description = 'SHEAR PANEL' where id = '140U2402-61'
update part set description = 'SHEAR PLATE' where id = '140U5703-133'
update part set description = 'SHEAR TIE' where id = '112W5017-88'
update part set description = 'SHEAR TIE' where id = '140T2102-1878'
update part set description = 'SHEAR TIE' where id = '140U0051-2421'
update part set description = 'SHEAR TIE' where id = '140U0051-2485'
update part set description = 'SHEAR TIE' where id = '140U0051-2500'
update part set description = 'SHEAR TIE' where id = '140U0051-3187'
update part set description = 'SHEAR TIE' where id = '287T1030-29'
update part set description = 'SHEAR TIE' where id = '287T1030-33'
update part set description = 'SHIM' where id = '451U1113-26-02'
update part set description = 'SHIM' where id = '451U1113-26-03'
update part set description = 'SHIM' where id = '451U1113-26-04'
update part set description = 'SHIM' where id = '451U1113-89'
update part set description = 'SHIM' where id = '451U1113-96'
update part set description = 'SHIM' where id = '451U1113-99'
update part set description = 'SHIM' where id = '61B10009-113-20'
update part set description = 'SHIM' where id = '69B98826-5'
update part set description = 'SHIM' where id = 'TS99050-2X30A'
update part set description = 'SHIM' where id = 'TS99125-1X21A'
update part set description = 'SHROUD' where id = '775-34515-117'
update part set description = 'SKIN' where id = 'K32079-113'
update part set description = 'SOL TREATED PLATE' where id = '15-5PHP-025X7X14-CMP'
update part set description = 'SPACER' where id = '100-360-1015'
update part set description = 'SPACER' where id = '66-13524-6'
update part set description = 'SPLICE DETAIL' where id = '152W0204-5'
update part set description = 'SPLICE FITTING' where id = '140U9120-12 IMA1'
update part set description = 'SPLICE FTG.' where id = '65B12572-5'
update part set description = 'SPLICE PLATE' where id = '140U9119-36'
update part set description = 'SPLICE PLATE' where id = '140U9119-37'
update part set description = 'SPLICE PLATE' where id = '140W9604-9019'
update part set description = 'SPLICE PLATE' where id = '65-82082-5'
update part set description = 'SPLICE PLATE' where id = '9-65836-5'
update part set description = 'SPLICE STRAP' where id = '140W9264-905A'
update part set description = 'SPLICE' where id = '65B06314-265'
update part set description = 'SPLICE' where id = '65B14230-38'
update part set description = 'SPRT DTL' where id = '453U7232-143L01'
update part set description = 'STIFFENER' where id = '115W5219-1'
update part set description = 'STIFFENER' where id = '65B01836-226'
update part set description = 'STIFFENER' where id = '814B6523-15'
update part set description = 'STIFFNER' where id = '65B24840-285A'
update part set description = 'STOP' where id = '254A1305-1'
update part set description = 'STOP' where id = '413U1523-18'
update part set description = 'STOWAGE ASSY' where id = '232W4381-25B'
update part set description = 'STOWAGE ASSY' where id = '232W4381-26B'
update part set description = 'STRAP' where id = '146A8208-11'
update part set description = 'STRAP' where id = '146A8208-15'
update part set description = 'STRAP' where id = '146U9419-28'
update part set description = 'STRAP' where id = '418U3416-150 IMA1'
update part set description = 'STRAP' where id = '65B04347-179'
update part set description = 'STRAP' where id = '813A0025-1'
update part set description = 'STRAP, SPLICE' where id = '146U9319-2'
update part set description = 'STRAPS' where id = '144A2618-22'
update part set description = 'STRIKE PLATE' where id = '413U2180-29'
update part set description = 'STRINGER CLIP' where id = '140U0061-1646'
update part set description = 'STRINGER CLIP' where id = '140U0061-2111'
update part set description = 'STRINGER SPLICE' where id = '146U9321-46'
update part set description = 'STRINGER SPLICE' where id = '69B10412-18'
update part set description = 'STRINGER' where id = '141T3223-43'
update part set description = 'STRINGER' where id = '146U7715-5'
update part set description = 'STRINGER' where id = '65B07653-9433'
update part set description = 'STRIP SUPPT ASSY' where id = '453T7162-56'
update part set description = 'SUPPORT ASSY' where id = '287T0020-514'
update part set description = 'SUPPORT ASSY' where id = '451T1608-166'
update part set description = 'SUPPORT BRACKET' where id = '287T0015-1472'
update part set description = 'SUPPORT BRACKET' where id = '453U7232-147L01'
update part set description = 'SUPPORT BRACKET' where id = '453U7232-148L01'
update part set description = 'SUPPORT BRKT' where id = '287T0015-1476'
update part set description = 'SUPPORT COR.' where id = '775-34580-108'
update part set description = 'SUPPORT' where id = '453U7033-1026'
update part set description = 'SUPPORT' where id = '453U7033-85'
update part set description = 'SUPT' where id = '142A6332-6'
update part set description = 'SWITCH PANEL' where id = '12516-1'
update part set description = 'SYS LINK' where id = '679Z7055-4'
update part set description = 'Seal Retainer' where id = '416U6011-9D'
update part set description = 'Splice Strap Assy' where id = '313U8224-1'
update part set description = 'Strap' where id = '116U3240-4'
update part set description = 'Stringer' where id = '140W9517-501'
update part set description = 'Structural Prov' where id = '144A9753-11'
update part set description = 'T-CLIP' where id = '141T8210-30'
update part set description = 'TEE SEAL' where id = '688-22850-15'
update part set description = 'TEE' where id = '143A9405-5M'
update part set description = 'TEST PANEL' where id = '7075-6'
update part set description = 'TRAILING EDGE' where id = '313T3360-289'
update part set description = 'TRIM STRIKER' where id = '436W5600-6'
update part set description = 'TRIM' where id = '413U3165-210'
update part set description = 'Tee' where id = '775-34653-105'
update part set description = 'Training part' where id = 'Tapered filler-TRNG'
update part set description = 'Truss' where id = '151W6899-5 IMA1'
update part set description = 'VENT STRINGER' where id = 'SPL111A3210-35M'
update part set description = 'WEB' where id = '65B10527-9051'
update part set description = 'WINDOW PLUG' where id = '140W2415-29'
update part set description = 'Wiggle Plate' where id = '113T1666-312'
update part set description = 'ZEE ASSY' where id = '65B17415-27'
update part set description = 'ZEE' where id = '287T0020-424'

```