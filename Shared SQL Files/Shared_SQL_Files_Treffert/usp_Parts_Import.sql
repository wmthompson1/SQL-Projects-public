USE LIVE;  -- Change to LIVE after approval
GO

/****** Object:  StoredProcedure [dbo].[usp_Parts_Import]    Script Date: 6/23/2016 10:31:45 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE PROCEDURE [dbo].[usp_Parts_Import]
AS
BEGIN

/****** Steps ******
1 ) Save Ann's excel file to
    S:\IS\admin stuff\LIVESupplemental Imports\FromAnn\Part Uploads\??????.xlsx
2 ) Review excel file
2a) check for new columns, ie part_user_6
2b) check for periods in column names
2c) check data to see if it makes sense 
3 ) drop table
4 ) Create table
4a) Validate that table was created

5 ) import to excel file into livesupplemental.dbo.visual_upload_part$
5a) validate there is data in livesupplemental.dbo.visual_upload_part$
5b) check for extra rows in livesupplemental.dbo.visual_upload_part$
5c) delect extra rows in livesupplemental.dbo.visual_upload_part$
5d) Check for duplicates in livesupplemental.dbo.visual_upload_part$
5e) Email Ann about duplicate lines (more than 1 part_id) 
5f) If approved then remove duplicate 

6 )
*/

/****** 1 ******/

/****** Object:  Table LIVESupplemental.dbo.visual_upload_part$   Script Date: 6/23/2016 7:39:25 AM ******/

--	    DROP TABLE [LIVESupplemental].[dbo].[visual_upload_part$]

/****** Object:  Table LIVESupplemental.dbo.visual_upload_part$   Script Date: 6/23/2016 7:39:25 AM ******/

/****** 2 ******/
--CREATE TABLE LIVESupplemental.dbo.visual_upload_part$
--	(
--	[PART_ID]                              [NVARCHAR](255) NULL,
--	[PART_DESCRIPTION]                     [NVARCHAR](255) NULL,
--	[PART_STOCK_UM]                        [NVARCHAR](255) NULL,
--	[PART_FABRICATED]                      [NVARCHAR](255) NULL,
--	[PART_STOCKED]                         [NVARCHAR](255) NULL,
--	[PART_ENGINEERING_MSTR]                [FLOAT] NULL,
--	[PART_PLANNER_USER_ID]                 [NVARCHAR](255) NULL,
--	[PART_PLANNING_LEADTIME]               [INT] NULL,
--	[PART_BUYER_USER_ID]                   [NVARCHAR](255) NULL,
--	[PART_ORDER_POLICY]                    [NVARCHAR](255) NULL,
--	[PART_MAT_GL_ACCT_ID]                  [FLOAT] NULL,
--	[PART_LAB_GL_ACCT_ID]                  [FLOAT] NULL,
--	[PART_BUR_GL_ACCT_ID]                  [FLOAT] NULL,
--	[PART_SER_GL_ACCT_ID]                  [FLOAT] NULL,
--	[PART_USER_7]                          [NVARCHAR](255) NULL,
--	[PART_USER_8]                          [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_CUSTOMER_ID]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_CUSTOMER_PART_ID]   [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_EFFECTIVE_DATE]     [DATETIME] NULL,
--	[CUST_PRICE_EFFECT_DISCONTINUE_DATE]   [DATETIME] NULL,
--	[CUST_PRICE_EFFECT_SELLING_UM]         [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_BY_DATE_CODE]       [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_DEFAULT_UNIT_PRICE] [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_1]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_1]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_2]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_2]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_3]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_3]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_4]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_4]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_5]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_5]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_6]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_6]       [FLOAT] NULL,
--	[CUST_PRICE_EFFECT_QTY_BREAK_7]        [NVARCHAR](255) NULL,
--	[CUST_PRICE_EFFECT_UNIT_PRICE_7]       [FLOAT] NULL
--	)
--ON [PRIMARY];

--DELETE TABLE [LIVESupplemental].[dbo].[visual_upload_part$]

/****** 5  ******/

/****************************** DO IMPORT ******************************/
/****** 5b and 5c ******/
/*
select * FROM livesupplemental.dbo.visual_upload_part$; 
*/

/****** 5c ******/
/*
delete FROM livesupplemental.dbo.visual_upload_part$ where part_id is null
*/

/****** 5d ******/
/*
SELECT 
	COUNT(part_id) AS partcnt,
	part_id
FROM	livesupplemental.dbo.visual_upload_part$
GROUP BY 
	part_id
HAVING	COUNT(part_id) > 1;

*/

/****** 5d ******/
/*  check to see if there are parts already in Visual
SELECT *
FROM	LIVESupplemental.dbo.visual_upload_part$ l
INNER JOIN
	PART p
	ON p.ID = l.part_id

*/

