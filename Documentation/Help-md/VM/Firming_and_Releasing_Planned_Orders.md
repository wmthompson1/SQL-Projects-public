Firming and Releasing Planned Orders




# Firming and Releasing Planned Orders

Planned requirements and planned orders for a part are numbered
sequentially as they are created. They appear in the Material Planning
Window preceded by the letters PL, then the Part ID/Order Number.
For example, if MRP generates 3 planned orders for part B1241, they
appear as PL B1241/1, PL B1241/2, and PL B1241/3.

When you convert a planned order to a purchase order or work order,
the auto-numbering scheme you set up for the order is used to identify
the order.

If you are licensed to use multiple sites, firm or release planned
orders on a site-by-site basis. If you are licensed to use a single
site, firm or release planned orders on an enterprise-wide basis.

## Firming and Releasing Planned Work Orders

To firm or release a planned work order:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site ID to use. If you are licensed to use as single site, this
   field is unavailable.
2. Click the Part
   ID browse button and select the part that has planned orders.
3. Select a line containing
   the planned supply work order. Planned supply order IDs are prefixed
   with PL and have a status of P.
4. Select Edit,
   Firm/Release Planned Order.
5. In the Part is... section,
   select the Fabricated check box if the part is fabricated. Select
   the Purchased check box if the part is purchased. The Fabricated
   and Purchased settings from the header in the Material Planning
   Window are inserted.
6. In the Work Order section,
   specify this information:

Copy Engineering ID
The default engineering ID for the part is inserted. If you have
defined multiple engineering IDs for the part, click the arrow to
select a different ID.

New Base ID/New Lot/New
Split ID To specify your own work order ID, specify the Base
ID, Lot ID, and Split ID. If you leave these fields blank, then the
auto-numbering scheme you set up for work orders is used.

Forward Schedule from
Release Date Select this check box to schedule the new order
in this way.

Copy All document References
To copy all of the document references from the engineering master,
select this check box.

Copy All Reference Designators
To copy the reference designators from the engineering master, select
this check box. If you do not want to copy reference designators,
clear this check box. Reference designators are used to specify the
location where the material in the requirement should be placed.

Copy All Alternate Parts
To copy the alternate parts from the engineering master, select
this check box. If you do not want to copy reference designators,
clear this check box. Alternate parts are parts that can be used in
place of the part specified on the material card.

7. In the Status section,
   specify the status of the work order you are creating. Select
   Unreleased, Firm, or Released.
8. Specify this information:

Warehouse ID
Specify the ID of the warehouse where the part will be received. By
default, the primary warehouse for the part is inserted.

Quantity Specify
the quantity to make in the work order. By default, the quantity generated
for the planned order by MRP is inserted.

Rls Date Specify
the date to release the work order. This is the earliest date that
work on the order can begin.

Want Date Specify
the date that the work order should be complete. This is the date
that the parts produced in this work order should be available for
use.

9. Click Order.

The planned supply order is converted to an actual order. Any material
requirements for the planned order are replaced by the actual requirements
associated with the new order.

Remember that you must schedule any new work orders using the Concurrent
Scheduler or the Schedule Current Work Order command in the Manufacturing
Window.

## Firming and Releasing a Planned Purchase Order

If you are licensed to use multiple sites, you can create an internal
purchase order from the planned purchase order. You can also create
a standard, external purchase order.

To firm or release a planned purchase order:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site ID to use. If you are licensed to use as single site, this
   field is unavailable.
2. Click the Part
   ID browse button and select the part that has planned orders.
3. Select a line containing
   the planned supply purchase order. Planned supply order IDs are
   prefixed with PL and have a status of P.
4. Select Edit,
   Firm/Release Planned Order.
5. In the Part is... section,
   select the Fabricated check box if the part is fabricated. Select
   the Purchased check box if the part is purchased. The Fabricated
   and Purchased settings from the header in the Material Planning
   Window is inserted.
6. In the Purchase Order
   section, specify this information:

Order ID Specify
the ID of the purchase order. To use your number generation scheme
for purchase orders, leave this field blank.

Vendor ID Specify
the ID of the vendor from whom you are purchasing this material. To
create an internal purchase order, specify the ID of an internal vendor.
Use internal purchase orders if you are licensed to use multiple sites
and you want one of your entities to supply another entity.

Mfg Name Specify
the name of the manufacturer of the part you are ordering. This information
is optional.

Mfg Part ID
Specify the ID that the manufacturer uses for this part. This information
is optional.

Internal Order
If you specified an internal vendor, this check box is selected.
Select this check box to create an internal purchase order. When you
create an internal purchase order, a corresponding internal sales
order is created automatically. Specify the ID of the internal customer
in the Internal Customer field. If you want to use an internal vendor
for this order, but you do not want to automatically create a corresponding
sales order, clear the check box.

Internal Customer
If you selected the Internal Order check box, you must specify the
ID of the internal customer that is purchasing the goods. If a default
internal customer ID is defined for the site in Site Maintenance,
then that customer ID is inserted. You can specify a different internal
customer ID.

7. In the Status section,
   specify the status of the purchase order you are creating. Select
   Firm or Released.
8. Specify this information:

Warehouse ID
Specify the ID of the warehouse where the part will be received. By
default, the primary warehouse for the part is inserted.

Quantity Specify
the quantity to order. By default, the quantity generated for the
planned order by MRP is inserted.

Rls Date Specify
the date that the purchase order is released. The date you specify
is inserted in the Order Date field when the purchase order is created.

Want Date Specify
the date that the purchase order should be received. This date is
inserted in the Desired Recv Date when the purchase order is created.

9. Click Order.
   If the part that you are ordering is not a piece tracked part,
   then the Firm/Release Planned Order dialog is closed. If the part
   that you are ordering is a piece tracked part, then the Dimensional
   Pieces dialog is opened. This information is displayed:

Pieces The number
of whole pieces needed to fulfill the demand is displayed. This is
the number of pieces that will be ordered.

Length, Width, and Height
The dimensions of the piece is displayed. You can change the dimensions.
If you change the dimensions, the values in the Pieces and Piece Qty
field are adjusted so that you order enough pieces to meet the demand.

Reqd Qty The
amount required to meet the demand.

Piece Qty The
quantity in the order is displayed. This quantity is the number of
pieces multiplied by the dimensions and converted from the usage unit
of measure to the stock unit of measure.

9. Click Ok.

If you create an internal purchase order, the corresponding sales
order is also created.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information