# Credit History

```sql
-- Visual Enterprise Reports/Administrative Reports/Credit History

SELECT 
    c.ID,
    c.NAME,
    case
        when c.TERMS_DESCRIPTION is null  then cast(c.[TERMS_NET_DAYS] as varchar)
        else c.TERMS_DESCRIPTION 
    end as TERMS_DESCRIPTION,
    convert(varchar(11),c.OPEN_DATE,101) as CustOpenDate,
    convert(varchar(11),c.MODIFY_DATE,101) as ModifyDate,
    c.ACTIVE_FLAG,
    ce.CREDIT_STATUS,
    ce.CREDIT_LIMIT,
    convert(varchar(11),r.INVOICE_DATE,101) as InvoiceDate,
    convert(varchar(11),r.Posting_DATE,101) as PostingDate,
    convert(varchar(11),r.Void_DATE,101) as VoidDate,
    convert(varchar(11),cr.check_DATE,101) as CheckDate,
    r.INVOICE_ID,
    r.[type],
    r.[status],
    r.TOTAL_AMOUNT as RTotalAmt,
    r.PAID_AMOUNT as RPaidAmt
into #t1
from 
    customer c 
left outer join 
    customer_entity ce 
        on c.id = ce.customer_id 
left outer join 
    receivable r
        on c.id = r.customer_id
left outer join 
    [CASH_RECEIPT_LINE] crl
        on r.invoice_id = crl.invoice_id
left outer join 
    [CASH_RECEIPT] cr
        on crl.CHECK_ID = cr.CHECK_ID
        and cr.customer_id = c.id  
where 
    c.name = @CustomerName
order by 
    r.invoice_date,
    r.INVOICE_ID

select distinct
    ID,
    NAME,
    TERMS_DESCRIPTION,
    CustOpenDate,
    ACTIVE_FLAG,
    CREDIT_STATUS,
    CREDIT_LIMIT,
    (select 
        sum(RTotalAmt)
        from #t1 s
        where 
            datediff(month, InvoiceDate, getdate()) < 6
            and ([type] = 'I' and Status = 'A')
            and m.id = s.id) as SixMosInvoice,
    (select 
        sum(RTotalAmt)
        from #t1 s
        where
            datediff(month, InvoiceDate, getdate()) < 12
            and ([type] = 'I' and Status = 'A')
            and s.id = m.id) YearInvoice,
    (select 
        avg(datediff(day, InvoiceDate, isnull(CheckDate,getdate())))
        from #t1 s
        where
            Status = 'A'
            and RPaidAmt > 0
            and s.id = m.id) AvgDays,
    (select 
        sum(RTotalAmt) - sum(RPaidAmt)
        from #t1 s
        where
            s.id = m.id
            and Status = 'A') CurrBalance,
    (select 
        sum(RTotalAmt)
        from #t1 s
        where
            datediff(day, InvoiceDate, getdate()) > 30
            and RPaidAmt = 0
            and Status = 'A'
            and type = 'I'
            and s.id = m.id) AmtPastDue, 
    (select 
        convert(varchar(11),max(create_date),101)
        from customer_order co
        where
            co.customer_id = m.id) LastOrderDate
FROM #t1 m

```