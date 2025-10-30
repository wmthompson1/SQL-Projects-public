use live
go

select * from part where id in ('146Z6831-921', '146Z6832-921', '146Z6833-921')


use test
go

select * from part where id in ('146Z6831-921', '146Z6832-921', '146Z6833-921')


--DROP TABLE #TITANIUM
--DROP TABLE #ALL_TITANIUM 
--DROP TABLE #ALL_TITANIUM_MFG_PARTS
--DROP TABLE #ALL_TITANIUM_MFG_PARTS_DISTINCT
--DROP TABLE LIVESupplemental.dbo.ALL_TITANIUM_MFG_PARTS

/*
SELECT P.ID AS part_id
	, P.DESCRIPTION
	, P.STOCK_UM
	, P.PURCHASED
	, P.FABRICATED
	, P.PLANNING_LEADTIME
	, P.QTY_ON_HAND
	, P.MINIMUM_ORDER_QTY
	, P.MAXIMUM_ORDER_QTY
	, P.MULTIPLE_ORDER_QTY
	, P.COMMODITY_CODE
	, P.PLANNER_USER_ID
	, P.BUYER_USER_ID
	, P.DAYS_OF_SUPPLY
	, P.PREF_VENDOR_ID
	, ps.UNIT_MATERIAL_COST
	, ps.UNIT_SERVICE_COST
	, ps.UNIT_LABOR_COST
	, PS.UNIT_BURDEN_COST
INTO #TITANIUM
	FROM LIVE.dbo.PART AS P 
		INNER JOIN LIVE.dbo.PART_SITE AS ps 
			ON P.ID = ps.PART_ID 
		INNER JOIN LIVE.dbo.USER_DEF_FIELDS AS UDF 
			ON P.ID = UDF.DOCUMENT_ID
  WHERE UDF.ID = 'UDF-0000035' 
	AND UDF.STRING_VAL LIKE '%titanium%'--AND --UDF.STRING_VAL LIKE '%Titanium%'
	AND P.PLANNER_USER_ID IN ('MRP','NEW','PLAN')
	AND P.STATUS IS NULL
--192

SELECT part_id
INTO #ALL_TITANIUM 
FROM #TITANIUM 
--8205

UNION ALL
 --requirements1.rpt
 --Parent requirements Masters only - parent = titanium
 SELECT --R.WORKORDER_TYPE
	 --R.WORKORDER_BASE_ID
	R.PART_ID
	 --, P.STATUS
	 --, P_1.STATUS
 FROM #TITANIUM T
	INNER JOIN LIVE.dbo.REQUIREMENT R
		ON T.part_id = R.WORKORDER_BASE_ID
	INNER JOIN LIVE.dbo.PART P 
		ON R.PART_ID=P.ID
	INNER JOIN LIVE.dbo.PART P_1 
		ON R.WORKORDER_BASE_ID = P_1.ID
 WHERE  P.STATUS IS  NULL  
	--AND R.WORKORDER_BASE_ID = T.part_id
	AND P_1.STATUS IS  NULL 
 --ORDER BY R.PART_ID
 --361 

 UNION ALL
 --requirements2.rpt
 SELECT --R.WORKORDER_TYPE
	 --R.PART_ID
	R.WORKORDER_BASE_ID
	 --, R.PART_ID
	 --, P.STATUS
 FROM #TITANIUM T
	INNER JOIN LIVE.dbo.REQUIREMENT R 
		ON T.part_id = R.PART_ID
	INNER JOIN LIVE.dbo.PART P 
		ON R.WORKORDER_BASE_ID=P.ID
 WHERE  R.WORKORDER_TYPE='M' 
	AND P.STATUS IS  NULL 
 --ORDER BY R.WORKORDER_BASE_ID
 --177

UNION ALL
--requirements4.rpt
--work order part is titanium; child is anything; includes masters and workorders
 SELECT --'' WORKORDER_TYPE
	PART_ID
	 --, BASE_ID
	 --, WO_PART_ID
	 --, STATUS
  FROM (
		 SELECT R.OPERATION_SEQ_NO
		 , R.PIECE_NO
		 , R.PART_ID
		 , R.STATUS
		 , R.CALC_QTY
		 , R.ISSUED_QTY
		 , WO.BASE_ID
		 , WO.PART_ID WO_PART_ID
		 , R.FIXED_QTY
		 , P.PURCHASED
		 , P.STOCK_UM
		 , P.QTY_ON_HAND
		 , P.PLANNING_LEADTIME
		 , P.DESCRIPTION
		 , P.SAFETY_STOCK_QTY
		 , P.STATUS P_STATUS
		 , P_1.STATUS P_1_STATUS
		   FROM #TITANIUM T
			INNER JOIN LIVE.dbo.WORK_ORDER WO
				ON T.part_id = WO.PART_ID
			INNER JOIN LIVE.dbo.REQUIREMENT R 
				ON WO.TYPE=R.WORKORDER_TYPE
					AND WO.BASE_ID=R.WORKORDER_BASE_ID
					AND WO.LOT_ID=R.WORKORDER_LOT_ID
					AND WO.SPLIT_ID=R.WORKORDER_SPLIT_ID 
					AND WO.SUB_ID=R.WORKORDER_SUB_ID
			INNER JOIN LIVE.dbo.PART P_1 
				ON WO.PART_ID=P_1.ID
			INNER JOIN LIVE.dbo.PART P 
				ON R.PART_ID=P.ID
		 WHERE P.STATUS IS  NULL  
			AND P_1.STATUS IS  NULL 
		) A
 --ORDER BY PART_ID
 --3492

UNION ALL
 --requirements5.rpt 
 --child is titanium and parent is anything
 SELECT --'' WORKORDER_TYPE
	PART_ID
	 --, BASE_ID
	 --, WO_PART_ID
	 --, STATUS
  FROM (
		 SELECT R.OPERATION_SEQ_NO
		 , R.PIECE_NO
		 , R.PART_ID
		 , R.STATUS
		 , R.CALC_QTY
		 , R.ISSUED_QTY
		 , WO.BASE_ID
		 , WO.PART_ID WO_PART_ID
		 , R.FIXED_QTY
		 , P.PURCHASED
		 , P.STOCK_UM
		 , P.QTY_ON_HAND
		 , P.PLANNING_LEADTIME
		 , P.DESCRIPTION
		 , P.SAFETY_STOCK_QTY
		 , P.STATUS P_STATUS
		FROM #TITANIUM T
			INNER JOIN LIVE.dbo.WORK_ORDER WO
				ON T.part_id = WO.PART_ID
			INNER JOIN LIVE.dbo.REQUIREMENT R 
				ON WO.TYPE=R.WORKORDER_TYPE 
					AND WO.BASE_ID=R.WORKORDER_BASE_ID 
					AND WO.LOT_ID=R.WORKORDER_LOT_ID 
					AND WO.SPLIT_ID=R.WORKORDER_SPLIT_ID 
					AND WO.SUB_ID=R.WORKORDER_SUB_ID
			INNER JOIN LIVE.dbo.PART P 
				ON R.PART_ID=P.ID
		 WHERE P.STATUS IS  NULL 
		) A
 --ORDER BY PART_ID
  --3492

UNION ALL
--planned1.rpt
SELECT --PMR.PARENT_PART_ID
	PMR.REQUIRED_PART_ID
	 --, P.STATUS
 FROM #TITANIUM T
	INNER JOIN LIVE.dbo.PLANNED_MATL_REQ PMR 
		ON T.part_id = PMR.PARENT_PART_ID
	INNER JOIN LIVE.dbo.PART P 
		ON PMR.REQUIRED_PART_ID=P.ID
 WHERE  P.STATUS IS  NULL 
 --ORDER BY PMR.REQUIRED_PART_ID
 --359

UNION ALL
 --planned2.rpt
 SELECT PMR.PARENT_PART_ID
	 --, PMR.REQUIRED_PART_ID
	 --, P.STATUS
 FROM #TITANIUM T
	INNER JOIN LIVE.dbo.PLANNED_MATL_REQ PMR 
		ON T.part_id = PMR.REQUIRED_PART_ID
	INNER JOIN LIVE.dbo.PART P 
		ON PMR.PARENT_PART_ID=P.ID
 WHERE P.STATUS IS  NULL 
 --ORDER BY PMR.PARENT_PART_ID
 --132

 --BOM.rpt
 SELECT DISTINCT 
	   R.OPERATION_SEQ_NO
	 , R.PIECE_NO
	 , R.PART_ID
	 , R.CALC_QTY
	 , R.WORKORDER_BASE_ID
	 , R.WORKORDER_TYPE
	 , P.STATUS
	 , P_1.STATUS P_1_STATUS
 INTO #ALL_TITANIUM_MFG_PARTS
 FROM #ALL_TITANIUM T
	INNER JOIN LIVE.dbo.REQUIREMENT R 
		ON T.part_id = R.WORKORDER_BASE_ID
	INNER JOIN LIVE.dbo.PART P 
		ON R.WORKORDER_BASE_ID=P.ID
			 AND P.STATUS IS  NULL 
			 AND WORKORDER_BASE_ID NOT LIKE '%REWORK%'
			 AND WORKORDER_BASE_ID NOT LIKE '%TOOLING%'
	INNER JOIN LIVE.dbo.PART P_1 
		ON R.PART_ID=P_1.ID
			AND P_1.STATUS IS  NULL 
 WHERE T.part_id NOT LIKE '%REWORK%'
	AND T.part_id NOT LIKE '%TOOLING%'
--WHERE R.PART_ID IN ('1018CSS-090','70757E-81205','BACB30NX5HK4','BACN11G3A1CM','BACR15CE3M3','MS20427M3-3')
UNION ALL
 SELECT DISTINCT 
	   '' OPERATION_SEQ_NO
	 , '' PIECE_NO
	 , T.PART_ID
	 , 0  CALC_QTY
	 , '' WORKORDER_BASE_ID
	 , '' WORKORDER_TYPE
	 , '' STATUS
	 , '' P_1_STATUS
 FROM #ALL_TITANIUM T

 WHERE T.part_id NOT LIKE '%REWORK%'
	AND T.part_id NOT LIKE '%TOOLING%'
ORDER BY PART_ID
--459

SELECT DISTINCT part_id 
INTO #ALL_TITANIUM_MFG_PARTS_DISTINCT
FROM #ALL_TITANIUM_MFG_PARTS


--select * from #ALL_TITANIUM_MFG_PARTS where part_id in ('146Z6831-921', '146Z6832-921', '146Z6833-921')


SELECT DISTINCT PartNumber
	, Description
	, Revision -- null or blank
	, location
	, UnitOfMeasure
	, PartType
	, FixedLeadTime 
	, SUM(AverageDailyUsage) 	  AS AverageDailyUsage
	, OrderCycle
	, OrderMinimumQty
	, SUM(OrderMaximumQty) OrderMaximumQty --VW.MAXIMUM_ORDER_QTY    
 	, SUM(OrderMultipleQty) OrderMultipleQty
    , PlannerCode    
    , MaterialType
    , RawMaterialsCost
    , Vendor 
    , VendorIdentifier
    , InventoryMethod
    , InventoryPlanning
    , OutSourceCost   
    , PlannedAdjustmentFactor
    , UserDefined1
    , UserDefined2 
    , UserDefined3 
    , UserDefined4 
    , UserDefined5 
    , UserDefined6 
    , UserDefined7 
    , UserDefined8 
    , timestamp
FROM (
SELECT DISTINCT T.part_id	AS PartNumber
	, P.DESCRIPTION			AS Description
	, ''                    AS Revision -- null or blank
	, 'Aub South'           AS location
	, P.STOCK_UM			AS UnitOfMeasure
	, CASE WHEN P.PURCHASED = 'Y' 
		   THEN 1  --'b' 
           ELSE 2  --'m'  
		END					AS PartType
	, P.PLANNING_LEADTIME    AS FixedLeadTime --PLANNING_LEADTIME
	, ADU2.ADU 	  AS AverageDailyUsage
	, CASE WHEN P.PURCHASED = 'Y' 
              THEN 7 
              ELSE 30
         END                   AS OrderCycle
	, CAST(P.MINIMUM_ORDER_QTY AS int)		AS OrderMinimumQty --VW.MINIMUM_ORDER_QTY
    , CAST(P.MAXIMUM_ORDER_QTY AS int)		AS OrderMaximumQty --VW.MAXIMUM_ORDER_QTY    
	, CASE WHEN (CAST(P.MULTIPLE_ORDER_QTY AS int) / CAST(P.MINIMUM_ORDER_QTY AS int)) <> (CAST(CAST(P.MULTIPLE_ORDER_QTY AS decimal (10,2)) / CAST(P.MINIMUM_ORDER_QTY AS decimal (10,2))AS decimal (10,2)))-- <0
		THEN 0
		WHEN CAST(P.MULTIPLE_ORDER_QTY AS int) >  CAST(P.MINIMUM_ORDER_QTY AS int)
		THEN  CAST(P.MINIMUM_ORDER_QTY AS int)
		ELSE CAST(P.MULTIPLE_ORDER_QTY AS int)  --CAST(P.MULTIPLE_ORDER_QTY AS int) / CAST(P.MINIMUM_ORDER_QTY AS int)
		END AS OrderMultipleQty
    , P.PLANNER_USER_ID		AS PlannerCode    
    , CASE WHEN P.COMMODITY_CODE = 'Raw Material' 
          THEN 'RM' 
          WHEN P.COMMODITY_CODE = 'Standards' 
          THEN 'Comp' 
          WHEN P.COMMODITY_CODE = 'Adhesives' 
          THEN 'Adh'
		--ELSE P.COMMODITY_CODE 
       END                  AS MaterialType
    , ps.UNIT_MATERIAL_COST AS RawMaterialsCost
    , V.NAME				AS Vendor 
    , P.PREF_VENDOR_ID      AS VendorIdentifier
    , ''                    AS InventoryMethod
    , ''                    AS InventoryPlanning
    , ''                    AS OutSourceCost   
    , ''                    AS PlannedAdjustmentFactor
    , ''                    AS UserDefined1
    , ''                    AS UserDefined2 
    , ''                    AS UserDefined3 
    , ''                    AS UserDefined4 
    , ''                    AS UserDefined5 
    , ''                    AS UserDefined6 
    , ''                    AS UserDefined7 
    , ''                    AS UserDefined8 
    , ''                    AS timestamp
	FROM #ALL_TITANIUM_MFG_PARTS_DISTINCT T 
		INNER JOIN LIVE.dbo.PART AS P 
			ON T.part_id = P.ID
				AND T.part_id NOT LIKE '%REWORK%'
				AND T.part_id NOT LIKE '%TOOLING%'
		INNER JOIN LIVE.dbo.PART_SITE AS ps 
			ON P.ID = ps.PART_ID 
		LEFT OUTER JOIN LIVE.dbo.USER_DEF_FIELDS AS UDF
			ON P.ID = UDF.DOCUMENT_ID
				AND UDF.ID = 'UDF-0000035' 
		LEFT OUTER JOIN LIVE.dbo.VENDOR V
			ON P.PREF_VENDOR_ID = V.ID
		LEFT OUTER JOIN (SELECT DISTINCT TOP (100) 
						  PERCENT PART_ID
						, QTYISSUED
						, ADU
						, TopOfYellow
						, TopOfGreen
						, ROUND(TopOfGreen + (TopOfGreen * .3), 0) AS TopOfRed
					FROM (SELECT DISTINCT IT.PART_ID
								, SUM(IT.QTY) AS QTYISSUED
								, ROUND(SUM(CASE WHEN IT.TYPE = 'I' 
												THEN (- IT.QTY) 
												ELSE IT.QTY 
												END) / 122, 2) AS ADU
								, ROUND(ROUND(SUM(CASE WHEN IT.TYPE = 'I' 
														THEN (- IT.QTY) 
														ELSE IT.QTY 
													END) / 122, 2) * P.PLANNING_LEADTIME, 0) AS TopOfYellow
								, CASE WHEN P.PLANNING_LEADTIME < 11 
										THEN ROUND(ROUND(ROUND(SUM(CASE WHEN IT.TYPE = 'I' 
																		THEN (- IT.QTY) 
																		ELSE IT.QTY 
																		END) / 122, 2) * P.planning_leadtime, 0) * 0.7, 0) 
																		WHEN P.PLANNING_LEADTIME BETWEEN 11 AND 60 
																		THEN ROUND(ROUND(ROUND(SUM(CASE WHEN IT.TYPE = 'I' 
																										THEN (- IT.QTY) 
																										ELSE IT.QTY 
																										END) / 122, 2) * P.planning_leadtime, 0) * 0.5, 0) 
																										WHEN P.PLANNING_LEADTIME > 60 
																										THEN ROUND(ROUND(ROUND(SUM(CASE WHEN IT.TYPE = 'I' 
																																		THEN (- IT.QTY) 
																																		ELSE IT.QTY 
																																		END) / 122, 2) * P.planning_leadtime, 0) * 0.3, 0) 
																										END AS TopOfGreen
								FROM  #ALL_TITANIUM_MFG_PARTS_DISTINCT T
									INNER JOIN LIVE.dbo.PART_SITE PS 
										ON T.PART_ID = PS.PART_ID 
									INNER JOIN LIVE.dbo.PART P
										ON PS.PART_ID=P.ID
											AND P.STATUS IS  NULL  
											AND P.ID NOT LIKE '%REWORK%'
											AND P.ID NOT LIKE '%TOOLING%'
									INNER JOIN LIVE.dbo.INVENTORY_TRANS IT
										ON T.PART_ID = IT.PART_ID
										--ON P.ID = IT.PART_ID
											AND IT.CLASS='I' 
											AND CAST(IT.TRANSACTION_DATE AS date) >= GETDATE()-122
									LEFT OUTER JOIN LIVE.dbo.VENDOR V 
										ON P.PREF_VENDOR_ID=V.ID
								GROUP BY IT.PART_ID, IT.WAREHOUSE_ID, P.PLANNING_LEADTIME 
					) AS ADU
					) ADU2 
						ON T.part_id = ADU2.PART_ID
							AND T.part_id NOT LIKE '%REWORK%'
							AND T.part_id NOT LIKE '%TOOLING%'
	WHERE T.part_id NOT LIKE '%REWORK%'
		AND T.part_id NOT LIKE '%TOOLING%'
	GROUP BY T.part_id			--AS PartNumber
	, P.DESCRIPTION			--AS Description
	, P.STOCK_UM			--AS UnitOfMeasure
	, CASE WHEN P.PURCHASED = 'Y' 
		   THEN 1  --'b' 
           ELSE 2  --'m'  
		END					--AS PartType
	, P.PLANNING_LEADTIME    --AS FixedLeadTime --PLANNING_LEADTIME
	, ADU2.ADU
	, CASE WHEN P.PURCHASED = 'Y' 
              THEN 7 
              ELSE 30
         END                   --AS OrderCycle
	, CAST(P.MINIMUM_ORDER_QTY AS int)		--AS OrderMinimumQty --VW.MINIMUM_ORDER_QTY
    , CAST(P.MAXIMUM_ORDER_QTY AS int)		--AS OrderMaximumQty --VW.MAXIMUM_ORDER_QTY    
	, CASE WHEN (CAST(P.MULTIPLE_ORDER_QTY AS int) / CAST(P.MINIMUM_ORDER_QTY AS int)) <> (CAST(CAST(P.MULTIPLE_ORDER_QTY AS decimal (10,2)) / CAST(P.MINIMUM_ORDER_QTY AS decimal (10,2))AS decimal (10,2)))-- <0
		THEN 0
		WHEN CAST(P.MULTIPLE_ORDER_QTY AS int) >  CAST(P.MINIMUM_ORDER_QTY AS int)
		THEN  CAST(P.MINIMUM_ORDER_QTY AS int)
		ELSE CAST(P.MULTIPLE_ORDER_QTY AS int) 
		END --AS OrderMultipleQty
    , P.PLANNER_USER_ID		--AS PlannerCode    
    , CASE WHEN P.COMMODITY_CODE = 'Raw Material' 
          THEN 'RM' 
          WHEN P.COMMODITY_CODE = 'Standards' 
          THEN 'Comp' 
          WHEN P.COMMODITY_CODE = 'Adhesives' 
          THEN 'Adh'
		--ELSE P.COMMODITY_CODE 
       END                  --AS MaterialType
    , ps.UNIT_MATERIAL_COST --AS RawMaterialsCost
    , V.NAME				--AS Vendor 
    , P.PREF_VENDOR_ID      --AS VendorIdentifier

) Z
WHERE PartNumber in ('146Z6831-921', '146Z6832-921', '146Z6833-921')
GROUP BY PartNumber
	, Description
	, Revision -- null or blank
	, location
	, UnitOfMeasure
	, PartType
	, FixedLeadTime --PLANNING_LEADTIME
	, OrderCycle
	, OrderMinimumQty
    , PlannerCode    
    , MaterialType
    , RawMaterialsCost
    , Vendor 
    , VendorIdentifier
    , InventoryMethod
    , InventoryPlanning
    , OutSourceCost   
    , PlannedAdjustmentFactor
    , UserDefined1
    , UserDefined2 
    , UserDefined3 
    , UserDefined4 
    , UserDefined5 
    , UserDefined6 
    , UserDefined7 
    , UserDefined8 
    , timestamp
ORDER BY PartNumber
*/

