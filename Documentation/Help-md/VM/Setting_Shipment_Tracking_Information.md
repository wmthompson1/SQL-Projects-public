Setting Shipment Tracking Information




# Setting Shipment Tracking Information

Shipment Tracking is primarily for European users
who need to be able to produce appropriate shipping documentation
for materials that they may be holding off-site, are in transit to
some other locationa customer or another warehouseor that they are
returning to a vendor.

To specify shipment tracking information:

1. Click the Shipment
   Trk tab.
2. To enable the shipment
   tracking function, select the Shipment tracking enabled check
   box. When you select this check box, you can print transportation
   document in these applications:
3. Shipping Entry
4. Service Dispatch
   Entry
5. Interbranch
   Transfer Entry
6. Interbranch
   Shipping Entry

When you select this check box, the Shipment
Reason Codes section Maintenance section become available.

Clear the check box if you do not use shipment
tracking.

3. If you selected the
   Shipment tracking enabled check box, specify this information:

Shipment Reason Codes
This section is available only if you select the Shipment tracking
enabled check box. Click one option:

Required Select
this option if users must supply a reason code to print a transportation
document.

Optional Select
this option if users can print a transportation document without supplying
a reason code.

Maintenance
Click Ship Reason Codes... to define reason codes for your shipping
documents. Specify this information:

Shipment
Type Click the arrow and select one of these types:

Shipment Select
this option if you want to classify the shipment as a shipment of
goods to an outside location.

Inventory Transfer
Select this option to classify the shipment as a transfer of inventory
between locations.

Service Dispatch
Select this option to classify the shipment as a service dispatch.

Purchase Return
Select this option to classify the shipment as a purchase return.

Reason Code
Specify a unique reason code ID.

GL Account ID
Specify an account ledger to assign to this Ship Reason Code.

Default Warehouse ID
Specify the ID for the warehouse you want to use for this code.

4. In the Default Shipping
   Label field, click the browse button and select the default label
   format.
5. To allow the deletion
   of packlists with ship dates in closed or locked periods, select
   the Allow Deletion of Packlists in Closed or
   Locked Periods check box. When you select this check box,
   any packlist can be deleted provided that no invoices have been
   created for the packlist. Clear the check box to allow packlists
   to be deleted only if the ship date is in an open period.
6. In the Partial Shipments
   with Pre-invoiced Orders section, select one option:

Create memo with excess
balance Select this option if you would like to create a
memo for any excess amount from pre-invoices or progress billings
when customer orders are partially shipped. For example, if the customer
has been pre-invoiced for $300 for a certain quantity of a part, and
you have shipped $200 worth, then the system generates a memo worth
$100 for the customer's account.

Retain excess balance for
future shipments Select this option if you would like to
retain the excess amount that a customer has been pre-invoiced or
has been progress billed. The system behaves differently depending
on if you pre-invoice the customer or progress bill the customer.

If you progress bill the customer, the system
considers the amount to apply on a line-by-line basis. For example,
if the customer has a progress billing invoice for $300 for a certain
quantity of a part on line 1 of the customer order, and you have shipped
$200 worth, then the system retains the $100 to apply to a future
shipment of the same part on line 1 of the customer order.

If you create the pre-invoice in Accounts Receivable
Invoice Entry, then the grand total of the customer order is considered
when the system determines the amount to refund or apply to a future
shipment. The individual lines are not considered.

If you close the customer order or a line short
prior to consuming all of a pre-invoice amount, the user must manually
generate a memo to offset the remaining balance of the pre-invoice.

If you select this option, certain options
may be disabled in Invoice Forms. If at least one customer order has
been partially shipped and has a pre-invoice applied to it, the system
disables the Create A/R Invoices, Combine All Packlists for an Order
on One Invoice, and Combine All Packlists for a Customer on One Invoice
options. You can re-activate these options by generating invoices
for pre-invoiced orders with partial shipments. To identify these
orders, print the List of Pre-Invoiced Orders with Partial Shipments
report. Then, use the Generate/Print One Invoice option available
on the File menu to generate an invoice for each order in the List
of Pre-Invoiced Orders with Partial Shipments report. After you generate
each invoice, the system reactivates the Create A/R Invoices, Combine
All Packlists for an Order on One Invoice, and Combine All Packlists
for a Customer on One Invoice options.

7. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User Defined Help