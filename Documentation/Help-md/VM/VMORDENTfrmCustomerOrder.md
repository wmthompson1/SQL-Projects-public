Entering a Customer Order




# Entering a Customer Order

1. If
   you are licensed to use multiple sites, click the Site ID arrow
   and select the site from which the customer is buying items. If
   you are licensed to use a single site, this field is unavailable.
2. Enter
   the date on which the customer placed the order in the Order Date
   field.

The date defaults to the current date.

3. If you are NOT using Auto
   Numbering, enter an Order ID in the Our Order ID.

If you ARE using Auto Numbering, DO NOT
enter an Order ID. VISUAL assigns an Order ID automatically.

See Using Auto Numbering more information.

If
you are editing an existing order, refer to [Editing
a Customer Order](Editing_a_Customer_Order.md).

4. Move
   to the Customer ID field and enter the ID for the customer who
   is placing the order.

If you do not know the Customer ID, click
the Customer ID button and select a customer
from the Customer table.

VISUAL perform a number of checks on this
customer:

If the customers status is set to On Hold,
then you are not allowed to create an order for the customer.

If the customers status is set to Orders
On Hold, you are allowed to create an order, but you must set the
order status to On Hold. VISUAL does not allow to change the status
to Released until the customers account status is Ok again.

If the customer has outstanding payments
older than their Receiving Age Limit, VISUAL notifies you when you
save the order.

If the customers Credit Limit Control is
set to Override Allowed, VISUAL allows you to proceed. Otherwise,
you cannot save the order.

If this new order will cause the customer
to exceed the Credit Limit, VISUAL notifies you when saving the order.
If the customers Credit Limit Control is set to Override Allowed,
VISUAL allows you to proceed. Otherwise, you cannot save the order.

You can set Credit Status, Receiving Age
Limit, Credit Limit, and Credit Limit Control for a customer in Customer
Maintenance.

VISUAL
populates the Shipto ID from your customer. This is the default ship
to address for your customer.

5. Enter the customers PO number.

This is not a required field, but is recommended.
The customer PO prints on the order acknowledgment and allows you
to call up a customers order based on the PO number.

6. Click
   the Desired Ship Date calendar button and select the date on which
   your customer wants you to ship this order.
7. Click the Original
   Promise Date calendar button and select the date you promised
   to ship this order.
8. In
   the Promise Del Date field, click the Calendar button and select
   the date you are promising to deliver this order. This field is
   for informational purposes only.
9. If
   necessary, override the appropriate information in the following
   tabs:

Sold to / Ship to tab:

The
Ship To address defaults to the Sold To address. If you want to use
an alternate shipping address, click the Shipping Address toolbar
button, or select Shipping Addresses from
the Edit menu.

The Shipping Addresses dialog box for the customer
appears.

The table at the top of the dialog box lists
the alternate shipping addresses, if any, for the customer.

To use an alternate shipping address for this
order, select the line of the address you want to use and click the
Use Selected Address button. A dialog box
appears, asking you if you want to reset the customer order header.
Click Yes to continue.

To change back to the customers main address,
click the Use Sold to Address button.

The dialog box automatically closes and the
selected address appears at the bottom of the Sold To/Ship To window,
beneath the Sold To address.

You can also use this dialog box to add, modify,
and delete alternate shipping addresses for the customer.

The Customer ID or a selected alternate shipping
address completes most of the remaining header information. You can
edit all of this information except the Sold To address, which appears
directly from the customer database. The customers currency appears
to the upper-right of the line item table.

Status
- Specify the header status. The status that you specify in the header
is the effective status of all customer order lines that have a status
of Inherit. For example, if you specify Released in the header Status
field, and customer order line 1 has a status of Inherit, then line
1 is also considered to be released. If customer order lines have
a status other than inherit, the header status is ignored.

See [Working
with Order Statuses](Working_with_Order_Statuses.md).

FOB
- Click the FOB arrow and select the Free On Board point you want
to use for this order. This is the point up to which you will pay
for the freight and after which your customer will pay for the freight.

Ship
Via - Click the Ship Via arrow and select the select the shipping
method you want to use for this order.

