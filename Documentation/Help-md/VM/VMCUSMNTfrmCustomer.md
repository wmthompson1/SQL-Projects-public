Adding New Customers




# Adding a New Customer

1. Select Sales,
   Customer Maintenance. If you are licensed
   to use project/A&D functionality, select Contracts, Customer
   Maintenance.
2. Enter the new Customer ID. To comply with the European Union
   GDPR rules, we recommend that you do not use personal information,
   such as a name, for the ID. See [What
   Is Individual Privacy?](VMINDPRVWhat.md).

2. Enter the customers address
   information in the Sold to address fields.
3. If the billing
   address for the customer is different from the Sold to address,
   enter the billing address in the Bill to address fields.

5. If you want to inactivate
   this new customer, clear the Active check box.

For example, you may be entering this customers
information and want to inactivate the account until you have completed
a credit check.

6. Specify this information
   in the General tab:

SIC Code - Specify the customer's SIC code.

Industrial Code - Specify the customer's industrial
code.

Discount Code - Specify the customer's
discount code. This feature lets you associate a discount with this
customer. This trade Discount appears in Customer Order Entry in the
line item field entitled Disc %. Notice that this data field has a
push button that lets you browse on the available codes. If you are
unsure of which one to use, press the Discount
Code button and select a code from the Discount Code table.
If you do not see the appropriate discount code, see [Entering
Discount Codes](Entering_Discount_Codes.md).

Label
ID - Click the Label ID browse button to select a Label ID
for the customer if you use the BTS (Barcode Transaction Service)
module.

Price
Group - This feature is reserved for future use.

Sales Rep ID - Specify the salesperson code for
this customer. This is the salesperson that services this customer.
Enter the Sales Rep ID or click the Sales Rep ID
button and select it from the Sales Reps Table. To add sales reps,
see [Entering Sales Reps](Entering_Sales_Reps.md).

Territory - Specifythe sales territory in which
the customer is located. You can also select from the drop down box.

Market - Click the Market arrow and select the
type of market with which you want to categorize this customer.

Priority - Click the Priority arrow and select
the priority you want to assign to this customer.

Account Open - Specify the date your company opens
this customer account. If you leave this field blank, VISUAL enters
the current date in this field when you save the new customer information.
If you have modified
this account, the date on which you last made changes appears in the
Account Modified field.

7. If this customer is
   an internal customer, select the Internal
   check box on the General tab.

If you are licensed to use multiple sites,
customers you designate as internal are used when you create internal
purchase orders. Use internal purchase orders to move inventory between
two sites in different accounting entities.

8. If this customer must
   use a Return Material Authorization for their returns, select
   the RMA Required for Return check box
   on the General tab..

9. On
   the Contact tab, click the Contact browse
   button and select the contact to use for the primary contact.
   When
   you designate the primary customer contact, it is displayed in
   the Contact tab. The changes you make in the Contact tab
   are also made in Contact Maintenance where you
   can also associate contacts with
   the
   customer and change the primary contact. See [Entering
   Information on the Customers Tab](VMCONMNTfrmContact.md) for more information.
   You
   can also assign contacts to customers in the Contact Maintenance
   window.
10. To specify the primary
    contact specify
    the customer contact using one of these methods:

Select an alternate contact
with a registered Contact ID -
Click the Contact browse button and select a
contact from the browse table showing contacts assigned to the customer.
Select the Primary check box. Click the
Save toolbar button.

Select a contact from all
contacts with a registered Contact ID -
Click the Contact browse button and then click
the Associate existing contact toolbar
button. Select a contact from the Contacts dialog. Click Ok.
In the Contacts for Customer dialog, select the Primary
check
box. Click the Save toolbar button.

Specify a new contact in
the Customer Maintenance window -
When
no primary contact exists for the customer the contact fields are
empty. Enter
the contact information in the fields and click Save.
The contact becomes the primary contact, and a contact ID is
generated.

Specify a new contact in
the Contacts for Customer dialog -
Click the Contact browse button. Click the
Add New Contact button
and specify contact information in the General tab and Address tab
fields.  Select
the Primary check
box for that contact and click the Save
toolbar button.

* To
  clear the Contact tab, click
  the Contact browse
  button and clear the Primary
  check
  box. Click the Save toolbar
  button. The Contact tab is cleared. The contact is still associated
  with the customer, but is  no longer the customer's
  primary contact.

Specify
this information:

Contact- Specify the contacts full
name. The Contact ID field is not modifiable.

Position Specify the contacts position
in the company or title.

