declare @StartDate datetime = '1/1/2017',
		@EndDate datetime = '6/1/2017'

select SupvEmail, ee.*
from 
	(SELECT 
		A.[Reports To],
		T.EMPLOYEE_ID, 
		T.TRANSACTION_DATE, 
		E.LAST_NAME, 
		E.FIRST_NAME, 
		E.DEPARTMENT_ID, 
		T.WORKORDER_BASE_ID, 
		t.resource_id, 
		T.HOURS_WORKED, 
		E.SHIFT_ID, 
		T.TRANSACTION_ID,
		case
			when T.WORKORDER_BASE_ID is NULL then 'Indirect'
			else 'Direct'
		end as [Ticket Type],
		Active 
	FROM 
		LABOR_TICKET AS T 
	INNER JOIN 
		EMPLOYEE AS E 
		ON T.EMPLOYEE_ID = E.ID
	left OUTER JOIN 
		LIVESupplemental.DBO.emp_ADP AS A
		ON T.EMPLOYEE_ID = A.EmpID
	WHERE 
		T.ACT_CLOCK_OUT IS NULL
		AND T.ACT_CLOCK_IN IS NOT NULL
		AND T.HOURS_WORKED IS NULL
		AND (T.TRANSACTION_DATE >= @StartDate 
		AND T.TRANSACTION_DATE < @EndDate)
	) ee
inner join
	(select distinct [reports to], ee.email_addr as SupvEmail
	from livesupplemental.dbo.emp_ADP a
	inner join employee ee
		on a.[reports to] = ee.last_name + ', ' + ee.first_name
		and active = 'Y'
	) email
	on ee.[reports to] = email.[reports to]
where active = 'Y'
ORDER BY 
	email.SupvEmail,
	Employee_ID