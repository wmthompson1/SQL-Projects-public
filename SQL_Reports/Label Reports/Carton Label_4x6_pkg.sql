SELECT c.id,
       ca.NAME , 
       ca.addr_1,
       ca.addr_2,
       CO.SHIP_TO_ADDR_NO,
       CASE
           WHEN ca.ADDR_2 IS null
            THEN ca.NAME + char(10) + char(13) + ca.ADDR_1 + char(10) + char(13) + ca.CITY + ',' + ca.STATE +' ' + ca.zipcode
            ELSE ca.NAME + char(10) + char(13) + ca.ADDR_1 + char(10) + char(13) + ca.ADDR_2 + char(10) + char(13) + ca.CITY + ',' + ca.STATE +' ' + ca.zipcode
        END AS addr,  
       ca.ADDR_3 , 
       ca.CITY +',' + ca.STATE +' ' + ca.zipcode as ctystzip, 
       co.CUSTOMER_PO_REF , 
       cl.customer_part_id, 
       cl.customer_part_id + char(32) + cl.USER_2 as job,
       cl.USER_2,
       s.PACKLIST_ID , 
       cl.PART_ID , 
       sl.SHIPPED_QTY ,  
       cast(WO.DESIRED_WANT_DATE as date) as DUEDATE,
       dbo.sfnWONUMFormat(dsl.supply_BASE_ID, dsl.SUPPLY_LOT_ID, dsl.SUPPLY_SPLIT_ID, dsl.supply_SUB_ID) AS WORK_ORDER,
       dbo.sfnwonumformat_old(dsl.supply_BASE_ID, dsl.SUPPLY_LOT_ID, dsl.SUPPLY_SPLIT_ID, dsl.supply_SUB_ID) AS old_wo_id,
       DSL.SUPPLY_BASE_ID  
  FROM CUSTOMER AS C
 INNER JOIN CUSTOMER_ORDER AS Co
    ON c.ID              = CO.CUSTOMER_ID
 INNER JOIN CUST_ORDER_LINE AS Cl
    ON CO.ID             = cl.CUST_ORDER_ID
 INNER JOIN CUST_ADDRESS AS CA
    ON CA.CUSTOMER_ID = CO.customer_ID
   AND CA.ADDR_NO = CO.SHIP_TO_ADDR_NO
 INNER JOIN DEMAND_SUPPLY_LINK AS DSL
    ON CL.CUST_ORDER_ID  = DSL.DEMAND_BASE_ID
   AND CL.LINE_NO        = DSL.DEMAND_SEQ_NO
 INNER JOIN SHIPPER_LINE AS SL
    ON DSL.DEMAND_BASE_ID       = sl.CUST_ORDER_ID
   AND DSL.DEMAND_SEQ_NO          = sl.CUST_ORDER_LINE_NO
 INNER JOIN SHIPPER AS S
    ON sl.PACKLIST_ID = s.PACKLIST_ID
 INNER JOIN WORK_ORDER AS WO
    ON DSL.SUPPLY_BASE_ID    = WO.BASE_ID
   AND DSL.SUPPLY_LOT_ID     = WO.LOT_ID
   AND DSL.SUPPLY_SPLIT_ID   = WO.SPLIT_ID
   AND DSL.SUPPLY_SUB_ID     = WO.SUB_ID
 WHERE cl.PART_ID > '0'
   AND sl.SHIPPED_QTY > 0
   AND s.PACKLIST_ID = @PACKLIST;