/****** 5e ******/
/*  compare parts in Visual to Import
SELECT 
	p.id,
	[import].[PART_DESCRIPTION], 
	p.DESCRIPTION, 
	case when [import].[PART_DESCRIPTION] <> p.DESCRIPTION then 'Check'  else ''  end as Check_PART_DESCRIPTION, 
	udf2.string_val as MaterialType,
	udf3.string_val as Alloy,
	udf1.number_val as SurfaceArea,
	udf4.number_val as Length,
	udf5.number_val as Width,
	udf6.number_val as Thickness,
	[import].[PART_STOCK_UM], 
	p.STOCK_UM, 
	case when [import].[PART_STOCK_UM] <> p.STOCK_UM then 'Check'  else ''  end as Check_PART_STOCK_UM, 
	[import].[PART_FABRICATED], 
	p.FABRICATED, 
	case when [import].[PART_FABRICATED] <> p.FABRICATED then 'Check'  else ''  end as Check_PART_FABRICATED, 
	[import].[PART_STOCKED], 
	p.STOCKED, 
	case when [import].[PART_STOCKED] <> p.STOCKED then 'Check'  else ''  end as Check_PART_STOCKED, 
	[import].[PART_ENGINEERING_MSTR], 
	ps.[ENGINEERING_MSTR], 
	case when [import].[PART_ENGINEERING_MSTR] <> ps.[ENGINEERING_MSTR] then 'Check'  else ''  end as Check_PART_ENGINEERING_MSTR, 
	[import].[PART_PLANNER_USER_ID], 
	p.PLANNER_USER_ID, 
	case when [import].[PART_PLANNER_USER_ID] <> p.PLANNER_USER_ID then 'Check'  else ''  end as Check_PART_PLANNER_USER_ID, 
	[import].[PART_PLANNING_LEADTIME], 
	p.PLANNING_LEADTIME, 
	case when [import].[PART_PLANNING_LEADTIME] <> p.PLANNING_LEADTIME then 'Check'  else ''  end as Check_PART_PLANNING_LEADTIME, 
	[import].[PART_BUYER_USER_ID], 
	p.BUYER_USER_ID, 
	case when [import].[PART_BUYER_USER_ID] <> p.BUYER_USER_ID then 'Check'  else ''  end as Check_PART_BUYER_USER_ID, 
	[import].[PART_ORDER_POLICY], 
	p.ORDER_POLICY, 
	case when [import].[PART_ORDER_POLICY] <> p.ORDER_POLICY then 'Check'  else ''  end as Check_PART_ORDER_POLICY, 
	[import].[PART_MAT_GL_ACCT_ID], 
	p.MAT_GL_ACCT_ID, 
	case when [import].[PART_MAT_GL_ACCT_ID] <> p.MAT_GL_ACCT_ID then 'Check'  else ''  end as Check_PART_MAT_GL_ACCT_ID, 
	[import].[PART_LAB_GL_ACCT_ID], 
	p.LAB_GL_ACCT_ID, 
	case when [import].[PART_LAB_GL_ACCT_ID] <> p.LAB_GL_ACCT_ID then 'Check'  else ''  end as Check_PART_LAB_GL_ACCT_ID, 
	[import].[PART_BUR_GL_ACCT_ID], 
	p.BUR_GL_ACCT_ID, 
	case when [import].[PART_BUR_GL_ACCT_ID] <> p.BUR_GL_ACCT_ID then 'Check'  else ''  end as Check_PART_BUR_GL_ACCT_ID, 
	[import].[PART_SER_GL_ACCT_ID], 
	p.SER_GL_ACCT_ID, 
	case when [import].[PART_SER_GL_ACCT_ID] <> p.SER_GL_ACCT_ID then 'Check'  else ''  end as Check_PART_SER_GL_ACCT_ID, 
	[import].[PART_USER_7], 
	p.USER_7, 
	case when [import].[PART_USER_7] <> p.USER_7 then 'Check'  else ''  end as Check_PART_USER_7, 
	[import].[PART_USER_8], 
	p.USER_8  --, 
	--removed as usually a new contract
	--case when [import].[PART_USER_8] <> p.USER_8 then 'Check'  else ''  end as Check_PART_USER_8, 
	--[import].[CUST_PRICE_EFFECT_CUSTOMER_ID], 
	--[CPE].[CUSTOMER_ID], 
	--case when [import].[CUST_PRICE_EFFECT_CUSTOMER_ID] <> [CPE].[CUSTOMER_ID] then 'Check'  else ''  end as Check_CPE_CUSTOMER_ID, 
	--[import].[CUST_PRICE_EFFECT_CUSTOMER_PART_ID], 
	--[CPE].[CUSTOMER_PART_ID], 
	--case when [import].[CUST_PRICE_EFFECT_CUSTOMER_PART_ID] <> [CPE].[CUSTOMER_PART_ID] then 'Check'  else ''  end as Check_CPE_CUSTOMER_PART_ID, 
	--[import].[CUST_PRICE_EFFECT_EFFECTIVE_DATE], 
	--[CPE].[EFFECTIVE_DATE], 
	--case when [import].[CUST_PRICE_EFFECT_EFFECTIVE_DATE] <> [CPE].[EFFECTIVE_DATE] then 'Check'  else ''  end as Check_CPE_EFFECTIVE_DATE, 
	--[import].[CUST_PRICE_EFFECT_DISCONTINUE_DATE], 
	--[CPE].[DISCONTINUE_DATE], 
	--case when [import].[CUST_PRICE_EFFECT_DISCONTINUE_DATE] <> [CPE].[DISCONTINUE_DATE] then 'Check'  else ''  end as Check_CPE_DISCONTINUE_DATE, 
	--[import].[CUST_PRICE_EFFECT_SELLING_UM], 
	--[CPE].[SELLING_UM], 
	--case when [import].[CUST_PRICE_EFFECT_SELLING_UM] <> [CPE].[SELLING_UM] then 'Check'  else ''  end as Check_CPE_SELLING_UM, 
	--[import].[CUST_PRICE_EFFECT_BY_DATE_CODE], 
	--[CPE].[BY_DATE_CODE], 
	--case when [import].[CUST_PRICE_EFFECT_BY_DATE_CODE] <> [CPE].[BY_DATE_CODE] then 'Check'  else ''  end as Check_CPE_BY_DATE_CODE, 
	--[import].[CUST_PRICE_EFFECT_DEFAULT_UNIT_PRICE], 
	--[CPE].[DEFAULT_UNIT_PRICE], 
	--case when [import].[CUST_PRICE_EFFECT_DEFAULT_UNIT_PRICE] <> [CPE].[DEFAULT_UNIT_PRICE] then 'Check'  else ''  end as Check_CPE_DEFAULT_UNIT_PRICE, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_1], 
	--[CPE].[QTY_BREAK_1], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_1] <> [CPE].[QTY_BREAK_1] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_1, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_1], 
	--[CPE].[UNIT_PRICE_1], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_1] <> [CPE].[UNIT_PRICE_1] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_1, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_2], 
	--[CPE].[QTY_BREAK_2], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_2] <> [CPE].[QTY_BREAK_2] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_2, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_2], 
	--[CPE].[UNIT_PRICE_2], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_2] <> [CPE].[UNIT_PRICE_2] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_2, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_3], 
	--[CPE].[QTY_BREAK_3], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_3] <> [CPE].[QTY_BREAK_3] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_3, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_3], 
	--[CPE].[UNIT_PRICE_3], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_3] <> [CPE].[UNIT_PRICE_3] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_3, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_4], 
	--[CPE].[QTY_BREAK_4], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_4] <> [CPE].[QTY_BREAK_4] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_4, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_4], 
	--[CPE].[UNIT_PRICE_4], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_4] <> [CPE].[UNIT_PRICE_4] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_4, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_5], 
	--[CPE].[QTY_BREAK_5], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_5] <> [CPE].[QTY_BREAK_5] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_5, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_5], 
	--[CPE].[UNIT_PRICE_5], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_5] <> [CPE].[UNIT_PRICE_5] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_5, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_6], 
	--[CPE].[QTY_BREAK_6], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_6] <> [CPE].[QTY_BREAK_6] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_6, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_6], 
	--[CPE].[UNIT_PRICE_6], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_6] <> [CPE].[UNIT_PRICE_6] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_6, 
	--[import].[CUST_PRICE_EFFECT_QTY_BREAK_7], 
	--[CPE].[QTY_BREAK_7], 
	--case when [import].[CUST_PRICE_EFFECT_QTY_BREAK_7] <> [CPE].[QTY_BREAK_7] then 'Check'  else ''  end as Check_CPE_QTY_BREAK_7, 
	--[import].[CUST_PRICE_EFFECT_UNIT_PRICE_7], 
	--[CPE].[UNIT_PRICE_7], 
	--case when [import].[CUST_PRICE_EFFECT_UNIT_PRICE_7] <> [CPE].[UNIT_PRICE_7] then 'Check'  else ''  end as Check_CPE_UNIT_PRICE_7
FROM	liveSupplemental.dbo.visual_upload_part$ import
inner JOIN
	PART p
	ON p.ID = import.part_id
inner JOIN 
	PART_Site ps
	ON ps.part_id = import.part_id
left outer JOIN
	cust_Price_effect cpe
	ON cpe.part_id = import.part_id
	and cpe.customer_part_id = import.[CUST_PRICE_EFFECT_CUSTOMER_PART_ID]
left outer join
	user_def_fields udf1
	on udf1.document_id = import.part_id
	and udf1.id = 'UDF-0000026'
left outer join 
	user_def_fields udf2
	on udf2.document_id = import.part_id
	and udf2.id = 'UDF-0000035'
left outer join 
	user_def_fields udf3
	on udf3.document_id = import.part_id
	and udf3.id = 'UDF-0000036'
left outer join 
	user_def_fields udf4
	on udf4.document_id = import.part_id
	and udf4.id = 'UDF-0000037'
left outer join 
	user_def_fields udf5
	on udf5.document_id = import.part_id
	and udf5.id = 'UDF-0000038'
left outer join 
	user_def_fields udf6
	on udf6.document_id = import.part_id
	and udf6.id = 'UDF-0000039'
where
	[import].[PART_DESCRIPTION] <> p.DESCRIPTION
	or [import].[PART_STOCK_UM] <> p.STOCK_UM
	or [import].[PART_FABRICATED] <> p.FABRICATED
	or [import].[PART_STOCKED] <> p.STOCKED
	or [import].[PART_ENGINEERING_MSTR] <> ps.[ENGINEERING_MSTR]
	or [import].[PART_PLANNER_USER_ID] <> p.PLANNER_USER_ID
	or [import].[PART_PLANNING_LEADTIME] <> p.PLANNING_LEADTIME
	or [import].[PART_BUYER_USER_ID] <> p.BUYER_USER_ID
	or [import].[PART_ORDER_POLICY] <> p.ORDER_POLICY
	or [import].[PART_MAT_GL_ACCT_ID] <> p.MAT_GL_ACCT_ID
	or [import].[PART_LAB_GL_ACCT_ID] <> p.LAB_GL_ACCT_ID
	or [import].[PART_BUR_GL_ACCT_ID] <> p.BUR_GL_ACCT_ID
	or [import].[PART_SER_GL_ACCT_ID] <> p.SER_GL_ACCT_ID
	or [import].[PART_USER_7] <> p.USER_7
	or [import].[PART_USER_8] <> p.USER_8
	--or [import].[CUST_PRICE_EFFECT_CUSTOMER_ID] <> [CPE].[CUSTOMER_ID]
	--or [import].[CUST_PRICE_EFFECT_CUSTOMER_PART_ID] <> [CPE].[CUSTOMER_PART_ID]
	--or [import].[CUST_PRICE_EFFECT_EFFECTIVE_DATE] <> [CPE].[EFFECTIVE_DATE]
	--or [import].[CUST_PRICE_EFFECT_DISCONTINUE_DATE] <> [CPE].[DISCONTINUE_DATE]
	--or [import].[CUST_PRICE_EFFECT_SELLING_UM] <> [CPE].[SELLING_UM]
	--or [import].[CUST_PRICE_EFFECT_BY_DATE_CODE] <> [CPE].[BY_DATE_CODE]
	--or [import].[CUST_PRICE_EFFECT_DEFAULT_UNIT_PRICE] <> [CPE].[DEFAULT_UNIT_PRICE]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_1] <> [CPE].[QTY_BREAK_1]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_1] <> [CPE].[UNIT_PRICE_1]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_2] <> [CPE].[QTY_BREAK_2]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_2] <> [CPE].[UNIT_PRICE_2]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_3] <> [CPE].[QTY_BREAK_3]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_3] <> [CPE].[UNIT_PRICE_3]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_4] <> [CPE].[QTY_BREAK_4]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_4] <> [CPE].[UNIT_PRICE_4]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_5] <> [CPE].[QTY_BREAK_5]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_5] <> [CPE].[UNIT_PRICE_5]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_6] <> [CPE].[QTY_BREAK_6]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_6] <> [CPE].[UNIT_PRICE_6]
	--or [import].[CUST_PRICE_EFFECT_QTY_BREAK_7] <> [CPE].[QTY_BREAK_7]
	--or [import].[CUST_PRICE_EFFECT_UNIT_PRICE_7] <> [CPE].[UNIT_PRICE_7]
order by 
	import.part_id
*/