Ship Charge Acct If the customer requests that
you charge shipping costs directly to the customers account when
you ship items by the ship via method that you selected, specify the
customers account number. If you have specified the customer account
to charge when shipments are sent by the selected ship via method,
the account ID is displayed. See [Adding
Customer Shipment Accounts.](Adding_Customer_Shipment_Accounts_vmordent.md)

Carrier
ID - Click the Carrier ID arrow and select the shipping carrier
you want to use for this order.

Contact tab:

You
can enter contact information directly in the Contact tab fields.
If
you enter information directly in the Contact tab fields, the information
is not stored in your Contacts table. Alternatively, you can click
the Contact
browse
button, select the contact from the existing customer contacts, and
then click the Use
Selected Contact toolbar
button. If the contact you want to use is not yet in the database,
click Add New
Contact.
See [Adding
Contacts](VMCONMNTfrmContact.md).

If
you do not want to assign a contact to this order, click the
Use
No Contact toolbar
button

Monetary Tab:

You can override the following information
in the Monetary tab:

Terms - Click the browse
button and select the appropriate Terms for this order. Refer to [Adding
Terms](Entering_Information_in_Terms_Maintenance.md) for more information.

Cust Bank ID
- Click the browse button and select the appropriate Customer Bank
ID for this order.

Currency
ID - Click the arrow and select the appropriate currency type
for this order.

EDI tab:

You can override the following information
in the EDI tab:

EDI
Blanket Order - An order you place for a given period of time
that stands until the quantity an outside vendor ships matches the
total quantity that you ordered in the blanket order. After the quantities
shipped match the total quantity ordered, you need to place a new
blanket order to continue to receive parts. For example, rather than
placing 100 individual purchase orders of 1000 pieces, you can blanket
order 100,000 pieces at once.

EDI
Release - Select this check box to mark the order as an EDI
release. This allows you to create outbound transactions using the
Infor VISUAL Data Interchange (VMDI) module.

EDI
Order Changed - Select this check box if this order has changed
from when your originally entered it.

EDI
Blanket Number - The authorization number for the total quantity
of parts on the blanket order.

Contract
ID - The contract ID for the delivery schedule.

EDI
Release Number - The EDI release number of the shipment.

Other tab:

You can override the following information
in the Other tab:

Sales Rep - Click
either the browse button or the arrow and select the appropriate Sales
Rep for this order. Because the Sales Rep you select here controls
the commissions for this order, Make sure you have selected the correct
sales rep.

Territory
- Enter the sales reps territory.

Sales
Tax - Click either the browse button or arrow and select the
appropriate Sales Tax setting for this order.

Discount Code
- This determines the default line item discount.

VAT
Reg. # - Enter the customers VAT registration number, if applicable.

Entered
By - If the order was created in the Customer Order Entry window,
then the ID of the user who created the header information for the
order is displayed. A User ID is displayed if the order was created
manually, by copying an existing order, by creating an order from
a quote, or by creating automatically using another VISUAL application,
such as Return Material Authorization Entry.   
Note: ***This
field was introduced in VISUAL 8.0.0. A User ID is displayed in this
field only if the order was created in VISUAL 8.0.0 or later.***

Printed -
Select this check box if you are going to print this customer order.

Is
Separate Back Order - Select this box to mark the order as
a separate back order.

Accept Early by number
of days - If this customer accepts orders early, select this
check box and enter the number of days early the customer accepts
a shipment.

**Consignment
Tracking** - Select this
check box if this is an order for consignment parts or materials.

Credit
tab:

The system displays the following basic information
about the customers credit:

Credit Status The system inserts the value from
the Credit Status field in the Credit tab of Customer Maintenance.
When you select a customer for an order, use this field to decide
if you should proceed with the order. If the customer has a credit
status of On Hold or Orders on Hold, you will not be able to complete
the customer order.

Open Receivable Amount

Credit Limit The
system inserts the credit limit you specified on the Credit tab in
Customer Maintenance.

Credit Balance
The system displays the remaining amount of credit. The system subtracts
the total of any outstanding invoices from the credit limit.

Available Credit %
The system expresses the credit available to the customer as a percentage.
The system divides the credit balance by the credit limit then multiplies
by 100.

