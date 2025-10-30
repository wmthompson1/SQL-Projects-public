use live
go

select part_id, count(*) from part_site group by part_id having count(*) > 1 order by part_id

select id, count(*) from part group by id having count(*) > 1 order by id

--There are multiple Select Statements that can be used to find possible problems with data that could cause MRP to not complete.
-- 1)  Two (2) engineering masters reference each other with co-products in their respective masters could cause a looping condition.
-- If two engineering masters reference each other as co-products in their respective masters and there are requirements against each of these part id's, MRP will run in a loop. 
-- The sql statement below will find this condition:

 --Finds Self-Referencing Co-Product - check the co-product on the Engineering Master in the results.
 select workorder_base_id, part_id 
 from co_product cp 
 where cp.workorder_type = 'M' 
 and cp.part_id in 
 (select cp2.workorder_base_id 
 from co_product cp2 
 where cp2.part_id = cp.workorder_base_id 
 and cp2.workorder_type = 'M');

 --Other possible conditions

 --Finds Self-Referencing Eng Master - check the leg header card to make sure there isn't a part id that is the same as the part being made.
 select workorder_base_id, part_id
 from requirement r1
 where r1.workorder_type = 'M'
 and r1.part_id in
 (select r2.workorder_base_id
 from requirement r2
 where r2.part_id = r1.workorder_base_id
 and r2.workorder_type = 'M');

-- 2)  There could be orphaned records in the database.

---Identifies orphaned legs.  If there are any they need to be deleted.

select work_order.type, work_order.base_id, work_order.lot_id, work_order.split_id, work_order.sub_id from work_order
where work_order.sub_id != '0'
and not exists (select * from requirement where
work_order.type = requirement.workorder_type and
work_order.base_id = requirement.workorder_base_id and 
work_order.lot_id = requirement.workorder_lot_id and 
work_order.split_id = requirement.workorder_split_id and
work_order.sub_id = requirement.subord_wo_sub_id)

select * from operation where workorder_base_id = '1376848'
select * from work_order where base_id = '1376848'

select w.desired_qty, w.variable_table, count(*) from WORK_ORDER w where w.[type] = 'M' group by w.desired_qty, w.variable_table having count(*) > 1

--Finds all materials belonging to orphaned legs.   If there are any they need to be deleted.
select requirement.workorder_type, requirement.workorder_base_id, requirement.workorder_lot_id, requirement.workorder_split_id, requirement.workorder_sub_id, requirement.operation_seq_no, 
requirement.piece_no from requirement 
where exists (select work_order.type, work_order.base_id, work_order.lot_id, work_order.split_id, work_order.sub_id from work_order
where work_order.sub_id != '0'
and not exists (select * from requirement where
work_order.type = requirement.workorder_type and
work_order.base_id = requirement.workorder_base_id and 
work_order.lot_id = requirement.workorder_lot_id and 
work_order.split_id = requirement.workorder_split_id and
work_order.sub_id = requirement.subord_wo_sub_id)
and
requirement.workorder_type = work_order.type and
requirement.workorder_base_id = work_order.base_id and
requirement.workorder_lot_id = work_order.lot_id and
requirement.workorder_split_id = work_order.split_id and
requirement.workorder_sub_id = work_order.sub_id)

--Finds all operations belonging to orphaned legs. (shouldn't be any, but if there is then delete them.)

select Operation.workorder_type, Operation.workorder_base_id, Operation.workorder_split_id, Operation.workorder_sub_id, Operation.sequence_no from operation 
where exists (select work_order.type, work_order.base_id, work_order.lot_id, work_order.split_id, work_order.sub_id from work_order where work_order.sub_id != '0'
and not exists (select * from requirement where
work_order.type = requirement.workorder_type and
work_order.base_id = requirement.workorder_base_id and 
work_order.lot_id = requirement.workorder_lot_id and 
work_order.split_id = requirement.workorder_split_id and
work_order.sub_id = requirement.subord_wo_sub_id)
and
Operation.workorder_type = work_order.type and
Operation.workorder_base_id = work_order.base_id and
Operation.workorder_lot_id = work_order.lot_id and
Operation.workorder_split_id = work_order.split_id and
Operation.workorder_sub_id = work_order.sub_id)
 --Finds part ids with a planning policy where minimum_order_qty > maximum_order_qty 
 select id, minimum_order_qty, maximum_order_qty from part 
 where minimum_order_qty > maximum_order_qty 
 order by id;

 3)  Parts have a Minimum Order Qty that is greater than the Maximum Order.  This is an invalid condition because if the maximum order quantity is less than what the minimum order quantity is, MRP does not know what to do with it if it is determined that an order is needed.  In Release 7.1.0 or higher, change PART to PART_SITE table.

 --Finds part ids with a planning policy where minimum_order_qty > maximum_order_qty 
 select id, minimum_order_qty, maximum_order_qty, order_policy from part
 where minimum_order_qty > maximum_order_qty 
 order by id;

 select Part_id, warehouse_id, minimum_order_qty, maximum_order_qty, order_policy from part_warehouse
 where minimum_order_qty > maximum_order_qty 
 order by part_id;

 4)  Finds parts that have MRP_REQUIRED flag set to Yes but no Order Policy.  If Order Policy is N then MRP Required should be N.

 SELECT ID, MRP_REQUIRED, ORDER_POLICY FROM PART WHERE MRP_REQUIRED = 'Y' AND ORDER_POLICY ='N';
 SELECT PART_ID, MRP_REQUIRED, ORDER_POLICY FROM PART_WAREHOUSE WHERE MRP_REQUIRED = 'Y' AND ORDER_POLICY ='N';

 ---FOR RELEASE 7.1.0 AND UP;
 SELECT PART_ID, MRP_REQUIRED, ORDER_POLICY, SITE_ID FROM PART_SITE WHERE MRP_REQUIRED = 'Y' AND ORDER_POLICY ='N';