/****** 6A ******/
/*  Update PARTS information for existing Part.ID   */

UPDATE PART			
SET			
	[DESCRIPTION] = l.PART_DESCRIPTION,
	[STOCK_UM] = l.PART_STOCK_UM,
	[PLANNING_LEADTIME] = L.PART_PLANNING_LEADTIME, 
	[ORDER_POLICY] = l.PART_ORDER_POLICY, 
	[ORDER_POINT] = NULL, 
	[SAFETY_STOCK_QTY] = NULL, 
	[FIXED_ORDER_QTY] = NULL, 
	[DAYS_OF_SUPPLY] = NULL, 
	[MINIMUM_ORDER_QTY] = NULL, 
	[MAXIMUM_ORDER_QTY] = NULL, 
	[PRODUCT_CODE] = NULL, 
	[COMMODITY_CODE] = NULL, 
	[MFG_NAME] = NULL, 
	[MFG_PART_ID] = NULL, 
	[FABRICATED] = l.PART_FABRICATED, 
	[PURCHASED] = 'N', 
	[STOCKED] = l.PART_STOCKED, 
	[DETAIL_ONLY] = 'N', 
	[DEMAND_HISTORY] = 'N', 
	[TOOL_OR_FIXTURE] = 'N', 
	[INSPECTION_REQD] = 'N', 
	[WEIGHT] = NULL, 
	[WEIGHT_UM] = NULL, 
	[DRAWING_ID] = NULL, 
	[DRAWING_REV_NO] = NULL, 
	[PREF_VENDOR_ID] = NULL, 
	[MRP_REQUIRED] = 'N', 
	[MRP_EXCEPTIONS] = NULL, 
	[PRIVATE_UM_CONV] = NULL, 
	[AUTO_BACKFLUSH] = 'N', 
	[PLANNER_USER_ID] = l.PART_PLANNER_USER_ID, 
	[BUYER_USER_ID] = NULL, 
	[ABC_CODE] = NULL, 
	[ANNUAL_USAGE_QTY] = NULL, 
	[INVENTORY_LOCKED] = 'N', 
	[MAT_GL_ACCT_ID] = l.PART_MAT_GL_ACCT_ID, 
	[LAB_GL_ACCT_ID] = l.PART_LAB_GL_ACCT_ID, 
	[BUR_GL_ACCT_ID] = l.PART_BUR_GL_ACCT_ID, 
	[SER_GL_ACCT_ID] = l.PART_SER_GL_ACCT_ID, 
	[QTY_ON_HAND] = 0,
	[QTY_AVAILABLE_ISS] = 0,
	[QTY_AVAILABLE_MRP] = 0,
	[QTY_ON_ORDER] = 0,
	[QTY_IN_DEMAND] = 0,
	[USER_1] = NULL, 
	[USER_2] = NULL, 
	[USER_3] = NULL, 
	[USER_4] = NULL, 
	[USER_5] = NULL, 
	[USER_6] = NULL, 
	[USER_7] = l.PART_USER_7, 
	[USER_8] = l.PART_USER_8, 
	[USER_9] = NULL, 
	[USER_10] = NULL, 
	[NMFC_CODE_ID] = NULL, 
	[PACKAGE_TYPE] = NULL, 
	[MRP_EXCEPTION_INFO] = NULL, 
	[MULTIPLE_ORDER_QTY] = NULL, 
	[ADD_FORECAST] = 'N', 
	[UDF_LAYOUT_ID] = NULL, 
	[PIECE_TRACKED] = 'N', 
	[LENGTH_REQD] = 'N', 
	[WIDTH_REQD] = 'N', 
	[HEIGHT_REQD] = 'N', 
	[DIMENSIONS_UM] = NULL, 
	[SHIP_DIMENSIONS] = NULL, 
	[DRAWING_FILE] = NULL, 
	[TARIFF_CODE] = NULL, 
	[TARIFF_TYPE] = NULL, 
	[ORIG_COUNTRY_ID] = NULL, 
	[NET_WEIGHT_2] = NULL, 
	[GROSS_WEIGHT_2] = NULL, 
	[WEIGHT_UM_2] = NULL, 
	[VOLUME] = NULL, 
	[VOLUME_UM] = NULL, 
	[VAT_CODE] = NULL, 
	[DEMAND_FENCE_1] = NULL, 
	[DEMAND_FENCE_2] = NULL, 
	[ROLL_FORECAST] = NULL, 
	[CONSUMABLE] = 'N', 
	[PRIMARY_SOURCE] = NULL, 
	[LABEL_UM] = NULL, 
	[HTS_CODE] = NULL, 
	[DEF_ORIG_COUNTRY] = NULL, 
	[MATERIAL_CODE] = NULL, 
	[DEF_LBL_FORMAT_ID] = NULL, 
	[VOLATILE_LEADTIME] = NULL, 
	[LT_PLUS_DAYS] = NULL, 
	[LT_MINUS_DAYS] = NULL, 
	[STATUS] = NULL, 
	[USE_SUPPLY_BEF_LT] = NULL, 
	[QTY_COMMITTED] = 0,
	[intrastat_exempt] = 'N', 
	[CASE_QTY] = NULL, 
	[PALLET_QTY] = NULL, 
	[MINIMUM_LEADTIME] = NULL, 
	[LEADTIME_BUFFER] = NULL, 
	[EMERGENCY_STOCKPCT] = NULL, 
	[REPLENISH_LEVEL] = NULL, 
	[MIN_BATCH_SIZE] = NULL, 
	[EFF_DATE_PRICE] = NULL, 
	[ECN_REVISION] = NULL, 
	[REVISION_ID] = NULL, 
	[STAGE_ID] = NULL, 
	[ECN_REV_CONTROL] = NULL, 
	[IS_KIT] = 'N', 
	[YELLOW_STOCKPCT] = NULL, 
	[UNIV_PLAN_MATERIAL] = NULL, 
	[RLS_NEAR_DAYS] = NULL, 
	[SUGG_RLS_NEAR_DAYS] = NULL, 
	[ORDER_UP_TO_QTY] = NULL, 
	[LAST_IMPLODE_DATE] = NULL, 
	[STATUS_EFF_DATE] = GETDATE(),
	[CONTROLLED_BY_ICS] = 'N', 
	[PRICE_GROUP] = NULL, 
	[DEF_PACKAGE_QTY] = NULL, 
	[DEF_PACKAGE_CAP] = NULL, 
	[DEF_SLS_TAX_GRP_ID] = NULL, 
	[MRO_CLASS] = NULL, 
	[BUFFER_PROFILE_ID] = NULL, 
	[ADU_HORIZON] = NULL, 
	[ASR_LEADTIME] = NULL, 
	[ONHAND_ALERT_RED_PCT] = NULL
