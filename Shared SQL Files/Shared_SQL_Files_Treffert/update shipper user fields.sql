--S:\IS\admin stuff\Database Actions\As Needed Fixes\update shipper user fields.sql
select CREATE_DATE, 
       packlist_Id,
	   cust_order_id, 
	   INVOICE_ID,
	   user_1, 
	   user_2, 
	   user_3, 
	   user_4, 
	   user_5, 
	   user_6, 
	   user_7,
	   user_8, 
	   user_9,
	   user_10,
	   UDF_LAYOUT_ID
from dbo.SHIPPER
where PACKLIST_ID like '1048713'

--WHERE USER_1 IS NOT NULL
--AND INVOICE_ID IS NOT NULL
--AND USER_4 IS NOT NULL
--ORDER BY CREATE_DATE
--AND CREATE_DATE > '2/15/2012'

Update dbo.SHIPPER 
 SET 
    --USER_1  = '5',               -- changed to qty received             from paint thickness
    -- USER_2  = '6/0',               -- changed to qty accepted                from qty received
    -- USER_3  = '0/13',               -- changed to qty rejected               from qty received 
     --USER_4  = '79.0-79.5 HRBW',    -- changed to rockwell hardness null from qty rejected
     --USER_5  = '30.0-30.5 %IACS',--, -- changed to eddy current from from reject no
     USER_6  = '1.09 – 1.60 mils',       -- changed to Primer thickness from Null
     --user_7  = '9.15/10.66;F-19.79-70846;2.10/2.58',                -- changed to Topcoat thickness
     USER_8  = '1.61 – 1.98 mils',                 -- Complex area thickness
     --user_9	= '118991',              -- changed to reject no from Null
    -- USER_10 = '310'                -- stop at Cert Seq#
    UDF_LAYOUT_ID = 'Skills Cert'
where PACKLIST_ID = '1048713'