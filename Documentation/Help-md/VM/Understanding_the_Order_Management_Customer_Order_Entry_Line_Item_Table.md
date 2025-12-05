Understanding the Order Management Customer Order Entry Line Item Table




# Understanding the Order Management Customer Order Entry Line Item Table

The line item table in the VISUAL Order Management
Customer Order Entry Window contains many of the same columns as the
standard VISUAL Customer Order Entry Window. However, the order in
which the columns appear in this table is different; also, some columns
are specific to this window. The following is a list of the column
names followed by a brief description.

Part ID - The Part ID on the customer
order line.

# Pieces If you specified a piece tracked
part in the Part ID field, specify the number of pieces the customer
is ordering.

Length, Width, Height If you specified
a piece tracked part in the Part ID field, specify the required dimensions
for the part. After you specify the number of pieces and the dimensions,
the quantity is calculated.

Dim UM If you specified a piece tracked
part in the Part ID field, the dimension unit of measure is inserted.

DC Class - If you are running Distribution Center, click
the arrow and select the DC Class. You can select: Available, On Hold,
In QA, In Process, Returned, Damaged, Scrap, Committed.

Current Part Stage -
The current stage of the part appears.

Current Part Revision The current revision of the part you selected
appears

Ordered Sage/Rev
 If different, the stage in which
the part was when your customer ordered it appears.

Customer Part ID - The customer's ID for
the part.

ShipTo ID - The customer's shipping addresses
to which you can send a shipment. If the customer has a default ShipTo
ID, it appears automatically. See later for entering ShipTo IDs for
a customer.

Mark for ID - The identifier for the final
destination of the order. This identifier allows the customer to quickly
redistribute inventory to other locations from their distribution
center.

Warehouse ID - The default warehouse for
a customer. If the customer has a primary warehouse it appears automatically.
See later for entering Warehouse IDs for a customer.

Quantity - The
quantity of the part that the customer is ordering.

Quantity Available - The quantity of the
part that is currently available to you for order fulfillment.

Quantity Available to Customer - The quantity
that is currently available to the customer

Minimum Fill Rate Quantity - The minimum
quantity that VISUAL automatically allocates to the C/O line based
on the Fill Rate of the customer. If a customer's fill rate is 50,
then VISUAL hard allocates, if there are sufficient quantities, a
minimum 50% of the supply to the C/O line. A order line of 100,000,
with a customer fill rate of 52, produces the value 52,000 (52/100)in
this column.

Unit Price - The price per unit of the
part.

Net Unit Price -
The unit price after discounts appears
in the Net Unit Price column.

WIP/VAS Unit Price - The Work In Process/
Value-Added Service price per part unit. Enter WIP/VAS information
for a customer in Customer Maintenance; enter general WIP/VAS information
in Application Global Information.

Extension - The dollar amount of the customer
order. VISUAL uses the following formula: Order Quantity x Unit Price
- Trade Discount (%).

Order Type -
Select the order type from the drop-down
list to use for this line. You can select: Back Order, Drop Ship,
Emergency, Flow Through, International, Regular, Will Call.

Shipping Weight - The weight by line of
the shipment.

Weight U/M - The default Weight U/M for
the part. You cannot override this value. Enter Weight U/Ms for parts
in Part Maintenance.

U/M - The unit of measure with which you
measure the part. Enter units of measure in Unit of Measure Maintenance.

Allocate Quantity - The quantity to which
you must allocate supply, either through hard allocations or soft
allocations against future receipts. This value is always equal to
the quantity.

Supply Status -
The system inserts one of these values
in the Supply Status field: In Stock, Expected, or No Supply.

Supply Type - (1) Select from either PO,
purchase order, or WO, work order. If you are obtaining supplying
for this customer order from a purchase order or a work order, select
one of these.

Supply Type - (2) The type of supply for
the part on the C/O line. If VISUAL automatically fills the order
from the primary warehouse, I appears; otherwise,
this column remains empty until you assign supply from one of the
six other supplying sources.

Job ID/Order ID - The place from which
you or VISUAL have assigned supply. If your case relates to the first
definition above, the Job ID of the work order or the Order ID of
the purchase order appear. If your case relates to the second definition,
the ID of the supplying source appear. For example, a Warehouse ID,
(I) a Purchase Order Delivery Schedule ID (PD) could appear; "Multiple
Links" appears if there is more than one source of supply.

Lot ID/Line # - Again, if this C/O line
refers to the first definition, the Lot ID of the work order or the
Line # of the purchase order to which the C/O line is linked appears.

Split ID - Again, if this C/O line refers
to the first definition, the Split ID of the work order to which the
C/O line is linked appears.

Sched Finish Date The date that work is scheduled to end.

New Work Order - Select this box if the
customer order line requires a new work order.

Service Charge ID - An extra amount that
you charge for a service. You cannot enter a Service Charge ID if
the order line is for a part. Enter Service Charge IDs in Application
Global Information.

Configured - If you have used the Master
Product Configurator to configure this part, VISUAL checks this box
automatically.

Miscellaneous Reference/Description -
A description of the part. You enter this description in Part Maintenance.

Wholesale Unit Cost - The wholesale cost
per unit of the part. Enter this value in Part Maintenance under the
Costing tab.

Discount Code - The discount code for
the customer. Enter discount codes in Customer Maintenance.

Discount
% - The discount percentage of the customer's discount code.
For example, if the customer's default discount code is "Retail,"
and you maintain a 12% discount for that code, then 12% appears in
this field. However, you do not have to accept this default; you can
override this value on each line. Enter discount codes and maintain
customer discount code information in Customer Maintenance.

