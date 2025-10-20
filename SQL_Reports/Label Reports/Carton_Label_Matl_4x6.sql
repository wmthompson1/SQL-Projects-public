select rl.PURC_ORDER_ID, 
       rl.PURC_ORDER_LINE_no, 
       pl.part_id, 
       t.APROPERTY_2,
       it.location_id,
      trt.QTY,
       DBO.SPLIT(p.DESCRIPTION,2,' ')  AS matl_type,
       p.DESCRIPTION
  from dbo.RECEIVER_LINE rl
 inner join PURC_ORDER_LINE pl
    on pl.PURC_ORDER_ID = rl.PURC_ORDER_ID
   and pl.LINE_NO        = rl.PURC_ORDER_LINE_NO
 inner join dbo.PART p
    on p.ID = pl.PART_ID
 inner join dbo.inventory_trans it 
   on pl.part_id = it.part_id
inner join dbo.trace_inv_trans trt
 on it.TRANSACTION_ID = trt.TRANSACTION_ID
 inner join dbo.TRACE t
    on trt.trace_id = t.id
   and Trt.TRACE_ID =CASE 
                WHEN CHARINDEX('/ ',Trt.TRACE_ID ) > 0
              THEN convert(varchar(15), pl.PURC_ORDER_ID) + '/ '+ convert(varchar(3),pl.LINE_NO)   
              WHEN CHARINDEX('-',Trt.TRACE_ID ) > 0
              THEN convert(varchar(15), pl.PURC_ORDER_ID) + '-'+ convert(varchar(3),pl.LINE_NO)   
              WHEN CHARINDEX('/',Trt.TRACE_ID ) > 0
              THEN convert(varchar(15), pl.PURC_ORDER_ID) + '/'+ convert(varchar(3),pl.LINE_NO)   
              ELSE convert(varchar(15),pl.PURC_ORDER_ID)  
        END
WHERE rl.PURC_ORDER_ID =  @PURCHASE_ORDER
and it.location_id <> 'insp'
and trt.qty > 0
