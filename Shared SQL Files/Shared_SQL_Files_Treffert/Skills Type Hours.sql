use live
go

select --*
    WORKORDER_BASE_ID,
    WORKORDER_LOT_ID,
    WORKORDER_SPLIT_ID,
    WORKORDER_SUB_ID,
    ra.PPD_Process,
    sum(lt.hours_worked) as HoursWorked
FROM	   
    labor_ticket lt
INNER JOIN 
	LIVESupplemental.DBO.ResourceID_Assignments RA
		ON RA.Resource_ID = lt.RESOURCE_ID
		and skills_type = 'M'
WHERE
    lt.TRANSACTION_DATE >= '1/1/2016'
    and     lt.TRANSACTION_DATE < '8/1/2016'
group by
    WORKORDER_BASE_ID,
    WORKORDER_LOT_ID,
    WORKORDER_SPLIT_ID,
    WORKORDER_SUB_ID,
    ra.PPD_Process
Order by
    WORKORDER_BASE_ID,
    WORKORDER_LOT_ID,
    WORKORDER_SPLIT_ID,
    WORKORDER_SUB_ID,
    ra.PPD_Process