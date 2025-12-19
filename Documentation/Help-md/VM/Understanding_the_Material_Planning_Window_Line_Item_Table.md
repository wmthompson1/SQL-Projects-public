Understanding the Material Planning Window Line Item Table




# Understanding the Material Planning Window Line Item Table

In Standard mode, these columns are displayed in the Material Planning
Window line item table. After you have selected a part and the information
for that part appears, refer to these definitions as a general reference
as you carry out procedures.

Demand Information The table displays
this information about demand orders:

Demand Warehouse
The warehouse supplying the part for an order.

Date Required
The date by which you need to complete the order. If the view is set
to Net by Required Date or Net by MRP Rules, and the order is late,
the date is displayed in red.

Release Date  The
release date of the demand order. If the view is set to Net By Release
Date and the order is late, the date is displayed in red.

Total Quantity Required
The total quantity required. For work order material requirements,
this value is equal to the Calculated Qty value specified on the Material
card. See [Specifying
Planning/Leadtime Information](Specifying_Planning_Leadtime_Information.md).

Quantity Issued
The quantity that has been issued to an order.

Quantity Required
The remaining quantity required to fill the order.

Status The status
of the order.

Peg To The Order
ID. If the order has multiple links, more than one ID is displayed.
If one order ID is displayed, double click the Order ID to open the
order in the appropriate application.

Order IDs are preceded by these codes:

C The order is
a customer order.

WH The order is
an interbranch transfer.

PL The order is
a planned order.

If the order ID is not preceded by a code,
then the order is a work order.

If there is an asterisk after the work order
ID, then the work order is for a rate-based part. A rate-based part
is a fabricated part that you produce in predictable daily quantities.
See [What Are Rate-based Parts?](What_Are_Rate-based_Parts_.md).

Customer ID For
customer orders, the ID of the customer who placed the order.

Customer Name
Optionally, you can show the name of the customer who placed the order.
To show this field, select Options, Configure Table and include the colCUSTOMER\_NAME
column

Internal Demand
If the purchase order was placed by an internal customer, the ID
and line number of the associated internal purchase order is displayed.

Internal Demand Stat
The status of the internal demand is displayed. The status of the
internal purchase order is displayed in this field, except in these
cases:

* If the purchase
  order line has a status of Closed and no quantity has been received
  on the line, then Closed is displayed in the Internal Demand Stat
  column
* If the purchase
  order has a status of Closed or Canceled and the quantity on the
  line is partially received, then Received is displayed in the
  Internal Demand Stat column. At least one unit must be received
  for this status to be used.
* If the purchase
  order line has a status of Closed and the quantity on the line
  is partially received, then Received is displayed in the Internal
  Demand Stat column. At least one unit must be received for this
  status to be used.
* If the purchase
  order has a status of Firmed or Released and the quantity on the
  line is partially received, then Partial is displayed in the Internal
  Demand Stat column. At least one unit must be received for this
  status to be used.

Demand Dimensional Info
If this is a piece tracked part, the number of whole pieces required
to meet the demand and the dimensions of the part are displayed.

Demand Dimensional Info
no Scrap If the demand transaction is a work order, the number
of whole pieces required without factoring in scrap percentages is
displayed. The dimensions of the part are also displayed.  

Demand User-defined Fields
Optionally, you can show the user-defined fields from the demand
order. The user-defined information that is displayed depends upon
the type of demand order. For work orders, the user-defined fields
from the Header card are displayed. For sales orders with delivery
schedules, the user-defined fields from the delivery schedule are
displayed. For sales orders without delivery schedules, the user-defined
fields from the sales order line are displayed. To show these fields,
select Options, Configure
Table and include the colREQD\_USER\_1 through colREQD\_USER\_10
columns.

Want Date Optionally,
you can show the want date for work orders that generate demand. If
you display this column, the Want Date specified on the work order
header is displayed in the column. If a date is not specified on the
header card, then the standard infinity date is displayed. If the
demand transaction is not a work order, then the Want Date column
is blank. To show this column, select Options,
Configure Table and include the colREQD\_WANT\_DATE
column.

CO Promise Ship Date
Optionally, you can show the date that you promised to ship the
order. This date is specified on the customer order. To show this
column, select Options, Configure
Table and include the colCO\_PROM\_SHIP\_DATE column.

CO Promise Del Date
Optionally, you can show the date that you promised to deliver the
order. This date is specified on the customer order. To show this
column, select Options, Configure
Table and include the colCO\_PROM\_DEL\_DATE column.

Projected Quantity The quantity remaining
in your inventory after you fill the order. This number can be negative.
Deficits are displayed in red.

Supply Information The table displays
this information about supply orders:

Supply Warehouse
The warehouse expecting supply of the part.

Quantity Ordered
The total quantity of the part ordered.

Quantity Received
The quantity of part that has been received.

Net Quantity Due
The remainder of quantity to be received.

Due Date The date
on which the order is expected to be received.

Release Date The
date the order was released.

Order ID The Order
ID of the supply line. Order IDs are preceded by these codes:

P The supply is
a purchase order.

WH The supply is
an interbranch transfer.

PL The supply is
a planned order.

If the order ID is not preceded by a code,
then the supply is a work order.

