Viewing Part Information




# Viewing Information in the Material Planning Header

After you have selected a Part ID, the header displays
general information for the part. The table displays current demand
and supply for the part.

The header displays this general part information:

Fabricated The Fabricated check box
is selected if the part is designated as a fabricated part in the
part master.

Purchased The Purchased check box is
selected if the part is designated as a purchased part in the part
master.

Stocked The Stocked check box is selected
if the part is designated as a purchased part in the part master.

Auto Issue This check box is selected
if you selected this setting in Part Maintenance.

Inspection Required This check box is
selected if you selected this setting in Part Maintenance.

Piece Tracked This check box is selected
if a part is inventoried using piece tracking.

Obsolete The Obsolete check box is selected
if the part is designated as an obsolete part in the part master.
Obsolete parts are inactive inventory parts. Before you can declare
a part obsolete, VISUAL checks to make sure the part has no outstanding
transactions reported against it.

Drawing ID The ID of the drawing number
or file of the part.

Drawing Revision Number The drawing
revision number of the part.

Planner The ID of the planner responsible
for the part.

Buyer The ID of the buyer responsible
for the part.

Active ECN If the part, either as subject
of a work order or a engineering master, has an Active Engineering
Change Notice associated to it.

Engineer ID The Engineer ID that you
assigned to the part in Part Maintenance.

Unit of Measure The parts default unit
of measure from Part Maintenance.

Product Code The product code that you
assigned to the part in Part Maintenance.

Commodity Code The commodity code that
you assigned to the part in Part Maintenance.

Order Policy The order policy for the
part that you set in Part Maintenance. One of these is displayed:
Not Planned, Discreet, Period Supply # of days, Fixed EOQ, Master
Schedule.

Leadtime The number of days that you
need to replenish the part.

Safety Extra amount of a part that you
plan to keep in excess of real demand to cover fluctuations in demand
caused by unplanned orders, scrap, or other events.

Warehouse on Hand The quantity of the
part in the warehouse that is available for use.

Warehouse on Hold The quantity of the
part in the warehouse you have placed on Hold.

Primary Warehouse The default primary
warehouse of the part.

Primary Location The primary location
of the part. The primary location must be a location in the Primary
Warehouse.

Total On Hand The total quantity that
is stored in all locations in the selected warehouses.

Total On Hold The total quantity that
is stored in locations that are set to On Hold or Unavailable.

Netable The total quantity that is stored
in all locations in the selected warehouses, minus the quantity that
is stored in Unavailable locations.

Total Unit Cost The material cost of
the part.

Preferred Vendor ID The ID of the vendor
that you prefer provide the part or a service on the part.

Min/Max/Mult For MRP purposes, this
is the multiple of the min/max order quantity to use for planned orders.
Order quantities should be divisible by this number. If a part has
an order policy of Master Schedule, VISUAL generates planned orders
with this value as a guide. For a part with a Multiples of value of
500 and dependent demand for a period equaling 435, VISUAL produces
an MRP quantity of 500 rather than a matching quantity of 435. Without
a Multiples of value in a part master, MRP always equals 435, the
same as Dependent Demand.

Minimum Order Qty Minimum suggested
quantity used by MRP when placing a planned order (when MRP is implemented).
VISUAL uses this number as a material planning guide. An entry of
zero means there is no minimum. This number does not restrict other
types of orders and is only used by MRP when creating planned orders.
You set this value in Part Maintenance.

Maximum Order Qty Maximum quantity used
when processing a planned order. This number does not restrict other
types of orders and is only used by MRP. An entry of zero means there
is no maximum. You set this value in Part Maintenance.

IBT Transit This field is displayed
only if you select a warehouse. If you have shipped quantities for
interbranch transfers, the quantity is inserted in this field. This
quantity is not available for netting.

Leadtime Buffer (in days) For stocked
materials that you purchase, the lead-time buffer is a generous allowance
of time to comfortably obtain more materials (including time to place
the purchase order).

Min Leadtime (in days) For stocked materials
that are purchased the minimum lead-time buffer is the shortest time
in which you could obtain more.

Demand Horizon (in days) The number
of days from the current date to examine for demand.

Latest Buffer Status The current status
of the buffer for this part.

Emergency Stock % The current setting
for the emergency stock level for this part.

Replenishment Level The current replenishment
level for this part.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.md) User-defined Help