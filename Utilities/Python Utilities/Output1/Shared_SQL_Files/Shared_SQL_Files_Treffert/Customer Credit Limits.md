# Customer Credit Limits

```sql
use live
go

SELECT 
	c.ID,
	c.NAME,
	c.TERMS_NET_DAYS,
	c.TERMS_DESCRIPTION,
	convert(varchar(11),c.OPEN_DATE,101) as CustOpenDate,
	convert(varchar(11),c.MODIFY_DATE,101) as ModifyDate,
	c.ACTIVE_FLAG,
	ce.CREDIT_STATUS,
	ce.CREDIT_LIMIT_CTL,
	ce.CREDIT_LIMIT,
	ce.RECV_AGE_LIMIT,
	ce.TOTAL_OPEN_ORDERS,
	ce.TOTAL_OPEN_RECV,
	ce.OPEN_ORDER_COUNT,
	ce.OPEN_RECV_COUNT,
	ce.TOTAL_OPEN_SHIPPED,
	convert(varchar(11),r.INVOICE_DATE,101) as InvoiceDate,
	r.INVOICE_ID,

	convert(varchar(11),cr.CREATE_DATE, 101) as CRCreateDate,
	crl.check_id as CRLCheckId,
	cr.AMOUNT as CRAmount,
	--sum(crl.AMOUNT) as CRLAmount,
	--sum(r.TOTAL_AMOUNT) as RTotalAmt,
	--sum(r.PAID_AMOUNT) as RPaidAmt
	crl.LINE_NO,
	cr.AMOUNT as CRAmount,
	crl.AMOUNT as CRLAmount,
	r.TOTAL_AMOUNT as RTotalAmt,
	r.PAID_AMOUNT as RPaidAmt

from 
	customer c 
left outer join 
	customer_entity ce 
		on c.id = ce.customer_id 
left outer join 
	receivable r
		on c.id = r.customer_id
--		and (r.invoice_id = crl.invoice_id or crl.invoice_id is null)

left outer join 
	cash_receipt_line crl
		on c.id = crl.customer_id 
		and r.invoice_id = crl.invoice_id
left outer join 
	cash_receipt cr
		on c.id = cr.customer_id 
		and crl.check_id = cr.check_id 

where 
	c.id like '%trifab%'
	--and cr.check_id = '207232'
--GROUP BY 
--	c.ID,
--	c.NAME,
--	c.TERMS_NET_DAYS,
--	c.TERMS_DESCRIPTION,
--	c.OPEN_DATE,
--	c.MODIFY_DATE,
--	c.ACTIVE_FLAG,
--	ce.CREDIT_STATUS,
--	ce.CREDIT_LIMIT_CTL,
--	ce.CREDIT_LIMIT,
--	ce.RECV_AGE_LIMIT,
--	ce.TOTAL_OPEN_ORDERS,
--	ce.TOTAL_OPEN_RECV,
--	ce.OPEN_ORDER_COUNT,
--	ce.OPEN_RECV_COUNT,
--	ce.TOTAL_OPEN_SHIPPED,
--	cr.CREATE_DATE,
--	crl.check_id,
--	crl.LINE_NO,
--	r.INVOICE_DATE,
--	r.INVOICE_ID,
--	cr.AMOUNT,
--	crl.AMOUNT,
--	r.TOTAL_AMOUNT,
--	r.PAID_AMOUNT
order by 
	r.invoice_date,
	cr.create_date,
	r.INVOICE_ID




/*
select * from customer where id like '%trifab%'
select * from customer_entity where customer_id like '%trifab%'
select * from cash_receipt where customer_id like '%trifab%'
select * from cash_receipt_line where customer_id like '%trifab%' and invoice_id = '1006828' order by invoice_ID
select * from receivable where customer_id like '%trifab%' order by invoice_date

select * from cash_receipt_curr where customer_id like '%trifab%' 

*/
```