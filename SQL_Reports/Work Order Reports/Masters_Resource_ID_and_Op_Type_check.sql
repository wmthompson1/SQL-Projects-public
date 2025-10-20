
SELECT 
       OP1.WORKORDER_TYPE,                          
       OP1.STATUS AS OPSTATUS,
       OP1.WORKORDER_BASE_ID,
       OP1.WORKORDER_LOT_ID,
       OP1.WORKORDER_SPLIT_ID,
       OP1.WORKORDER_SUB_ID,
       OP1.SEQUENCE_NO,
       OP1.RESOURCE_ID,
      SR.USER_1 as skills_type, 
      SR.USER_5 as plant,
      OP1.OPERATION_TYPE, 
      CAST(CAST(ob.BITS AS varbinary(MAX)) AS nvarchar(MAX)) AS specs,
      mo.NEXTSEQ, 
      mo.NEXTRESOURCE,
      sr2.user_1 as nextskillstype,
      sr2.user_5 as nextplant, 
      op2.OPERATION_TYPE as nextoptype,  
      CAST(CAST(ob2.BITS AS varbinary(MAX)) AS nvarchar(MAX)) AS nextopspecs
  FROM OPERATION OP1
  INNER JOIN SHOP_RESOURCE SR
  ON SR.ID = OP1.RESOURCE_ID
 inner join skills_master_ops mo
 on op1.workorder_type = mo.type
     and op1.workorder_base_id = mo.base_id
     and op1.workorder_lot_id = mo.lot_id
     and op1.workorder_split_id = mo.split_id
     and op1.workorder_sub_id = mo.sub_id
     and op1.sequence_no = mo.sequence_no
inner join operation op2
 on op2.workorder_type = mo.type
     and op2.workorder_base_id = mo.base_id
     and op2.workorder_lot_id = mo.lot_id
     and op2.workorder_split_id = mo.split_id
     and op2.workorder_sub_id = mo.sub_id
     and op2.sequence_no = mo.NEXTSEQ
  INNER JOIN SHOP_RESOURCE SR2
  ON SR2.ID = OP2.RESOURCE_ID
left outer join operation_binary ob
     on op1.workorder_type = ob.workorder_type
     and op1.workorder_base_id = ob.workorder_base_id
     and op1.workorder_lot_id = ob.workorder_lot_id
     and op1.workorder_split_id = ob.workorder_split_id
     and op1.workorder_sub_id = ob.workorder_sub_id
     and op1.sequence_no = ob.sequence_no
left outer join operation_binary ob2
     on op2.workorder_type = ob2.workorder_type
     and op2.workorder_base_id = ob2.workorder_base_id
     and op2.workorder_lot_id = op2.workorder_lot_id
     and op2.workorder_split_id = ob2.workorder_split_id
     and op2.workorder_sub_id = ob2.workorder_sub_id
     and op2.sequence_no = ob2.sequence_no
   WHERE OP1.WORKORDER_TYPE = 'M'
   AND op1.operation_type IN ('rec-p1','aubrec', 'PANEL')--2831--'panel') --7150,)


