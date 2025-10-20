Select W.BASE_ID, W.LOT_ID, W.PART_ID,W.WONUM,W.DESIRED_QTY, W.CUSTOMER_ID, W.OPERATOR, W.REPT_DEPT, AVG (w.WAIT_DAYS) AS AVG_WAIT_DAYS

FROM [SQL-LAB-2].LIVESupplemental.dbo.WODS_output W WITH (NOLOCK)

LEFT JOIN wo_sch_priority p ON w.base_id = p.workorder_base_id 

 AND w.lot_id = p.workorder_lot_id 

 AND w.split_id = p.workorder_split_id AND p.workorder_sub_id = 0 

 AND p.workorder_type = 'w' AND p.schedule_id = 'STANDARD'

WHERE W.REPT_DEPT IN ( 'PENETRANT' )

GROUP BY W.BASE_ID, W.LOT_ID, W.PART_ID,W.WONUM,W.DESIRED_QTY, W.CUSTOMER_ID, W.OPERATOR, W.REPT_DEPT
