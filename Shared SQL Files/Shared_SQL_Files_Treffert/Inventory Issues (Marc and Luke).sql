use LIVE
go

select *
from 
    (SELECT Part_ID , Warehouse_ID, Location_ID, 
    SUM(case when [Type] = 'I' Then Qty Else Qty *-1 End) As Qty
    From Inventory_Trans
--    Where Part_ID = 'BACW10EC3S'
    Group By Part_ID , Warehouse_ID, Location_ID
    ) Q
join part_location pl
on pl.WAREHOUSE_ID = q.WAREHOUSE_ID
and pl.LOCATION_ID = q.LOCATION_ID
and pl.part_id = q.part_id
and pl.qty <> q.Qty

--> TURN OFF TRACE PROFILE
--update trace_profile set APPLY_TO_REC = 'N', APPLY_TO_ISSUE = 'N', APPLY_TO_ADJ = 'N' where part_id =  '143T5352-28'

--> UPDATE LOCATION QUANTITY TO INCLUDE ADJUSTMENTS
--update part_location set qty = 3 where part_id = '143T5352-28' and warehouse_id = 'FGA' and location_id = 'A3E'

--> FROM FRONT END: ADJUST IN/OUT INVENTORY TRANSACION
--> VERIFY QUANTITIES FOR TRACE AND MPW

--> TURN TRACE PROFILE BACK ON
--update trace_profile set APPLY_TO_REC = 'Y', APPLY_TO_ISSUE = 'Y', APPLY_TO_ADJ = 'Y' where part_id =  '143T5352-28'

 select *
from 
    (SELECT Part_ID , Warehouse_ID, --Location_ID, 
    SUM(case when [Type] = 'I' Then Qty Else Qty *-1 End) As Qty
    From Inventory_Trans
--    Where Part_ID = 'BACW10EC3S'
    Group By Part_ID , Warehouse_ID --, Location_ID
    ) Q
join part_warehouse pw
on pw.WAREHOUSE_ID = q.WAREHOUSE_ID
and pw.part_id = q.part_id
and pw.available_qty <> q.Qty
-- update part_warehouse set available_qty = x where part_id = n and warehouse_id = n

 select *
from 
    (SELECT Part_ID, --Warehouse_ID, --Location_ID, 
    SUM(case when [Type] = 'I' Then Qty Else Qty *-1 End) As Qty
    From Inventory_Trans
--    Where Part_ID = 'BACW10EC3S'
    Group By Part_ID --, Warehouse_ID --, Location_ID
    ) Q
join part p
on p.id = q.part_id
and p.qty_on_hand <> q.Qty
-- update part set available_qty = x where id = n 

 

/*
CREATE VIEW SK_AVAIL_LOT AS (
SELECT IT.PART_ID, IT.WAREHOUSE_ID, IT.LOCATION_ID, SUM(TRT.QTY) AS QTY, TRT.TRACE_ID
FROM  INVENTORY_TRANS IT JOIN TRACE_INV_TRANS TRT ON IT.TRANSACTION_ID = TRT.TRANSACTION_ID
AND IT.PART_ID = TRT.PART_ID 
GROUP BY IT.PART_ID, IT.WAREHOUSE_ID, IT.LOCATION_ID, TRT.TRACE_ID
HAVING SUM(TRT.QTY) <> 0)
*/

select V.*
from 
    (SELECT Part_ID , Warehouse_ID, Location_ID, 
    SUM(case when [Type] = 'I' Then Qty Else Qty *-1 End) As Qty
    From Inventory_Trans
--    Where Part_ID = 'BACW10EC3S'
    Group By Part_ID , Warehouse_ID, Location_ID
    ) Q
join 
(SELECT PART_ID, WAREHOUSE_ID, LOCATION_ID, SUM(QTY) AS TOT_QTY
FROM SK_AVAIL_LOT v
GROUP BY PART_ID, WAREHOUSE_ID, LOCATION_ID
) V
on v.WAREHOUSE_ID = q.WAREHOUSE_ID
and v.LOCATION_ID = q.LOCATION_ID
and v.part_id = q.part_id
AND V.TOT_QTY <> q.Qty
JOIN TRACE_PROFILE TP
ON TP.PART_ID = Q.PART_ID
-- update part_location set qty = x where part_id = n and warehouse_id = n and location_id = n

-->

--Select * From Trace_Profile Where Part_ID = 'BACW10Ec3s'
--update trace_profile set APPLY_TO_REC = 'N', APPLY_TO_ISSUE = 'N', APPLY_TO_ADJ = 'N' where part_id =  'BACW10Ec3S'