Salutation Specify
the salutation to use for correspondence with this customer contact.
You can specify a new salutation or click the arrow and select a salutation
from the list.

E-Mail  Specify the contact persons
e-mail address.

Phone/Ext  
Specify the telephone number, with area code and extension, for the
contact. This may be a direct line to the contact, or a generic company
line.

Fax  Specify
the area code and Fax number.

Mobile Phone 
Specify the contact persons mobile/cellular phone number.

Web User ID  If
you have a web site and require the contact to enter a user ID to
access it, enter the customers User ID. This may be the direct contacts
user ID, or a generic one for anyone at the customer location to use.

Web Password 
If you have a web site and require the contact to enter a User ID
and password, enter the password in this field. This must correspond
to the Web User ID. When you enter a password, asterisks replace the
characters you type.

Depending
on your database engine, and whether you enforce strong passwords,
this may or may not be case sensitive. Refer to your database software
documentation for information about passwords.

Confirm  If your customer requires
a User ID and Password to access your web site, you must confirm the
user password. The Confirm Password entry must exactly match the entry
in the Web Password field upon saving the customer record. If password
entries do not match, you must correct the error.

10. Click the Entity Credit
    Limit tab to enter credit limit information for the customer.
     If you are licensed to use multiple entities, you can define
    credit limit information for each of your entities. If you are
    licensed to use a single site, define credit limit information
    on an enterprise-wide basis. Specify this information:

Entity ID - If
you are licensed to use multiple entities, click the arrow and select
the entity for which you are defining credit limit information. All
information you define on this tab applies to the selected entity
only. If you are licensed to use a single entity, this field is unavailable.

Credit
Limit - The dollar amount for the credit that is extended to
this customer. The limit is expressed in the selected entitys entity
currency.

Credit Balance
The amount of credit the customer has not used is inserted. The
setting you specified in the Customer Balance Method section in Accounting
Entity Maintenance determines how this value is calculated. One of
these totals is subtracted from the Credit Limit to determine the
credit balance:

* Open Orders
  + Uninvoiced Shipments + Open A/R Invoices
* Uninvoiced
  Shipments + Open A/R Invoices
* Open A/R Invoices

You cannot edit this field.

Recv
Age Limit - The number of days at which you will no longer
allow orders to be taken without a payment from the customer. When
the Age Limit is exceeded, VISUAL displays a message when entering
a new order. An entry is not required.

Credit Status
- Drop down menu for selecting the status for the customer. The available
selections are:

OK - There are no
restrictions on the customer.

On Hold - The system
does not allow an order to be placed by this customer or a shipment
to be sent to this customer.

Orders on Hold -
The system does not allow this customer to place an order.

Shipments on Hold
- The system does not allow a shipment to go to this customer.

Credit Limit
Control Specify whether users can save orders for this customer
if the customer's credit balance exceeds the customer's credit limit.
Specify one of these options:

Override Allowed
Select this option to allow users to save orders when the credit
balance is greater than the credit limit. A dialog is displayed to
warn users that the credit limit has been exceeded, but users can
still save orders.

No Override Select
this option to prevent users from saving orders when the credit balance
is greater than the credit limit. A dialog is displayed informing
users that the customer has exceeded the credit limit and the order
cannot be saved.

Ship
Credit Limit Control Specify whether to check the customers
credit limit when orders are shipped. If you decide to check the customers
credit limit, and the customer has exceeded the credit limit, you
can specify whether users are allowed to ship the order. Specify one
of these options:

No Credit Evaluation
Select this option if you do not want to check the customers credit
limit when the shipment is saved. If you select this option, then
the customers credit limit is checked only when sales orders are
saved.

Override Allowed
Select this option to allow users to save packlists for customers
who have exceeded their credit limit. A dialog is displayed to warn
users that the credit limit has been exceeded, but users can still
save packlists.

No Override Select
this option to prevent users from saving packlists for customers who
have exceeded their credit limit. A dialog is displayed informing
users that the customer has exceeded the credit limit.

# Days Oldest Unpaid Invoice The system identifies
the customer invoice on which net payment has been outstanding the
longest. The system calculates the number of days that payment is
delinquent and displays the result in the # Days Oldest Unpaid Invoice
field. The system calculates the number of days based on your selection
in the Oldest Unpaid Invoice section.

Oldest Open Invoice
Select how you would like to define the oldest past due customer invoice.
The system uses this information in conjunction with the Recv. Age
Limit field in Customer Order Entry. If the customer has an unpaid
invoice older than the receivable age limit, the system warns you.
If you are creating a new customer, the system inserts the default
value defined in Application Global Maintenance. You can override
the default setting by selecting one option:

