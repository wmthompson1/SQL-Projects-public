--> Visual Enterprise Financial Reports > Receivable Reports > BOE_receivable_comparison
DECLARE @startdate AS DATE = '10/01/2025'
, @enddate AS DATE = '10/30/2025'
, @paysettledate AS DATE = '11/17/2025'
, @supplier_invoice_num_cleaned AS VARCHAR(100)= '1472480';


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
                , len(i.[supplier invoice num]) AS supplier_invoice_num_length
                , i.[invoice received date]
                , i.[invoice gross amt]
                , CASE 
                    WHEN 0 <>  i.[invoice net amt] THEN 0 -  i.[invoice net amt]
                    ELSE 0
                END AS invoice_diff
                , i.payment
                ,i.[payment settlement date]
            FROM LIVEAccounting.dbo.boe_pay_summary_history AS i 
                LEFT OUTER JOIN LIVE.dbo.RECEIVABLE_LINE AS rl
                    ON  i.[supplier invoice num] = rl.PACKLIST_ID
            WHERE 1=1
            --test for no match to packlist id
          --and i.[supplier invoice num]  = @supplier_invoice_num_cleaned
            and CONVERT(DATE, i.[payment settlement date]) = CONVERT(DATE,@paysettledate)

                -- AND rl.PACKLIST_ID IS NULL
                -- AND i.[boeing purchase order num]<> 'NO PO INVOICE'
         


            )
        SELECT *
        FROM cte_match;

    