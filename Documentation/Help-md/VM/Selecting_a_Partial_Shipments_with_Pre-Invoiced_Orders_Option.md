Selecting a Partial Shipments with Pre-Invoiced Orders Option




# Selecting a Partial Shipments with Pre-Invoiced Orders Option

If you pre-invoice your customers for orders in advance of them
receiving their order, or if they are progress billed, you can choose
how to handle the excess pre-invoiced amounts when creating the manufacturing
shipper invoice for the partial shipment.

Choose one option:

Create memo with excess
balance Select this option if you would like to  create
a memo for any excess amount from pre-invoices or progress billings
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

If you create the pre-invoice in Accounts
Receivable Invoice Entry, then the grand total of the customer order
is considered when the system determines the amount to refund or apply
to a future shipment. The individual lines are not considered.

If you close the customer order or a line
short prior to consuming all of a pre-invoice amount, the user must
manually generate a memo to offset the remaining balance of the pre-invoice.

If you select this option, certain options
may be disabled in [Invoice Forms](VMINVGENfrmPrintInvoice.htm).
If at least one customer order has been partially shipped and has
a pre-invoice applied to it, the system disables the Create A/R Invoices,
Combine All Packlists for an Order on One Invoice, and Combine All
Packlists for a Customer on One Invoice options. You can re-activate
these options by generating invoices for pre-invoiced orders with
partial shipments. To identify these orders, print the [List
of Pre-Invoiced Orders with Partial Shipments](Printing_a_List_of_Pre-invoiced_Orders_with_Partial_Shipments.htm) report. Then, use
the Generate/Print One Invoice option available on the File menu to
generate an invoice for each order in the List of Pre-Invoiced Orders
with Partial Shipments report. After you generate each invoice, the
system reactivates the Create A/R Invoices, Combine All Packlists
for an Order on One Invoice, and Combine All Packlists for a Customer
on One Invoice options.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help