# Employee_Training_Visual_Basics

```sql
-- Visual Enterprise Reports/Administrative Reports/Employee_Training_Visual_Basics

-- Identify who should next be having the Visual Basics class

SELECT a.empid,
       e.first_name,
       e.LAST_NAME,
       e.user_id,
      A.[Job Title],
       a.Shift,
       a.Status,
      A.Location,
      E.DEPARTMENT_ID,
      D.DESCRIPTION, 
       CASE
           WHEN [Rehire Date] IS NOT NULL
           THEN [rehire date]
           ELSE [hire date]
       END AS hiredate,
       CASE WHEN A.[DEPT CODE] LIKE '300%' THEN 'Finish'
           WHEN A.[Dept Code] LIKE '100%' THEN 'MFG'
          WHEN A.[Dept Code] LIKE '400%' THEN 'Finish'
          WHEN A.[Dept Code] LIKE '960%' THEN 'Admin'
        END AS 'line_of_business',
       a.[Reports To]
  FROM lIVESupplemental.dbo.emp_adp a
 INNER JOIN live.dbo.employee e
    ON e.id = a.empID
 INNER JOIN LIVE.DBO.DEPARTMENT D
    ON E.DEPARTMENT_ID = D.ID
 WHERE  CASE
           WHEN [Rehire Date] IS NOT NULL
           THEN [rehire date]
           ELSE [hire date]
          END > getdate()-28
      AND E.USER_ID IS NOT NULL

```