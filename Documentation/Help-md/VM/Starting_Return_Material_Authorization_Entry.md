Starting Return Material Authorization Entry




# Starting Return Material Authorization Entry

Return Material Authorization Entry is available from
the Infor VISUAL Main window.

To start Return Material Authorization Entry, select Return
Material Authorization from the Sales menu.

The Return Material Authorization window appears.

The Return Material Authorization window contains two sections:
RMA Header information and the RMA Line Item table.

The RMA Header information section, located at the top of the window,
contains customer and order details.

The RMA Line Item table contains one line for each item on the RMA.
It contains the following columns:

Ln # - The current line number.

Original Order Ln # - The line number
from the original order.

New Order Ln # - If you are creating a
new order for this RMA, this is the line number for the item in the
new order.

Quantity Ordered - The original customer
order quantity.

Shipped Qty - The original quantity shipped
to the customer.

C.O. Pieces If the part is a piece tracked
part, the number of pieces ordered.

C.O. Length If the part is a piece tracked
part, the length specified on the customer order.

C.O Width If the part is a piece tracked
part, the width specified on the customer order.

C.O. Height If the part is a piece tracked
part, the height specified on the customer order.

C.O. Dim UM If the part is a piece tracked
part, the dimension unit of measure for the part.

Rtn Qty Authorized - The quantity that
your company has authorized the customer to return.

Rtn Pieces Authorized - If the part is
a piece tracked part, specify the number of returned pieces.

Length, Width, and Height - If the part
is a piece tracked part, specify the dimensions of the pieces that
the customer is returning to you. After you specify the number of
pieces and the dimensions, the Rtn Qty Authorized is calculated based
on the conversion factor for this part.

Dim UM - For dimensional inventory, select
a dimensional unit of measure. If the part is a piece tracked part,
the default DIM UM auto-fills information from the part master.

Quantity Returned - The quantity that
the customer has returned to your company.

Quantity Re-shipped - The quantity that
your company has re-shipped to the customer. This is for Repair and
Replacement RMAs.

Pieces Received - The number of pieces
received, if you are receiving piece tracked parts.

Pieces Shipped - The number of pieces
shipped, if you are shipping piece tracked parts.

Job ID - The original order's Job ID for
this item.

Lot ID - The original order's Lot ID for
this item.

Split ID - The original order's Split
ID for this item.

Part ID - The Part ID for this item.

Service Charge ID - The original order's
service charge for this item, if applicable.

Misc Ref/Descr - A field reference for
or a description of the item from the original order.

U/M - The selling unit of measure for
this item.

Unit Price - The unit price for the item.
This automatically defaults to the price set for that customer or
discount code. If you do not have anything set up for this customer,
the Unit Price defaults to the unit price in Part Maintenance.

Wholesale Unit Cost - The wholesale unit
price from Part Maintenance.

Disc % - The discount percent to be applied
to this item. If you specified a Discount Code for this item, this
column defaults to the discount percentage for that code.

Extension - The extended price for the
item, computed by:

(Unit Price - Unit x Disc% / 100) \* Quantity

Wholesale Extension - The wholesale unit
cost multiplied by the quantity ordered.

Ship Date - The original ship date for
this item.

Promise Ship Date - The date you expected
the shipment to be sent.

Promise Del Date - The date you expected
the shipment to be delivered.

Freight - The freight charges for this
item.

Comm % - The default commission percentage
for the Sales Rep for this order.

VAT Code If the accounting entity is
VAT-enabled, then the VAT code specified on the original order is
inserted.

VAT % If the accounting entity is VAT-enabled,
then the VAT percentage applied to the original order is inserted.

VAT Amount If the accounting entity
is VAT-enabled, then the VAT amount applied to the original order
is inserted.

Tax Group ID - If you specified a Product
Code with a defined Sales Tax Group, the Tax Group ID automatically
appears here.

Product Code - The Product for this item.
You can define Codes in Part Maintenance.

Commodity Code - If a Commodity Code exists
for this item, it appears in this column.

Revenue Acct ID - The G/L Revenue Account
ID associated with this line item.

Revenue Acct Descr - A description of
the Revenue Account ID.

Cust Part ID - A Customer Part ID for
this item, if applicable.

Drawing ID - The Drawing ID for this item,
from the work order.

Rev - The drawing revision number for
this item.

Line Status The status of the customer
order line. If the status is Inherit, then the line inherits the status
of the customer order header.

Ln Closed Short - This check box indicates
that the line VISUAL has closed this item without having received
the entire order quantity.

Specs - This check box indicates that
there are specs for this item. To view the specs, highlight the line,
then lick on the Line Specs button. The Specs dialog box appears.

Piece Tracked - This check box indicates
that this item is a piece tracked item.

Cls This check box is selected if the
line is closed.

Quote Ln # If you created a quote as
part of an evaluation RMA, the line number of the quote is inserted.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Return_Material_Authorization.htm) User-defined Help