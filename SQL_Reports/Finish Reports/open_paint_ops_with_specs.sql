SELECT      
      ops.desired_want_date,
      ops.wostatus,
      ops.opstatus,
      co.CUSTOMER_ID,
      ops.base_id,
      ops.lot_id,
      ops.split_id,
      ops.sub_id,
      ops.sequence_no,
      ops.resource_id,
      ops.operation_seq_no,
      ops.part_id,
      ops.operation_type,
      ops.desired_qty, 
      opb.specs,
      case when opb.specs like '%one coat%'
           then 1
          when opb.specs like '%two coat%'
          then 2
          when opb.specs like '%Three coat%'
          then 3
          else 0
          end as number_of_coats
  FROM dbo.skills_wo_ops_open ops
  inner join dbo.SKILL_OP_TYPE_BINARY opb
    on opb.OPERATION_TYPE_ID = ops.OPERATION_TYPE
  left outer join dbo.DEMAND_SUPPLY_LINK dsl
    on ops.base_id         =  dsl.supply_base_id
   and ops.lot_id         = dsl.supply_lot_id
   and ops.split_id         = dsl.supply_split_id
   and ops.sub_id         = dsl.supply_sub_id
   left outer join dbo.cust_order_line col
      on dsl.demand_base_id = col.cust_order_id
     and dsl.DEMAND_SEQ_NO = col.line_no
   left outer join customer_order co
     on col.cust_order_id = co.id
 WHERE resource_id IN
                 (
                 SELECT Resource_ID FROM LIVESupplemental..ResourceID_ReportSettings s
                 WHERE Report_Name = 'open_paint_ops_with_specs'
                    AND Report_Section = 'ALL'
                  --'aub-tc',
                  --'aub-pri'
                 ) 
                 and
                  ops.opstatus <> 'C'
order by ops.part_id, 
         ops.base_id, 
        ops.operation_seq_no
