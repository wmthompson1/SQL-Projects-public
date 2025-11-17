# Of_Balance_Inventory___Tablix4

```sql
select p.ID as 'PartID', p.DESCRIPTION, p.QTY_ON_HAND as 'Total_Inv', L.QTY as 'Tot_Loc'
from PART p with (nolock) 
inner join  ( select PART_ID, sum(QTY) as 'QTY' from PART_LOCATION where QTY > 0 group by PART_ID ) L on p.ID = L.PART_ID
where p.QTY_ON_HAND > 0 and p.QTY_ON_HAND <> l.QTY
order by p.ID

```