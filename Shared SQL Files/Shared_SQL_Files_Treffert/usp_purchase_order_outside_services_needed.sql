USE [LIVE]
GO

/****** Object:  StoredProcedure [dbo].[usp_purchase_order_outside_services_needed]    Script Date: 2/5/2021 7:52:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Eric Shafer
-- Create date: Unknown - Revised 7/13/2017
-- Description:	Original notes unavailable.  Altered procedure using existing logic.  Optimized to eliminate temp tables, reduce locks and round trips to the database.
-- Revised 7/27/2018 - ES
-- Updated to utilize the new ResourceID_ReportSettings table.
-- Updated to utilize the new Planning_user_id_ReportSettings table.
-- =============================================
CREATE PROCEDURE [dbo].[usp_purchase_order_outside_services_needed] @start_date AS DATETIME, 
													  @end_date AS   DATETIME
AS
    BEGIN
	   SET NOCOUNT ON;

	   --CAREFUL TO MAKE SURE COLUMNS ARE IN THE SAME ORDER AS THE SPROK.
	   DECLARE @ReportSettings AS TABLE
	   (RESOURCE                  NVARCHAR(30), 
	    [LABOR SHIPPING RESOURCE] INT, 
	    [SERVICE RESOURCE]        INT
	   );
	   INSERT INTO @ReportSettings
	   EXEC LIVESUPPLEMENTAL..USP_GETREPORTSETTINGS 
		   'usp_purchase_order_outside_services_needed';
	   --SELECT * FROM @ReportSettings
	   --customer orders with linked workorders
	   WITH LABORTICKETS
		   AS (SELECT *
			  FROM LABOR_TICKET
			  WHERE TRANSACTION_DATE >= @start_date
				   AND TRANSACTION_DATE < @end_date
				   AND EXISTS
			  (
				 SELECT 1
				 FROM @ReportSettings R
				 WHERE R.[LABOR SHIPPING RESOURCE] IS NOT NULL
					  AND RESOURCE_ID = R.RESOURCE
			  )
		   --AND RESOURCE_ID IN(SELECT Resource FROM @ReportSettings WHERE [Labor Shipping Resource] IS NOT NULL)
		   )
	   --SELECT * FROM LaborTickets
	   ,
		   TMPLINKED
		   AS (SELECT CO.CUSTOMER_ID, 
				    COL.CUST_ORDER_ID, 
				    COL.PART_ID AS        PART_ID, 
				    DSL.SUPPLY_BASE_ID AS BASE_ID, 
				    DSL.SUPPLY_LOT_ID     LOT_ID, 
				    DSL.SUPPLY_SPLIT_ID   SPLIT_ID, 
				    DSL.SUPPLY_SUB_ID     SUB_ID, 
				    COL.LINE_NO
			  --into #tmplinked
			  FROM CUST_ORDER_LINE COL
				  INNER JOIN CUSTOMER_ORDER AS CO
					ON CO.ID = COL.CUST_ORDER_ID
					   AND CO.STATUS = ('R')
					   AND COL.LINE_STATUS <> 'C'
					   AND COL.ORDER_QTY - COL.TOTAL_SHIPPED_QTY > 0
					   AND COL.PART_ID IS NOT NULL
				  INNER JOIN DEMAND_SUPPLY_LINK DSL
					ON COL.CUST_ORDER_ID = DEMAND_BASE_ID
					   AND COL.LINE_NO = DEMAND_SEQ_NO
					   AND DSL.DEMAND_TYPE = 'CO'
			  --INNER JOIN WORK_ORDER WO
			  --	ON DSL.SUPPLY_BASE_ID     = WO.BASE_ID
			  --   AND DSL.SUPPLY_LOT_ID      = WO.LOT_ID
			  --   AND DSL.SUPPLY_SPLIT_ID    = WO.SPLIT_ID 
			  --   AND DSL.SUPPLY_SUB_ID      = WO.SUB_ID
			  --   AND WO.TYPE = 'w'
			  --   AND WO.status in ('F','R')
			  --   AND DSL.SUPPLY_TYPE = 'WO'
			  WHERE EXISTS
			  (
				 SELECT 1
				 FROM LABORTICKETS L
				 WHERE L.WORKORDER_BASE_ID = DSL.SUPPLY_BASE_ID
					  AND L.WORKORDER_LOT_ID = DSL.SUPPLY_LOT_ID
					  AND L.WORKORDER_SPLIT_ID = DSL.SUPPLY_SPLIT_ID
					  AND L.WORKORDER_SUB_ID = DSL.SUPPLY_SUB_ID
					  AND L.WORKORDER_TYPE = DSL.SUPPLY_TYPE
				   --AND L.TRANSACTION_DATE >= @start_date
				   --AND L.TRANSACTION_DATE < @end_date
			  )
				   AND EXISTS
			  (
				 SELECT 1
				 FROM WORK_ORDER WO
				 WHERE DSL.SUPPLY_BASE_ID = WO.BASE_ID
					  AND DSL.SUPPLY_LOT_ID = WO.LOT_ID
					  AND DSL.SUPPLY_SPLIT_ID = WO.SPLIT_ID
					  AND DSL.SUPPLY_SUB_ID = WO.SUB_ID
					  AND WO.TYPE = 'w'
					  AND WO.STATUS IN('F', 'R')
				 AND DSL.SUPPLY_TYPE = 'WO'
			  ))

	   --select * from tmplinked
	   --customer orders without linked workorders
	   ,
		   TMPNOTLINKED
		   AS (SELECT CO.CUSTOMER_ID, 
				    COL.CUST_ORDER_ID, 
				    COL.PART_ID AS PART_ID, 
				    WO.BASE_ID AS  BASE_ID, 
				    WO.LOT_ID, 
				    WO.SPLIT_ID, 
				    WO.SUB_ID
			  --into #tmpnotlinked
			  FROM CUST_ORDER_LINE COL
				  INNER JOIN CUSTOMER_ORDER AS CO
					ON CO.ID = COL.CUST_ORDER_ID
					   AND CO.STATUS = ('R')
					   AND COL.LINE_STATUS <> 'C'
					   AND COL.ORDER_QTY - COL.TOTAL_SHIPPED_QTY > 0
					   AND COL.PART_ID IS NOT NULL
				  INNER JOIN WORK_ORDER WO
					ON COL.PART_ID = WO.PART_ID
					   AND WO.TYPE = 'W'
					   AND WO.STATUS IN('F', 'R')
			  --left outer JOIN DEMAND_SUPPLY_LINK DSL 
			  --  ON COL.CUST_ORDER_ID = DEMAND_BASE_ID
			  -- AND COL.LINE_NO       = DEMAND_SEQ_NO

			  WHERE NOT EXISTS
			  (
				 SELECT 1
				 FROM DEMAND_SUPPLY_LINK DSL
				 WHERE DSL.DEMAND_BASE_ID = COL.CUST_ORDER_ID
					  AND DSL.DEMAND_SEQ_NO = COL.LINE_NO
					  AND DSL.DEMAND_TYPE = 'CO'
			  )
			  GROUP BY CO.CUSTOMER_ID, 
					 COL.CUST_ORDER_ID, 
					 COL.PART_ID, 
					 WO.BASE_ID, 
					 WO.LOT_ID, 
					 WO.SPLIT_ID, 
					 WO.SUB_ID
			  --demand_base_id is null
			  )
		   --select * from tmpnotlinked

		   ,
		   TMPCUST
		   AS (SELECT L.CUSTOMER_ID, 
				    L.CUST_ORDER_ID, 
				    L.PART_ID, 
				    L.BASE_ID, 
				    L.LOT_ID, 
				    L.SPLIT_ID, 
				    L.SUB_ID
			  FROM TMPLINKED L
			  UNION ALL
			  SELECT U.CUSTOMER_ID, 
				    U.CUST_ORDER_ID, 
				    U.PART_ID, 
				    U.BASE_ID, 
				    U.LOT_ID, 
				    U.SPLIT_ID, 
				    U.SUB_ID
			  FROM TMPNOTLINKED U)
		   --SELECT * FROM tmpcust
		   ,
		   TMPLT
		   AS (SELECT A.WORKORDER_TYPE, 
				    A.WORKORDER_BASE_ID, 
				    A.WORKORDER_LOT_ID, 
				    A.WORKORDER_SPLIT_ID, 
				    A.WORKORDER_SUB_ID, 
				    LT.DESCRIPTION, 
				    A.MAXSEQ, 
				    A.NEXTSEQ, 
				    MAX(LT.GOOD_QTY) AS QTY
			  --into #tmplt
			  FROM
			  (
				 SELECT L.WORKORDER_TYPE, 
					   L.WORKORDER_BASE_ID, 
					   L.WORKORDER_LOT_ID, 
					   L.WORKORDER_SPLIT_ID, 
					   L.WORKORDER_SUB_ID, 
					   OL.NEXTSEQ, 
					   OL.PREVSEQ, 
				 (
					SELECT MAX(L2.OPERATION_SEQ_NO)
					FROM LABORTICKETS L2
					WHERE L.WORKORDER_TYPE = L2.WORKORDER_TYPE
						 AND L.WORKORDER_BASE_ID = L2.WORKORDER_BASE_ID
						 AND L.WORKORDER_LOT_ID = L2.WORKORDER_LOT_ID
						 AND L.WORKORDER_SPLIT_ID = L2.WORKORDER_SPLIT_ID
						 AND L.WORKORDER_SUB_ID = L2.WORKORDER_SUB_ID
						 AND L.OPERATION_SEQ_NO = L2.OPERATION_SEQ_NO
					GROUP BY L2.OPERATION_SEQ_NO
				 ) AS MAXSEQ
				 FROM LABORTICKETS L
					 INNER JOIN OPERATION O
					    ON O.WORKORDER_TYPE = L.WORKORDER_TYPE
						  AND O.WORKORDER_BASE_ID = L.WORKORDER_BASE_ID
						  AND O.WORKORDER_LOT_ID = L.WORKORDER_LOT_ID
						  AND O.WORKORDER_SPLIT_ID = L.WORKORDER_SPLIT_ID
						  AND O.WORKORDER_SUB_ID = L.WORKORDER_SUB_ID
						  AND O.SEQUENCE_NO = L.OPERATION_SEQ_NO
					 INNER JOIN EMPLOYEE E
					    ON L.EMPLOYEE_ID = E.ID
					 --   and e.id in ('3077','3212')   
					 -- and e.id in ('3077','3212','3379','2288')    --adding new employees -- trying without specifying employees 4/22/2016
					 INNER JOIN SKILLS_WO_OPS_OPEN_LOC OL
					    ON L.WORKORDER_TYPE = OL.WORKORDER_TYPE-- OL.type
						  AND L.WORKORDER_BASE_ID = OL.WORKORDER_BASE_ID --OL.base_id
						  AND L.WORKORDER_LOT_ID = OL.WORKORDER_LOT_ID --OL.LOT_ID
						  AND L.WORKORDER_SPLIT_ID = OL.WORKORDER_SPLIT_ID--OL.split_id
						  AND L.WORKORDER_SUB_ID = OL.WORKORDER_SUB_ID --OL.SUB_ID
						  AND L.OPERATION_SEQ_NO = OL.SEQUENCE_NO
				 WHERE L.RESOURCE_ID IN
				 (
					SELECT RESOURCE
					FROM @ReportSettings
					WHERE [LABOR SHIPPING RESOURCE] IS NOT NULL
				 )
				 --AND L.TYPE = 'S'
				 --and l.WORKORDER_BASE_ID = '1354327'
				 GROUP BY L.WORKORDER_TYPE, 
						L.WORKORDER_BASE_ID, 
						L.WORKORDER_LOT_ID, 
						L.WORKORDER_SPLIT_ID, 
						L.WORKORDER_SUB_ID, 
						L.OPERATION_SEQ_NO, 
						L.EMPLOYEE_ID, 
						O.WORKORDER_TYPE, 
						O.WORKORDER_BASE_ID, 
						O.WORKORDER_LOT_ID, 
						O.WORKORDER_SPLIT_ID, 
						O.WORKORDER_SUB_ID, 
						O.SEQUENCE_NO, 
						OL.NEXTSEQ, 
						OL.PREVSEQ
			  ) AS A
			  INNER JOIN LABORTICKETS LT
				ON A.WORKORDER_TYPE = LT.WORKORDER_TYPE
				   AND A.WORKORDER_BASE_ID = LT.WORKORDER_BASE_ID
				   AND A.WORKORDER_LOT_ID = LT.WORKORDER_LOT_ID
				   AND A.WORKORDER_SPLIT_ID = LT.WORKORDER_SPLIT_ID
				   AND A.WORKORDER_SUB_ID = LT.WORKORDER_SUB_ID
				   AND A.MAXSEQ = LT.OPERATION_SEQ_NO
			  GROUP BY A.WORKORDER_TYPE, 
					 A.WORKORDER_BASE_ID, 
					 A.WORKORDER_LOT_ID, 
					 A.WORKORDER_SPLIT_ID, 
					 A.WORKORDER_SUB_ID, 
					 LT.DESCRIPTION, 
					 A.MAXSEQ, 
					 A.NEXTSEQ, 
					 LT.OPERATION_SEQ_NO

			  --order by a.WORKORDER_BASE_ID
			  --    
			  )
			  --select * from tmplt
			  --checks if a po has been written for the operation
			  -- drop table #tmppo
			  ,
		   TMPPO
		   AS (SELECT --distinct
			  PO.ID, 
			  PO.VENDOR_ID, 
			  PO.ORDER_DATE, 
			  POL.LINE_NO, 
			  POL.DESIRED_RECV_DATE, 
			  R.RECEIVED_DATE, 
			  POL.ORDER_QTY, 
			  POL.PART_ID, 
			  POL.UNIT_PRICE, 
			  'W' AS                 TYPE, 
			  DSL.DEMAND_BASE_ID AS  BASE_ID, 
			  DSL.DEMAND_LOT_ID AS   LOT_ID, 
			  DSL.DEMAND_SPLIT_ID AS SPLIT_ID, 
			  DSL.DEMAND_SUB_ID AS   SUB_ID, 
			  DSL.DEMAND_SEQ_NO AS   SEQUENCE_NO, 
			  PO.STATUS
			  --into #tmppo
			  FROM PURCHASE_ORDER AS PO
				  LEFT OUTER JOIN PURC_ORDER_LINE AS POL
					ON PO.ID = POL.PURC_ORDER_ID
				  LEFT OUTER JOIN RECEIVER AS R
					ON PO.ID = R.PURC_ORDER_ID
				  LEFT OUTER JOIN DEMAND_SUPPLY_LINK AS DSL
					ON POL.PURC_ORDER_ID = DSL.SUPPLY_BASE_ID
					   AND POL.LINE_NO = DSL.SUPPLY_SEQ_NO
					   AND DSL.SUPPLY_TYPE = 'PO'
			  WHERE PO.VENDOR_ID NOT IN('ANALAB', 'OLYSCI', 'VECTOR')
				  --and po.vendor_id in (@vendorid)
				  -- AND po.STATUS = 'r'
				  AND DSL.DEMAND_BASE_ID IS NOT NULL
		   -- AND R.RECEIVED_DATE IS NULL
		   -- And dsl.DEMAND_BASE_ID <> '1375103'
		   --ORDER BY po.VENDOR_ID , 
		   --         pol.DESIRED_RECV_DATE
		   )

/*
checks if total qty of pos written per vendor per line equal or exceed the work order 
This is to remove pos that have been split from the report
*/

			  -- drop table #tmpSUMPO
			  ,
		   TMPSUMPO
		   AS (SELECT --distinct
			  -- po.ID , --
			  --po.VENDOR_ID , 
			  --po.LINE_NO , 
			  --SUM(PO.ORDER_QTY) AS SUMPOQTY,
			  --CASE WHEN SUM(POL.ORDER_QTY) >= WO.DESIRED_QTY
			  -- AND pol.user_2 is null
			  --           THEN  'OKAY'
			  --           ELSE CASE WHEN pol.user_2 = 'exclude from report'
			  --                 THEN 'OKAY'
			  --                         ELSE 'STILL OPEN'
			  --END 
			  -- END AS QTYSTATUS,
			  CASE
				 WHEN PO.BASE_ID <> '1375103'
				 THEN CASE
						WHEN SUM(PO.ORDER_QTY) >= WO.DESIRED_QTY
						THEN 'OKAY'
						ELSE 'STILL OPEN'
					 END
				 ELSE 'OKAY'
			  END AS         QTYSTATUS,
			  --WO.DESIRED_QTY,
			  PO.PART_ID, 
			  'W' AS         TYPE, 
			  PO.BASE_ID AS  BASE_ID, 
			  PO.LOT_ID AS   LOT_ID, 
			  PO.SPLIT_ID AS SPLIT_ID, 
			  PO.SUB_ID AS   SUB_ID, 
			  PO.SEQUENCE_NO
			  --INTO #tmpSUMpo
			  FROM TMPPO AS PO
				  --LEFT OUTER JOIN PURC_ORDER_LINE AS Pol
				  --  ON po.ID = pol.PURC_ORDER_ID 
				  -- AND POL.PART_ID IS NOT NULL
				  --LEFT OUTER JOIN DEMAND_SUPPLY_LINK AS DSL
				  --  ON pol.PURC_ORDER_ID = DSL.SUPPLY_BASE_ID
				  -- AND pol.LINE_NO       = DSL.SUPPLY_SEQ_NO
				  LEFT OUTER JOIN WORK_ORDER WO
					ON PO.BASE_ID = WO.BASE_ID
					   AND PO.LOT_ID = WO.LOT_ID
					   AND PO.SPLIT_ID = WO.SPLIT_ID
					   AND PO.SUB_ID = WO.SUB_ID
					   AND WO.TYPE = 'W'
			  WHERE PO.VENDOR_ID NOT IN('ANALAB', 'OLYSCI', 'VECTOR')
			  --AND po.BASE_ID IS NOT NULL
			  -- and dsl.DEMAND_BASE_ID <> '1375103'
			  GROUP BY 
			  --   po.id, --
			  --po.VENDOR_ID , 
			  --po.LINE_NO ,  
			  WO.DESIRED_QTY, 
			  PO.PART_ID, 
			  --po.user_2,
			  PO.BASE_ID, 
			  PO.LOT_ID, 
			  PO.SPLIT_ID, 
			  PO.SUB_ID, 
			  PO.SEQUENCE_NO
		   --ORDER BY po.VENDOR_ID 
		   )

