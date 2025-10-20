SELECT --DISTINCT
       GETDATE() as thisdate, 
       W.STATUS , 
       W.TYPE AS     WORKORDER_TYPE , 
       W.BASE_ID AS  WORKORDER_BASE_ID , 
       W.LOT_ID AS   WORKORDER_LOT_ID , 
       W.SPLIT_ID AS WORKORDER_SPLIT_ID , 
       W.SUB_ID AS   WORKORDER_SUB_ID , 
       W.BASE_ID +
             CASE WHEN W.SUB_ID = '0'
                 THEN CASE WHEN W.LOT_ID = '0'
                           THEN '' 
                              + CASE WHEN W.SPLIT_ID = '0'
                                     THEN ''
                                     ELSE '.' + W.SPLIT_ID
                                 END
                           ELSE '/' + W.LOT_ID 
                              + CASE WHEN W.SPLIT_ID = '0'
                                     THEN ''
                                     ELSE '.' + W.SPLIT_ID
                                 END 
                              + '/' + W.SUB_ID
                           END
                 ELSE '-' + W.SUB_ID 
                    + CASE WHEN W.LOT_ID = '0'
                           THEN ''
                           ELSE '/' + W.LOT_ID 
                              + CASE WHEN W.SPLIT_ID = '0'
                                     THEN ''
                                     ELSE '.' + W.SPLIT_ID
                                 END
                           END
             END 
       AS WONUM_ID,
       convert(date,w.DESIRED_WANT_DATE) as wantdate,
       w.wo_qty as DESIRED_QTY, 
       W.PART_ID , 
       P.DESCRIPTION, 
       sa.material_type,
       sa.alloy ,
       w.firstOP as SEQUENCE_NO,
       w.FirstRES as RESOURCE_ID,
       DSL.DEMAND_BASE_ID, 
       DSL.DEMAND_SEQ_NO
  FROM [dbo].[SKILLS_WO_OPS_first_last_loc] w
 INNER JOIN PART P
    ON P.ID = W.PART_ID
  LEFT OUTER JOIN LIVE.DBO.DEMAND_SUPPLY_LINK DSL
    ON  W.BASE_ID = DSL.SUPPLY_BASE_ID
   AND W.LOT_ID = DSL.SUPPLY_LOT_ID
   AND W.SPLIT_ID = DSL.SUPPLY_SPLIT_ID
   AND W.SUB_ID = DSL.SUPPLY_SUB_ID
  LEFT OUTER JOIN SKILLS_WO_SURFACE_AREA AS SA
    ON W.BASE_ID                 = SA.BASE_ID
   AND W.LOT_ID                  = SA.LOT_ID
   AND W.SPLIT_ID                = SA.SPLIT_ID
 WHERE DSL.DEMAND_BASE_ID = @ORDER_ID--'001336317'