On Time % The system
evaluates the frequency of on-time settlements. The system examines
the invoices due over the period of time you specified in the Settlement
Threshold Days field and expresses the number of invoices paid on
time as a percentage.

Recv Age Limit
The system inserts the receivable age limit you specified on the Credit
tab in Customer Maintenance.

# Days Oldest Unpaid Invoice
The system identifies the invoice that has been unpaid the longest
and inserts the number of days old the invoice is in the # Days Oldest
Unpaid Invoice field.

Oldest Unpaid Invoice Term
Days The system inserts the number of days from the date
of the oldest invoice that the net payment is due.

The system uses the Recv Age Limit, # Days
Oldest Unpaid Invoice, the Oldest Unpaid Invoice Term Days, and the
Oldest Unpaid Invoice option you selected on the Credit Limit tab
in Customer Maintenance to determine whether it displays a warning
message when you save the order. For example, say your receivable
age limit is 2 days. You have an invoice that is 5 days old based
on the invoice date. Net payment on the invoice is due in 25 days.

If you use the Determined by Invoice Date option
in the Oldest Unpaid Invoice section in Customer Maintenance, the
system would display a message warning you that the customer has an
invoice that exceeds the receivable age limit. The system would consider
the invoice 5 days old, which is greater than the 2 day receivable
age limit.

If you use the Determined by Due Date option
in the Oldest Unpaid Invoice section in Customer Maintenance, the
system would not display a warning message. The system would compare
the invoice date to the net due payment date and determine that the
customer has 20 days to make the net payment. Because the payment
is not yet overdue, the system would allow you to add customer orders
without a warning message. If the invoice was 30 days old based on
the invoice date and net payment was due 25 days from the date of
the invoice, then the system would calculate that the invoice is 5
days overdue and display a warning message when you try to save the
customer order.

Notifications tab:

Use the Notifications tab to specify when to
send customers and employees notifications about this order.

Notification emails are addressed to the contact
specified on the Contact tab. Internal employees receive copies of
the email.

Notify Me If the
user ID that you singed into VISUAL with is associated with an employee
ID that has an email address, then the Notify Me check box is available.
Select the check box to receive internal notifications. The email
address specified for your employee ID in Employee Maintenance is
displayed.

In the Send Notification to Order Contact section,
select the notifications to send to the customer:

Email on New Order
Select this check box to email the customer when a customer order
is saved for the first time.

Note:
In terms of notification status, a customer order is considered new
until the first email notification for the specified customer order
is sent.

Email on Changed Order
Select this check box to email the customer when changes to a customer
order are saved.

Email on Shipment
Select this check box to email the customer when a shipment has
been made for the order. If multiple shipments are sent to fulfill
an order, then emails are sent for each shipment.

Notifications Sent
This check box contains a checked value if an email notification
is sent for the current customer order at least once. This is a read-only
check box.

In the Send Internal Notifications section,
use the check boxes to specify when employees receive notifications.
In addition to the Email on New Order, Email on Changed Order, and
Email on Shipment check boxes, you can select the Email on Invoice
Payment to send a notification to an employee when payment for the
shipment is received.

To edit the list of internal recipients that
receive notifications for this order, select Edit,
Order Notifications.

10. Click the Insert button
    to start adding items to the customer order.

A new row appears in the line item table.

|  |  |
| --- | --- |
| POSTIT.gif | This list contains ALL of the columns that can appear in the order line table. For more information on viewing or hiding columns in the table, refer to [Configuring\_Line\_Item\_Tables](Configuring_Line_Item_Tables.md). |

11. Specify
    the ordered item.

* For an inventory part that is not linked
  to a work order, enter the Part ID.

VISUAL fills in the Product Code and Commodity
Code from the part entry in Part Maintenance.

If there is a Customer Part ID, VISUAL fills
it in automatically. Otherwise, you can enter it manually. The Customer
Part ID appears on the order acknowledgment that is sent to the customer.

* For an inventory part that will have
  a new work order, enter Part ID and check the New W/O box.

When you move the cursor from the field,
a dialog box appears, asking if you want to create a new Job (Work
Order).

This dialog box has radio buttons that allow
you to select the initial status of the work order, if you decide
to create it.

In the Create Job dialog box you can also
select to have VISUAL copy all of the document references from the
parts engineering master to the new work order by selecting the Copy All Document references check box.

