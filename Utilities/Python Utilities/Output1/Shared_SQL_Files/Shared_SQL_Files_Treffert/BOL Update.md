# BOL Update

```sql
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ROWID]
      ,[PACKLIST_ID]
      ,[CUST_ORDER_ID]
      ,[SHIPPED_DATE]
      ,[INVOICE_ID]
      ,[INVOICED_DATE]
      ,[CREATE_DATE]
      ,[USER_ID]
      ,[MARKED_FOR_PURGE]
      ,[LONG_DESCRIPTION]
      ,[BOL_ID]
      ,[ASN_ID]
      ,[PRINTED_DATE]
      ,[STATUS]
      ,[STATUS_USER_ID]
      ,[SHIP_TO_ADDR_NO]
      ,[FREE_ON_BOARD]
      ,[SHIP_VIA]
      ,[SALES_TAX_GROUP_ID]
      ,[SITE_ID]
      ,[ESL_REPORT_NO]
      ,[ESL_FILENAME]
      ,[SHIP_REASON_CD]
      ,[CUSTOMS_DOC_ID]
      ,[POOL_CODE]
      ,[VEHICLE_NUMBER]
      ,[INTER_CONSIGNEE]
      ,[TARE_WEIGHT]
      ,[TOTAL_NET_WEIGHT]
      ,[TOTAL_GROSS_WEIGHT]
      ,[SHIPPED_TIME]
      ,[EXPECTED_DEL_DATE]
      ,[EXPECTED_DEL_TIME]
      ,[WAYBILL_NUMBER]
      ,[WSA_ID]
      ,[LOAD_START_DATE]
      ,[LOAD_START_TIME]
      ,[LOAD_COMPLETE_DATE]
      ,[LOAD_COMPLETE_TIME]
      ,[LOAD_DURATION]
      ,[SALESREP_ID]
      ,[USER_1]
      ,[USER_2]
      ,[USER_3]
      ,[USER_4]
      ,[USER_5]
      ,[USER_6]
      ,[USER_7]
      ,[USER_8]
      ,[USER_9]
      ,[USER_10]
      ,[UDF_LAYOUT_ID]
      ,[STATUS_EFF_DATE]
      ,[ACTUAL_DEL_DATE]
      ,[DOC_FILE_PATH]
      ,[DOCUMENT_ID]
      ,[DISTRIBUTED_DATE]
      ,[DOC_TOTAL_AMOUNT]
      ,[CUST_SHIP_CHG_ACCT_NO]
  FROM [LIVE].[dbo].[SHIPPER]
  where packlist_id in ('1209275', '1209276', '1309275', '1309276')

  --update shipper
  --set bol_id = NULL
  --where packlist_id = '1209275'

  --update shipper
  --set bol_id = 'B17410'
  --where packlist_id = '1309275'
```