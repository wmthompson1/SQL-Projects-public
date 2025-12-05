VMDI Integration Requirements and Samples




# VMDI Integration Requirements and Samples

The following section relates to the integration of
EDI data into and out of the Infor VISUAL database. For EDI translators,
you need to develop any necessary "maps" to and from that
software in the format that the VISUAL VMDI module produces and reads.

The following sections describe the VISUAL modules and EDI transactions
that can currently be integrated. Additional EDI transactions are
handled directly through the EDI translation software in stand-alone
mode.

EDI transactions currently integrated with VISUAL are:

* [CPO
  - Customer Order Information (Inbound)](VMDI_Integration_Requirements.htm#CPO)
* [PLN
  - Planning Information (Inbound)](VMDI_Integration_Requirements.htm#PLN)
* [CSH
  - Cash Receipts Information (Inbound)](VMDI_Integration_Requirements.htm#CSH)
* [ACK
  - Customer Order Acknowledgment Information (Outbound)](VMDI_Integration_Requirements.htm#ACK)
* [ASN
  - Shipping Information (Outbound)](VMDI_Integration_Requirements.htm#ASN)
* [INV
  - Invoice Information (Outbound)](VMDI_Integration_Requirements.htm#INV)
* [VPO
  - Purchase Order Information (Outbound)](VMDI_Integration_Requirements.htm#VPO)
* [RCA
  - Purchase Order Receipt Information (Outbound)](VMDI_Integration_Requirements.htm#RCA)
* [WSA
  - Purchase Order Receipt Information (Outbound)](Creating_WSA_Layouts.htm)

## CPO - Customer Order Information (Inbound)

If you are licensed to use multiple sites, use caution when defining
and using a CPO layout. Since you specify the Allocations Require
Warehouse/Location setting (DDP) on the accounting entity record,
some of your entities may require you to specify warehouse IDs/locations
in allocations (DDP enabled) while others do not. Sites assigned to
an accounting entity inherit the accounting entitys setting. As a
result, the warehouse ID in all CPO layouts is optional.

If you plan to use a CPO layout in conjunction with a site that
is DDP enabled, you must select a CPO layout that contains a Warehouse
ID. If you import a .vdi without a warehouse ID to a site that requires
the warehouse, the file import will fail.

If your site is DDP enabled, all customer order lines in the .vdi
file must include the warehouse ID. Otherwise, the file import will
fail.

If your site is not DDP enabled, you can include a warehouse ID
in a CPO layout even though the site does not require a warehouse.
If a warehouse is specified in the .vdi file, then the warehouse ID
will be inserted in the customer order line. If a warehouse is not
included in the .vdi file, the file import will still be successful
because the site does not require the warehouse.

View a [sample layout](VMDI_Sample_Layouts_CPO.htm)

This is typically the most complex transaction to integrate because
of the vast differences in how you and your trading partners may use
the transaction data.

You need to consider several factors:

* Which inbound transactions
  contain customer order information? (850, 860, 830, 862, etc.)
* Is the trading partners
  VISUAL Customer ID present in the EDI data?
* Is there a Ship to location
  that applies to the entire order or does each line item have a
  separate Ship to location?
* Are the VISUAL part numbers
  present in the EDI data?
* Do you want to accept the
  pricing as it comes in or should VISUAL override it?

## EDI Transaction 850 - Purchase Order

The customer purchase order is the most widely used commercial EDI
transaction. While the information contained in a customer purchase
order may vary in content and format from company to company, there
are pieces of information that are common to every PO:

* Order number and date
* Buyers Company ID
* Ship-to location
* Requested delivery date
* One of more line items containing
  quantity ordered, unit of measure, unit price, and a part number
  or description.

Other transactions may contain customer order information, such
as the PO Change (860) or Material Release (830). This information
can also be brought into VISUAL through integration as a CPO.

## PLN - Planning Information (Inbound)

View a [sample layout](VMDI_Sample_Layouts_PLN.htm)

This is typically the simplest transaction to implement. When planning
information is imported, the CUSTOMER\_ FORECAST table is populated
in your VISUAL database. These records contain a CUSTOMER\_ID, FORECAST\_ID,
PART\_ID, REQUIRED\_DATE, REQUIRED\_QTY, CUSTOMER\_PART\_ID, CUSTOMER\_PO\_REF,
USER\_DATE, and WAREHOUSE ID.

## EDI Transaction 830 - Planning Schedule

The planning schedule is most typically used to transfer forecasting/material
release information. You can use this transaction in a variety of
ways, such as:

* a simple forecast
* a forecast with the buyers
  authorization for the seller to commit to resources, such as labor
  or material
* an order release mechanism,
  containing such elements as resource authorizations, period-to-date
  cumulative quantities, and specific ship/delivery patterns.

For inbound planning and customer order information, successful
integration often depends on having raw EDI data (sample or production)
from the trading partner. This data is necessary in order to determine
the absolute segment and element location of each required piece of
data.

The EDI requirements or "mappings" that a trading partner
provides are sometimes inaccurate or outdated. Because the integration
maps are dependent on the format of the data, changes or discrepancies
may cause implementation delays. This is why sample data is so critical
to a smooth and timely integration process. Accurate data not only
eliminates the need for modifications to the maps, but is also essential
for testing the maps prior to delivery to the customer.

## ASN - Shipping Information (Outbound)

View a [sample layout](VMDI_Sample_Layouts_ASN.htm)

Shipping data is extracted from VISUAL to one or more fixed length
or delimited files. The files contain ASN information, BOL information,
the order or pack-list information, and the line item information
for each order. The details of each file are determined by the requirements
of your trading partner.

## EDI Transaction 856 - Advance Shipment Notice

The ship notice lists the contents of a shipment and its configuration
within the shipment container at various levels of detail. ASNs are
used extensively in the retail and automotive industries, where Just-In-Time
(JIT) and Efficient Consumer Response (ECR) are an integral part of
the management philosophy.

A typical ASN has the following information:

* ASN number and date
* Shipment identification
  number (SID)
* Date and time of the shipment
* Bill of lading (BOL) number
* Number of packages
* Total shipment weight
* Product number and quantity
  of each item shipped (SKU)

## INV - Invoice Information (Outbound)

View a [sample layout](VMDI_Sample_Layouts_INV.htm)

Invoice data is extracted from VISUAL to one or more fixed length
or delimited files. The files contain the Invoice header information
and line item information. The details of each file are determined
by the requirements of your trading partner.

## EDI Transaction 810 - Invoice

The invoice is the second most widely used EDI transaction set.
It is a natural extension of the purchase order and can generally
be implemented at the same time. In most cases, an invoice repeats
much of the information contained in the purchase order, while adding
invoice related information such as:

* Invoice number and date
* Quantity shipped and invoiced
  amount for each item
* Total invoice amount
* Payment terms

## CSH - Cash Receipts Information (Inbound)

View a [sample layout](VMDI_Sample_Layouts_CSH.htm)

In order to import Cash Receipts, you are first required to set
up the following in VISUAL:

* Bank Account: Account Number
  and Routing Number
* ISO code for your Currency
  ID
* Rounding Account for your
  Currency ID

Please see [Importing
CSH (Cash Receipts) Transactions](Importing_CSH_Cash_Receipts_Transactions.htm) section in for more information.

## EDI Transaction 820 - Remittance Advice

The remittance advice is often used to transfer cash
receipt information. The cash receipts in your .VDI file will match
the appropriate Receivables Invoices in VISUAL based on one of the
four user-selected settings:

* Based on Invoice Number
* Based on BOL ID
* Based on ASN ID
* Based on Packlist ID

You will be importing either fixed length or delimited .VDI files.
When running VMDI Exchange for a CSH import, the program does not
actually update the VISUAL database directly but instead writes to
the temporary database tables: VMDI\_CSH\_HDR and VMDI\_CSH\_LINE. The
transactions are written to these tables with a Pending flag set to
"P" indicating that the transactions have not yet been
imported into VISUAL. To import them into VISUAL, you will need to
run the VMDI Cash Applications Processor.

The VMDI Cash Applications Processor is accessed from the EDI menu.
The program allows the user to process all transactions in the VMDI\_CSH\_HDR
and VMDI\_CSH\_LINE tables either individually or based on a timer setting.

The program launches the VISUAL Cash Application program for each
record processed. The processed records are viewable from the Completed
Transactions tab of the Processor. If you then launch Receivables>Cash
Application and select your Payment ID, you should see that the payments
were applied to your invoices.

## ACK - Customer Order Acknowledgment Information (Outbound)

View a [sample layout](VMDI_Sample_Layouts.htm)

The Customer Order Acknowledgement is used for acknowledging new
customer orders, changed orders, or both new and changed. Typically
most of the same data fields that were imported in your CPO documents
are exported as your ACK documents.

## EDI Transactions 855, 865, and ORDRSP - Order Acknowledgement

The Customer Order Acknowledgement is a widely used commercial EDI
transaction.

Many clients who receive inbound customer orders are required to
send their trading partners acknowledgement transactions in a timely
manner. Those acknowledgements are for new orders, orders in which
one or more line items were changed, or both new and changed.

Infor VISUAL allows you set up your ACK layout to acknowledge new,
changed, or new and changed customer orders through a Special Settings
option. You do this by selecting the appropriate Special Settings
option from the choices below:

Original Orders Only (855) - Select this option button if you want
to acknowledge original customer orders only. Original orders are
orders with the EDI Release checkbox selected and the Order Changed
checkbox cleared. These check boxes appear in the EDI tab of the Customer
Order Entry window.

Change Orders Only (865) - Select this option button if you want
to acknowledge changed customer orders only. Changed orders are orders
with both the EDI Release checkbox selected and Order Changed checkbox
selected. These check boxes appear in the EDI tab of the Customer
Order Entry window.

When you update an existing order using VMDI Exchange, VISUAL selects
the Order Changed checkbox. When you manually make changes to new
orders in Customer Order Entry, you have to manually mark the Order
Changed checkbox. You can clear the checkbox if you mistakenly change
an order prior to exporting your 855 ACK documents. When you export
acknowledgments for changed orders, the checkbox for those orders
is automatically cleared.

If multiple 865 layouts exist for the same customer, the 865 ACK
is only exported one time per change. That is, if you have orders
with Order changed checkbox marked and you export 865 ACK, you cannot
export the same orders with another layout unless you first re-select
the checkbox.

Both Original and Change (ORDRSP) - Select this option button if
you want to acknowledge both original and changed customer orders.

When you update an existing order using VMDI Exchange, VISUAL selects
the Order Changed checkbox. When you manually make changes to new
orders in Customer Order Entry, you have to manually mark the Order
Changed checkbox. You can clear the checkbox if you mistakenly change
an order prior to exporting your 855 ACK documents. When you export
acknowledgments for changed orders, the checkbox for those orders
is automatically cleared.

If multiple 865 layouts exist for the same customer, the 865 ACK
is only exported one time per change. That is, if you have orders
with Order changed checkbox marked and you export 865 ACK, you cannot
export the same orders with another layout -- unless you first re-select
the checkbox.

VMDI includes Customer Order Acknowledgement Codes on every line
item (LIN record) of your ACK (this applies to 855 as well as 865
documents). You can enter and maintain common Customer Order Ack Codes
using Application Global Maintenance. If the codes your trading partner
requires you to use are not in the default list, you may add them.

When your EDI order is saved or received via VMDIXCHG, all customer
order line items have your default code on them. For example, some
clients use the IA code (Item Accepted), some use AC (Item Accepted
and Shipped), and others might use a common code. You can add as many
codes as you need. Do this in Customer Maintenance. See Customer Order
Entry for more information. You can change the code assigned to your
line items at any time. Be certain that they are correct on your order
line items Before you export your ACK documents, otherwise you may
need to update the codes on your orders and re-export the ACKs.

## VPO - Purchase Order Information (Outbound)

View a [sample layout](VMDI_Sample_Layouts_VPO.htm)

The Purchase Order transaction is used to send purchase order requests
to your vendors. Purchase Order data is extracted from VISUAL to one
or more fixed length or delimited files. The files contain the header
information, line item information, and sub line item information.
The details of each file are determined by the requirements of your
trading partner.

## EDI Transaction 850 - Purchase Order

Fields that are typically exported on your outbound purchase order
are:

* Purchase Order ID
* Vendor ID
* Order Date
* Desired Receive Date
* Total Amount Ordered
* Part ID
* Quantity Ordered
* Shipto ID

## RCA - Purchase Order Receipt Information (Outbound)

View a [sample layout](VMDI_Sample_Layouts_RCA.htm)

The 861 Purchase Order Receipt transaction is used to send your
vendors receipt information regarding purchase orders for which have
received product. Purchase Order Receipt data is extracted from VISUAL
to one or more fixed length or delimited files. The files contain
the header information, line item information, and sub line item information.
The details of each file are determined by the requirements of your
trading partner.

## EDI Transaction 861 - Material Receipts (Receiving Advices)

Typically most of the same data fields that were exported in your
VPO documents are also exported as your RCA documents. Additional
fields that are often transmitted are:

* Receiver ID
* Date quantity was received
* Quantity received
* Delivery schedule on which
  quantity was received

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_VISUAL_Data_Interchange.htm) User-defined Help