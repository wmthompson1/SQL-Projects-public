use datamart
go

drop table #t1

create table #t1 (		
	BASE_ID	nvarchar (30)
, 	LOT_ID	nvarchar (3)
, 	SPLIT_ID	nvarchar (3)
, 	SUB_ID	nvarchar (3)
, 	TYPE	nvarchar (1)
, 	PART_ID	nvarchar (30)
, 	WONUM	nvarchar (30)
, 	DESIRED_QTY	decimal(14, 4)
, 	STATUS	nvarchar (1)
, 	CUSTOMER_ORDER	nvarchar (15)
, 	LINE_NO	nvarchar (3)
, 	CUSTOMER_ID	nvarchar (6)
, 	CurrentOperation	nvarchar (5)
, 	StatusCurrOp	nvarchar (5)
, 	PRINTED_DATE	datetime
, 	DESIRED_RLS_DATE	datetime
, 	CREATE_DATE	datetime
, 	remaining_operations	nvarchar (max)
, 	QTY_ON_HAND	decimal(14, 4)
, 	QTY_IN_DEMAND	decimal(14, 4)
, 	BUYER_USER_ID	nvarchar (20)
, 	PLANNER_USER_ID	nvarchar (20)
, 	COMMODITY_CODE	nvarchar (20)
, 	DESCRIPTION	nvarchar (max)
, 	DESIRED_WANT_DATE	datetime
, 	[EXP/FLT]	nvarchar (max)
, 	USER_10	nvarchar (max)
, 	RWPart	nvarchar (max)
, 	CUSTOMER_PO_REF	nvarchar (max)
, 	WORK_ORDER_NOTES	nvarchar (max)
, 	CUST_ORDER_NOTATION	nvarchar (max)
, 	CUST_ORD_CREATEDATE	datetime
, 	PartMaterialType	nvarchar (max)
, 	RESOURCE_ID_Raw	nvarchar (50)
, 	OPERATION_TYPE	nvarchar (50)
, 	StatusCurrOpType	nvarchar (50)
, 	CURROPCHK	nvarchar (5)
, 	RESOURCE_ID	nvarchar (50)
, 	AubPriText	nvarchar (max)
, 	AubTcText	nvarchar (max)
, 	HasAubPri	 int
, 	HasAubTc	 int
, 	TimeLimit	 int
, 	LAST_CLOCK_OUT	datetime
, 	last_worked_seq	nvarchar (5)
, 	last_clocked	nvarchar (50)
, 	LATE	 int
, 	LATEP2	 int
, 	LATEP1	 int
, 	LATEP3	 int
, 	LATEBP1	 int
, 	WAIT_DAYS	 int
, 	EMPLOYEE_ID	nvarchar (10)
, 	OPERATOR	nvarchar (50)
, 	USER_1	nvarchar (10)
, 	LEAD_SUPERVISOR	nvarchar (50)
, 	SupervisorName	nvarchar (50)
, 	StatusCurrOpMsg	nvarchar (10)
, 	tdesc	nvarchar (max)
, 	LABOR_TICKET_DESC	nvarchar (max)
, 	BUYER	nvarchar (50)
, 	BUYERFILTER	nvarchar (50)
, 	SALESREP_ID	nvarchar (50)
, 	Account	nvarchar (5)
, 	Plant_ID	nvarchar (5)
, 	Tooling	 int
, 	IsAP1	 int
, 	IsAP2	 int
, 	IsAP3	 int
, 	IsBP1	 int
, 	IsUndetermined	 int
, 	IsNORGRU	 int
, 	IsTWMETA	 int
, 	IsAMTRIB	 int
, 	IsAUBMASK	 int
, 	IsAUBPrime	 int
, 	IsAUBSand	 int
, 	IsAUBsetup	 int
, 	IsAUBTC	 int
, 	IsAUBtakedown	 int
, 	IsAUBPartMark	 int
, 	IsAUBFinalInspection	 int
, 	IsAUBInspection	 int
, 	IsAUBPenetrant	 int
, 	IsAUBChemline	 int
, 	AP1_ETRAC	 int
, 	AP2_ETRAC	 int
, 	AP3_ETRAC	 int
, 	BP1_ETRAC	 int
, 	AP1_PDEXP	 int
, 	AP2_PDEXP	 int
, 	AP3_PDEXP	 int
, 	BP1_PDEXP	 int
, 	AP1_FLT	 int
, 	AP2_FLT	 int
, 	AP3_FLT	 int
, 	BP1_FLT	 int
, 	AP1_Buyer_Tracy	 int
, 	AP1_Buyer_Joe	 int
, 	AP1_Buyer_Meg	 int
, 	AP1_Buyer_Sharon	 int
, 	AP1_Buyer_Sunni	 int
, 	AP1_Buyer_Michele	 int
, 	AP1_Review	 int
, 	AP1_PlanningQueue	 int
, 	AP1_SkyFlex	 int
, 	ID	nvarchar(20)
, 	DESIRED_RECV_DATE	datetime
, 	SnapshotDate	datetime
)		

go
		
insert into #t1	
EXEC dbo.usp_WODailyStatusData3
go

select * from #t1