FROM	LIVESupplemental.dbo.visual_upload_part$ l			
LEFT OUTER JOIN 
	PART p			
	ON p.ID = l.part_id			

/****** 6B ******/
/*  Update PART_SITE information for existing Part.ID   */

UPDATE PART_SITE   
SET   
	[SITE_ID] = 'SK01', 
	[PART_ID] = l.part_ID, 
	[PLANNING_LEADTIME] = l.PART_PLANNING_LEADTIME, 
	[ORDER_POLICY] = l.PART_ORDER_POLICY, 
	[ORDER_POINT] = NULL, 
	[ORDER_UP_TO_QTY] = NULL, 
	[SAFETY_STOCK_QTY] = NULL, 
	[FIXED_ORDER_QTY] = NULL, 
	[DAYS_OF_SUPPLY] = NULL, 
	[MINIMUM_ORDER_QTY] = NULL, 
	[MAXIMUM_ORDER_QTY] = NULL, 
	[ENGINEERING_MSTR] = NULL,    -->l.part_engineering_mstr,   -- removed.  will have to manually update when new Master created.
	[PRODUCT_CODE] = NULL, 
	[FABRICATED] = l.part_fabricated, 
	[PURCHASED] = 'N', 
	[STOCKED] = l.part_STOCKED, 
	[DETAIL_ONLY] = NULL, 
	[DEMAND_HISTORY] = NULL, 
	[TOOL_OR_FIXTURE] = NULL, 
	[CONSUMABLE] = NULL, 
	[INSPECTION_REQD] = NULL, 
	[DEMAND_FENCE_1] = NULL, 
	[DEMAND_FENCE_2] = NULL, 
	[PLANNER_USER_ID] = l.PART_PLANNER_USER_ID, 
	[BUYER_USER_ID] = NULL, 
	[ABC_CODE] = NULL, 
	[ANNUAL_USAGE_QTY] = NULL, 
	[INVENTORY_LOCKED] = NULL, 
	[PREF_VENDOR_ID] = NULL, 
	[PRIMARY_WHS_ID] = NULL, 
	[PRIMARY_LOC_ID] = NULL, 
	[BACKFLUSH_WHS_ID] = NULL, 
	[BACKFLUSH_LOC_ID] = NULL, 
	[INSPECT_WHS_ID] = NULL, 
	[INSPECT_LOC_ID] = NULL, 
	[MRP_REQUIRED] = NULL, 
	[MRP_EXCEPTIONS] = NULL, 
	[AUTO_BACKFLUSH] = NULL, 
	[UNIT_PRICE] = NULL, 
	[EFF_DATE_PRICE] = NULL, 
	[UNIT_MATERIAL_COST] = 0, 
	[UNIT_LABOR_COST] = 0, 
	[WHSALE_UNIT_COST] = NULL, 
	[BURDEN_PERCENT] = 0, 
	[BURDEN_PER_UNIT] = 0, 
	[EXCISE_UNIT_PRICE] = NULL, 
	[PURC_BUR_PERCENT] = 0, 
	[UNIT_BURDEN_COST] = 0, 
	[FIXED_COST] = 0, 
	[UNIT_SERVICE_COST] = 0, 
	[NEW_MATERIAL_COST] = 0, 
	[NEW_LABOR_COST] = 0, 
	[NEW_BURDEN_COST] = 0, 
	[NEW_SERVICE_COST] = 0, 
	[NEW_BURDEN_PERCENT] = 0, 
	[NEW_BURDEN_PERUNIT] = 0, 
	[PURC_BUR_PER_UNIT] = 0, 
	[NEW_FIXED_COST] = 0, 
	[MAT_GL_ACCT_ID] = l.PART_MAT_GL_ACCT_ID, 
	[LAB_GL_ACCT_ID] = l.PART_LAB_GL_ACCT_ID, 
	[BUR_GL_ACCT_ID] = l.PART_BUR_GL_ACCT_ID, 
	[SER_GL_ACCT_ID] = l.PART_SER_GL_ACCT_ID, 
	[QTY_ON_HAND] = 0, 
	[QTY_AVAILABLE_ISS] = 0, 
	[QTY_AVAILABLE_MRP] = 0, 
	[QTY_ON_ORDER] = 0, 
	[QTY_IN_DEMAND] = 0, 
	[QTY_COMMITTED] = 0, 
	[TARIFF_CODE] = NULL, 
	[TARIFF_TYPE] = NULL, 
	[VAT_CODE] = NULL, 
	[ORIG_COUNTRY_ID] = NULL, 
	[INTRASTAT_EXEMPT] = 'N', 
	[STATUS] = NULL, 
	[STATUS_EFF_DATE] = GETDATE(), 
	[USE_SUPPLY_BEF_LT] = NULL, 
	[MINIMUM_LEADTIME] = NULL, 
	[LEADTIME_BUFFER] = NULL, 
	[EMERGENCY_STOCKPCT] = NULL, 
	[REPLENISH_LEVEL] = NULL, 
	[MIN_BATCH_SIZE] = NULL, 
	[YELLOW_STOCKPCT] = NULL, 
	[MRP_EXCEPTION_INFO] = NULL, 
	[MULTIPLE_ORDER_QTY] = NULL, 
	[LAST_IMPLODE_DATE] = NULL, 
	[MRO_CLASS] = NULL, 
	[UDF_LAYOUT_ID] = NULL, 
	[USER_1] = NULL, 
	[USER_2] = NULL, 
	[USER_3] = NULL, 
	[USER_4] = NULL, 
	[USER_5] = NULL, 
	[USER_6] = NULL, 
	[USER_7] = NULL, 
	[USER_8] = NULL, 
	[USER_9] = NULL, 
	[USER_10] = NULL, 
	[BUFFER_PROFILE_ID] = NULL, 
	[ADU_HORIZON] = NULL, 
	[ASR_LEADTIME] = NULL, 
	[ONHAND_ALERT_RED_PCT] = NULL, 
	[LAST_ABC_DATE] = NULL 
