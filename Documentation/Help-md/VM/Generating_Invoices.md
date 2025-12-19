Generating Invoices




# Generating Invoices

During the Printing Invoice process, VISUAL generates
the invoices. You can view and post the invoices through Account Receivable
Invoice Maintenance.

When you generate an invoice through Project Billing Events, the
invoices are not posted to the general ledger. You must post the invoices
to the general ledger through Accounts Receivable Invoice Maintenance.

VISUAL provides you with several methods of outputting your project
invoices:

* Print
* Viewing on screen
* File
* E-mail

### Printing Invoices

To print and generate invoices:

1. Open the Project Billing
   Entry window.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are printing invoices.
   You can print invoices on a site-by-site basis only. If you are
   licensed to use a single site, this field is unavailable.
3. From the File menu,
   select the Print Invoices option.
4. If any of the invoices
   are attached to international orders, click the Language ID arrow
   and select a language for the invoice.
5. In the Date Setting
   section, select Current, Event
   Date, or Specified. If you select
   Specified, click the calendar button and select the date you want.
6. Select the appropriate
   print options:

Print Only - Do Not Save
Invoice # If you want to print draft invoices and you do
not want to generate the actual invoice record in your database, select
the Print Only option.

When you select the Print Only option, you
have the option to view the invoice on-screen only.

Printing for view generates invoice numbers
but does NOT save the invoice number and does not transfer it to your
general ledger, the next time you print invoices, VISUAL does the
transfer.

Use Pre-numbered Forms
If you are using pre-numbered forms, select the Use Pre-numbered
Forms check box and enter the number on which the forms start in the
Starting Form Number field.

Use Current Exchange
Rates If exchange rates are involved in your invoice calculations
and you want to make sure VISUAL uses the latest exchange rates, select
the Use Current Exchange Rates check box.

7. Select the appropriate
   format option in the Format section.

You can select the standard QRP format,
or one of three user defined formats.

The Samples section is helpful in setting
up your printer correctly. If necessary, select the appropriate sample
options:

Print Samples Only
If you want to print samples ONLY of your invoice form, select the
Print Samples Only check box.

Zero Sample Forms
Select this option if you do NOT want to print any sample invoices
before printing actual invoices.

1 Sample Form
Select this option to print one sample invoice when you select the
Print Samples Only check box.

3 Sample Forms
Select this option to print three sample invoices when you select
the Print Samples Only check box.

8. To print the invoices,
   click the Ok button.

If you have NOT selected the Print Only
- Do Not Save Invoice # check box, a notification dialog is displayed
indicating that VISUAL printed invoices and it transferred them to
Accounts Receivable.

If you selected the Print Only - Do Not
Save Invoice # check box, the notification dialog states that VISUAL
printed invoices and it did NOT transfer them to Accounts Receivable.

9. To close the dialog
   , click Ok.

The Print Invoices dialog also closes.

## Printing Duplicate Invoices

To print duplicates of your invoices:

1. Open the Project Billing
   Entry window.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are printing duplicate
   invoices. You can print duplicate invoices on a site-by-site basis
   only. If you are licensed to use a single site, this field is
   unavailable.
3. Select the Order whose
   invoices you want duplicate.
4. From the File menu,
   select the Print Duplicate Invoice(s)
   option.

The Reprintable Invoices dialog is displayed
populated with a list of invoices for the order and customer you selected.

4. To select the invoice
   you want to reprint, click the row header.

To select multiple continuous lines, select
the first line, press the SHIFT key, and select the last line you
want. All of the lines you select appear highlighted.

To select multiple discontinuous lines,
press and hold the CTRL key while selecting each lines you want.

5. Click Ok.

6. Select the printing
   options you want to use for this print run.
7. Click Ok.

VISUAL prints the invoices you selected
using the setting you selected.

## E-mailing Invoices

You can use this feature to e-mail invoices to the associated customer
contacts. This feature is useful if you want to e-mail invoices instead
of, or in addition to, printing. You can also use this feature to
preview the invoices selected to be e-mailed before sending them to
the recipients. The e-mailing invoices process allows you to preview,
e-mail, and print invoices by site, customer, beginning and ending
dates, and invoice types. When you run the process the e-mails are
consolidated by customer and by site.

Note: If no e-mail address is associated
with a contact, the e-mail is generated for preview, where you can
then add the e-mail address of the recipient.

To e-mail invoices:

1. From the A/R Invoice
   Entry window, select File, Email
   Invoices.
2. If you created invoices.
   If you select \*\*All\*\* in the Site ID
   field, all sites are selected. If you are licensed to use a single
   site, this field is unavailable.
3. To e-mail invoices to
   a particular customer, specify the Customer ID in the Customer
   ID field.
4. Specify a date range
   in the Begin Date and End Date fields for the invoices that you
   want to e-mail.

If you do not specify a date range all invoices
for the selected customer and sites are e-mailed.

5. Select the check box
   of the types of transactions that you want to e-mail. You can
   select any of these types of invoice documents:

AR Invoices
Select this check box to e-mail Account Receivables invoices to the
contacts e-mail address associated with the customer. If you access
the Email Invoices dialog from the Account Receivables Invoice Entry
window, this check box is already selected.

