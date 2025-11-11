# RM Inventory Check Report

```sql
Select PL.Warehouse_ID ,PL.Location_ID ,PL.PART_ID ,T.IN_QTY - T.OUT_QTY as 'QTY' ,P.STOCK_UM ,T.ID as 'Trace_ID' ,'' as 'Counted_Qty' From Trace T Inner Join PART_SITE_VIEW PS on PS.PART_ID = T.PART_ID Inner Join PART_LOCATION PL on T.PART_ID = PL.PART_ID and PL.PART_ID = PS.PART_ID Left Outer Join PART P on T.PART_ID = P.ID and PS.PART_ID = P.ID and PS.PART_ID = P.ID 
Where T.IN_QTY - T.OUT_QTY != '0' 
and Pl.QTY != '0'  and pl.LOCATION_ID in (@locations)
and Pl.WAREHOUSE_ID = 'Auburn Mtl Cage' Order by PL.LOCATION_ID 

```