If you click No, the New W/O check box automatically
becomes unchecked.

VISUAL creates all new work orders for line
items when you save the order.

If you want to assign a specific Job ID,
enter it as well. You may want to assign a Job ID that incorporates
the Order ID of this customer order.

* If the line item is for an inventory
  part that you will link to an existing work order, enter the Base
  ID of the work order in the Job ID field.

When you enter the Job ID, VISUAL fills
in the Part ID and other fields.

* If the line item is for a custom work
  order, enter the Base ID of the existing work order in the Job
  ID field.

Because there is no part definition, you
must manually enter the Description, Unit Price, Product Code, Commodity
Code, and Customer Part ID. Only the unit price is required.

* If the line is for a miscellaneous item,
  enter a unit price and a description in the Misc Ref/Descr column.
  You can enter Product Code, Commodity Code, and other fields,
  if necessary.
* For
  Project users, if you select a project related Part ID, you must
  select an appropriate WBS Code, Proj Ref Seq No, Proj Ref Sud
  ID, and Dept ID combination. For more information, refer to [Enforcing
  Referential Integrity](Enforcing_Referential_Integrity.md).

12. Specify
    the quantity ordered. If the customer is ordering a standard part,
    specify the quantity in the Quantity field. If the customer is
    ordering a piece tracked part, specify the number of pieces the
    customer is ordering in the # Pieces field, and then specify the
    required dimensions in the Length, Width, and Height fields. After
    you specify the number of pieces and dimensions, the quantity
    ordered is calculated for you.
13. If
    the customer order is linked to a work order, the system inserts
    the date the work order is due to be complete in the Sched Finish
    Date field. The system inserts the date as follows:
14. If the customer order is linked to an
    existing work order, the system inserts the scheduled finish date
    from the work order when you tab out of the Job ID field.
15. If
    you selected the New W/O check box, the system inserts the scheduled
    finish date after you select File, Check Schedule Availability.
    For more information on checking schedule availability, refer
    to [Checking
    Schedule Availability](Checking_Schedule_Availability_C_O_E_.md).

14. After
    you have specified a part and quantity, and if you have selected
    the Auto calculate check box in [Customer
    Order Preferences](Specifying_Customer_Order_Preferences.md), the system determines the supply status
    based on the calculation setting you specified. If you did not
    select the Auto calculate check box, you can click the
    Calculate Supply Status button
    to calculate the supply status. The system inserts one of the
    following values in the Supply Status field:

In Stock The
system inserts In Stock if you have sufficient quantity of the part
on hand to fulfill the order.

Expected The
system inserts Expected if the quantity of the part you have on hand
plus the quantity of the part you have on order and due to arrive
in inventory before the Desired Ship Date equals or exceeds the amount
required to fulfill the order. Amount on order includes both parts
you are in the process of purchasing and parts scheduled to be made
on unreleased, firmed, and released work orders. If a work order has
been scheduled, the system evaluates supply based on the schedule
date of the work order. If a work order has not been scheduled, the
system uses the want date of the work order to evaluate supply. The
system compares the work order dates to the Desired Ship Date on the
order line to evaluate if parts on order will arrive in inventory
on time. If the Desired Ship Date on the order line is blank, then
the system uses the Desired Ship Date on the customer order header
instead.

If you change the Desired Ship Date, the
system reevaluates the Supply Status when you save the order.

No Supply The
system inserts No Supply if the quantity of the part you have on hand
plus the quantity of the part you have on order and due to arrive
before the Desired Ship Date does not equal or exceed the amount required
to fulfill the order. The system uses the Desired Ship Date on the
order line to evaluate if parts on order will arrive on time. If the
Desired Ship Date on the order line is blank, then the system uses
the Desired Ship Date on the customer order header instead. If you
change the Desired Ship Date, the system reevaluates the Supply Status
when you save the order.

Note:
If you print a Shipping/Delivery report and select Due Date for the
sequence or sub-sequence, the supply level in the report may not agree
with the supply level in Customer Order Entry. The report is able
to consider delivery line schedules when evaluating supply; the Customer
Order Entry window does not.

15. Modify
    the Commission % amount, if necessary.

