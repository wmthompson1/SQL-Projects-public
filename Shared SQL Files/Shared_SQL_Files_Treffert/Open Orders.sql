use live
go


select distinct

		       gt.BASE_ID, 
		       gt.LOT_ID, 
		       gt.SPLIT_ID, 
		       gt.SUB_ID, 
		       gt.STATUS,
       CASE WHEN current_location IS NULL and wo_at_res = 'contractor' THEN 'Contractor'
            WHEN current_location = 'A'   THEN 'Auburn'
            WHEN current_location = 'B'   THEN 'Ballard'
            WHEN WO_AT_RES like 'ANM-%'   THEN 'MFG-AubNorth'
            WHEN current_location = 'M'   THEN 'MFG-AubSouth'
            WHEN current_location = 'O'   THEN 'Outreach'
            ELSE 'No Operations'
        END as location,
       W.CREATE_DATE, 
       GT.BASE_ID AS JOB, 
       GT.CUST_ORDER_ID, 
       --GT.expedite,
       GT.ID AS CUST_ID, 
       GT.CUSTOMER_PO_REF,
       GT.SALESREP_ID,
       GT.PART_ID, 
	  gt.customer_part_id,
       ISNULL(DESCRIPTION,'MISCELLANIOUS') AS PART_DESC, 
       CAST(ORDER_QTY AS INT) AS ORDER_QTY, 
       DUE_DATE,
       gt.Expedite,
       GT.lastop,
       MIN_OP,
       GT.[Time and Date], 
       GT.operator,
       CURR_OP,
       case when WO_AT_RES is not null then wo_at_res 
            when operator is not null and REMAINING_OPS IS null
            then 'ready to ship'
            when WO_AT_RES is null and curr_op is null and MIN_OP IS null 
            then 'nothing to report'
            when WO_AT_RES is null and curr_op is null and MIN_OP IS NOT null 
            then 'at Review?'
            Else 'look into this' end as wo_at_res,
      -- ISNULL(WO_AT_RES,'Ready to Ship') AS WO_AT_RES,
     CASE when WO_AT_RES is null and curr_op is null and MIN_OP IS null 
            THEN 'No Operations'
            WHEN WO_AT_RES is null and curr_op is null
            THEN REMAINING_OPS2
            ELSE REMAINING_OPS END AS REMAINING_OPS, 
       GT.COnote, 
       GT.COnoteprev
 FROM (
	SELECT Q2.*, 
	(SELECT S.SKILLS_TYPE FROM 
	        OPERATION SO 
	  INNER JOIN SHOP_RESOURCE S
	        ON SO.RESOURCE_ID = S.ID
	  WHERE SO.WORKORDER_TYPE = Q2.TYPE 
	    AND SO.WORKORDER_BASE_ID = Q2.BASE_ID 
	    AND SO.WORKORDER_LOT_ID = Q2.LOT_ID 
	    AND SO.WORKORDER_SPLIT_ID = Q2.SPLIT_ID 
	    AND SO.WORKORDER_SUB_ID = Q2.SUB_ID 
	    and SO.SEQUENCE_NO = Q2.MIN_OP) AS FIRST_RES,
	(SELECT  S.SKILLS_TYPE FROM 
	        OPERATION SO 
	  INNER JOIN SHOP_RESOURCE S 
	     ON SO.RESOURCE_ID = S.ID
	  WHERE SO.WORKORDER_TYPE = Q2.TYPE
	    AND SO.WORKORDER_BASE_ID = Q2.BASE_ID 
	    AND SO.WORKORDER_LOT_ID = Q2.LOT_ID 
	    AND SO.WORKORDER_SPLIT_ID = Q2.SPLIT_ID 
	    AND SO.WORKORDER_SUB_ID = Q2.SUB_ID 
	    and SO.SEQUENCE_NO = Q2.CURR_OP) AS current_location,    
	(SELECT S.ID 
	   FROM OPERATION SO 
	  INNER JOIN SHOP_RESOURCE S 
	     ON SO.RESOURCE_ID = S.ID
	  WHERE SO.WORKORDER_TYPE = Q2.TYPE
	    AND SO.WORKORDER_BASE_ID = Q2.BASE_ID 
	    AND SO.WORKORDER_LOT_ID = Q2.LOT_ID 
	    AND SO.WORKORDER_SPLIT_ID = Q2.SPLIT_ID 
	    AND SO.WORKORDER_SUB_ID = Q2.SUB_ID 
	    and SO.SEQUENCE_NO = Q2.CURR_OP) AS WO_AT_RES 
	FROM (
		SELECT W.TYPE, 
		       W.BASE_ID, 
		       W.LOT_ID, 
		       W.SPLIT_ID, 
		       W.SUB_ID, 
		       W.STATUS,

		       CL.CUST_ORDER_ID, 
		       CL.LINE_NO, 
		       C.ID, 
		       co.CUSTOMER_PO_REF,
			  cl.customer_part_id,
		       CR.SALESREP_ID,
		       W.PART_ID, 
		       ISNULL(CL.ORDER_QTY,W.DESIRED_QTY) AS ORDER_QTY, 
		       P.DESCRIPTION, 
		       ISNULL(ISNULL(CL.DESIRED_SHIP_DATE,CO.DESIRED_SHIP_DATE),W.DESIRED_WANT_DATE) AS DUE_DATE,
		       --has expedite charges
                       (SELECT MAX(EXPEDITE) 
                          FROM LIVESupplemental.dbo.view_COL_expedite E
                         WHERE E.CUST_ORDER_ID = CL.CUST_ORDER_ID) AS EXPEDITE, 
		       case when convert(varchar,t.lastEMPop) IS null
		             then 'No Labor Tickets' else convert(varchar,t.lastEMPop) 
		             end as lastop,
		       t.TRANSACTION_DATE as [Time and Date],
		       t.lastEMPNAME as operator, 
			--FIRST OPERATION
			(SELECT MIN(SEQUENCE_NO) 
			   FROM OPERATION 
			  WHERE WORKORDER_TYPE = W.TYPE 
		  	    AND WORKORDER_BASE_ID = W.BASE_ID 
		  	    AND WORKORDER_LOT_ID = W.LOT_ID 
		  	    AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
		  	    AND WORKORDER_SUB_ID = W.SUB_ID) AS MIN_OP,
			--GRAB WHERE IT'S AT FROM EXISTING VIEW
			 (SELECT SEQUENCE_NO 
			    FROM LIVESupplemental.dbo.WO_CURRENTLY_AT 
			   WHERE WORKORDER_TYPE = W.TYPE 
			     AND WORKORDER_BASE_ID = W.BASE_ID
			     AND WORKORDER_LOT_ID = W.LOT_ID 
			     AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
			     AND WORKORDER_SUB_ID = W.SUB_ID) AS CURR_OP,
			 (SELECT REMAINING_OPS 
			    FROM LIVESupplemental.dbo.WO_CURRENTLY_AT 
			   WHERE WORKORDER_TYPE = W.TYPE 
			     AND WORKORDER_BASE_ID = W.BASE_ID 
			     AND WORKORDER_LOT_ID = W.LOT_ID 
			     AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
			     AND WORKORDER_SUB_ID = W.SUB_ID) AS REMAINING_OPS, 
			 (SELECT DISTINCT REMAINING_OPS
			    FROM LIVESupplemental.dbo.WO_CURRENTLY_AT_START
			   WHERE WORKORDER_TYPE = W.TYPE 
			     AND WORKORDER_BASE_ID = W.BASE_ID 
			     AND WORKORDER_LOT_ID = W.LOT_ID 
			     AND WORKORDER_SPLIT_ID = W.SPLIT_ID 
			     AND WORKORDER_SUB_ID = W.SUB_ID) AS REMAINING_OPS2,
		     (SELECT CONOTE 
		        FROM View_CO_notes n
               WHERE n.CUST_ORDER_ID = co.ID) as COnote,
             (SELECT CONOTEprev
		        FROM View_CO_notes_Prev n1
               WHERE n1.CUST_ORDER_ID = co.ID) as COnoteprev
		FROM WORK_ORDER W 
		LEFT OUTER JOIN PART P 
		  ON W.PART_ID = P.ID
		LEFT OUTER JOIN (DEMAND_SUPPLY_LINK DSL
		                 INNER JOIN CUST_ORDER_LINE CL 
		                    ON DSL.DEMAND_BASE_ID = CL.CUST_ORDER_ID 
		                   AND CL.LINE_NO = DSL.DEMAND_SEQ_NO
		                 INNER JOIN CUSTOMER_ORDER CO 
		                    ON CL.CUST_ORDER_ID = CO.ID 
		                 INNER JOIN CUSTOMER C
		                    ON CO.CUSTOMER_ID = C.ID)                
                     ON W.BASE_ID = DSL.SUPPLY_BASE_ID 
		            AND W.LOT_ID = DSL.SUPPLY_LOT_ID 
		            AND W.SPLIT_ID = DSL.SUPPLY_SPLIT_ID 
		            AND W.SUB_ID = DSL.SUPPLY_SUB_ID 
		            AND DSL.DEMAND_TYPE = 'CO' 
		            AND DSL.SUPPLY_TYPE = 'WO'

      LEFT OUTER JOIN LIVESupplemental.dbo.customer_reps CR 
        ON C.ID = CR.id	
      left outer join svw_last_ticket_info t
        on W.BASE_ID = t.lastWObaseid
       and W.LOT_ID = t.lastWOlotid    
       and W.SPLIT_ID = t.lastWOsplitid
       AND W.SUB_ID = t.lastWOsubid 
       AND W.TYPE = 'W' 
	 WHERE W.STATUS IN ('R','F', 'U') 
--	   AND W.SUB_ID = 0 
	   AND W.TYPE = 'W'
--	   AND CR.SHOWINLIST = 'Y'
	   )Q2 
)GT 
 LEFT OUTER JOIN WORK_ORDER W 
    ON GT.BASE_ID = W.BASE_ID 
   AND GT.LOT_ID = W.LOT_ID 
   AND GT.SPLIT_ID = W.SPLIT_ID
   AND GT.SUB_ID = W.SUB_ID
   AND W.TYPE = 'W' 
 WHERE ISNULL(GT.ID,'PROD') <> 'SKILLS Q.A.'
--and gt.base_ID = '1441595'