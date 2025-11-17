# Active_Inactive

```sql
Select
[File Number]
,[Last Name]
,[First Name]
,[Preferred Name]
,[Position Status]
,[Location Description]
,[Home Department Code]
,[Reports To Name]
,[Job Title Description]
,Case
    When [Job Title Description] = '1' then 'F'
    Else 'P'
End as 'Worker Category Code'
,[Assigned Shift Code]
, [Job Class Code]
,Case
    When [Job Class Code] = 'RG' then 'Regular'
    when [Job Class Code] = 'C' Then 'Casual'
    When [Job Class Code] = 'H' then 'Hourly-Full Time'
    When [Job Class Code] = 'CB' then 'CBA'
    WHen [Job Class Code] = 'CT' Then 'Contract'
    When [Job Class Code] = 'P' Then 'Hrly-PartTime no-ben'
Else 'Salary'
End as 'Job Class'
,[Hire Date]
,[Rehire Date]
,[Termination Date]
,[Termination Reason Description]

from ADP_EMP

WHere [Position Status] in ('Active', 'Terminated', 'Leave')

```