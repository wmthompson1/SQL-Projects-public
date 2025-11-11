# Open Labor Tickets Report by email

```sql
SELECT distinct
	A.[Reports To],
	isnull(S.EMAIL_ADDR,'tracit@skillsinc.com') as Email
FROM 
	LABOR_TICKET AS T 
INNER JOIN 
	EMPLOYEE AS E 
	ON T.EMPLOYEE_ID = E.ID
LEFT OUTER JOIN 
	LIVESupplemental.DBO.emp_ADP AS A
	ON T.EMPLOYEE_ID = A.EmpID
	and status = 'Active'
left outer join
	(select distinct
		adp.[reports to],
		supv.[legal NameLF],
		supv.nameLF
	from 
		livesupplemental.dbo.emp_adp adp
	inner join
		livesupplemental.dbo.emp_adp supv
		on adp.[reports to] = supv.[legal NameLF]
		and supv.[status] = 'Active'
	) Sup
	on sup.[Legal NameLF] = a.[Reports To]

left outer JOIN 
	EMPLOYEE AS S 
	ON Sup.[nameLF] = S.[LAST_NAME] + ', ' + s.[FIRST_NAME]
	and s.active = 'Y'
WHERE 
	T.ACT_CLOCK_OUT IS NULL
	AND T.ACT_CLOCK_IN IS NOT NULL
	AND T.HOURS_WORKED IS NULL
	AND (T.TRANSACTION_DATE >= DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)
	AND T.TRANSACTION_DATE < getdate()-1)



```