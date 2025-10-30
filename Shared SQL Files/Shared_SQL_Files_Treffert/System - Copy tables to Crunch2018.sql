USE [LIVE908SP4]
GO

/****** Object:  Table [dbo].[Update20210301]    Script Date: 3/8/2021 7:03:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Update20210301](
	[PartID] [nvarchar](50) NOT NULL,
	[status] [nvarchar](5) NOT NULL,
	[planner_user_id] [nvarchar](15) NOT NULL,
	[wostatus] [nvarchar](5) NULL,
	[type] [nvarchar](5) NULL,
	[baseid] [nvarchar](50) NULL,
	[lot] [nvarchar](5) NULL,
	[split] [nvarchar](5) NULL,
	[sub] [nvarchar](5) NULL,
	[createdate] [date] NULL,
	[lastclosedate] [date] NULL,
	[timelapse] [float] NULL
) ON [PRIMARY]
GO


INSERT INTO [dbo].[Update20210301]
   SELECT *
   FROM [SQL-LAB-1].[LIVESupplemental].[dbo].[Update20210301]