select a.TRANSACTION_ID, a.PART_ID, a.QTY, a.TRACE_ID, b.WAREHOUSE_ID, b.LOCATION_ID, case when b.DESCRIPTION is null and CLASS = 'R' then 
'Product Reception' when b.DESCRIPTION is null and CLASS = 'I' then 'Issued' else b.DESCRIPTION end as 'DESCRIPTION', b.TYPE, b.CLASS, 
b.TRANSACTION_DATE, b.USER_ID 
from TRACE_INV_TRANS a inner join INVENTORY_TRANS b on a.TRANSACTION_ID = b.TRANSACTION_ID
where a.PART_ID in ( select p.ID as 'PartID' from PART p with (nolock) inner join  ( select PART_ID, sum(QTY) as 'QTY' 
from PART_LOCATION where QTY > 0 group by PART_ID ) L on p.ID = L.PART_ID where  p.QTY_ON_HAND <> l.QTY )
and a.TRACE_ID in ( select distinct i.TRACE_ID from PART p with (nolock) 
inner join ( select a.PART_ID, sum(a.QTY) as 'QTY', b.LOCATION_ID, a.TRACE_ID from TRACE_INV_TRANS a with (nolock)
inner join INVENTORY_TRANS b with (nolock) on a.TRANSACTION_ID = b.TRANSACTION_ID group by a.PART_ID, b.LOCATION_ID, 
a.TRACE_ID ) i on p.ID = i.PART_ID WHERE p.ID in ( select p.ID as 'PartID' from PART p with (nolock) left outer join  
(select PART_ID, sum(QTY) as 'QTY' from PART_LOCATION where QTY > 0 group by PART_ID) L on p.ID = L.PART_ID where 
p.QTY_ON_HAND > 0 and p.QTY_ON_HAND <> l.QTY ) ) 
order by a.PART_ID, a.TRACE_ID, a.TRANSACTION_ID asc