SELECT DISTINCT 
	PartNumber
	, Description
	, Revision -- null or blank
	, location
	, UnitOfMeasure
	, PartType
	, FixedLeadTime --PLANNING_LEADTIME
	, SUM(AverageDailyUsage) 	  AS AverageDailyUsage
	, OrderCycle
	, OrderMinimumQty
	, SUM(OrderMaximumQty) OrderMaximumQty --VW.MAXIMUM_ORDER_QTY    
	, SUM(OrderMultipleQty) OrderMultipleQty
	, PlannerCode    
	, MaterialType
	, RawMaterialsCost
	, Vendor 
	, VendorIdentifier
	, InventoryMethod
	, InventoryPlanning
	, OutSourceCost   
	, PlannedAdjustmentFactor
	, UserDefined1
	, UserDefined2 
	, UserDefined3 
	, UserDefined4 
	, UserDefined5 
	, UserDefined6 
	, UserDefined7 
	, UserDefined8 
	, timestamp
FROM 
	(
	SELECT DISTINCT 
		T.part_id AS PartNumber
		, P.DESCRIPTION AS Description
		, ''  AS Revision -- null or blank
		, 'Aub South' AS location
		, P.STOCK_UM AS UnitOfMeasure
		, CASE 
			WHEN P.PURCHASED = 'Y'  THEN 1  --'b' 
			ELSE 2  --'m'  
		END AS PartType
		, P.PLANNING_LEADTIME  AS FixedLeadTime --PLANNING_LEADTIME
		, ADU2.ADU AS AverageDailyUsage
		, CASE 
			WHEN P.PURCHASED = 'Y'   THEN 7 
			ELSE 30
		END AS OrderCycle
		, CAST(P.MINIMUM_ORDER_QTY AS int) AS OrderMinimumQty --VW.MINIMUM_ORDER_QTY
		, CAST(P.MAXIMUM_ORDER_QTY AS int) AS OrderMaximumQty --VW.MAXIMUM_ORDER_QTY    
		, CASE 
			WHEN (CAST(P.MULTIPLE_ORDER_QTY AS int) / CAST(P.MINIMUM_ORDER_QTY AS int)) 
			<> (CAST(CAST(P.MULTIPLE_ORDER_QTY AS decimal (10,2)) / CAST(P.MINIMUM_ORDER_QTY AS decimal (10,2))AS decimal (10,2)))-- <0
				THEN 0
			WHEN CAST(P.MULTIPLE_ORDER_QTY AS int) >  CAST(P.MINIMUM_ORDER_QTY AS int)
				THEN  CAST(P.MINIMUM_ORDER_QTY AS int)
			ELSE CAST(P.MULTIPLE_ORDER_QTY AS int)  
		END AS OrderMultipleQty
		, P.PLANNER_USER_ID AS PlannerCode    
		, CASE 
			WHEN P.COMMODITY_CODE = 'Raw Material' 	THEN 'RM' 
			WHEN P.COMMODITY_CODE = 'Standards' 	THEN 'Comp' 
			WHEN P.COMMODITY_CODE = 'Adhesives' 	THEN 'Adh'
			--ELSE P.COMMODITY_CODE 
		END  AS MaterialType
		, ps.UNIT_MATERIAL_COST AS RawMaterialsCost
		, V.NAME AS Vendor 
		, P.PREF_VENDOR_ID  AS VendorIdentifier
		, ''  AS InventoryMethod
		, ''  AS InventoryPlanning
		, ''  AS OutSourceCost   
		, ''  AS PlannedAdjustmentFactor
		, ''  AS UserDefined1
		, ''  AS UserDefined2 
		, ''  AS UserDefined3 
		, ''  AS UserDefined4 
		, ''  AS UserDefined5 
		, ''  AS UserDefined6 
		, ''  AS UserDefined7 
		, ''  AS UserDefined8 
		, ''  AS timestamp
	FROM #ALL_TITANIUM_MFG_PARTS_DISTINCT T 
	INNER JOIN LIVE.dbo.PART AS P 
		ON T.part_id = P.ID
		AND T.part_id NOT LIKE '%REWORK%'
		AND T.part_id NOT LIKE '%TOOLING%'
	INNER JOIN LIVE.dbo.PART_SITE AS ps 
		ON P.ID = ps.PART_ID 
	LEFT OUTER JOIN LIVE.dbo.USER_DEF_FIELDS AS UDF
		ON P.ID = UDF.DOCUMENT_ID
		AND UDF.ID = 'UDF-0000035' 
	LEFT OUTER JOIN LIVE.dbo.VENDOR V
		ON P.PREF_VENDOR_ID = V.ID
	LEFT OUTER JOIN 
		(
		SELECT DISTINCT TOP (100) 
			PERCENT PART_ID
			, QTYISSUED
			, ADU
			, TopOfYellow
			, TopOfGreen
			, ROUND(TopOfGreen + (TopOfGreen * .3), 0) AS TopOfRed
		FROM 
		(
		SELECT DISTINCT 
			IT.PART_ID
			, SUM(IT.QTY) AS QTYISSUED
			, ROUND(SUM(CASE 
					WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
					ELSE IT.QTY 
			END) / 122, 2) AS ADU
			, ROUND(ROUND(SUM(CASE 
					WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
					ELSE IT.QTY 
			END) / 122, 2) * P.PLANNING_LEADTIME, 0) AS TopOfYellow
			, CASE 
				WHEN P.PLANNING_LEADTIME < 11  THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.7, 0) 
				WHEN P.PLANNING_LEADTIME BETWEEN 11 AND 60 THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.5, 0) 
				WHEN P.PLANNING_LEADTIME > 60 THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.3, 0) 
			END AS TopOfGreen
		FROM  	#ALL_TITANIUM_MFG_PARTS_DISTINCT T 
		INNER JOIN 
			LIVE.dbo.PART_SITE PS 
				ON T.PART_ID = PS.PART_ID 
		INNER JOIN 
			LIVE.dbo.PART P
				ON PS.PART_ID=P.ID
				AND P.STATUS IS  NULL  
				AND P.ID NOT LIKE '%REWORK%'
				AND P.ID NOT LIKE '%TOOLING%'
		INNER JOIN 
			LIVE.dbo.INVENTORY_TRANS IT
				ON T.PART_ID = IT.PART_ID
				AND IT.CLASS='I' 
				AND CAST(IT.TRANSACTION_DATE AS date) >= GETDATE()-122  
		--LEFT OUTER JOIN 
		--	LIVE.dbo.VENDOR V 
		--		ON P.PREF_VENDOR_ID=V.ID
		WHERE p.ID in ('146Z6831-921', '146Z6832-921', '146Z6833-921')
		GROUP BY 
		IT.PART_ID, 
		IT.WAREHOUSE_ID, 
		P.PLANNING_LEADTIME 
		) AS ADU
	) ADU2 
		ON T.part_id = ADU2.PART_ID
		AND T.part_id NOT LIKE '%REWORK%'
		AND T.part_id NOT LIKE '%TOOLING%'
	WHERE 
		T.part_id NOT LIKE '%REWORK%'
		AND T.part_id NOT LIKE '%TOOLING%'
	GROUP BY 
		T.part_id		
		, P.DESCRIPTION	
		, P.STOCK_UM	
		, CASE 
			WHEN P.PURCHASED = 'Y' 
			THEN 1  --'b' 
			ELSE 2  --'m'  
		END				
		, P.PLANNING_LEADTIME
		, ADU2.ADU
		, CASE 
			WHEN P.PURCHASED = 'Y' THEN 7 
			ELSE 30
		END                   --AS OrderCycle
		, CAST(P.MINIMUM_ORDER_QTY AS int)		
		, CAST(P.MAXIMUM_ORDER_QTY AS int)		
		, CASE 
			WHEN (CAST(P.MULTIPLE_ORDER_QTY AS int) / CAST(P.MINIMUM_ORDER_QTY AS int)) 
				<> (CAST(CAST(P.MULTIPLE_ORDER_QTY AS decimal (10,2)) / CAST(P.MINIMUM_ORDER_QTY AS decimal (10,2))AS decimal (10,2)))-- <0
				THEN 0
			WHEN CAST(P.MULTIPLE_ORDER_QTY AS int) >  CAST(P.MINIMUM_ORDER_QTY AS int)
				THEN  CAST(P.MINIMUM_ORDER_QTY AS int)
			ELSE CAST(P.MULTIPLE_ORDER_QTY AS int)  
		END --AS OrderMultipleQty
		, P.PLANNER_USER_ID		--AS PlannerCode    
		, CASE 
			WHEN P.COMMODITY_CODE = 'Raw Material' THEN 'RM' 
			WHEN P.COMMODITY_CODE = 'Standards' THEN 'Comp' 
			WHEN P.COMMODITY_CODE = 'Adhesives' THEN 'Adh'
			--ELSE P.COMMODITY_CODE 
		END                  --AS MaterialType
		, ps.UNIT_MATERIAL_COST --AS RawMaterialsCost
		, V.NAME				--AS Vendor 
		, P.PREF_VENDOR_ID      --AS VendorIdentifier
) Z
WHERE PartNumber in ('146Z6831-921', '146Z6832-921', '146Z6833-921')
GROUP BY 
	PartNumber
	, Description
	, Revision -- null or blank
	, location
	, UnitOfMeasure
	, PartType
	, FixedLeadTime --PLANNING_LEADTIME
	, OrderCycle
	, OrderMinimumQty
	, PlannerCode    
	, MaterialType
	, RawMaterialsCost
	, Vendor 
	, VendorIdentifier
	, InventoryMethod
	, InventoryPlanning
	, OutSourceCost   
	, PlannedAdjustmentFactor
	, UserDefined1
	, UserDefined2 
	, UserDefined3 
	, UserDefined4 
	, UserDefined5 
	, UserDefined6 
	, UserDefined7 
	, UserDefined8 
	, timestamp