Determined by Invoice Date
If you select this option, the system uses the date of the invoice
to identify the oldest past due invoice.

Determined by Due Date
If you select this option, the system uses the date by which the
full amount of the invoice should be paid to identify the oldest past
due invoice.

For more information on choosing a default
setting in Application Global Maintenance, refer to [Setting
Order Management Global Values](Setting_Order_Management_Global_Values.md).

Credit
Threshold In the Credit Threshold box, specify credit ratings
thresholds for the customer. Credit ratings are expressed as the percentage
of the credit line that the customer has consumed. If you specify
credit thresholds and a credit limit in the Credit Limit field, the
system displays the appropriate credit rating icon in the Customer
Order Entry window. You can see at a glance if the customer is credit-worthy.

Specify the following credit rating information:

Acceptable The
upper limit of the Good credit rating is 100%. You cannot change this
value. Enter the lower limit of the Good credit rating. You must enter
a whole number.

Warning The system
inserts the number you specified as the lower limit of the Good credit
rating in the upper limit field of the Warning credit rating. Enter
the lower limit of the Warning credit rating. You must enter a whole
number.

Unacceptable The
system inserts the number you specified as the lower limit of the
Warning credit rating in the upper limit field of the Unacceptable
credit rating. The system enter 0 for the lower limit of the unacceptable
credit rating.

Settlement Threshold In the Settlement Threshold
box, specify the settlement ratings thresholds for the customer. If
you specify settlement thresholds, the system displays the appropriate
settlement rating icon in the Customer Order Entry window. You can
see at a glance if the customer has a good track record of paying
invoices on time when you enter a new order. Settlement ratings are
expressed as the percentage of invoices that the customer paid on
time. Specify the following information:

Today - ## days
Specify the time period you want the system to use to evaluate payments.
The system subtracts the number of days you specify from the current
date and evaluates payments during that time period. For example,
if you want the system to evaluate payments over the last year, enter
365. This number must be greater than the number you specified in
the Recv Age Limit field.

Acceptable The
upper limit of the Good settlement rating is 100%. You cannot change
this value. Enter the lower limit of the Good settlement rating. You
must enter a whole number.

Warning The system
inserts the number you specified as the lower limit of the Good settlement
rating in the upper limit field of the Warning settlement rating.
Enter the lower limit of the Warning settlement rating. You must enter
a whole number.

Unacceptable The
system inserts the number you specified as the lower limit of the
Warning settlement in the upper limit field of the Unacceptable settlement
rating. The system enter 0 for the lower limit of the unacceptable
settlement rating.

11. Click on the Accounting
    tab and enter the following accounting information for the customer:

Tax
ID Number - If you have NOT enabled VAT, enter the customers
Tax Identification number. Enter the number supplied by the customer.
An entry is not required.

Terms
- Click the Terms button and select the default payment terms for
this customer. If you do not specify a value, then the default terms
that are specified on the Defaults tab in Application Global Maintenance
are inserted when you save the record. If you do not specify a value
in the Terms field and default terms have not been defined in Application
Global Maintenance, then the terms ID that is specified in the Due
on Receipt ID field in Application Global Maintenance is inserted.
If the Due on Receipt ID field is blank, then the first ID in the
database that meets the criteria for due on receipt is used. See [Adding Terms](Entering_Information_in_Terms_Maintenance.md).

Currency
ID - A unique abbreviation code used to describe the currency
exchange rate. An entry is not required.  After you set
this and perform a transaction with this customer, you cannot change
the Currency ID.

Default
Transaction Currency - A unique abbreviation code used to describe
the customers default transaction currency. This may be different
than the above Currency ID.

Def
Tax Grp ID - This is the default Tax Group ID for this customer.
An entry is not required.

Enter the Def Tax Grp ID or select it from
the table by clicking on the Def Tax Grp ID
button.

Default
A/R Account ID - Select the default accounts receivable group
you want VISUAL to use for this customer.

If you are not running the Project or Aerospace
and Defense versions of Infor VISUAL, the following fields appear
grey.

Deferred
Rev Account ID -

Liquidation
Account ID -

P/B
Credit Account ID -

For more information about VISUAL for Project-Based
Manufacturers or Infor VISUAL Aerospace and Defense, contact your
Infor Global Solutions Partner.

Customer
is tax exempt - If this box is not checked, the customer is
not exempted from tax.