from	LIVESupplemental.dbo.visual_upload_part$ l
left outer join 
	PART_SITE p
	on p.PART_ID = l.part_id


/****** 7A ******/
/*  Insert into PART New Parts    */

INSERT INTO PART
	([ID],
	[DESCRIPTION],
	[STOCK_UM],
	[PLANNING_LEADTIME],
	[ORDER_POLICY],
	[ORDER_POINT],
	[SAFETY_STOCK_QTY],
	[FIXED_ORDER_QTY],
	[DAYS_OF_SUPPLY],
	[MINIMUM_ORDER_QTY],
	[MAXIMUM_ORDER_QTY],
	[PRODUCT_CODE],
	[COMMODITY_CODE],
	[MFG_NAME],
	[MFG_PART_ID],
	[FABRICATED],
	[PURCHASED],
	[STOCKED],
	[DETAIL_ONLY],
	[DEMAND_HISTORY],
	[TOOL_OR_FIXTURE],
	[INSPECTION_REQD],
	[WEIGHT],
	[WEIGHT_UM],
	[DRAWING_ID],
	[DRAWING_REV_NO],
	[PREF_VENDOR_ID],
	[MRP_REQUIRED],
	[MRP_EXCEPTIONS],
	[PRIVATE_UM_CONV],
	[AUTO_BACKFLUSH],
	[PLANNER_USER_ID],
	[BUYER_USER_ID],
	[ABC_CODE],
	[ANNUAL_USAGE_QTY],
	[INVENTORY_LOCKED],
	[MAT_GL_ACCT_ID],
	[LAB_GL_ACCT_ID],
	[BUR_GL_ACCT_ID],
	[SER_GL_ACCT_ID],
	[QTY_ON_HAND],
	[QTY_AVAILABLE_ISS],
	[QTY_AVAILABLE_MRP],
	[QTY_ON_ORDER],
	[QTY_IN_DEMAND],
	[USER_1],
	[USER_2],
	[USER_3],
	[USER_4],
	[USER_5],
	[USER_6],
	[USER_7],
	[USER_8],
	[USER_9],
	[USER_10],
	[NMFC_CODE_ID],
	[PACKAGE_TYPE],
	[MRP_EXCEPTION_INFO],
	[MULTIPLE_ORDER_QTY],
	[ADD_FORECAST],
	[UDF_LAYOUT_ID],
	[PIECE_TRACKED],
	[LENGTH_REQD],
	[WIDTH_REQD],
	[HEIGHT_REQD],
	[DIMENSIONS_UM],
	[SHIP_DIMENSIONS],
	[DRAWING_FILE],
	[TARIFF_CODE],
	[TARIFF_TYPE],
	[ORIG_COUNTRY_ID],
	[NET_WEIGHT_2],
	[GROSS_WEIGHT_2],
	[WEIGHT_UM_2],
	[VOLUME],
	[VOLUME_UM],
	[VAT_CODE],
	[DEMAND_FENCE_1],
	[DEMAND_FENCE_2],
	[ROLL_FORECAST],
	[CONSUMABLE],
	[PRIMARY_SOURCE],
	[LABEL_UM],
	[HTS_CODE],
	[DEF_ORIG_COUNTRY],
	[MATERIAL_CODE],
	[DEF_LBL_FORMAT_ID],
	[VOLATILE_LEADTIME],
	[LT_PLUS_DAYS],
	[LT_MINUS_DAYS],
	[STATUS],
	[USE_SUPPLY_BEF_LT],
	[QTY_COMMITTED],
	[intrastat_exempt],
	[CASE_QTY],
	[PALLET_QTY],
	[MINIMUM_LEADTIME],
	[LEADTIME_BUFFER],
	[EMERGENCY_STOCKPCT],
	[REPLENISH_LEVEL],
	[MIN_BATCH_SIZE],
	[EFF_DATE_PRICE],
	[ECN_REVISION],
	[REVISION_ID],
	[STAGE_ID],
	[ECN_REV_CONTROL],
	[IS_KIT],
	[YELLOW_STOCKPCT],
	[UNIV_PLAN_MATERIAL],
	[RLS_NEAR_DAYS],
	[SUGG_RLS_NEAR_DAYS],
	[ORDER_UP_TO_QTY],
	[LAST_IMPLODE_DATE],
	[STATUS_EFF_DATE],
	[CONTROLLED_BY_ICS],
	[PRICE_GROUP],
	[DEF_PACKAGE_QTY],
	[DEF_PACKAGE_CAP],
	[DEF_SLS_TAX_GRP_ID],
	[MRO_CLASS],
	[BUFFER_PROFILE_ID],
	[ADU_HORIZON],
	[ASR_LEADTIME],
	[ONHAND_ALERT_RED_PCT]
	)
