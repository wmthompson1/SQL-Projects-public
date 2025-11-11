# View_DDS_COPart Monitor

```sql
USE [LIVESupplemental]
GO

/****** Object:  View [dbo].[View_DDS_COPartMonitor]    Script Date: 2/9/2017 1:23:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Alter VIEW [dbo].[View_DDS_COPartMonitor]
AS
select RecipientEmail, TimeframeByMinute, dbo.fn_ComDelPartIDs(RecipientEmail) as Part_IDs
from 
	[DDS_CO_Part_Monitor] PM
where exists
	(select 1 
	from 
		live.dbo.cust_order_line col 
	inner join 
		live.dbo.customer_order co
		on col.cust_order_id = co.id
	where 
		co.[status] not in ('C', 'X')
		and pm.part_id = col.part_id
		and DATEDIFF(n, co.create_date, GETDATE()) <= isnull(TimeframeByMinute,30)
	)
GROUP BY
	RecipientEmail, 
	TimeframeByMinute
	
GO

/*
/****** Object:  View [dbo].[View_DDS_COPartMonitorDaily]    Script Date: 2/9/2017 1:23:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter VIEW [dbo].[View_DDS_COPartMonitorDaily]
AS
select RecipientEmail, dbo.fn_ComDelPartIDs(RecipientEmail) as Part_IDs
from 
	[DDS_CO_Part_Monitor] PM
where 
	DailySummary = 1
	and exists
	(select 1 
	from 
		live.dbo.cust_order_line col 
	inner join 
		live.dbo.customer_order co
		on col.cust_order_id = co.id
	where 
		co.[status] not in ('C', 'X')
		and pm.part_id = col.part_id
		and co.create_date >= dateadd(dd,-1,GETDATE())

	)
GROUP BY
	RecipientEmail
	
GO

/*

load table with 

	col.part_id IN ('436W5510-66', '436W5510-65')
	and Jessicam@skillsinc.com


insert into DDS_CO_Part_Monitor
values	('436W5510-66', 'Jessicam@skillsinc.com'),
		('436W5510-65', 'Jessicam@skillsinc.com')

update DDS_CO_Part_Monitor
set TimeframeByMinute = 30,
	dailysummary = 1
where RecipientEmail = 'Jessicam@skillsinc.com'

delete from DDS_CO_Part_Monitor where RecipientEmail <> 'Jessicam@skillsinc.com'

select dbo.fn_ComDelPartIDs('Jessicam@skillsinc.com')

select * from DDS_CO_Part_Monitor where RecipientEmail = 'Jessicam@skillsinc.com'

select * from View_DDS_COPartMonitor

select * from View_DDS_COPartMonitorDaily


```