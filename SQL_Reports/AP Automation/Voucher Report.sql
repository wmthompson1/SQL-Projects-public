--use live
--go

-- run @lab2

-- C:\bbb\20200316 Voucher Report SSRS\Voucher Report SSRS-01.2.1.sql

/**********************************************************************************************
Description:    
Sample:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
03/18/2020    William Thompson    Created.

Tester:
100005
**********************************************************************************************/


--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET DEADLOCK_PRIORITY LOW

--IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results

 --declare @VOUCHER_ID nvarchar(15) = '100005'

SELECT
   PL.VOUCHER_ID,
   PL.LINE_NO,
   PL.REFERENCE,
   PL.QTY,
   PL.AMOUNT,
   PL.VAT_AMOUNT,
   PL.VAT_PERCENT,
   PL.PURC_ORDER_ID,
   PL.PURC_ORDER_LINE_NO,
   PL.RECEIVER_ID,
   PL.RECEIVER_LINE_NO,
   PL.FIXED_CHARGE,
   PL.DUTY_AMOUNT,
   V.ID VENDOR_ID,
   V.NAME,
   V.ADDR_1,
   V.ADDR_2,
   V.ADDR_3,
      ADDR_11 =
     V.ADDR_1
     + iif( V.ADDR_2 is not null, CHAR(10) + CHAR(13) + V.ADDR_2,'')
     + iif( V.ADDR_3 is not null, CHAR(10) + CHAR(13) + V.ADDR_3,'')
     ,
   V.CITY,
   V.[STATE],
   V.ZIPCODE,
      ADDR_44 = 
        CONCAT(V.CITY, ', ',V.[STATE],' ', V.ZIPCODE)
     ,

     ADDR_99 =
       V.ADDR_1
     + iif( V.ADDR_2 is not null, CHAR(10) + CHAR(13) + V.ADDR_2,'')
     + iif( V.ADDR_3 is not null, CHAR(10) + CHAR(13) + V.ADDR_3,'')
     + CHAR(10) + CHAR(13) + CONCAT(V.CITY, ', ',V.[STATE],' ', V.ZIPCODE)
     + CHAR(10) + CHAR(13) + ISNULL(V.COUNTRY,'')
     ,
   V.COUNTRY,
   V.VENDOR_COUNTRY_ID,
   V.REMIT_TO_NAME,
   V.REMIT_TO_ADDR_1,
   V.REMIT_TO_ADDR_2,
   V.REMIT_TO_ADDR_3,
   REMIT_TO_ADDR_11 =
     V.REMIT_TO_ADDR_1
     + iif( V.REMIT_TO_ADDR_2 is not null, CHAR(10) + CHAR(13) + V.REMIT_TO_ADDR_2,'')
     + iif( V.REMIT_TO_ADDR_3 is not null, CHAR(10) + CHAR(13) + V.REMIT_TO_ADDR_3,'')
     ,
   V.REMIT_TO_CITY,
   V.REMIT_TO_STATE,
   V.REMIT_TO_ZIPCODE,
   REMIT_TO_ADDR_44 = 
        CONCAT(V.REMIT_TO_CITY, ', ',V.REMIT_TO_STATE,' ', V.REMIT_TO_ZIPCODE)
     ,

   REMIT_TO_ADDR_99 =
     V.REMIT_TO_ADDR_1
     + iif( V.REMIT_TO_ADDR_2 is not null, CHAR(10) + CHAR(13) + V.REMIT_TO_ADDR_2,'')
     + iif( V.REMIT_TO_ADDR_3 is not null, CHAR(10) + CHAR(13) + V.REMIT_TO_ADDR_3,'')
     + CHAR(10) + CHAR(13)  + CONCAT(V.REMIT_TO_CITY, ', ',V.REMIT_TO_STATE,' ', V.REMIT_TO_ZIPCODE)
     + CHAR(10) + CHAR(13)  + ISNULL(V.REMIT_TO_COUNTRY,'')
     ,

   V.REMIT_TO_COUNTRY,
   V.REMIT_TO_COUNTRY_ID,
   P.CURRENCY_ID,
   P.INVOICE_ID,
   P.INVOICE_DATE,
   P.TERMS_NET_TYPE,
   P.TERMS_NET_DAYS,
   P.TERMS_NET_DATE,
   P.TERMS_DISC_TYPE,
   P.TERMS_DISC_DAYS,
   P.TERMS_DISC_DATE,
   P.TERMS_DISC_PERCENT,
   P.TERMS_DESCRIPTION,
   ISNULL ( P.NEW_SELL_RATE, P.SELL_RATE ) SELL_RATE,
   ISNULL ( P.NEW_BUY_RATE, P.BUY_RATE ) BUY_RATE,
   V.USER_1,
   V.USER_2,
   V.USER_3,
   V.USER_4,
   V.USER_5,
   V.USER_6,
   V.USER_7,
   V.USER_8,
   V.USER_9,
   V.USER_10,
   P.REMIT_ADDR_NO,
   P.PAY_STATUS,
   PL.ACT_PO_UNIT_PRICE,
   PL.PO_UNIT_PRICE,
   P.SITE_ID,
   PL.GL_ACCOUNT_ID 
FROM
   PAYABLE_LINE PL (nolock)
   inner join PAYABLE P (nolock)
   on PL.VOUCHER_ID = P.VOUCHER_ID
   inner join VENDOR V (nolock)
   on P.VENDOR_ID = V.ID  
WHERE
   PL.VOUCHER_ID = @VOUCHER_ID
ORDER BY
   PL.VOUCHER_ID,
   PL.LINE_NO

