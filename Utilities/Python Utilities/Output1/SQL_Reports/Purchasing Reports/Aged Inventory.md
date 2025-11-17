# Aged Inventory

```sql
SELECT ROW_NUMBER() over (order by a.QTY_ON_HAND desc) as 'RowN', a.ID, a.DRAWING_ID, a.QTY_ON_HAND, 
    a.QTY_ON_ORDER, a.QTY_IN_DEMAND, a.STOCK_UM, a.DESCRIPTION, a.COMMODITY_CODE, c.WAREHOUSE_ID, c.LOCATION_ID, 
    c.QTY, convert(varchar(12), b.Last_Issued, 23) as 'Last_Issued'
FROM PART a WITH (NOLOCK) 
LEFT JOIN ( SELECT distinct PART_ID, max(TRANSACTION_DATE) as 'Last_Issued' 
            FROM INVENTORY_TRANS WITH (NOLOCK) WHERE TYPE = 'O' and CLASS = 'I' and WORKORDER_BASE_ID is not null 
            and PART_ID is not null and TRANSACTION_DATE >= @Date group by PART_ID 
    ) b ON a.ID = b.PART_ID 
LEFT JOIN ( SELECT PART_ID, QTY, WAREHOUSE_ID, LOCATION_ID 
            FROM PART_LOCATION WITH (NOLOCK) where QTY > 0
    ) c ON a.ID = c.PART_ID

WHERE a.ID not in (SELECT ID FROM PART WITH (NOLOCK) where DESCRIPTION like '%OBSOLET%') 
    and a.QTY_ON_HAND >= @Inventory 

ORDER BY a.QTY_ON_HAND desc

```