Allow
Invoice Over Payments - If you want to allow invoices for over
payments for this customer, select this check box.

Compute
tax on wholesale price - This check box governs how VISUAL
computes taxes for this customer.

Print
dunning letters when appropriate - Click on this check box
if the letter demanding payment is to be printed after the expiration
of the receiving age limit.

Allow
Closed Period Invoice Adjustments - If you want to allow adjustments
to closed periods for this customer, select this check box.

Suppress Printing of Invoices If you do not
want to print the current customers invoices, select this check box.
If you select this option, you can manually print the customers invoices
from within Invoice Entry. Additionally, if you select this option,
any invoices for the current customer appear on the List of Unprinted
Invoice(s) report, which you can access from within the Invoice Forms
window.

Suppress Printing of Customer Statement If you
do not want print customer statements for this customer, select this
check box. If you select this option, the customer will not be included
when you run Customer Statements in Receivables Invoice Entry.

12. If you want to use the
    User Defined fields, click the User Defined tab.

You
can use these fields for any purpose. To assign field labels, refer
to Using User Defined Field Labels topic.

13. If you need to set VAT
    information for this customer, click the VAT tab and enter the
    appropriate information.

VAT
Registration - Enter the customers VAT Registration number.

VAT
Code - Click the browse button and select a VAT code for this
customer.

Invoice
VAT Book Code - Select the appropriate VAT Book for the customer.

Memo
VAT Book Code - Select the appropriate VAT Book for the customer.

Customer
is VAT Exempt - Click on this check box if the customer is
not required to pay VAT.

VAT
is Discounted if Within Terms - If you want VISUAL to discount
the VAT amount if the customer pays the invoice within the terms limit,
select the VAT is Discounted if Within Terms check box.

VAT
is Always Discounted - If you want VISUAL to always discount
the VAT amount, select the VAT is Always Discounted check box.

Customer
VAT Code Overrides Part VAT - If you want VISUAL to calculate
the VAT amount based on the customer setting rather than those for
the part, select the Customer VAT Code Overrides Part VAT, check box.

14. If you need to set Intrastat
    information for this customer, click the Intrastat tab and enter
    the appropriate information.

Port
of Arrival - Enter the port of arrival for this customer.

Port
of Transshipment - Enter the port of transshipment for this
customer. A port of transshipment is the location from which goods
are shipped.

Country
ID - Select the customers country ID.

Nature
of Transaction - Enter the nature of transaction for this customer.

Nature of Return Transaction - Enter the nature
of the return transaction for this customer.

Mode
of Transport - Enter the method by which goods are delivered
to the customers port of arrival.

Siret
Number - Enter the customers siret number. A siret number
is a French company ID number.

15. If you need to set Order
    Management information for this customer, click the Order Mgt
    tab. If you are licensed to use multiple sites, specify order
    management information on a site-by-site basis. If you are licensed
    to use a single site, specify order management information on
    an enterprise-wide basis. Specify this information:

Site ID - If you
are licensed to use multiple sites, click the Site ID arrow and select
the site for which you are defining order management information.
If you are licensed to use a single site, this field is unavailable.

Primary Warehouse - Click the browse button and
select a primary warehouse from where you will ship orders to this
customer.

Customer Type - Click the browse button
and select the type of customer. See [Entering
Customer Types](Entering_Customer_Types.md).

Priority Code - Click the browse button and select
a priority assignment for this customer. See [Entering
Customer Priority Codes](Entering_Customer_Priority_Codes.md).

Order Fill Rate - Click in the Order Fill Rate
field and enter an fill rate for this customer's orders.

Fill
Rate Type - Click the Fill Rate Type arrow and select a Fill
Rate Type for this customer. You can select either Line
Level or Whole Order.

Allocation Fence - Click in the Allocation Fence
field and enter the amount you want to allocate to this customer.

C/O
Allocation Level - If you use the Auto Allocate function, specify
the type of allocation to use:

Full
Allocation Specify this allocation level if the customer
order must be fully supplied before it can be accepted.

Partial
Allocation Specify this allocation level if the allocation
optional.

Alternate warehouses
- Click the browse button and select the alternate warehouses you
want to use for this customer. This browse button is available only
if you selected the Allocations Require Warehouse/Location option
in Accounting Entity Maintenance

Customer WIP/VAS
- Click the browse button and enter the WIP/VAS information for this
customer.