SELECT 
	l.PART_ID,
	l.PART_DESCRIPTION,
	l.PART_STOCK_UM,
	L.PART_PLANNING_LEADTIME, 	 --<PLANNING_LEADTIME, smallint,> 
	L.PART_ORDER_POLICY, 	 --<ORDER_POLICY, char(1),>
	NULL, 	 --<ORDER_POINT, decimal(14,4),>
	NULL, 	 --<SAFETY_STOCK_QTY, decimal(14,4),>
	NULL, 	 --<FIXED_ORDER_QTY, decimal(14,4),>
	NULL, 	 --<DAYS_OF_SUPPLY, smallint,>
	NULL, 	 --<MINIMUM_ORDER_QTY, decimal(14,4),>
	NULL, 	 --<MAXIMUM_ORDER_QTY, decimal(14,4),>
	NULL, 	 --<PRODUCT_CODE, varchar(15),>
	NULL, --l.commodity_code      
	NULL, 	 --<MFG_NAME, varchar(30),>
	NULL, 	 --<MFG_PART_ID, varchar(30),>
	l.PART_FABRICATED, 	 --<FABRICATED, char(1),>
	'N', 	 --<PURCHASED, char(1),>
	l.PART_STOCKED, 	 --<STOCKED, char(1),>
	'N', 	 --<DETAIL_ONLY, char(1),>
	'N', 	 --<DEMAND_HISTORY, char(1),>
	'N', 	 --<TOOL_OR_FIXTURE, char(1),>
	'N', 	 --<INSPECTION_REQD, char(1),>
	NULL, 	 --<WEIGHT, decimal(14,4),>
	NULL, 	 --<WEIGHT_UM, varchar(15),>
	NULL, 	 --<DRAWING_ID, varchar(30),>
	NULL, 	 --<DRAWING_REV_NO, varchar(8),>
	NULL, 	 --<PREF_VENDOR_ID, varchar(15),>
	'N', 	 --<MRP_REQUIRED, char(1),>
	NULL, 	 --<MRP_EXCEPTIONS, char(1),>
	NULL, 	 --<PRIVATE_UM_CONV, char(1),>
	'N', 	 --<AUTO_BACKFLUSH, char(1),>
	L.PART_PLANNER_USER_ID, 	 --<PLANNER_USER_ID, varchar(20),>
	NULL,--l.PART_BUYER_USER_ID, 	 --<BUYER_USER_ID, varchar(20),>
	NULL, 	 --<ABC_CODE, char(1),>
	NULL, 	 --<ANNUAL_USAGE_QTY, decimal(15,4),>
	'N', 	 --<INVENTORY_LOCKED, char(1),>
	L.PART_MAT_GL_ACCT_ID, 	 --<MAT_GL_ACCT_ID, varchar(30),>
	L.PART_LAB_GL_ACCT_ID, 	 --<LAB_GL_ACCT_ID, varchar(30),>
	L.PART_BUR_GL_ACCT_ID, 	 --<BUR_GL_ACCT_ID, varchar(30),>
	L.PART_SER_GL_ACCT_ID, 	 --<SER_GL_ACCT_ID, varchar(30),>
	0, 	 --<QTY_ON_HAND, decimal(14,4),>
	0, 	 --<QTY_AVAILABLE_ISS, decimal(14,4),>
	0, 	 --<QTY_AVAILABLE_MRP, decimal(14,4),>
	0, 	 --<QTY_ON_ORDER, decimal(14,4),>
	0, 	 --<QTY_IN_DEMAND, decimal(14,4),>
	NULL, 	 --<USER_1, varchar(80),>
	NULL, 	 --<USER_2, varchar(80),>
	NULL, 	 --<USER_3, varchar(80),>
	NULL, 	 --<USER_4, varchar(80),>
	NULL, 	 --<USER_5, varchar(80),>
	NULL, 	 --<USER_6, varchar(80),>
	l.PART_USER_7, 	 --<USER_7, varchar(80),>
	L.PART_USER_8, 	 --<USER_8, varchar(80),>
	NULL,    --L.PART_USER_9         
	NULL, 	 --<USER_10, varchar(80),>
	NULL, 	 --<NMFC_CODE_ID, varchar(15),>
	NULL, 	 --<PACKAGE_TYPE, varchar(5),>
	NULL, 	 --<MRP_EXCEPTION_INFO, varchar(80),>
	NULL, 	 --<MULTIPLE_ORDER_QTY, decimal(14,4),>
	'N', 	 --<ADD_FORECAST, char(1),>
	NULL, 	 --<UDF_LAYOUT_ID, varchar(15),>
	'N', 	 --<PIECE_TRACKED, char(1),>
	'N', 	 --<LENGTH_REQD, char(1),>
	'N', 	 --<WIDTH_REQD, char(1),>
	'N', 	 --<HEIGHT_REQD, char(1),>
	NULL, 	 --<DIMENSIONS_UM, varchar(15),>
	NULL, 	 --<SHIP_DIMENSIONS, varchar(50),>
	NULL, 	 --<DRAWING_FILE, varchar(100),>
	NULL, 	 --<TARIFF_CODE, varchar(15),>
	NULL, 	 --<TARIFF_TYPE, varchar(20),>
	NULL, 	 --<ORIG_COUNTRY_ID, varchar(15),>
	NULL, 	 --<NET_WEIGHT_2, decimal(11,2),>
	NULL, 	 --<GROSS_WEIGHT_2, decimal(11,2),>
	NULL, 	 --<WEIGHT_UM_2, varchar(15),>
	NULL, 	 --<VOLUME, decimal(11,2),>
	NULL, 	 --<VOLUME_UM, varchar(15),>
	NULL, 	 --<VAT_CODE, varchar(15),>
	NULL, 	 --<DEMAND_FENCE_1, int,>
	NULL, 	 --<DEMAND_FENCE_2, int,>
	NULL, 	 --<ROLL_FORECAST, char(1),>
	'N', 	 --<CONSUMABLE, char(1),>
	NULL, 	 --<PRIMARY_SOURCE, char(3),>
	NULL, 	 --<LABEL_UM, varchar(15),>
	NULL, 	 --<HTS_CODE, varchar(20),>
	NULL, 	 --<DEF_ORIG_COUNTRY, varchar(50),>
	NULL, 	 --<MATERIAL_CODE, varchar(25),>
	NULL, 	 --<DEF_LBL_FORMAT_ID, varchar(30),>
	NULL, 	 --<VOLATILE_LEADTIME, char(1),>
	NULL, 	 --<LT_PLUS_DAYS, int,>
	NULL, 	 --<LT_MINUS_DAYS, int,>
	NULL, 	 --<STATUS, char(1),>
	NULL, 	 --<USE_SUPPLY_BEF_LT, char(1),>
	0, 	 --<QTY_COMMITTED, decimal(14,4),>
	'N', 	 --<intrastat_exempt, varchar(1),>
	NULL, 	 --<CASE_QTY, decimal(14,4),>
	NULL, 	 --<PALLET_QTY, decimal(14,4),>
	NULL, 	 --<MINIMUM_LEADTIME, smallint,>
	NULL, 	 --<LEADTIME_BUFFER, smallint,>
	NULL, 	 --<EMERGENCY_STOCKPCT, int,>
	NULL, 	 --<REPLENISH_LEVEL, decimal(14,4),>
	NULL, 	 --<MIN_BATCH_SIZE, decimal(14,4),>
	NULL, 	 --<EFF_DATE_PRICE, char(1),>
	NULL, 	 --<ECN_REVISION, char(1),>
	NULL, 	 --<REVISION_ID, varchar(8),>
	NULL, 	 --<STAGE_ID, varchar(15),>
	NULL, 	 --<ECN_REV_CONTROL, char(1),>
	'N', 	 --<IS_KIT, char(1),>
	NULL, 	 --<YELLOW_STOCKPCT, int,>
	NULL, 	 --<UNIV_PLAN_MATERIAL, varchar(1),>
	NULL, 	 --<RLS_NEAR_DAYS, smallint,>
	NULL, 	 --<SUGG_RLS_NEAR_DAYS, smallint,>
	NULL, 	 --<ORDER_UP_TO_QTY, decimal(14,4),>
	NULL, 	 --<LAST_IMPLODE_DATE, datetime,>
	GETDATE(),  --<STATUS_EFF_DATE, datetime,>
	'N', 	 --<CONTROLLED_BY_ICS, char(1),>
	NULL, 	 --<PRICE_GROUP, varchar(15),>
	NULL, 	 --<DEF_PACKAGE_QTY, decimal(14,4),>
	NULL, 	 --<DEF_PACKAGE_CAP, decimal(14,4),>
	NULL, 	 --<DEF_SLS_TAX_GRP_ID, varchar(15),>
	NULL, 	 --<MRO_CLASS, varchar(20),>
	NULL, 	 --<BUFFER_PROFILE_ID, varchar(15),>
	NULL, 	 --<ADU_HORIZON, smallint,>
	NULL, 	 --<ASR_LEADTIME, smallint,>
	NULL	 --<ONHAND_ALERT_RED_PCT, smallint,>)
FROM	LIVESupplemental.dbo.visual_upload_part$ l
LEFT OUTER JOIN 
	PART p
	ON p.ID = l.part_id
WHERE	p.ID IS NULL;


