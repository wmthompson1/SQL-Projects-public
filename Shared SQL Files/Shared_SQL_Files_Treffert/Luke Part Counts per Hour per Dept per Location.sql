use live
go

Select
       lt.WORKORDER_BASE_ID
       ,lt.WORKORDER_LOT_ID
       ,lt.WORKORDER_SUB_ID
       ,lt.WORKORDER_SPLIT_ID
       ,lt.RESOURCE_ID
       ,lt.OPERATION_SEQ_NO
       ,o.[STATUS]
       ,lt.ACT_CLOCK_IN
	   ,lt.ACT_CLOCK_OUT
       ,lt.GOOD_QTY
	   ,o.resource_ID
	   ,ra.dept
	   ,ra.[location]
	   ,datepart(d, lt.ACT_CLOCK_OUT) as [Day]
	   ,datepart(hh, lt.ACT_CLOCK_OUT) as [Hour]
From
	[dbo].[LABOR_TICKET] as lt 
Inner Join [dbo].[OPERATION] AS o
	on lt.WORKORDER_BASE_ID = o.[WORKORDER_BASE_ID]
	and lt.WORKORDER_LOT_ID = o.WORKORDER_LOT_ID
	and lt.WORKORDER_SUB_ID = o.WORKORDER_SUB_ID
	and lt.WORKORDER_SPLIT_ID = o.WORKORDER_SPLIT_ID
	and lt.OPERATION_SEQ_NO = o.SEQUENCE_NO
inner join livesupplemental.dbo.ResourceID_Assignments ra
	on o.resource_id = ra.resource_id
Where
       lt.CLOCK_IN > '8/1/2017'
       and lt.CLOCK_IN < '8/2/2017'
       and lt.GOOD_QTY > '0'

Order by
       lt.WORKORDER_BASE_ID
       ,lt.WORKORDER_LOT_ID
       ,lt.WORKORDER_SUB_ID
       ,lt.WORKORDER_SPLIT_ID
       ,lt.OPERATION_SEQ_NO
       ,lt.ACT_CLOCK_IN
