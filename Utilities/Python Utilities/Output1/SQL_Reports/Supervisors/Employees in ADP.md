# Employees in ADP

```sql
SELECT
  ADP_EMP.[File Number]
  ,ADP_EMP.[Last Name]
  ,ADP_EMP.[First Name]
  ,ADP_EMP.[Preferred Name]
  ,ADP_EMP.[Position Status]
  ,ADP_EMP.[Location Code]
  ,ADP_EMP.[Location Description]
  ,ADP_EMP.[Home Department Code]
  ,ADP_EMP.[Home Department Description]
  ,ADP_EMP.[Reports To Name]
  ,ADP_EMP.[Reports To Job Title Description]
  ,ADP_EMP.[Job Title Description]
  ,ADP_EMP.[Job Title Code]
  ,ADP_EMP.[Job Title Description1]
  ,ADP_EMP.[Assigned Shift Code]
  ,ADP_EMP.[Assigned Shift Description]
  ,ADP_EMP.[Job Class Code]
  ,ADP_EMP.[Hire Date]
  ,ADP_EMP.[Rehire Date]
  ,ADP_EMP.[Hire/Rehire Date]
  ,ADP_EMP.[Termination Date]
  ,ADP_EMP.[Termination Reason Code]
  ,ADP_EMP.[Termination Reason Description]
  ,ADP_EMP.[Status Flag 3 Code]
  ,ADP_EMP.[Status Flag 3 Description]
  ,ADP_EMP.[Work Contact: Work Email]
FROM
  ADP_EMP
WHERE
  ADP_EMP.[Position Status] LIKE @PositionStatus
  AND ADP_EMP.[Last Name] LIKE '%' + @LastName + '%'

```