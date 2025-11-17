# Prime_Part

```sql
/* Table detail to RRSS */
with LabTicPrimeBase as (
    Select  max(GOOD_QTY) as 'Max_Accumulated_Qty', WORKORDER_BASE_ID as WO,
        convert(varchar(10), LT.TRANSACTION_DATE, 101) as 'date'  --Conver ACT_CLOCK_OUT to format "mm-dd-yyyy"
    FROM LABOR_TICKET LT
    WHERE LT.RESOURCE_ID in ('P1F1-PNT-PRIME', 'P1F2-PNT-PRIME') --Specify filtered RESOURCE 
    and LT.TRANSACTION_DATE >= convert(varchar(12), (GETDATE()- 14), 23) and SETUP_COMPLETED = 'Y'
    GROUP BY WORKORDER_BASE_ID, convert(varchar(10), LT.TRANSACTION_DATE, 101)
) select sum(b.Max_Accumulated_Qty) as 'Max_Accumulated_Qty', b.date
from LabTicPrimeBase b    group by b.date
order by date

```