/**********************************************************************************************
Description:  TMX Price Check
Sample:
Date      Modified By      Change Description
---------- ------------------ ------------------------------------------------------------
08/14/2025    Luke        Query
Ticket 1043            Posted Report - William

Luke Garrison
To: helpdesk@skillsinc.org
Aug 14
Anyone, Active
Can we please have a new SSRS report published titled "TMX Price Check". 
Please put this in the Month End folder of the finance section of SSRS.


**********************************************************************************************/


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET DEADLOCK_PRIORITY LOW;

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results;

Select
     R.Invoice_ID as 'R_Invoice'
    ,R.Total_Amount as 'R_Amount'
    ,P.VOUCHER_ID
    ,(PL.AMOUNT * -1) as 'AP_Amount'

from Receivable R (nolock)
Left Outer Join Payable P  (nolock)
on P.VOUCHER_ID = R.INVOICE_ID
Left Outer Join PAYABLE_LINE PL  (nolock)
on PL.VOUCHER_ID = P.VOUCHER_ID
and Pl.RECEIVER_ID is null

where R.Customer_ID = 'BOEPOP'
and (R.TOTAL_AMOUNT + (PL.AMOUNT * -1)) != 0
and P.POSTING_DATE >= Getdate()- 30

Order By
R_Invoice