ORDER BY 
	PartNumber


--select * from part where ID in ('146Z6831-921', '146Z6832-921', '146Z6833-921')
--select * from part_site where Part_ID in ('146Z6831-921', '146Z6832-921', '146Z6833-921')


		SELECT DISTINCT 
			IT.PART_ID
			, SUM(IT.QTY) AS QTYISSUED
			, ROUND(SUM(CASE 
					WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
					ELSE IT.QTY 
			END) / 122, 2) AS ADU
			, ROUND(ROUND(SUM(CASE 
					WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
					ELSE IT.QTY 
			END) / 122, 2) * P.PLANNING_LEADTIME, 0) AS TopOfYellow
			, CASE 
				WHEN P.PLANNING_LEADTIME < 11  THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.7, 0) 
				WHEN P.PLANNING_LEADTIME BETWEEN 11 AND 60 THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.5, 0) 
				WHEN P.PLANNING_LEADTIME > 60 THEN ROUND(ROUND(ROUND(SUM(
					CASE 
						WHEN IT.TYPE = 'I' THEN (- IT.QTY) 
						ELSE IT.QTY 
					END) / 122, 2) * P.planning_leadtime, 0) * 0.3, 0) 
			END AS TopOfGreen
		FROM  	#ALL_TITANIUM_MFG_PARTS_DISTINCT T 
		INNER JOIN 
			LIVE.dbo.PART_SITE PS 
				ON T.PART_ID = PS.PART_ID 
		INNER JOIN 
			LIVE.dbo.PART P
				ON PS.PART_ID=P.ID
				AND P.STATUS IS  NULL  
				AND P.ID NOT LIKE '%REWORK%'
				AND P.ID NOT LIKE '%TOOLING%'
		INNER JOIN 
			LIVE.dbo.INVENTORY_TRANS IT
				ON T.PART_ID = IT.PART_ID
				AND IT.CLASS='I' 
				AND CAST(IT.TRANSACTION_DATE AS date) >= GETDATE()-122  
		--LEFT OUTER JOIN 
		--	LIVE.dbo.VENDOR V 
		--		ON P.PREF_VENDOR_ID=V.ID
		WHERE p.ID in ('146Z6831-921', '146Z6832-921', '146Z6833-921')
		GROUP BY 
		IT.PART_ID, 
		IT.WAREHOUSE_ID, 
		P.PLANNING_LEADTIME 

SELECT 
	p.id, 
	p.planning_leadtime,
	it.part_id,
	IT.WAREHOUSE_ID,
	it.qty
FROM	PART p
INNER JOIN 
	LIVE.dbo.INVENTORY_TRANS IT 
		ON IT.PART_ID = P.ID
WHERE 
	PART_ID in ('146Z6831-921', '146Z6832-921', '146Z6833-921') 
	AND IT.CLASS='I' 
	AND CAST(IT.TRANSACTION_DATE AS date) >= GETDATE()-122  
order by
	p.id
