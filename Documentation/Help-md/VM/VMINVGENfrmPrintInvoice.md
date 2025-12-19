Setting Up Invoice Generation



  
 
  
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

# Setting Up Invoice Generation

Use the Invoice Forms command to print invoices for
shipped customer orders. VISUAL supports pre-numbered forms or auto
numbering of forms. If you are using Infor VISUAL Financials, you
can also have this process create actual receivable invoices.

If you selected the Retain excess balance for future
shipments option on the [Shipment
Trk tab in Site Maintenance](Setting_Shipment_Tracking_Information.md), certain options may be disabled in
Invoice Forms. If at least one customer order has been partially shipped
and has a pre-invoice applied to it, the system disables the Create
A/R Invoices, Combine All Packlists for an Order on One Invoice, and
Combine All Packlists for a Customer on One Invoice options. You can
re-activate these options by generating invoices for pre-invoiced
orders with partial shipments. To identify these orders, print the
[List
of Pre-Invoiced Orders with Partial Shipments](Printing_a_List_of_Pre-invoiced_Orders_with_Partial_Shipments.md) report. Then, use
the [Generate/Print One Invoice](Printing_Invoices_2.md)
option available on the File menu to generate an invoice for each
order in the List of Pre-Invoiced Orders with Partial Shipments report.
After you generate each invoice, the system reactivates the Create
A/R Invoices, Combine All Packlists for an Order on One Invoice, and
Combine All Packlists for a Customer on One Invoice options.

To generate invoices:

1. Select Invoice
   Forms from the Sales menu.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site whose invoices you are generating. If you are licensed to
   use a single site, this field is unavailable.
3. If you want to generate
   invoices for a date range, click the Invoice From Date calendar button and select
   the beginning date of the range you want to use.

Click the Invoice Through Date calendar button and select
the date though which you want to generate invoices.

4. If you want to select
   a language, click the Language ID arrow and select the language
   you want to use.
5. If you want to generate
   invoices for a range of your customers only, click the Starting and Ending
   Customer ID buttons and select the customers for which
   you want to generate invoices.
6. Select the printing
   options you want to use:

Print
Draft - Do Not Save Invoice #s - VISUAL saves the Invoice ID
and Invoice Date with each packlist when you print invoices indicating
that you have invoiced the packlist. If you want to print invoices
without marking the packlist in this way, select the Print Draft -
Do Not Save Invoice #s option.

Use
Pre-Numbered Forms If you are using preprinted invoice forms,
select the Use Pre-numbered Forms check
box and enter the Starting Form Number and Form Prefix. VISUAL combines
the Form Prefix and Starting Form Number to produce the appropriate
identification for the invoice. For example, if you entered INV- in
the Form Prefix field and 8 in the Starting Form Number field, the
system would generate an invoice ID of INV-8. The Form Prefix field
is optional. If you do not specify a prefix, the system numbers the
invoices without a prefix. If you are generating more than one invoice,
the system will number them sequentially beginning with the value
you specify in the Starting Form Number field.

Create
A/R Invoices - If you are using Infor VISUAL Financials, select
this check box to have VISUAL generate a receivable invoice for each
invoice you print.

Print Traceable Part
Properties - If selected, the part traceable properties appear.

Combine All Packlists
for an Order on one Invoice - If you select this check box,
then all packlists for an order are combined on one invoice, provided
that the packlists are for the site that you specified in the Site
ID field. For example, you cannot combine all packlists for consolidated
sales orders, where multiple sites are specified on the sales order,
on to one invoice. See [Consolidated
Sales](Consolidated_Sales.md).

Combine
All Packlists for a Customer on one Invoice Select this check
box to combine all packlists for a customer that were shipped from
the site that you specified in the Site ID field. One invoice for
each currency used on the customers orders is created.

New Invoice on ShipTo
Change -
This
check box becomes available If you selected the Combine All Packlists
for a Customer on One Invoice check box. Select this check box to
generate separate invoices for each ShipTo address.

Sort by Customer ID (new
only) - If selected, VISUAL prints invoices by Customer ID.

7. If you want to edit
   the freight charges for this invoice, select Actual
   Freight from the Edit menu or click the Edit
   Actual Freight toolbar button and make the changes you
   want.

Actual Freight for a shipment is specified
when shipping, using Shipping Entry.

To save the freight values you have changed,
click the Save and Close
buttons on the Update Actual Freight dialog box.

8. Select the number of
   samples to print:

Print
Samples Only - If you only want to print samples, select the
Print Samples Only check box and select the quantity option you want.
This is useful to ensure that your setup is correct before you run
a large number of invoices and to make sure all data fields line up
properly.

Select the option button for the number
of forms you want:

Zero

One
or

Three

9. Select a print format:

Standard
- If you are printing your invoices to a continuous feed printer,
select Standard.

Print
Form - Select the Print Form option
to print your invoices to a laser printer.

User
Defined - If you have previously set up personalized forms
for your invoices, select the User Defined option you want to use
for this print run. You can customize the labels displayed for user
defined formats. See [Customizing
User Defined Format Labels](Customizing_User_Defined_Format_Labels.md).

10. If you are e-mailing
    invoices, use the Email File Format section to specify the format
    for the attachment. You can select either PDF or RTF format.

Invoices will be e-mailed if these conditions
exist: a valid file path location, an Email Invoices check box that
is selected by site in the Customer Maintenance window, and the contact
or contacts are selected to receive e-mailed documents. If all of
these conditions exist the PDF or RTF invoices are e-mailed when you
click Run in the Email Invoices window. Invoices that do not meet
these conditions are printed.

11. Select the Date Setting.

This specifies the Invoice Date to be used
for invoices. You have three choices:

Current
Date - The current date is used for the invoice date of all
invoices printed.

Shipped
Date - The shipped date of each packlist is used for that packlists
invoice date.

Specified
Date - Enter the date you want to be used for the invoice date
of all invoices printed.

12. Select the date you
    want to appear on your invoices:

Current - If you
want the current date to appear on your invoices, select Current.

Shipped Date -
If you want the date on which you made the shipment to appear on the
invoice, select Shipped Date.

Specified - If
you want a specific date to appear on your invoices, click the Calendar button and select the date you want to
use.

13. If you want to generate
    invoices but not print them, select the Suppress Print check box.
14. From the File menu,
    select Print.

VISUAL prints invoices for all un-invoiced
shipments. VISUAL produces separate invoice lines for each line item,
freight, and application tax.

If you did not select Print Only, VISUAL
saves the invoice number and date with the packlist, and the packlist
is no longer eligible for invoicing.

If you selected Create A/R Invoices, VISUAL
creates an Accounts Receivable invoice for each invoice number. You
can view these in A/R Invoice Entry.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Invoice_Forms.md) User-defined Help