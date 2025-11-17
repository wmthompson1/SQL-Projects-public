# Supervisors Table Creation

```sql
use LIVESupplemental
go


create table Supervisors
(
[reports to] nvarchar(50),
FName nvarchar(50),
LName nvarchar(50),
Email nvarchar(50)
)

Insert into Supervisors
select --*
distinct [reports to], 
case		
	when [reports to] = 'Baker, W. P.' then 'Rick'
	when [reports to] = 'Browning, Eldon M.' then 'Eldon'
	when [reports to] = 'Chien, Hsu-Yueh Steve' then 'Steve'
	when [reports to] = 'Francis, Timmothy' then 'Timm'
	when [reports to] = 'Gromoff, Natalie' then 'Natalie'
	when [reports to] = 'Jonsson, Genevieve' then 'Genny'
	when [reports to] = 'Kaiser, Laurell' then 'Laurell'
	when [reports to] = 'Nichols, David' then 'David'
	when [reports to] = 'Olson, George' then 'Dan'
	when [reports to] = 'Pasomsouk, Souriya' then 'Joe'
	when [reports to] = 'Richards, Donald' then 'Don'
	when [reports to] = 'Suzuki, Megumi' then 'Meg'
	when [reports to] = 'White, David' then 'Dave'
	when [reports to] = 'Ingram, Rick A.' then 'Rick'
	when [reports to] = 'Hartman, Gregory Wayne' then 'Greg'
	when [reports to] = 'Wentzke, M. Ann' then 'Ann'
	when [reports to] = 'Gilbertson, Gail M.' then 'Gail'
	when [reports to] = 'Baker, Michael R.' then 'Mike'
	when [reports to] = 'Rice, Jason Wayne' then 'Jason'
	when [reports to] = 'Dusenbery, Alexander' then 'Alex'
	else first_name
end as FName, 
case		
	when [reports to] = 'Baker, W. P.' then 'Baker'
	when [reports to] = 'Browning, Eldon M.' then 'Browning'
	when [reports to] = 'Chien, Hsu-Yueh Steve' then 'Chien'
	when [reports to] = 'Francis, Timmothy' then 'Francis'
	when [reports to] = 'Gromoff, Natalie' then 'Gromoff'
	when [reports to] = 'Jonsson, Genevieve' then 'Jonsson'
	when [reports to] = 'Kaiser, Laurell' then 'Kaiser'
	when [reports to] = 'Nichols, David' then 'Nichols'
	when [reports to] = 'Olson, George' then 'Olson'
	when [reports to] = 'Pasomsouk, Souriya' then 'Pasomsouk'
	when [reports to] = 'Richards, Donald' then 'Richards'
	when [reports to] = 'Suzuki, Megumi' then 'Suzuki'
	when [reports to] = 'White, David' then 'White'
	else last_name
end as LName, 
case		
	when [reports to] = 'Baker, W. P.' then 'rickb@skillsinc.com'
	when [reports to] = 'Browning, Eldon M.' then 'Eldon@skillsinc.com'
	when [reports to] = 'Chien, Hsu-Yueh Steve' then 'SteveC@skillsinc.com'
	when [reports to] = 'Francis, Timmothy' then 'timmf@skillsinc.com'
	when [reports to] = 'Gromoff, Natalie' then 'Natalie@skillsinc.com'
	when [reports to] = 'Jonsson, Genevieve' then 'Genny@skillsinc.com'
	when [reports to] = 'Kaiser, Laurell' then 'Laurell@skillsinc.com'
	when [reports to] = 'Nichols, David' then 'davidn@skillsinc.com'
	when [reports to] = 'Olson, George' then 'danolson@skillsinc.com'
	when [reports to] = 'Pasomsouk, Souriya' then 'joep@skillsinc.com'
	when [reports to] = 'Richards, Donald' then 'DonR@skillsinc.com'
	when [reports to] = 'Suzuki, Megumi' then 'meg@skillsinc.com'
	when [reports to] = 'White, David' then 'dave@skillsinc.com'
	else email_addr
end as email
from emp_ADP 
left outer join live.dbo.employee ee
on cast(last_name + ', ' + first_name as nvarchar) = [reports to]
where status = 'Active' and [reports to] <> ''

insert into supervisors values ('Testing', 'traci', 'treffert', 'tracit@skillsinc.com')

```