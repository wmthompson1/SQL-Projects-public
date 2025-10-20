select p.ID as 'PartID', p.DESCRIPTION, p.QTY_ON_HAND as 'QTY_ON_HAND', i.LOCATION_ID, 
sum(i.QTY) as 'Transact_Qty_Loc', pl.QTY as 'Qty_loc'
from PART p with (nolock) 
inner join ( select a.PART_ID, sum(a.QTY) as 'QTY', b.LOCATION_ID from TRACE_INV_TRANS a with (nolock)
inner join INVENTORY_TRANS b with (nolock) on a.TRANSACTION_ID = b.TRANSACTION_ID
group by a.PART_ID, b.LOCATION_ID ) i on p.ID = i.PART_ID
left outer join PART_LOCATION  pl on i.PART_ID = pl.PART_ID and i.LOCATION_ID = pl.LOCATION_ID
WHERE p.ID in ( select p.ID as 'PartID' from PART p with (nolock) left outer join  (select PART_ID, sum(QTY) as 'QTY' from 
PART_LOCATION where QTY > 0 group by PART_ID) L on p.ID = L.PART_ID where p.QTY_ON_HAND > 0 and p.QTY_ON_HAND <> l.QTY )
group by p.ID, p.DESCRIPTION, p.QTY_ON_HAND, i.LOCATION_ID, pl.QTY
order by p.ID, i.LOCATION_ID asc
