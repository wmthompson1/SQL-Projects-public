SELECT c.NAME,
      c.ADDR_2,
      c.ADDR_1,
      c.CITY,
      c.STATE,
      c.ZIPCODE,
      sl.SHIPPED_QTY,
      col.PART_ID,
      dsl.WO_BASE AS SUPPLY_BASE_ID,
      dsl.WO_LOT AS SUPPLY_LOT_ID,
      dsl.WO_SPLIT AS SUPPLY_SPLIT_ID,
      col.MISC_REFERENCE,
      s.BOL_ID,
      s.SHIPPED_DATE,
      co.ID,
      col.CUST_ORDER_ID,
      s.PACKLIST_ID,
      BOL.SHIP_DATE

FROM SHIPPER_LINE AS sl  --CUSTOMER AS CUSTOMER
    JOIN CUST_ORDER_LINE AS col
        ON sl.CUST_ORDER_ID = col.CUST_ORDER_ID
            AND col.LINE_NO = sl.CUST_ORDER_LINE_NO
    JOIN SHIPPER s
        ON s.PACKLIST_ID = sl.PACKLIST_ID 
    JOIN CUSTOMER_ORDER AS co
        ON s.CUST_ORDER_ID = co.ID
    JOIN CUSTOMER c 
        ON co.CUSTOMER_ID = c.ID 

    INNER JOIN DEMAND_SUPPLY_LINK_3 AS dsl
    ON col.CUST_ORDER_ID = dsl.CUST_ORDER_ID
        AND col.LINE_NO = dsl.LINE_NO
    INNER JOIN BOL
    ON s.BOL_ID = BOL.ID

WHERE  (s.BOL_ID = @bolid)
      AND (sl.SHIPPED_QTY > 0)
