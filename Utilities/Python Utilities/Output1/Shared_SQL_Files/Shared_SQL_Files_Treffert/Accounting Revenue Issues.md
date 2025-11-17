# Accounting Revenue Issues

```sql
USE LIVE
GO

SELECT R.CUSTOMER_ID
, R.INVOICE_ID
, R.INVOICE_DATE
, R.TOTAL_AMOUNT
, R.PAID_AMOUNT
, C.[NAME]
, R.POSTING_DATE
, C.SALESREP_ID
, C.ACTIVE_FLAG
FROM RECEIVABLE R
left outer JOIN CUSTOMER C 
ON R.CUSTOMER_ID = C.ID
WHERE R.POSTING_DATE >= '2019-01-01' 
AND R.POSTING_DATE < '2020-01-01'
ORDER BY R.CUSTOMER_ID
, R.INVOICE_ID


SELECT R.CUSTOMER_ID
, C.ACTIVE_FLAG
, udf.STRING_VAL
, month(r.posting_date) as [month]
, sum(R.TOTAL_AMOUNT) as total_amt
, sum(R.PAID_AMOUNT) as paid_amt
FROM RECEIVABLE R
left outer JOIN CUSTOMER C 
ON R.CUSTOMER_ID = C.ID
left outer join USER_DEF_FIELDS udf
on c.id = udf.DOCUMENT_ID
and udf.PROGRAM_ID = 'VMCUSMNT'
WHERE R.POSTING_DATE >= '2019-01-01' 
AND R.POSTING_DATE < '2020-01-01'
group BY R.CUSTOMER_ID, c.active_flag, month(r.posting_date), udf.STRING_VAL
order by R.CUSTOMER_ID, c.active_flag, month(r.posting_date), udf.STRING_VAL

select * from USER_DEF_FIELDS where program_id = 'VMCUSMNT'


Select *
From ACCOUNT A
Inner Join Account_Balance AB
on A.ID = AB.ACCOUNT_ID
Where 
--and A.[TYPE] in ('R', 'E')
and AB.ACCT_PERIOD = '12'
and Ab.ACCT_YEAR = '2019'

--select 3725450.37 - 23741.95

-- 4 => 88 => 310 ==> 3
and 

('40' , '43' , '44' , '45' , '46' , '47' , '48' , '49')


select * from account
```