Wholesale Extension
- The wholesale unit cost multiplied by the quantity of the order.

Ship Date - The date on which you ship
the order. Enter a date in this field if you want the Ship Date of
this line to be different that the ship date that you entered above
for the whole order.

Promise Date - The date on which you promise
to ship the order. Enter a date in this field if you want the Promise
Date of this line to be different than the Original Promise Date that
you entered above for the whole order.

Freight - The dollar amount that you charge
the customer for conveying the order.

Commission % - The commission percentage
of the customer's sales representative. VISUAL fills this column with
the default sales rep's commission percentage. Enter a sales rep's
Default Commission Percentage in Customer Maintenance in the Sales
Reps dialog box.

Tax Group ID - The appropriate Tax Group
ID for the customer. This does not apply if the customer is Intrastat/
VAT enabled.

VAT Code - VISUAL fills this field automatically
with the default from Part Maintenance. This only applies if the customer
is Intrastat/VAT enabled.

VAT % - The tax percent based on the selected
VAT code. This only applies if the customer is Intrastat/VAT enabled.

VAT Amount - The VAT amount based on the
VAT percent. This only applies if the customer is Intrastat/VAT enabled.

Transaction Category If you are using
Transaction Categories to further classify your transactions, double-click
the Transaction Category browse button and select the category to
use for this line.

HTS Code (Harmonized
Tariff Schedule Code) - If an international order, a tariff
by duty percent placed on the customer order. Enter HTS Codes in Application
Global Maintenance under the DDP tab.

Country of Origin - The country of origin
of this customer order. Enter Countries of Origin in Application Global
Maintenance using the HTS Codes Maintenance dialog box.

Material Code
- The default material code for this part. Enter material codes for
parts in Part Maintenance in the DDP tab. You can, however, override
these codes at the customer order line level.

Product Code - The default product code
for the part. You can, however, override this default and enter a
different code. Enter default product codes in Part Maintenance.

Commodity Code - The default commodity
code for the part. You can, however, override this default and enter
a different code. Enter default commodity codes in Part Maintenance.

Revenue Account ID - The general ledger
account for the part. Enter G/L accounts in the Accounting Window.

Revenue Account Description - The description
that goes along with the Revenue Account ID. VISUAL fills this column
after you enter an ID.

Drawing ID - The Drawing ID of the part.

Drawing Rev - The Drawing Rev (revision)
of the part. Enter Drawing Revisions in Part Maintenance.

Line Closed Short - If you ship a partial
quantity of a customer order line and then opt to close the order
with an outstanding backorder balance, VISUAL selects this check box.

Shipped Quantity - The quantity of the
part that you have shipped. After you use Shipping Entry to ship the
order, if you reopen the order, the quantity of the line that VISUAL
has successfully shipped appears here.

Text - Text regarding the part or order.
Click the Line Specs button located underneath the line item table
to enter text.

***S***pecs - VISUAL selects this
box if you have entered any text regarding the order line.

Has Del Schedd If the line contains
a delivery schedule, this check box is selected.

ATP (Available To Promise)
- The quantity of parts that you have available to promise to an order.
This value decreases by the quantity of the line after you save each
line.

Link Part ID - The ID of the part for
which the customer is placing the order. This is the same as the Part
ID field.

Link Warehouse ID - The ID of the warehouse
from which you assign supply to the order line.

Job Quantity Unallocated - The quantity
of the part remaining in the warehouse from which you are hard allocating
supply to the order line.

Accept Early - VISUAL selects this box
by default if the customer accepts shipments early. You can override
this default setting clearing the box for a specific line. Enter default
Accept Early preferences for this customer in Customer Maintenance.

Days Early -
VISUAL fills in the number of days by which the customer accepts shipments
early. You can also override this field.

Owner ID If you are working with consigned parts,
select the actual owner of the parts

Trace Qty If the part on this line is a traceable
part, the quantity of these parts you have traced appears.

Available Trace Qty If this part is traceable and available
to ship, the quantity available appears.

Total Quantity Allocated - The quantity
that you have allocated to the C/O line. If VISUAL finds sufficient
supply in the customer's primary warehouse, the value that appears
here after you save is equal to the quantity of the C/O line, meaning
that VISUAL has allocated full supply to the line. However, it is
possible to have a value in this field that is less than the required
quantity of a C/O line. In this case, only soft allocations exist
for the line; there is a portion of the order quantity (desired quantity)
for which you must still allocate supply.

Total
Quantity Fulfilled - The quantity that VISUAL has fulfilled
from the source.

Price Note  If you have included any notes in the price
formula, those notes appear here.

Discount Note
 If you have included any notes in
the discount formula, those notes appear here.

Freight Note Notes about freight display here.

Commission Note If you have included any notes for the
formula, those notes appear here.

Dispatched - If you are running Distribution Center
Management , the Dispatched check box is selected.

Ship Order Status
 If you are working with DCMS, the
order status of the shipment appears

RMA ID If this order was generated by
an RMA, the ID of the RMA is inserted.

RMA Line If this order was generate
by an RMA, the line number for this part on the RMA is inserted.

Entered By -
This field displays the User ID of the User that created this line
item entry if the line item was created manually or by copying. If
the line item was created automatically through another VISUAL application,
such as Return Material Authorization Entry, then no User ID is displayed.
Note:
***This field was introduced in VISUAL
8.0.0. A User ID is displayed in this field only if the order was
created in VISUAL 8.0.0 or later.***

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.htm) User-defined Help