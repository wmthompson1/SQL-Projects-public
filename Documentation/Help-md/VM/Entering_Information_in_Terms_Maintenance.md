Entering Information in Terms Maintenance




# Entering Information in Terms Maintenance

If you use Infor VISUAL for .NET Global Financials, this menu selection
is inactive. You must define terms in Global Financials. Refer to
your Global Financials online help for more information.

Use Terms Maintenance to define the payment terms you use when invoicing
customers and when vendors invoice you. The system uses terms in several
windows, including Customer Maintenance, Customer Order Entry, the
Estimating Window, Receivable Invoice Entry, Vendor Maintenance, Purchase
Order Entry, and Payable Invoice Entry.

To add terms:

1. Select Admin,
   Application Global Maintenance.
2. Select Accounting
   Maintenance, Terms Table.
3. Click the Insert
   button.
4. In the Discount Terms
   section, specify the following information:

Type Click the
Type arrow and select the type of discount
term:

Age of Invoice
If discounts are based on a specific number of days from the invoice
date, select the Age of Invoice option. If you select Age of Invoice,
you must enter the number the days you will offer the discount and
the discount percentage.

Day of month If
discounts apply only if payment is received before the next occurrence
of the day of month you specify, select the Day of month option. If
you select Day of Month, you must enter the day of the month you want
to use and the discount percentage.

Specified Date
If discounts apply only if payment is received before a specific date,
select the Specified Date option. If you select Specified Date, you
must enter the fixed date you want to use and the discount percentage.

Invoice age, day of month
If discounts are based on a combination of a specific Invoice age
and day of the month, select the Invoice age, day of month option.
If you select Invoice age, day of month, you must enter the number
of months and day of the month you want to use and the discount percentage.

EOM, no of days
If discounts are based on a specific day of the month but several
months from the invoice date, select the EOM, no. of days option.
If you select EOM, no. of days, you must enter the number of months
you want to allow, the day of the month on which the discount will
end, and the discount percentage.

For example, if you select EOM, no. of days
and enter:

Months = 2

Day of Month = 7

Discount % = 2.00

VISUAL applies the following discount rule:

2% if paid on or before the 7th day of the
month, 2 months from the invoice date.

If the invoice date is May 10th, 2007, VISUAL
applies the discount until July 7th, 2007.

5. In the Net section,
   specify the net terms:

Type Click the
Type arrow and select the net type:

Age of Invoice
If payment terms are based on a specific number of days from the invoice
date, select the Age of Invoice option. If you select Age of Invoice,
then you must also enter a number the days you want to use.

Day of month If
payment terms are based on receiving payment before the next occurrence
of the day of month you specify. If you select Day of Month, you must
enter the day of the month you want to use.

Specified Date
If payment terms are based on receiving payment before a specified
date, select the Specified Date option. If you select Specified Date,
you must enter the fixed date you want to use.

Invoice age, day of month
If payment terms are based on a combination of a specific Invoice
age and day of the month, select the Invoice age, day of month option.
If you select Invoice age, day of month, you must enter the number
of months and day of the month you want to use.

EOM, no of days
If payment terms are based on a specific day of the month but several
months from the invoice date, select the EOM, no. of days option.
If you select EOM, no. of days, you must enter the number of months
to allow and the day of the month on which the payment is due.

For example, if you select EOM, no. of days
and enter:

Months = 3

Day of Month = 2

VISUAL applies the following payment rule:

Payment is due on or before the 2nd day of
the month, 3 months form the invoice date.

If the invoice date is May 10th, 2007, the
payment rule is applied until August 2nd, 2007.

Installments If
you want to offer payment terms based on installments, select the
Installment option.

6. In the Freight Terms
   section, specify when the customer pays freight charges. You can
   select:

Prepaid If freight
is due before shipment, select the Prepaid option.

Billed If freight
charges are included in the invoice, select the Billed option.

Collect If the
shipping company collects the freight charges, select the Collect
option.

7. If you selected Installments
   in the Net Type field, click the Installment tab to specify installment
   information.

1. In the
   Period type section, specify whether the installments will be
   based on days, weeks, or months. When you select an option, the
   system changes the period column in the installment table to match
   your selection. For example, if you select weeks as the period
   type, the system inserts the N.Weeks label in the installment
   table.
2. Click
   the Insert button and specify:

N.
Inst The system numbers the installments in sequential order.

%
Inst. Specify the percentage of the total due for the installment.

N.
[Period] Enter when the installment is due. For example,
if you selected Days as the Period Type and entered 10 in the N.Days
column, then the installment is due 10 days after the invoice date.

3. Repeat
   step b to enter additional installments. The total of all installments
   must equal 100%.
4. If you
   are working with installments and you want the payment to be due
   at the end of the month, select the Due Date
   at the End of the Month check box in the Installments section.
5. If you
   enabled VAT and you want VISUAL to include the VAT amount on the
   first installment, select the VAT Amount on
   First Installment check box in the Installments section.

8. To generate a Term ID
   and Description, click the Gen ID and Desc
   button. The system builds an ID and Description based on the terms
   you set up. Typically, the system lists any discount percentage
   associated with the term followed by the net due information.
   For example, if you created a term that offered a 1.5% discount
   if paid by 10 days after the invoice date with the net amount
   due in 30 days, the system would use 1.5%10Net30 as the ID.

You can also specify your own ID and description.

9. Click the Save
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help