MFG Invoices
Select this check box to e-mail manufacturing invoices to the contacts
e-mail address associated with the customer. If you access the Email
Invoices dialog from the Account Receivables Invoice Forms window,
this check box is already selected.

Progress Billing
Select this check box to e-mail progress billing invoices to the
contacts e-mail address associated with the customer. If you access
the Email Invoices dialog from the Progress Billing Entry window or
the Project Billing Entry window, this check box is already selected.

6. Select one of these
   check boxes to display distributed invoices or invoice drafts:

Show Distributed Invoices
Select this check box to view invoices that have already been e-mailed
or printed.

Show Invoice Drafts
Select this check box to display invoice drafts in the Email Invoices
table. Clear this check box to display only finalized invoices.

7. To review e-mails before
   you send them, select the Preview Emails
   check box. After you click the Run toolbar
   button, the e-mails are opened for your review. The content of
   the e-mail is generated based on the e-mail template that you
   set up for AR Invoices in Notification Maintenance.
8. Select or specify information
   in the Email Invoices table:

Email Select
the check box in this column for each invoice that you want e-mailed.
When you click the Run toolbar button, e-mails are created for the
selected invoices. If the check box is clear, no e-mails are created
for the invoice.

Print Select
the check box in this column to print the invoices to the default
printer. When you click the Run toolbar button, the selected invoices
are printed.

9. Review this information
   in the Email Invoices table:

Customer ID
Specifies the Customer ID.

Customer Name
Specifies the customer name.

Site ID Specifies
the Site ID of the record.

Invoice ID Specifies
the Document Invoice ID. If the document invoice is a draft, then
the ID displays Draft as a suffix.

Invoice Type
Specifies the document invoice type created. If the Print Only check
box was selected for the document invoice type, then draft is added
as a suffix to the invoice type. These are the invoice types: AR Inv
for an Account Receivables invoice, Memo for an Account Receivables
memo, Mfg Inv for a Manufacturing invoice, and PB Event for a Progress
Billing invoice.

Customer Order ID 
Specifies the customer order ID on an invoice line. If there are multiple
customer order IDs, each Customer Order ID is separated by a comma.

Note:
The Customer Order ID is printed in place of the %ARInvoiceCustOrderID
on the email notification.

Customer PO Reference
 Specifies the Customer PO Reference on a Customer Order ID
that is on an invoice line. If there are multiple Customer PO Reference
numbers, each Customer PO Reference is separated by a comma.

Note:
The Customer PO Reference is printed in place of the %ARInvoiceCustPORef
on the email notification.

File Exists
Specifies a Y if the document invoice file exists, and N if it
does not.

File Link Specifies
the file path to the invoice. You can click the file path to drill
down to the invoice and further review the invoice details.

Invoice Date
Specifies the invoice date for Account Receivables invoices and Manufacturing
invoices.

Invoice Amount
Specifies the invoice amount for Account Receivables invoices, Manufacturing
invoices, and Progress Billing invoices.

Currency ID
Specifies the currency identifier applied to the invoice.

Prepaid Order ID
Specifies the Prepaid Order ID listed on the invoice for a customer
deposit or prepayment.

Prepaid Invoice ID
Specifies the Prepaid Invoice ID listed.

Last Distributed
Specifies the date that the invoice was last distributed.

Recipients Specifies
a listing by e-mail address of those customer contacts receiving the
invoice distribution.

10. You can select to all
    invoices in the Email Invoices table for e-mailing by clicking
    the Email - check all rows toolbar button.
    Click the Email - uncheck all rows toolbar
    button to clear all invoices from being e-mailed.
11. You can select to all
    invoices in the Email Invoices table for printing by clicking
    the Print - check all rows toolbar button.
    Click the Print - uncheck all rows toolbar
    button to clear all invoices from being printed.
12. Click the Run
    toolbar button to e-mail and print the invoices or draft invoices
    with Email and Print
    check boxes selected. A message is displayed noting the
    processed invoices.

If any invoices are misprinted you can reprint
them using the Print Duplicate Invoice options.

### Setting up your E-mail Preferences

Accounts receivable invoices are e-mailed using your preferred e-mail
client. Before you e-mail invoces, make sure that your e-mail settings
are correctly configured for your installed e-mail client.

To setup your e-mail preferences:

1. From your Email Invoices
   dialog, select Options, Mail
   Client Settings.
2. Select your installed
   e-mail client to be the default from the Email
   Client drop-down list.
3. Specify your server
   address in the Server Address field. Use your e-mails host name
   of the outgoing SMTP server address, for example smtp.example.com.
4. Specify the server port
   number to use in the Server Port field. The port number is used
   by the outgoing SMTP mail server. Commonly used port numbers are
   25, 465, and 587, but check with your e-mail service.
5. Specify the user name
   for your default e-mail account in the User Name field. This is
   often your full e-mail address.
6. Specify your user password
   in the User Password field. This is the password that you use
   to sign in to your default e-mail account.

Select and hold your mouse down on the Show check box to view your password; otherwise,
the field display is automatically encrypted.

7. To enable SSL (Secure
   Socket Layer) security, which is required by some SMTP providers,
   select the Use SSL Security check box.
8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Billing_Inquiry.md) User-defined Help