/****** 7B ******/
/*  Insert PARTS_SITE information for new Part.ID   */
INSERT INTO PART_SITE
	([SITE_ID],
	[PART_ID],
	[PLANNING_LEADTIME],
	[ORDER_POLICY],
	[ORDER_POINT],
	[ORDER_UP_TO_QTY],
	[SAFETY_STOCK_QTY],
	[FIXED_ORDER_QTY],
	[DAYS_OF_SUPPLY],
	[MINIMUM_ORDER_QTY],
	[MAXIMUM_ORDER_QTY],
	--[ENGINEERING_MSTR],
	[PRODUCT_CODE],
	[FABRICATED],
	[PURCHASED],
	[STOCKED],
	[DETAIL_ONLY],
	[DEMAND_HISTORY],
	[TOOL_OR_FIXTURE],
	[CONSUMABLE],
	[INSPECTION_REQD],
	[DEMAND_FENCE_1],
	[DEMAND_FENCE_2],
	[PLANNER_USER_ID],
	[BUYER_USER_ID],
	[ABC_CODE],
	[ANNUAL_USAGE_QTY],
	[INVENTORY_LOCKED],
	[PREF_VENDOR_ID],
	[PRIMARY_WHS_ID],
	[PRIMARY_LOC_ID],
	[BACKFLUSH_WHS_ID],
	[BACKFLUSH_LOC_ID],
	[INSPECT_WHS_ID],
	[INSPECT_LOC_ID],
	[MRP_REQUIRED],
	[MRP_EXCEPTIONS],
	[AUTO_BACKFLUSH],
	[UNIT_PRICE],
	[EFF_DATE_PRICE],
	[UNIT_MATERIAL_COST],
	[UNIT_LABOR_COST],
	[WHSALE_UNIT_COST],
	[BURDEN_PERCENT],
	[BURDEN_PER_UNIT],
	[EXCISE_UNIT_PRICE],
	[PURC_BUR_PERCENT],
	[UNIT_BURDEN_COST],
	[FIXED_COST],
	[UNIT_SERVICE_COST],
	[NEW_MATERIAL_COST],
	[NEW_LABOR_COST],
	[NEW_BURDEN_COST],
	[NEW_SERVICE_COST],
	[NEW_BURDEN_PERCENT],
	[NEW_BURDEN_PERUNIT],
	[PURC_BUR_PER_UNIT],
	[NEW_FIXED_COST],
	[MAT_GL_ACCT_ID],
	[LAB_GL_ACCT_ID],
	[BUR_GL_ACCT_ID],
	[SER_GL_ACCT_ID],
	[QTY_ON_HAND],
	[QTY_AVAILABLE_ISS],
	[QTY_AVAILABLE_MRP],
	[QTY_ON_ORDER],
	[QTY_IN_DEMAND],
	[QTY_COMMITTED],
	[TARIFF_CODE],
	[TARIFF_TYPE],
	[VAT_CODE],
	[ORIG_COUNTRY_ID],
	[INTRASTAT_EXEMPT],
	[STATUS],
	[STATUS_EFF_DATE],
	[USE_SUPPLY_BEF_LT],
	[MINIMUM_LEADTIME],
	[LEADTIME_BUFFER],
	[EMERGENCY_STOCKPCT],
	[REPLENISH_LEVEL],
	[MIN_BATCH_SIZE],
	[YELLOW_STOCKPCT],
	[MRP_EXCEPTION_INFO],
	[MULTIPLE_ORDER_QTY],
	[LAST_IMPLODE_DATE],
	[MRO_CLASS],
	[UDF_LAYOUT_ID],
	[USER_1],
	[USER_2],
	[USER_3],
	[USER_4],
	[USER_5],
	[USER_6],
	[USER_7],
	[USER_8],
	[USER_9],
	[USER_10],
	[BUFFER_PROFILE_ID],
	[ADU_HORIZON],
	[ASR_LEADTIME],
	[ONHAND_ALERT_RED_PCT],
	[LAST_ABC_DATE]
	)