/* combining and filtering with the temp tables to produce report
*/

		   SELECT 
		   --o.TYPE,
		   PSA.MATERIAL_TYPE + ' ' + PSA.ALLOY + ' ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.THICKNESS_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.WIDTH_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.LENGTH_VAL)) AS CP_DESCRIPTION2, 
		   LEFT(SOB.SPECS, ISNULL(CHARINDEX(CHAR(13), SOB.SPECS, -1), 1)) AS                                                                                                                                                                                           ROUTETO, 
		   TP.ID AS                                                                                                                                                                                                                                                    PO, 
		   SOB.SPECS, 
		   C.CUSTOMER_ID, 
		   C.CUST_ORDER_ID, 
		   O.BASE_ID, 
		   O.LOT_ID, 
		   O.SPLIT_ID, 
		   O.SUB_ID, 
		   O.PART_ID, 
		   P.BUYER_USER_ID, 
		   P.DESCRIPTION, 
		   O.SEQUENCE_NO, 
		   O.RESOURCE_ID, 
		   O.SERVICE_ID, 
		   O.OPERATION_TYPE, 
		   --a.WORKORDER_TYPE, 
		   --    a.WORKORDER_BASE_ID, 
		   --    a.WORKORDER_LOT_ID,
		   --    a.WORKORDER_SPLIT_ID,
		   --    a.WORKORDER_SUB_ID,
		   A.DESCRIPTION AS                                                                                                                                                                                                                                            EXPEDITE, 
		   A.MAXSEQ, 
		   A.QTY
		   FROM SKILLS_WO_OPS_OPEN O
			   INNER JOIN PART P
				 ON P.ID = O.PART_ID
				    --AND P.PLANNER_USER_ID IN ('MRP', 'PLAN', 'TTO','NEW', '609M', '609MEO', '605M', '619M', 'KANBAN') 
				    AND EXISTS
		   (
			  SELECT 1
			  FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_REPORTSETTINGS EX
			  WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
				   AND REPORT_NAME = N'Purchase Orders Outside Services needed'
		   )
				    AND NOT(O.PART_ID LIKE 'ASB-%'
						  OR O.PART_ID LIKE 'F-%'
						  OR O.PART_ID LIKE 'PRO%'
						  OR O.PART_ID LIKE 'PROCESS%'
						  -- OR o.PART_ID LIKE 'REWORK%'
						  OR O.PART_ID LIKE 'UP%'
						  OR O.PART_ID LIKE '2024-3%'
						  OR O.PART_ID LIKE 'CMC-NRE%')
			   INNER JOIN TMPLT A
				 ON O.TYPE = A.WORKORDER_TYPE
				    AND O.BASE_ID = A.WORKORDER_BASE_ID
				    AND O.LOT_ID = A.WORKORDER_LOT_ID
				    AND O.SPLIT_ID = A.WORKORDER_SPLIT_ID
				    AND O.SUB_ID = A.WORKORDER_SUB_ID
				    AND O.SEQUENCE_NO = A.NEXTSEQ
			   LEFT OUTER JOIN TMPCUST C
				 ON O.BASE_ID = C.BASE_ID
			   -- and o.PART_ID = c.part_id
			   LEFT OUTER JOIN SKILL_OPERATION_BINARY AS SOB
				 ON O.TYPE = SOB.WORKORDER_TYPE
				    AND O.BASE_ID = SOB.WORKORDER_BASE_ID
				    AND O.LOT_ID = SOB.WORKORDER_LOT_ID
				    AND O.SPLIT_ID = SOB.WORKORDER_SPLIT_ID
				    AND O.SUB_ID = SOB.WORKORDER_SUB_ID
				    AND O.SEQUENCE_NO = SOB.SEQUENCE_NO
			   LEFT OUTER JOIN TMPPO TP
				 ON O.TYPE = TP.TYPE
				    AND O.BASE_ID = TP.BASE_ID
				    AND O.LOT_ID = TP.LOT_ID
				    AND O.SPLIT_ID = TP.SPLIT_ID
				    AND O.SUB_ID = TP.SUB_ID
				    AND O.SEQUENCE_NO = TP.SEQUENCE_NO
			   LEFT OUTER JOIN TMPSUMPO TSUMP
				 ON O.TYPE = TSUMP.TYPE
				    AND O.BASE_ID = TSUMP.BASE_ID
				    AND O.LOT_ID = TSUMP.LOT_ID
				    AND O.SPLIT_ID = TSUMP.SPLIT_ID
				    AND O.SUB_ID = TSUMP.SUB_ID
				    AND O.SEQUENCE_NO = TSUMP.SEQUENCE_NO
			   LEFT OUTER JOIN SKILLS_PART_UDF AS PSA
				 ON PSA.PART_ID = O.PART_ID
		   WHERE O.RESOURCE_ID IN
		   (
			  SELECT RESOURCE
			  FROM @ReportSettings
			  WHERE [SERVICE RESOURCE] IS NOT NULL
		   )
			    AND TP.ID IS NULL
			    --and  l.operation_type = 'SOUSHIP'
			    AND (O.OPERATION_TYPE <> 'VECTOR'
				    OR O.OPERATION_TYPE IS NULL)
			    AND (O.SERVICE_ID <> 'VECTOR'
				    OR O.SERVICE_ID IS NULL)
			    --and tSUMp.QTYSTATUS        = 'STILL OPEN'
			    AND O.BASE_ID <> '1375103'
		   UNION ALL
		   SELECT DISTINCT
		   --o.TYPE,
				PSA.MATERIAL_TYPE + ' ' + PSA.ALLOY + ' ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.THICKNESS_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.WIDTH_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.LENGTH_VAL)) AS CP_DESCRIPTION2, 
				LEFT(SOB.SPECS, ISNULL(CHARINDEX(CHAR(13), SOB.SPECS, -1), 1)) AS                                                                                                                                                                                           ROUTETO, 
				TP.ID AS                                                                                                                                                                                                                                                    PO, 
				SOB.SPECS, 
				C.CUSTOMER_ID, 
				C.CUST_ORDER_ID, 
				O.BASE_ID, 
				O.LOT_ID, 
				O.SPLIT_ID, 
				O.SUB_ID, 
				O.PART_ID, 
				P.BUYER_USER_ID, 
				P.DESCRIPTION, 
				O.SEQUENCE_NO, 
				O.RESOURCE_ID, 
				O.SERVICE_ID, 
				O.OPERATION_TYPE, 
				--a.WORKORDER_TYPE, 
				--    a.WORKORDER_BASE_ID, 
				--    a.WORKORDER_LOT_ID,
				--    a.WORKORDER_SPLIT_ID,
				--    a.WORKORDER_SUB_ID,
				A.DESCRIPTION AS                                                                                                                                                                                                                                            EXPEDITE, 
				A.MAXSEQ, 
				A.QTY
		   FROM SKILLS_WO_OPS_OPEN O
			   INNER JOIN PART P
				 ON P.ID = O.PART_ID
				    --AND P.PLANNER_USER_ID IN ('MRP', 'PLAN', 'TTO','NEW', '609M', '609MEO', '605M', '619M', 'KANBAN') 
				    AND EXISTS
		   (
			  SELECT 1
			  FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_REPORTSETTINGS EX
			  WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
				   AND REPORT_NAME = N'Purchase Orders Outside Services needed'
		   )
				    AND NOT(O.PART_ID LIKE 'ASB-%'
						  OR O.PART_ID LIKE 'F-%'
						  OR O.PART_ID LIKE 'PRO%'
						  OR O.PART_ID LIKE 'PROCESS%'
						  --OR o.PART_ID LIKE 'REWORK%'
						  OR O.PART_ID LIKE 'UP%'
						  OR O.PART_ID LIKE '2024-3%'
						  OR O.PART_ID LIKE 'CMC-NRE%')
			   INNER JOIN TMPLT A
				 ON O.TYPE = A.WORKORDER_TYPE
				    AND O.BASE_ID = A.WORKORDER_BASE_ID
				    AND O.LOT_ID = A.WORKORDER_LOT_ID
				    AND O.SPLIT_ID = A.WORKORDER_SPLIT_ID
				    AND O.SUB_ID = A.WORKORDER_SUB_ID
				    AND O.SEQUENCE_NO = A.NEXTSEQ
			   LEFT OUTER JOIN TMPCUST C
				 ON O.BASE_ID = C.BASE_ID
			   -- and o.PART_ID = c.part_id
			   LEFT OUTER JOIN SKILL_OPERATION_BINARY AS SOB
				 ON O.TYPE = SOB.WORKORDER_TYPE
				    AND O.BASE_ID = SOB.WORKORDER_BASE_ID
				    AND O.LOT_ID = SOB.WORKORDER_LOT_ID
				    AND O.SPLIT_ID = SOB.WORKORDER_SPLIT_ID
				    AND O.SUB_ID = SOB.WORKORDER_SUB_ID
				    AND O.SEQUENCE_NO = SOB.SEQUENCE_NO
			   LEFT OUTER JOIN TMPPO TP
				 ON O.TYPE = TP.TYPE
				    AND O.BASE_ID = TP.BASE_ID
				    AND O.LOT_ID = TP.LOT_ID
				    AND O.SPLIT_ID = TP.SPLIT_ID
				    AND O.SUB_ID = TP.SUB_ID
				    AND O.SEQUENCE_NO = TP.SEQUENCE_NO
			   LEFT OUTER JOIN TMPSUMPO TSUMP
				 ON O.TYPE = TSUMP.TYPE
				    AND O.BASE_ID = TSUMP.BASE_ID
				    AND O.LOT_ID = TSUMP.LOT_ID
				    AND O.SPLIT_ID = TSUMP.SPLIT_ID
				    AND O.SUB_ID = TSUMP.SUB_ID
				    AND O.SEQUENCE_NO = TSUMP.SEQUENCE_NO
			   LEFT OUTER JOIN SKILLS_PART_UDF AS PSA
				 ON PSA.PART_ID = O.PART_ID
		   WHERE O.RESOURCE_ID IN
		   (
			  SELECT RESOURCE
			  FROM @ReportSettings
			  WHERE [SERVICE RESOURCE] IS NOT NULL
		   )
			    --= 'contractor'
			    AND (O.OPERATION_TYPE <> 'VECTOR'
				    OR O.OPERATION_TYPE IS NULL)
			    AND (O.SERVICE_ID <> 'VECTOR'
				    OR O.SERVICE_ID IS NULL)
			    AND -- (
			    A.DESCRIPTION = 'Split'
			    --or a.description is null)
			    AND TSUMP.QTYSTATUS = 'STILL OPEN'
		   ORDER BY LEFT(SOB.SPECS, ISNULL(CHARINDEX(CHAR(13), SOB.SPECS, -1), 1)), 
				  PSA.MATERIAL_TYPE + ' ' + PSA.ALLOY + ' ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.THICKNESS_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.WIDTH_VAL)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5, 2), PSA.LENGTH_VAL)), 
				  BASE_ID, 
				  O.SEQUENCE_NO;

	   --OPTION (OPTIMIZE FOR (@start_date='2018-5-01 00:00:00.000', @end_date = '2018-6-01 00:00:00.00'))

    END;
GO


