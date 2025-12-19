Understanding the Shipping Entry Window Line Item Table




# Understanding the Shipping Entry Window Line Item Table

The following is a list of the column names in the
Shipping Entry window line item table followed by a brief description.

Supply Type - The type of supply used
to fulfill the order lines Order Quantity. If there are no links
of supply to the customer order line, nothing appears in this column.
If you have attached links of supply to this order line from one of
the six possible sources of supply, the appropriate two character
Type ID appears here. These include:

CP (Coproducts)

I (Inventory)

PD (Purchase Order Delivery
Schedule)

PO (Purchase Order)

WH (Interbranch Transfer)

WO (Work Order)

Reference - If there is a link of supply
attached to this customer order line, the Supply Base ID of the supplying
order, the line number of the supplying line as it appears in the
order, and a description of the part appear in this column. For example:

Trace - VISUAL selects this check box
if a Part Trace Profile exists for the part on this order line.

Ship Date - The date on which you ship
the order. This is the date of shipment you entered in Customer Order
Entry during the entry of the order.

Promise Date - The date on which you promise
to ship the order. This is the promise date you entered in Customer
Order Entry during the entry of the order.

Quantity Ordered - The order quantity
of the customer order line.

C.O. Pieces If the part is a piece tracked
part, the number of pieces ordered in Customer Order Entry.

C.O. Length If the part is a piece tracked
part, the length specified in Customer Order Entry.

C.O. Width If the part is a piece tracked
part, the width specified in Customer Order Entry.

C.O Height If the part is a piece tracked
part, the height specified in Customer Order Entry.

C.O. Dim UM If the part is a piece tracked
part, the dimension unit of measure specified in Customer Order Entry.

Quantity Shipped - The portion of the
Quantity Ordered that you have shipped. If this is a new shipment,
no value appears here. If this is a back order or a line that you
shipped partial quantities from before but kept open, a value appears
here.

Line Closed Short - If you ship a partial
quantity of a customer order line and then opt to close the order
with an outstanding backorder balance, VISUAL selects this check box.

Ship Quantity - The quantity that you
want to ship. The default value is the Order Quantity, however you
can enter greater or lesser values than the Order Quantity. If you
enter greater or lesser values, you must decide what to do with either
the overshipment quantity or the remaining balance. See Shipping Customer
Orders for more information.

Ship Pieces For a piece tracked part,
the number of pieces to ship to the customer. You can enter greater
or lesser values than the C.O Pieces quantity. If you enter greater
or lesser values, you must decide what to do with either the overshipment
quantity or the remaining balance.

Ship Status The system indicates whether
you have sufficient materials on hand to ship the order. The system
inserts one of the following statuses:

In Stock - The system
inserts In Stock if you have sufficient quantity of the part on hand
to fulfill the order.

Expected - The system
inserts Expected if the quantity of the part you have on hand plus
the quantity of the part you have on order and due to arrive in inventory
before the Desired Ship Date equals or exceeds the amount required
to fulfill the order. Amount on order includes both parts you are
in the process of purchasing and parts scheduled to be made on a unreleased,
firmed, or released work order. If the work order is not scheduled,
the system uses the work order want date to evaluate supply. If the
work order is scheduled, the system uses the schedule date to evaluate
supply. The system uses the Desired Ship Date on the customer order
line to evaluate if parts on order will arrive in inventory on time.
If the Desired Ship Date on the order line is blank, then the system
uses the Desired Ship Date on the customer order header instead.

No Supply - The
system inserts No Supply if the quantity of the part you have on hand
plus the quantity of the part you have on order and due to arrive
before the Desired Ship Date does not equal or exceed the amount required
to fulfill the order. The system uses the Desired Ship Date on the
order line to evaluate if parts on order will arrive on time. If the
Desired Ship Date on the order line is blank, then the system uses
the Desired Ship Date on the customer order header instead. If you
change the Desired Ship Date, the system reevaluates the Supply Status
when you save the order.

Quantity Allocated - The quantity that
you have allocated to the C/O line. If VISUAL finds sufficient supply
in the customers primary warehouse, the value that appears here is
equal to the quantity of the C/O line, meaning that VISUAL has allocated
full supply to the line from inventory. However, it is possible to
have a value in this field that is less than the required quantity
of a C/O line.

Quantity Fulfilled - The quantity that
VISUAL has fulfilled from the supplying source.

Length, Width, and Height If the part
is a piece tracked part, specify the dimensions of the part you are
shipping. You can specify different dimensions from the dimensions
on the customer order.

