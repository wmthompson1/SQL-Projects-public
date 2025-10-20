SELECT 
       OP1.WORKORDER_TYPE,                          
       OP1.STATUS AS OPSTATUS,
       OP1.WORKORDER_BASE_ID,
       OP1.WORKORDER_LOT_ID,
       OP1.WORKORDER_SPLIT_ID,
       OP1.WORKORDER_SUB_ID,
       OP1.SEQUENCE_NO,
       OP1.RESOURCE_ID,
      OP1.SERVICE_ID,
      SR.USER_1 as skills_type, 
      SR.USER_5 as plant,
      OP1.OPERATION_TYPE, 
      CAST(CAST(SB.BITS AS varbinary(MAX)) AS nvarchar(MAX)) AS SERVICE_specs,
      CAST(CAST(oTB.BITS AS varbinary(MAX)) AS nvarchar(MAX)) AS TYPE_specs,
      CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)) AS OP_specs
  FROM OPERATION OP1
  INNER JOIN SHOP_RESOURCE SR
  ON SR.ID = OP1.RESOURCE_ID
  INNER JOIN OPER_TYPE_BINARY OTB
   ON OTB.OPERATION_TYPE_ID = OP1.OPERATION_TYPE
   LEFT OUTER JOIN SERVICE S
   ON S.ID = OP1.SERVICE_ID
   LEFT OUTER JOIN SERVICE_BINARY SB
   ON S.ID = SB.SERVICE_ID
left outer join operation_binary ob
     on op1.workorder_type = ob.workorder_type
     and op1.workorder_base_id = ob.workorder_base_id
     and op1.workorder_lot_id = ob.workorder_lot_id
     and op1.workorder_split_id = ob.workorder_split_id
     and op1.workorder_sub_id = ob.workorder_sub_id
     and op1.sequence_no = ob.sequence_no
   WHERE OP1.WORKORDER_TYPE = 'M'
   AND RESOURCE_ID = 'CONTRACTOR'
