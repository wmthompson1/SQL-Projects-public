# SSIS - Salesrep Verication

```sql
use datawarehouse
go

SELECT C.ID
	, C.SALESREP_ID
	, R.SALESREP_ID
	, B.Salesperson_ID
	, C.USER_4
	, C.ACTIVE_FLAG
FROM CUSTOMER C
LEFT OUTER JOIN LIVESupplemental.dbo.buyer_assn B
ON B.Salesperson_ID = C.SALESREP_ID
LEFT OUTER JOIN LIVESupplemental.dbo.Cust_Reps R
ON C.ID = R.[CUST_ID]
WHERE C.ACTIVE_FLAG = 'Y'
AND (C.USER_4 <> B.ACCOUNT_ID
	OR B.Salesperson_ID IS NULL
	OR C.SALESREP_ID <> R.[SALESREP_ID])


```