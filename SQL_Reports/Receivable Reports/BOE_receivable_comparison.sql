--> Visual Enterprise Financial Reports > Receivable Reports > BOE_receivable_comparison
--DECLARE @startdate AS DATE = '3/27/2019'
--, @enddate AS DATE = '6/18/2019'
--, @paysettledate AS DATE = '6/18/2019'

IF EXISTS
    (SELECT * 
    FROM dbo.boe_pay_summary_history
    WHERE CONVERT(DATE, [payment settlement date]) = CONVERT(DATE,@paysettledate)
    )
    BEGIN
        WITH cte_match AS
            (SELECT '5-does not match Packlist ID not equal to NO PO INVOICE' as invoice_group
                , NULL AS INVOICE_ID
                , NULL AS INVOICE_DATE
                , rl.PACKLIST_ID
                , rl.CUST_ORDER_ID
                , NULL AS CUSTOMER_ID
                , rl.AMOUNT
                , rl.REFERENCE
                , i.[check/trace num]
                , i.[boeing invoice num]
                , i.[boeing purchase order num]
                , i.[supplier invoice num]
                , i.[invoice received date]
                , i.[invoice gross amt]
                , CASE 
                    WHEN 0 <>  i.[invoice net amt] THEN 0 -  i.[invoice net amt]
                    ELSE 0
                END AS invoice_diff
                , i.payment
            FROM LIVEAccounting.dbo.boe_pay_summary_history AS i 
                LEFT OUTER JOIN LIVE.dbo.RECEIVABLE_LINE AS rl
                    ON  i.[supplier invoice num] = rl.PACKLIST_ID
            WHERE CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
                AND rl.PACKLIST_ID IS NULL
                AND i.[boeing purchase order num]<> 'NO PO INVOICE'
            UNION ALL
            SELECT '1-Matches Packlist ID and dollar amt' as invoice_group
                , r.INVOICE_ID
                , r.INVOICE_DATE
                , rl.PACKLIST_ID
                , rl.CUST_ORDER_ID
                , r.CUSTOMER_ID
                , rl.AMOUNT
                , rl.REFERENCE
                , i.[check/trace num]
                , i.[boeing invoice num]
                , i.[boeing purchase order num]
                , i.[supplier invoice num]
                , i.[invoice received date]
                , i.[invoice gross amt]
                , CASE 
                    WHEN rl.AMOUNT <>  i.[invoice net amt] THEN rl.AMOUNT -  i.[invoice net amt]
                    ELSE 0
                END AS invoice_diff
                , i.payment
            FROM   LIVE.dbo.RECEIVABLE_LINE AS rl
                INNER JOIN LIVE.dbo.RECEIVABLE AS r
                    ON rl.INVOICE_ID = r.INVOICE_ID
                INNER JOIN LIVEAccounting.dbo.boe_pay_summary_history AS i
                    ON rl.packlist_id = i.[supplier invoice num]
                INNER JOIN LIVE.DBO.CUST_ORDER_LINE COL
                    ON RL.CUST_ORDER_ID = COL.CUST_ORDER_ID
                    AND RL.CUST_ORDER_LINE_NO = COL.LINE_NO
                    AND COL.PART_ID IS NOT NULL         
            WHERE REPLACE(i.[supplier invoice num], '/', ',') NOT LIKE '%,%'
                AND  rl.AMOUNT =  i.[invoice net amt]
                AND (r.CUSTOMER_ID = ''
                    OR r.customer_id = 'BOE605'
                    OR r.customer_id = 'BOE609'
                    OR r.customer_id = 'BOE610'
                    OR r.customer_id = 'BOEPOP'
                    OR r.customer_id = 'BOETRN')
                AND rl.packlist_id > '1'
                AND r.invoice_date >= @startdate
                AND r.invoice_date <=  @enddate
                AND CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
            -- get lines that are in the 2nd part of the supplier invoice num to match to the packlist id
--> tt20211117: Add CO to matching criteria
            UNION ALL
            SELECT '1B-Matches CO_ID and dollar amt' as invoice_group
                , r.INVOICE_ID
                , r.INVOICE_DATE
                , rl.PACKLIST_ID
                , rl.CUST_ORDER_ID
                , r.CUSTOMER_ID
                , rl.AMOUNT
                , rl.REFERENCE
                , i.[check/trace num]
                , i.[boeing invoice num]
                , i.[boeing purchase order num]
                , i.[supplier invoice num]
                , i.[invoice received date]
                , i.[invoice gross amt]
                , CASE 
                    WHEN rl.AMOUNT <>  i.[invoice net amt] THEN rl.AMOUNT -  i.[invoice net amt]
                    ELSE 0
                END AS invoice_diff
                , i.payment
            FROM   LIVE.dbo.RECEIVABLE_LINE AS rl
                INNER JOIN LIVE.dbo.RECEIVABLE AS r
                    ON rl.INVOICE_ID = r.INVOICE_ID
                INNER JOIN LIVEAccounting.dbo.boe_pay_summary_history AS i
-->                    ON rl.packlist_id = i.[supplier invoice num]
                    ON rl.CUST_ORDER_ID = i.[supplier invoice num]
                INNER JOIN LIVE.DBO.CUST_ORDER_LINE COL
                    ON RL.CUST_ORDER_ID = COL.CUST_ORDER_ID
                    AND RL.CUST_ORDER_LINE_NO = COL.LINE_NO
                    AND COL.PART_ID IS NOT NULL         
            WHERE REPLACE(i.[supplier invoice num], '/', ',') NOT LIKE '%,%'
                AND  rl.AMOUNT =  i.[invoice net amt]
                AND (r.CUSTOMER_ID = ''
                    OR r.customer_id = 'BOE605'
                    OR r.customer_id = 'BOE609'
                    OR r.customer_id = 'BOE610'
                    OR r.customer_id = 'BOEPOP'
                    OR r.customer_id = 'BOETRN')
                AND rl.packlist_id > '1'
                AND r.invoice_date >= @startdate
                AND r.invoice_date <=  @enddate
                AND CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
            -- get lines that are in the 2nd part of the supplier invoice num to match to the packlist id

            )

        , cte_nomatch_dollar as
            (SELECT DISTINCT i.[boeing invoice num]
            FROM LIVEAccounting.dbo.boe_pay_summary_history AS i
                LEFT OUTER JOIN cte_match m
                    ON i.[boeing invoice num]= m.[boeing invoice num] 
                    AND i.[invoice gross amt] =  M.[invoice gross amt]
            WHERE m.[boeing invoice num] IS NULL
                AND CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
            )

        SELECT invoice_group
            , INVOICE_ID
            , INVOICE_DATE
            , PACKLIST_ID
            , CUST_ORDER_ID
            , CUSTOMER_ID
            , AMOUNT
            , REFERENCE
            , [check/trace num]
            , [boeing invoice num]
            , [boeing purchase order num]
            , [supplier invoice num]
            , [invoice received date]
            , [invoice gross amt]
            , invoice_diff
            , payment
        FROM CTE_MATCH
        UNION ALL 
        SELECT '2-Matches Packlist ID and but not dollar amt' as invoice_group
            , r.INVOICE_ID
            , r.INVOICE_DATE
            , rl.PACKLIST_ID
            , rl.CUST_ORDER_ID
            , r.CUSTOMER_ID
            , rl.AMOUNT
            , rl.REFERENCE
            , i.[check/trace num]
            , i.[boeing invoice num]
            , i.[boeing purchase order num]
            , i.[supplier invoice num]
            , i.[invoice received date]
            , i.[invoice gross amt]
            , CASE 
                WHEN rl.amount <>  i.[invoice net amt] THEN rl.amount -  i.[invoice net amt]
                ELSE 0
            END AS invoice_diff
            , i.payment
        FROM LIVEAccounting.dbo.boe_pay_summary_history AS i
            INNER JOIN LIVE.dbo.RECEIVABLE_LINE AS rl
                ON  rl.PACKLIST_ID = i.[supplier invoice num]
                AND  rl.AMOUNT <> i.[invoice net amt]
            INNER JOIN LIVE.dbo.RECEIVABLE AS r
                ON rl.INVOICE_ID = r.INVOICE_ID
            INNER JOIN LIVE.DBO.CUST_ORDER_LINE COL
                ON RL.CUST_ORDER_ID = COL.CUST_ORDER_ID
                AND RL.CUST_ORDER_LINE_NO = COL.LINE_NO
                AND COL.PART_ID IS NOT NULL    
            INNER JOIN cte_nomatch_dollar nd
                ON nd.[boeing invoice num] = i.[boeing invoice num]      
        WHERE REPLACE(i.[supplier invoice num], '/', ',') not like '%,%'
             and (r.CUSTOMER_ID = ''
                  OR r.CUSTOMER_ID = 'BOE605'
                  OR r.CUSTOMER_ID = 'BOE609'
                  OR r.CUSTOMER_ID = 'BOE610'
                  OR r.CUSTOMER_ID = 'BOEPOP'
                  OR r.CUSTOMER_ID = 'BOETRN')
              AND rl.PACKLIST_ID > '1'
              AND r.INVOICE_DATE >= @startdate
              AND r.INVOICE_DATE <=  @enddate
              AND CONVERT(DATE,i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
        UNION ALL 
        SELECT '3-Matches Packlist ID for right side' as invoice_group
            , r.INVOICE_ID
            , r.INVOICE_DATE
            , rl.PACKLIST_ID
            , rl.CUST_ORDER_ID
            , r.CUSTOMER_ID
            , rl.AMOUNT
            , rl.REFERENCE
            , i.[check/trace num]
            , i.[boeing invoice num]
            , i.[boeing purchase order num]
            , SUBSTRING(i.[supplier invoice num], CHARINDEX(',', REPLACE(i.[supplier invoice num], '/', ','))+1,LEN(i.[supplier invoice num])) AS [supplier invoice num]
            , i.[invoice received date]
            , i.[invoice gross amt]
            , CASE 
                WHEN rl.amount <>  i.[invoice net amt] THEN rl.amount -  i.[invoice net amt]
                ELSE 0
            END AS invoice_diff
            , i.payment 
        FROM LIVE.dbo.RECEIVABLE_LINE AS rl
            INNER JOIN LIVE.dbo.RECEIVABLE AS r
            ON rl.INVOICE_ID = r.INVOICE_ID
            INNER JOIN LIVEAccounting.dbo.boe_pay_summary_history AS i
                ON rl.packlist_id = 
                    SUBSTRING(i.[supplier invoice num], CHARINDEX(',', REPLACE(i.[supplier invoice num], '/', ','))+1,LEN(i.[supplier invoice num]))
                AND rl.AMOUNT = i.[invoice net amt]
            INNER JOIN LIVE.DBO.CUST_ORDER_LINE COL
                ON RL.CUST_ORDER_ID = COL.CUST_ORDER_ID
                AND RL.CUST_ORDER_LINE_NO = COL.LINE_NO
                AND COL.PART_ID IS NOT NULL
            INNER JOIN cte_nomatch_dollar nd
                ON nd.[boeing invoice num] = i.[boeing invoice num] 
        WHERE REPLACE(i.[supplier invoice num], '/', ',')  like '%,%'
            AND  rl.AMOUNT =  i.[invoice net amt]
            AND (r.CUSTOMER_ID = ''
                OR r.CUSTOMER_ID = 'BOE605'
                OR r.CUSTOMER_ID = 'BOE609'
                OR r.CUSTOMER_ID = 'BOE610'
                OR r.CUSTOMER_ID = 'BOEPOP'
                OR r.CUSTOMER_ID = 'BOETRN')
            AND rl.PACKLIST_ID > '1'
            AND r.INVOICE_DATE >= @startdate
            AND r.INVOICE_DATE <=  @enddate
            AND CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
        UNION ALL 
        -- get lines that are in the 1st part of the supplier invoice num to match to the packlist id
        SELECT '4-Matches Packlist ID for left side' as invoice_group
            , r.INVOICE_ID
            , r.INVOICE_DATE
            , rl.PACKLIST_ID
            , rl.CUST_ORDER_ID
            , r.CUSTOMER_ID
            , rl.AMOUNT
            , rl.REFERENCE
            , i.[check/trace num]
            , i.[boeing invoice num]
            , i.[boeing purchase order num]
            , SUBSTRING(i.[supplier invoice num],0,charindex(',',replace(i.[supplier invoice num], '/', ','))) as [supplier invoice num]
            , i.[invoice received date]
            , i.[invoice gross amt]
            , CASE 
                WHEN rl.AMOUNT <>  i.[invoice net amt] THEN rl.AMOUNT -  i.[invoice net amt]
                ELSE 0
            END AS invoice_diff
            , i.payment
        FROM   live.dbo.receivable_line AS rl
            INNER JOIN LIVE.dbo.RECEIVABLE AS r
                ON rl.INVOICE_ID = r.INVOICE_ID
            INNER JOIN LIVEAccounting.dbo.boe_pay_summary_history AS i
                ON rl.packlist_id = 
                substring(i.[supplier invoice num],0,charindex(',',replace(i.[supplier invoice num], '/', ',')))
            INNER JOIN LIVE.DBO.CUST_ORDER_LINE COL
                ON RL.CUST_ORDER_ID = COL.CUST_ORDER_ID
                AND RL.CUST_ORDER_LINE_NO = COL.LINE_NO
                AND COL.PART_ID IS NOT NULL
            INNER JOIN cte_nomatch_dollar nd
                ON nd.[boeing invoice num] = i.[boeing invoice num] 
        WHERE REPLACE(i.[supplier invoice num], '/', ',')  like '%,%'
            AND (r.CUSTOMER_ID = ''
                OR r.CUSTOMER_ID = 'BOE605'
                OR r.CUSTOMER_ID= 'BOE609'
                OR r.CUSTOMER_ID= 'BOE610'
                OR r.CUSTOMER_ID= 'BOEPOP'
                OR r.CUSTOMER_ID= 'BOETRN')
            AND rl.PACKLIST_ID > '1'
            AND r.INVOICE_DATE >= @startdate
            AND r.INVOICE_DATE <=  @enddate
            AND  CONVERT(DATE,i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
        UNION ALL
        -- get lines that are not in visual and not equal to NO PO INVOICE
        SELECT '6-does not match Packlist ID is equal to NO PO INVOICE' as invoice_group
            , null as invoice_id
            , null as invoice_date
            , rl.packlist_id
            , rl.CUST_ORDER_ID
            , null as customer_id
            , 0 as amount
            , rl.reference
            , i.[check/trace num]
            , i.[boeing invoice num]
            , i.[boeing purchase order num]
            , i.[supplier invoice num]
            , i.[invoice received date]
            , i.[invoice gross amt]
            , CASE 
                WHEN 0 <>  i.[invoice net amt] THEN 0 -  i.[invoice net amt]
                ELSE 0
            END AS invoice_diff
            , i.payment
        FROM  LIVEAccounting.dbo.boe_pay_summary_history AS i 
            LEFT OUTER JOIN LIVE.dbo.RECEIVABLE_LINE AS rl
                ON  i.[supplier invoice num] =  rl.packlist_id
        WHERE CONVERT(DATE,i.[payment settlement date]) = CONVERT(DATE,@paysettledate)
            and rl.PACKLIST_ID is null
            and i.[boeing purchase order num]= 'NO PO INVOICE'
    END
ELSE
    BEGIN 
        SELECT NULL AS invoice_id
            , NULL AS invoice_date
            , NULL AS PACKLIST_ID
            , NULL AS CUSTOMER_ID
            , NULL AS AMOUNT
            , NULL AS REFERENCE
            , NULL AS [check/trace num]
            , NULL AS [boeing invoice num]
            , NULL AS [boeing purchase order num]
            , NULL AS  supplier_invoice_num_cleaned
            , NULL AS [invoice received date]
            , NULL AS [invoice gross amt]
    END
