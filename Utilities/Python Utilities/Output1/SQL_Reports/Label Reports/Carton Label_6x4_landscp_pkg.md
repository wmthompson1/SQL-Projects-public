# Carton Label_6x4_landscp_pkg

```sql
SELECT C.ID ,ca.NAME , 
       ca.addr_1,
       ca.addr_2,
       DSL3.SHIP_TO_ADDR_NO,
       CASE
           WHEN ca.ADDR_2 IS null
            THEN ca.NAME + char(10) + char(13) + ca.ADDR_1 + char(10) + char(13) + ca.CITY + ',' + ca.STATE +' ' + ca.zipcode
            ELSE ca.NAME + char(10) + char(13) + ca.ADDR_1 + char(10) + char(13) + ca.ADDR_2 + char(10) + char(13) + ca.CITY + ',' + ca.STATE +' ' + ca.zipcode
        END AS addr,  
       ca.ADDR_3 , 
       ca.CITY +',' + ca.STATE +' ' + ca.zipcode as ctystzip
       , DSL3.CUSTOMER_PO_REF
       , DSL3.CUSTOMER_PART_ID
       , DSL3.CL_USER_2 AS USER_2
       , @PACKLIST AS PACKLIST_ID
       , DSL3.PART_ID
       , DSL3.SHIPPED_QTY
       , DSL3.DESIRED_WANT_DATE AS DUEDATE
       , DSL3.WORKORDER AS WORK_ORDER
       , DSL3.WO_BASE
FROM dbo.sfnDEMAND_SUPPLY_LINK_3(@PACKLIST) DSL3
    JOIN CUSTOMER C
        ON DSL3.CUSTOMER_ID = C.ID
    JOIN CUST_ADDRESS CA
        ON CA.CUSTOMER_ID = C.ID
            AND CA.ADDR_NO = DSL3.SHIP_TO_ADDR_NO

```