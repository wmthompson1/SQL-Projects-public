select v.*
    , c.name
    , c.addr_1 + case when c.addr_2 is not null then char(11) + char(13) + c.addr_2 else '' end 
               + case when c.addr_3 is not null then char(11) + char(13) + c.addr_3 else '' end
               + char(11) + char(13) + c.city + ', ' + c.state + '  ' + c.zipcode 
               + case when c.bill_to_country is not null then char(11) + char(13) + c.bill_to_country else '' end as CustAddress
    , c.BILL_TO_NAME 
    , c.BILL_TO_ADDR_1 + case when c.bill_to_addr_2 is not null then char(10) + char(13) + c.bill_to_addr_2 else '' end 
               + case when c.bill_to_addr_3 is not null then char(10) + char(13) + c.bill_to_addr_3 else '' end
               + char(10) + char(13) + c.bill_to_city + ', ' + ISNULL(c.bill_to_state,'') + '  ' + isnull(c.bill_to_zipcode,'') 
               + case when c.bill_to_country is not null then char(10) + char(13) + c.bill_to_country else '' end as CustBillAddress
    , c.BILL_TO_ADDR_1, C.BILL_TO_ADDR_2, C.BILL_TO_CITY + ', ' + ISNULL(C.BILL_TO_STATE,'') + '  ' + ISNULL(C.BILL_TO_ZIPCODE,'') AS CITYSTATEZIP
from STMTM5_QRP_DTL v join customer c on v.customer_id = c.id 
where customer_id = @CustomerID order by v.due_date, v.invoice_id