Dim UM If the part is a piece tracked
part, the dimension unit of measure is inserted in this field.

Link Quantity Allocated - The quantity
you have allocated to this customer order line from one of the six
sources of supply. These include: CP (Coproducts), I (Inventory),
PD (Purchase Order Delivery Schedule), PO (Purchase Order), WH (Interbranch
Transfer), and WO (Work Order).

Stock U/M - The stock unit of measure
for the part.

U/M - The unit of measure with which you
measure the part. Enter units of measure in Unit of Measure Maintenance.

Location ID - The ID of the location in
the warehouse from which you are shipping the parts. Either accept
this default from the original order or select a new Location ID.

Warehouse ID - The warehouse you entered
in Customer Order Entry for this customer order.. If the customer
has a primary warehouse, the primary warehouse is the default.

Location Quantity - The quantity of part
on the customer order line in the selected warehouse location. See
above.

Customer Part ID - If applicable, the
Customers ID of the part.

Cartons - If applicable, the number of
cartons used to ship the part.

Shipping Weight - The shipping weight
of the part.

Weight U/M - The weight U/M of the part.
Select the appropriate weight u/m from the list box.

NMFC Code - If applicable, the National
Motor Freight Code for the customer line shipment. Enter NMFCs in
Application Global Maintenance.

Package Type - If applicable, The type
of packaging used in the shipment. Enter Packaging Types in Application
Global Maintenance.

Transaction ID - The Transaction ID VISUAL
assigns to this shipment. See Inventory Transaction Entry for more
information on viewing inventory transactions.

Transaction Description - If the shipment
has been returned, the description that was specified when the return
was processed.

Unit Price - The price per unit of the
part.

Shipping U/M - A valid VISUAL U/M appears
in this column only if you have attached a service charge to the packlist
using the Edit Packlist function. You must enter Shipping U/Ms in
the Edit Packlist dialog box.

Discount % - The discount percentage of
the customers discount code. For example, if the customers default
discount code is "Retail," and you maintain a 12% discount
for that code, then 12% appears in this field. However, you do not
have to accept this default; you can override this value on each line.
Enter discount codes and maintain customer discount code information
in Customer Maintenance.

Commission % - The commission percentage
of the customers sales representative. VISUAL fills this column with
the default sales repss commission percentage. Enter a sales reps
Default Commission Percentage in Customer Maintenance in the Sales
Reps dialog box.

VAT Code - VISUAL fills this field with
the default from Part Maintenance. This only applies if the customer
is Intrastat/VAT enabled.

G/L Revenue Account ID - The general ledger
account for the part. Enter G/L accounts in the Accounting Window.

Packlist Long Description - A description
of the packlist. Enter descriptions using the Edit Packlist function.
See [Working With Existing
Packlists](Working_With_Existing_Packlists.md).

Ship Dimensions - Shipping dimensions
for the order. Enter ship dimensions using the Edit Packlist function.
See [Working With Existing
Packlists](Working_With_Existing_Packlists.md).

User Defined 1-10 - User defined field
labels for this customer order line.

Country of Origin - The country of origin
of this customer order. Enter Countries of Origin in Application Global
Maintenance using the HTS Codes Maintenance dialog box.

Excise Price - If applicable, the amount
of internal tax levied on the customer for this order.

Tariff Code - If an international customer,
the Intrastat Tariff Code associated with the order line.

Region ID - If an international customer,
the Intrastat Region ID associated with the order line.

From Country ID - If an international
customer, the From Country ID associated with the order line.

Material Code - The material code of the
part on the order line. Enter material codes for parts in Part Maintenance
from the Order Management tab.

ShipTo ID - The ID associated with the
customers ShipTo address. If you did not specify a ShipTo ID in Customer
Order Entry, you can do so now.

HTS Code (Harmonized Tariff Schedule Code)-
If an international order, a tariff by duty percent placed on the
customer order. Enter HTS Codes in Application Global Maintenance
under the Order Management tab. Set default HTS Codes for parts in
Part Maintenance from the Order Management tab.

Country of Origin - The country of origin
for the part on the order line. You can either accept the parts default
Country of Origin or double-click the column header to select a different
one. You can also enter unique Country of Origin IDs. VISUAL reminds
you that the country you entered is not in the address tables but
lets you continue. Enter Countries of Origin in Application Global
Maintenance.

Has Delivery Schedule - VISUAL selects
this check box if the customer order line is a customer order delivery
schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help