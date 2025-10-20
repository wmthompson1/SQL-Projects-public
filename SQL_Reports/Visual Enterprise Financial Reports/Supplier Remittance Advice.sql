select right(cd.memo,4) as AcctEnding
    , 'Checking' as AcctType
    , v.name as VendorName
    , v.name + char(10) + char(13) + v.Addr_1 + char(10)+char(13) 
            + case when v.addr_2 is not null
                    then v.addr_2 + char(10) + char(13)
                    else '' 
                    end
            + case when v.addr_3 is not null
                    then v.addr_3 + char(10) + char(13)
                    else ''
                    end 
            + v.city + ', ' + isnull(v.state,'') + '  ' + isnull(v.zipcode,'')
            + case when v.Country is not null 
                   then char(10)+char(13) + v.country 
                   else ''
                   end as VendAddress
    , isnull(v.remit_to_name,v.name) as RemitVendorName
    , case when v.remit_to_name is null 
           then v.name + char(10) + char(13) + v.Addr_1 + char(10)+char(13) 
                + case when v.addr_2 is not null
                        then v.addr_2 + char(10) + char(13) 
                        else ''
                        end
                + case when v.addr_3 is not null
                        then v.addr_3 + char(10) + char(13)
                        else ''
                        end 
                + v.city + ', ' + isnull(v.state,'') + '  ' + isnull(v.zipcode,'')
                + case when v.Country is not null
                       then char(10)+char(13) + v.country 
                       else ''
                       end 
            else v.remit_to_name + char(10) + char(13) + v.remit_to_Addr_1 + char(10)+char(13) 
                + case when v.remit_to_addr_2 is not null
                        then v.remit_to_addr_2 + char(10) + char(13) 
                        else ''
                        end
                + case when v.remit_to_addr_3 is not null
                        then v.remit_to_addr_3 + char(10) + char(13)
                        else ''
                        end 
                + v.remit_to_city + ', ' + isnull(v.remit_to_state,'') + '  ' + isnull(v.remit_to_zipcode,'') 
                + case when v.remit_to_Country is not null
                       then char(10)+char(13) + v.remit_to_country
                       else ''
                       end
            end as RemitVendAddress
    , v.id as VendorID
    , cast(cd.amount as decimal(14,2)) as Amount
    , cdl.voucher_id
    , p.invoice_date
    , p.invoice_id 
    , p.total_amount as VoucherAmt
    , cdl.amount as PaidAmt
    , cdl.discount_applied
    , cd.control_no as ControlNo
    , cd.check_date
    , cd.Amount as RemitAmt
from cash_disburse_line cdl
join cash_disbursement cd on cdl.bank_account_id = cd.bank_account_id and cdl.control_no = cd.control_no
join vendor v on cd.vendor_id = v.id 
left join payable p on cdl.voucher_id = p.voucher_id 
where cd.payment_batch_no = @BatchID
and cd.bank_account_id = @BankID
and cd.vendor_id = @VendorID