Disbursement Fill Rate - This value is determined
by the customers priority. The Disbursement Fill Rate determines
how much of the available quantity in a warehouse is available to
the customer at the time of order fulfillment. For example, if a customer
fill rate is 100, the customer is allowed access to 100% of the available
stock; if the customer fill rate is 70, the customer is allowed access
to 70% of available stock.

Reallocation - If you want VISUAL to reallocate
parts material for this customer. select the Reallocate check box.

Consolidate Orders - If you want VISUAL to consolidate
orders for this customer instead of treating orders as individual,
select the Consolidate Orders check box.

Compliance Labeling - If you want VISUAL to generate
compliance labels for the shipments to this customer, select the Compliance
Labeling check box, For more information on Compliance Labeling, refer
to Compliance Labeling.

Auto
Allocate - If you want VISUAL to automatically assign parts
and materials to this customer's orders, select the Auto Allocate
check box.

Email
Invoices Use this check box to specify how invoices from
the site are generated in Invoice Forms for the customer. Select this
check box to e-mail invoices to the customer. When you generate invoices
for the site in Invoice Forms, invoices for this customer will not
be printed. A PDF of the invoice will be created and saved to the
file location specified in the Document Maintenance window. After
invoice generation is complete, use the Email Invoices dialog in Invoice
Forms to send the e-mails.

You can specify the customer contacts who
receive e-mailed invoices in the Email Documents dialog. See [Maintaining
Customer E-mail Document Lists](Maintaining_Customer_E-mail_Document_Lists.md).

Clear this check box to print invoices to
mail to the customer.

16. For
    more information on E-Commerce, refer to Setting General Customer
    [E-Commerce
    Preferences](Setting_General_Customer_E_Commerce_Preferences_.md).

17. For
    more information on specifying Language forms, refer to [Specifying
    Customer Language Forms](Specifying_Customer_Language_Forms.md).
18. You can enter the following
    information in the Shipping tab:

Carrier ID - Specify a preferred carrier code
for shipments to this customer. When a shipment is made, this carrier
is used by default. You can override the default value in Shipping
Entry. Add carrier codes in Application Global Maintenance.

Default Shipto ID - Specify the default address
for shipments to this customer. You can override the default value
in Shipping Entry.

Free On Board - Specify the Free on Board code
for this customer. Use this code to specify the point during the shipping
process that this customer becomes responsible for freight charges.

Ship Via - Click the Ship Via browse or arrow
button and select a ship via code for shipments to this customer.
Add ship via codes in Application Global Maintenance.

Ship Charge Acct If you have specified the customer
account to charge when shipments are sent by the selected ship via
method, the account ID is displayed. See [Adding
Customer Shipment Accounts](Adding_Customer_Shipment_Accounts_vmcusmnt.md).

Customer Accepts Partial Shipments - If the customer
accepts partial shipments, select the Accepts Partial Shipments check
box. If the customer only accepts full shipments, clear this check
box. If you use [consolidated sales](Consolidated_Sales.md),
ensure that you select this check box.

Accepts
Early Orders - To allow shipments of orders to this customer
prior to the desired ship date specified on the customer order, select
this check box. After you select the check box, specify the number
of days before the desired ship date that you can ship orders to this
customer. If you cannot ship orders to this customer prior to the
desired ship date, clear this check box.

Pallet Details Required - If pallet details are
necessary for all shipments to this customer, select this check box.
To generate pallet details, you must specify carton information for
a part.

Match Invoice ID to Packlist ID - To use the same
ID for both the packlist and A/R invoice, select this check box. If
you select this check box, you must print Before Shipment packlists
to match the packlist ID and invoice ID. See [Matching
Invoice IDs to Packlist IDs](Matching_Invoice_IDs_to_Packlist_IDs.md).

If you do not want to use the same ID for
the packlist and the invoice, clear this check box.

Customs Documentation
- In the Customs Documentation section, click one of these options:

Do
Not Print If you do not want to print customs documentation
for this customer, click this option.

Print
by Packlist To print customs documents for this customer
by packlist, select the Print by Packlist option button. Only consolidated
packlists are eligible for printing as customs documents.

Print
by Bill of Lading To print customs documents for this customer
by bill of lading, select the Print by Bill of Lading option button.

19. If this customer is
    a 3PL customer, click the 3PL tab and enter the appropriate information

For more
information on specifying 3PL customers, refer to [Specifying
3PL Customers](Specifying_3PL_Customers.md).

20. Click on the Specs tab
    and enter your comments about this customer.
21. Click Save
    to save the new Customer information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCUSMNTfrmPartPricing.md)
Setting Customer Part Pricing