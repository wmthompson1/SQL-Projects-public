# Masters Update (20210527)

```sql
USE [LIVESupplemental]
GO

/****** Object:  Table [dbo].[MasterUpdate20210527]    Script Date: 5/27/2021 11:17:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--CREATE TABLE [dbo].[MasterUpdate20210527](
--	[PartID] [nvarchar](50) NULL
--) ON [PRIMARY]
--GO


SELECT * FROM [MasterUpdate20210527] U
INNER JOIN LIVE.DBO.WORK_ORDER WO
ON U.PARTID = WO.PART_ID
AND WO.[TYPE] = 'M'
```