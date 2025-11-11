# Orders Received from Workshops___Tablix3

```sql
DECLARE @cmp AS NVARCHAR(3) = NULL;
SELECT @cmp = CASE WHEN @iscmp = 1 THEN 'CMP' END;

SELECT CO.ORDER_DATE AS RCV_DATE, CO.ID AS SFC_NUM, COL.PART_ID, COL.MISC_REFERENCE, CA.NAME, CO.DESIRED_SHIP_DATE AS DUE_DATE, (- 1 * (DATEDIFF(day, 
    CO.DESIRED_SHIP_DATE, CO.ORDER_DATE)) - 1) AS ACT_LEADTIME
    , CASE WHEN  - 1 * (DATEDIFF(day, CO.DESIRED_SHIP_DATE, CO.ORDER_DATE)) - 1 < @lessthandays--4 
        THEN '<' + @lessthandays + ' Days' 
        WHEN - 1 * (DATEDIFF(day, CO.DESIRED_SHIP_DATE, CO.ORDER_DATE)) -1 > @morethandays--6 
        THEN '>' + @morethandays + ' Days' 
        ELSE @lessthandays+ '-'+ @morethandays +' Days' 
    END AS LT
    , 
      CASE
         WHEN  -1 * (DATEDIFF(day,CO.DESIRED_SHIP_DATE,CO.ORDER_DATE)) - 1 < @lessthandays
         THEN 3
         WHEN -1 * (DATEDIFF(day,CO.DESIRED_SHIP_DATE,CO.ORDER_DATE)) - 1 > @morethandays
         THEN 1
         ELSE 2
      END AS LT_SORT,
SUM(1) OVER (PARTITION BY CO.ORDER_DATE) DailyTotal
FROM CUSTOMER_ORDER CO 
    INNER JOIN CUST_ORDER_LINE COL 
        ON CO.ID = COL.CUST_ORDER_ID 
    INNER JOIN CUST_ADDRESS CA 
        ON CO.CUSTOMER_ID = CA.CUSTOMER_ID 
            AND CO.SHIP_TO_ADDR_NO = CA.ADDR_NO
WHERE (CO.ORDER_DATE >= @start_date /*{ts '2018-02-05 00:00:00'}*/ 
    AND CO.ORDER_DATE < @end_date) /*{ts '2018-12-31 00:00:01'})*/ 
    AND CO.CUSTOMER_ID = @cust_id 
    AND CO.STATUS <> 'X' 
    AND EXISTS (
        SELECT 1
        FROM CUST_ADDRESS
        WHERE LEFT(CA.NAME, 3) <> ISNULL(@cmp, '')
        )


```