SELECT 
	'SK01',                   --(<SITE_ID, varchar(15),>
	l.part_ID,               --,<PART_ID, varchar(30),>
	L.PART_PLANNING_LEADTIME,           --,<PLANNING_LEADTIME, smallint,>
	L.PART_ORDER_POLICY,                    --,<ORDER_POLICY, char(1),>
	NULL,                    --,<ORDER_POINT, decimal(14,4),>
	NULL,                    --,<ORDER_UP_TO_QTY, decimal(14,4),>
	NULL,                    --,<SAFETY_STOCK_QTY, decimal(14,4),>
	NULL,                    --,<FIXED_ORDER_QTY, decimal(14,4),>
	NULL,                    --,<DAYS_OF_SUPPLY, smallint,>
	NULL,                    --,<MINIMUM_ORDER_QTY, decimal(14,4),>
	NULL,                    --,<MAXIMUM_ORDER_QTY, decimal(14,4),>
	--l.part_engineering_mstr --,<ENGINEERING_MSTR, varchar(3),>
	NULL,                    --,<PRODUCT_CODE, varchar(15),>
	l.part_fabricated,       --<FABRICATED, char(1),>
	'N',                     --,<PURCHASED, char(1),>
	l.part_STOCKED,          --,<STOCKED, char(1),>
	NULL,                    --,<DETAIL_ONLY, char(1),>
	NULL,                    --,<DEMAND_HISTORY, char(1),>
	NULL,                    --,<TOOL_OR_FIXTURE, char(1),>
	NULL,                    --,<CONSUMABLE, char(1),>
	NULL,                    --,<INSPECTION_REQD, char(1),>
	NULL,                    --,<DEMAND_FENCE_1, int,>
	NULL,                    --,<DEMAND_FENCE_2, int,>
	L.PART_PLANNER_USER_ID,  --,<PLANNER_USER_ID, varchar(20),>
	NULL, --l.PART_BUYER_USER_ID	 --,<BUYER_USER_ID, varchar(20),>
	NULL,                    --,<ABC_CODE, char(1),>
	NULL,                    --,<ANNUAL_USAGE_QTY, decimal(15,6),>
	NULL,                    --,<INVENTORY_LOCKED, char(1),>
	NULL,                    --,<PREF_VENDOR_ID, varchar(15),>
	NULL,                    --,<PRIMARY_WHS_ID, varchar(15),>
	NULL,                    --,<PRIMARY_LOC_ID, varchar(15),>
	NULL,                    --,<BACKFLUSH_WHS_ID, varchar(15),>
	NULL,                    --,<BACKFLUSH_LOC_ID, varchar(15),>
	NULL,                    --,<INSPECT_WHS_ID, varchar(15),>
	NULL,                    --,<INSPECT_LOC_ID, varchar(15),>
	NULL,                    --,<MRP_REQUIRED, char(1),>
	NULL,                    --,<MRP_EXCEPTIONS, char(1),>
	NULL,                    --,<AUTO_BACKFLUSH, char(1),>
	NULL,                    --,<UNIT_PRICE, decimal(15,6),>
	NULL,                    --,<EFF_DATE_PRICE, char(1),>
	0,                       --,<UNIT_MATERIAL_COST, decimal(15,6),>
	0,                       --,<UNIT_LABOR_COST, decimal(15,6),>
	NULL,                    --,<WHSALE_UNIT_COST, decimal(15,6),>
	0,                       --,<BURDEN_PERCENT, decimal(5,2),>
	0,                       --,<BURDEN_PER_UNIT, decimal(15,6),>
	NULL,                    --,<EXCISE_UNIT_PRICE, decimal(15,6),>
	0,                       --,<PURC_BUR_PERCENT, decimal(6,3),>
	0,                       --,<UNIT_BURDEN_COST, decimal(15,6),>
	0,                       --,<FIXED_COST, decimal(15,2),>
	0,                       --,<UNIT_SERVICE_COST, decimal(15,6),>
	0,                       --,<NEW_MATERIAL_COST, decimal(15,6),>
	0,                       --,<NEW_LABOR_COST, decimal(15,6),>
	0,                       --,<NEW_BURDEN_COST, decimal(15,6),>
	0,                       --,<NEW_SERVICE_COST, decimal(15,6),>
	0,                       --,<NEW_BURDEN_PERCENT, decimal(5,2),>
	0,                       --,<NEW_BURDEN_PERUNIT, decimal(15,6),>
	0,                       --,<PURC_BUR_PER_UNIT, decimal(15,6),>
	0,                       --,<NEW_FIXED_COST, decimal(15,2),>
	L.PART_MAT_GL_ACCT_ID,   --<MAT_GL_ACCT_ID, varchar(30),>
	L.PART_LAB_GL_ACCT_ID,   --<LAB_GL_ACCT_ID, varchar(30),>
	L.PART_BUR_GL_ACCT_ID,   --<BUR_GL_ACCT_ID, varchar(30),>
	L.PART_SER_GL_ACCT_ID,   --<SER_GL_ACCT_ID, varchar(30),
	0,                       --,<QTY_ON_HAND, decimal(14,4),>
	0,                       --,<QTY_AVAILABLE_ISS, decimal(14,4),>
	0,                       --,<QTY_AVAILABLE_MRP, decimal(14,4),>
	0,                       --,<QTY_ON_ORDER, decimal(14,4),>
	0,                       --,<QTY_IN_DEMAND, decimal(14,4),>
	0,                       --,<QTY_COMMITTED, decimal(14,4),>
	NULL,                    --,<TARIFF_CODE, varchar(15),>
	NULL,                    --,<TARIFF_TYPE, varchar(20),>
	NULL,                    --,<VAT_CODE, varchar(15),>
	NULL,                    --,<ORIG_COUNTRY_ID, varchar(15),>
	'N',                     --,<INTRASTAT_EXEMPT, varchar(1),>
	NULL,                    --,<STATUS, char(1),>
	GETDATE(),               --,<STATUS_EFF_DATE, datetime,>
	NULL,                    --,<USE_SUPPLY_BEF_LT, char(1),>
	NULL,                    --,<MINIMUM_LEADTIME, smallint,>
	NULL,                    --,<LEADTIME_BUFFER, smallint,>
	NULL,                    --,<EMERGENCY_STOCKPCT, int,>
	NULL,                    --,<REPLENISH_LEVEL, decimal(14,4),>
	NULL,                    --,<MIN_BATCH_SIZE, decimal(14,4),>
	NULL,                    --,<YELLOW_STOCKPCT, int,>
	NULL,                    --,<MRP_EXCEPTION_INFO, varchar(80),>
	NULL,                    --,<MULTIPLE_ORDER_QTY, decimal(14,4),>
	NULL,                    --,<LAST_IMPLODE_DATE, datetime,>
	NULL,                    --,<MRO_CLASS, varchar(20),>
	NULL,                    --,<UDF_LAYOUT_ID, varchar(15),>
	NULL,                    --,<USER_1, varchar(80),>
	NULL,                    --,<USER_2, varchar(80),>
	NULL,                    --,<USER_3, varchar(80),>
	NULL,                    --,<USER_4, varchar(80),>
	NULL,                    --,<USER_5, varchar(80),>
	NULL,                    --,<USER_6, varchar(80),>
	NULL,                    --,<USER_7, varchar(80),>
	NULL,                    --,<USER_8, varchar(80),>
	NULL,                    --,<USER_9, varchar(80),>
	NULL,                    --,<USER_10, varchar(80),>
	NULL,                    --,<BUFFER_PROFILE_ID, varchar(15),>
	NULL,                    --,<ADU_HORIZON, smallint,>
	NULL,                    --,<ASR_LEADTIME, smallint,>
	NULL,                    --,<ONHAND_ALERT_RED_PCT, smallint,>
	NULL                    --,<LAST_ABC_DATE, datetime,>
from	LIVESupplemental.dbo.visual_upload_part$ l
left outer join 
	PART_SITE p
	on p.PART_ID = l.part_id
where	p.PART_ID is null


/****** 7A ******/
/*  Update CUST_PRICE_EFFECT information for new Part.ID   */

/****** 7B ******/
/*  Insert CUST_PRICE_EFFECT information for new Part.ID   */
INSERT INTO CUST_PRICE_EFFECT
	([CUSTOMER_ID],
	[PART_ID],
	[SELLING_UM],
	[CREATE_DATE],
	[EFFECTIVE_DATE],
	[DISCONTINUE_DATE],
	[CUSTOMER_PART_ID],
	[DEFAULT_UNIT_PRICE],
	[BY_DATE_CODE]
	)
SELECT
	l.CUST_PRICE_EFFECT_CUSTOMER_ID,	--<CUSTOMER_ID, varchar(15),>
	l.PART_ID,				--,<PART_ID, varchar(30),>
	l.CUST_PRICE_EFFECT_SELLING_UM,		--,<SELLING_UM, varchar(15),>
	GETDATE(),				--,<CREATE_DATE, datetime,>
	l.CUST_PRICE_EFFECT_EFFECTIVE_DATE,	--,<EFFECTIVE_DATE, datetime,>
	l.CUST_PRICE_EFFECT_DISCONTINUE_DATE,	--,<DISCONTINUE_DATE, datetime,>
	cast(l.CUST_PRICE_EFFECT_CUSTOMER_PART_ID as varchar),
	convert(decimal(15,6),round(l.[CUST_PRICE_EFFECT_DEFAULT_UNIT_PRICE],2)),	   --,<DEFAULT_UNIT_PRICE, decimal(15,6),>
	l.CUST_PRICE_EFFECT_BY_DATE_CODE		  --,<BY_DATE_CODE, varchar(5),>)
FROM	LIVESupplemental.dbo.Visual_Upload_Part$ l
INNER JOIN 
	PART p
	ON l.part_id = p.id
LEFT OUTER JOIN 
	CUST_PRICE_EFFECT CPE
	on CPE.PART_ID = P.id  
	and CPE.CUSTOMER_PART_ID = cast(l.CUST_PRICE_EFFECT_CUSTOMER_PART_ID as varchar)
WHERE	l.CUST_PRICE_EFFECT_CUSTOMER_ID = 'BOEPOP'
	AND CPE.CUSTOMER_PART_ID IS NULL
;

/*********************************************************************************************/
/* REMOVE RECORDS FROM TEST AND RE-RUN PROCEDURE
SELECT *  FROM PART p 
INNER JOIN liveSupplemental.dbo.visual_upload_part$ l
ON p.ID = l.part_id
*
*
DELETE P
FROM PART p 
INNER JOIN liveSupplemental.dbo.visual_upload_part$ l
ON p.ID = l.part_id
*/
/*
SELECT *  
FROM
PART_SITE p
INNER JOIN liveSupplemental.dbo.visual_upload_part$ l
on p.PART_ID = l.part_id
*
*
DELETE P
FROM    PART_SITE p
INNER JOIN liveSupplemental.dbo.visual_upload_part$ l
on p.PART_ID = l.part_id
*/
/*
SELECT * 
FROM  CUST_PRICE_EFFECT c
INNER JOIN PART p
on c.PART_ID = P.id  
INNER JOIN livesupplemental.dbo.Visual_Upload_Part$ L
ON l.part_id = p.id
WHERE l.CUST_PRICE_EFFECT_CUSTOMER_ID = 'BOEPOP'
AND C.PART_ID = '151W1583-16'

*
*
DELETE P
FROM  CUST_PRICE_EFFECT c
INNER JOIN PART p
on c.PART_ID = P.id  
INNER JOIN livesupplemental.dbo.Visual_Upload_Part$ L
ON l.part_id = p.id
WHERE l.CUST_PRICE_EFFECT_CUSTOMER_ID = 'BOEPOP'

*/

END