Commission % defaults from the standard
commission for the Sales Rep specified in Customer Maintenance. You
can modify this percentage for each line item, if necessary.

If necessary, view or edit VAT information
in the following fields:

VAT Code - This
automatically populates with the default from Part Maintenance.

VAT % - This is
the tax percent based on the selected VAT code. This field is NOT
editable.

VAT Amount - This
is the VAT amount based on the VAT percent.

Wholesale Unit Cost
- This is the wholesale unit price from Part Maintenance.

Wholesale Extension
- This is the wholesale unit cost multiplied by the quantity ordered.

16. If
    you specified a default country of origin in Part Maintenance,
    the system inserts the default in the Country of Origin column.
    If necessary, click the browse button to select a different country.
17. The
    system populates the Sales Tax Group field based on the sales
    tax group settings you specified in Part Maintenance, but you
    can change the value as necessary. If the customer is not tax-exempt,
    the system inserts the sales tax group ID as follows:
18. If you specify a Shipto Address on the
    order line, the system inserts the sales tax group ID that you
    associated with the part/customer ID/Shipto Address combination.
19. If you did not assign a sales tax group
    ID to the shipto Address on the order line or you did not specify
    a shipto address on the order line, then the system uses the shipto
    Address you specified on the header to find the sales tax group
    ID associated with the part/customer ID/header shipto address
    combination.
20. If you did not associate a tax group
    ID with the part/customer ID/header shipto address combination,
    then the system inserts the sales tax group ID you assigned to
    the part ID/customer ID combination. If you did not assign a sales
    tax group ID with the part ID/customer ID combination, the system
    inserts the default sales tax group ID you specified for the part
    on the Accounting tab in Part Maintenance.
21. If you did not associate a tax group
    ID with the part, the system leaves the field blank. If a sales
    tax ID is specified on the header, the system uses that ID to
    calculate tax.

18. If
    you need to explicitly override the revenue account to be credited
    for the line item, enter the Account ID.

If you leave this field blank, VISUAL first
looks for a revenue account for the product code; if it does not find
one, VISUAL uses the default revenue account defined in Infor VISUAL
Financials Application Global Maintenance.

|  |  |
| --- | --- |
| POSTIT.gif | The default revenue account does NOT appear in this field; this does not mean that an account is not used. You only need to make an entry here for an explicit override. |

19. Use the statuses in the
    Line Status column to specify how to manage the status of the
    lines:
20. To
    manage the status of the line at the header level, select Inherit.
    When you select Inherit, the line effectively has the status that
    you specified in the header. For example, if you specify Released
    in the header Status field and Inherit in the line field, the
    line is considered to be released in the system.

To manage the status of the line independently
from the header, select one of these statuses:

* Released
* Firmed
* On Hold
* Closed
* Cancelled/Void

See [Working
with Order Statuses](Working_with_Order_Statuses.md).

19. Double
    click the ShipTo ID column header to select an alphanumeric ShipTo
    ID or enter a new one. By assigning a unique alphanumeric ID to
    each Ship-To location, you can specify different dates and locations
    for part delivery in the same customer order. The ID that appears
    in this column, also appears in the same-named column in Shipping
    Entry.
20. If
    you created a new customer order in conjunction with a return
    material authorization, the RMA ID and Line # is inserted on the
    customer order line.
21. Click
    Save to
    save the information.

When you save the customer order, VISUAL:

* Assigns an "Our Order ID,"
  if you did not enter one.
* Creates a new order, with its status
  set to the Default Status specified in the Preferences dialog
  box.
* Creates all new work orders using the
  line item quantity for work order quantity, and the desired ship
  date for work order want date.

|  |  |
| --- | --- |
| POSTIT.gif | If you specified a nonexistent work order for a custom part, there will be no engineering master from which to copy the work order. VISUAL gives you the option of creating a work order header with an unreleased status. If you choose to do this, you can manually create or copy to the new header using the Manufacturing Window Otherwise, VISUAL cancels the creation of the customer order. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Repeating_Lines.md)
Repeating Lines

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Adding_New_Shipping_Addresses.md) Adding New Shipping Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Shipping_Addresses.md)
Deleting Shipping Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enforcing_Referential_Integrity.md) Enforcing Referential Integrity