# Racking_Throughput_Orders

```sql
SELECT LD.date, max(ld.row) as 'Completed_Qty'
FROM LABOR_TICKET LT with (nolock)
INNER JOIN ( 
    Select  row_number()over(partition by datepart(day, TRANSACTION_DATE) order by TRANSACTION_DATE)row, 
        /* "row" create correlative per day */
        WORKORDER_BASE_ID as WO, WORKORDER_LOT_ID as lot, WORKORDER_SPLIT_ID as split, 
        convert(varchar(10), TRANSACTION_DATE, 101) as 'date'  --Conver TRANSACTION_DATE to format "mm-dd-yyyy"
    FROM LABOR_TICKET 
    WHERE RESOURCE_ID in ('P1F1-CH-RACK', 'P1F2-CH-RACK') --Specify filtered RESOURCE 
        and TRANSACTION_DATE > Getdate()-14 and SETUP_COMPLETED = 'Y'
) LD on LT.WORKORDER_BASE_ID = LD.WO and LT.WORKORDER_LOT_ID = LD.lot and LT.WORKORDER_SPLIT_ID = LD.split
WHERE LT.RESOURCE_ID in ('P1F1-CH-RACK', 'P1F2-CH-RACK') --Specify filtered RESOURCE 
    and LT.TRANSACTION_DATE > Getdate()-14 and SETUP_COMPLETED = 'Y'
GROUP BY LD.date    ORDER BY LD.date asc

```