If there is an asterisk after the work order
ID, then the work order is for a rate-based part. A rate-based part
is a fabricated part that you produce in predictable daily quantities.
See [What Are Rate-based Parts?](What_Are_Rate-based_Parts_.md)

Vendor ID The
ID of the vendor on the purchase order is displayed.

Vendor Name Optionally,
you can show the name of the vendor on the purchase order. To show
this field, select Options, Configure
Table and include the colVEDNDOR\_NAME column.

Internal Supply
If the sales order is an internal sales order, the ID and line number
of the associated internal sales order is displayed.

Internal Supply Stat
The status of the internal supply is displayed. The status of the
internal sales order is displayed in this field, except in these cases:

* If the sales
  order line has a status of Closed and no quantity has been shipped
  on the line, then Closed is displayed in the Internal Supply Stat
  column
* If the sales
  order has a status of Closed or Canceled and the quantity on the
  line is partially shipped, then Shipped is displayed in the Internal
  Supply Stat column. At least one unit must be shipped for this
  status to be used.
* If the sales
  order line has a status of Closed and the quantity on the line
  is partially shipped, then Shipped is displayed in the Internal
  Supply Stat column. At least one unit must be shipped for this
  status to be used.
* If the sales
  order has a status of Firmed, Released, or Hold and the quantity
  on the line is partially shipped, then Partial is displayed in
  the Internal Demand Stat column. At least one unit must be received
  for this status to be used.

Issue Late The
number of days that the issue of materials and services for the order
is late. This field is displayed if you have selected the Exception
Severity option available on the View menu.

Order Late The
number of days the order is overdue. This field is displayed if you
have selected the Exception Severity option available on the View
menu.

Release Late The
number of days the release of an order is overdue. The current date
is compared to the date in the Due Date field to determine this value.
This field is displayed if you have selected the Exception Severity
option available on the View menu.

Confirmed Ship Date
The date that the vendor sent the items to you. This information
is specified manually on the purchase order; it is not read from an
electronic document, such as an advanced ship notice. If a confirmed
ship date was specified on the purchase order line, then the date
from the line is displayed. If a confirmed ship date was specified
on the purchase order header only, then the date specified on the
header is displayed. The date is informational only.

Suggested Release Late
The number of days the release is overdue when compared to the suggested
release date. The current date is compared to the date in the Suggested
Release Date field to determine this value. This field is displayed
if you have selected the Exception Severity option available on the
View menu.

Order Projected Early
The number of days before the due date an order will be completed.
The suggested release date is compared to the due date to determine
this value. This field is displayed if you have selected the Exception
Severity option available on the View menu.

Order Projected Late
The number of days after the due date the order will be completed.
The suggested release date is compared to the due date to determine
this value. This field is displayed if you have selected the Exception
Severity option available on the View menu.

Stock Out The
quantity of part needed to meet current demand. This field is displayed
if you have selected the Exception Severity option available on the
View menu.

Over Stock The
quantity of part in excess of the amount required to meet demand.
This field is displayed if you have selected the Exception Severity
option available on the View menu.

Supply Dimensions Info
If this is a piece tracked part, the number of whole pieces and
the dimensions of the pieces in the supply source are displayed.

Supply User-defined Fields
Optionally, you can show the user-defined fields from the supply
order. The user-defined information that is displayed depends upon
the type of supply order. For work orders, the user-defined fields
from the Header card are displayed. For purchase orders with delivery
schedules, the user-defined fields from the delivery schedule are
displayed. For purchase orders without delivery schedules, the user-defined
fields from the purchase order line are displayed. To show these fields,
select Options, Configure
Table and include the colDUE\_USER\_1 through colDUE\_USER\_10
columns.

Exception Information This exception
information is displayed:

Exception The
most important exception is displayed in this field. This field is
displayed if you have cleared the Exception Severity option available
on the View menu.

Suggested Release
The date on which VISUAL suggests that you release the order. This
is done by subtracting the Lead Time for the part (purchased or fabricated)
from the required date for the demand.

For a purchase order, this is the date you
should place the order for the part. For a work order, this is the
date you should release the order.

Suggested Release Date uses the part lead
time to back off a release date for a work order. You should consider
this when setting the lead time for a fabricated part. VISUAL does
not examine the Concurrent Schedule to determine whether the lead
time can be met with the currently planned shop load. If you choose
to place a work order based on this date, you should then use Check
Availability in the Manufacturing Window to assess whether this produces
a finish date that meets the demand requirement date. You should then
use Schedule Current Work Order, or run the Concurrent Scheduler,
to add the new work order into the schedule

Schedule Start
If an order has been scheduled, the date that work on the order is
schedule to start.

Schedule Finish
If an order has been scheduled, the date that work on the order
is scheduled to be complete.

Rel Near If the
release date for a supply order with no aligned demand order is three
or fewer days away, a check mark is inserted in this column. This
field is displayed if you have selected the Exception Severity option
available on the View menu.

Sugg Rel Near
If the suggested release date for a supply order with no aligned demand
order is three or fewer days away, a check mark is inserted in this
column. This field is displayed if you have selected the Exception
Severity option available on the View menu.

|  |  |
| --- | --- |
| POSTIT.gif | For Project users, if you select a project related Part ID, the WBS Codes relating to the line item appear. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enforcing_Referential_Integrity.md) Enforcing Referential Integrity