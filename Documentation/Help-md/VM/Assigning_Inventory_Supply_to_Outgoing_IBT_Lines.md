Assigning Inventory Supply to Outgoing IBT Lines




# Assigning Inventory Supply to Outgoing IBT Lines

1. With the interbranch
   transfer line to which you want to assign supply highlighted,
   select Assign Supply to IBT Line from
   the Edit Menu.

The Supply Links dialog box appears.

The following read-only information appears
in the header section:

IBT ID/Line# -
The ID of the current IBT; the line of the IBT to which you are attempting
to assign supply.

IBT Qty - The
order quantity of the IBT line.

Shipped Qty -
The quantity of the IBT line that you have shipped. Unless you have
partially shipped this line and chosen to keep it open with a balance
pending possible future shipments, the value is zero for new IBTs.

Allocated Qty
- The portion of the IBT Qty to which you have allocated supply. Before
you establish any links of supply, this value is zero.

Fulfilled Qty
- The allocated quantity that has been fulfilled by the supplying
source.

Remaining Qty
- The quantity to which you have yet to assign supply. Before you
establish any links of supply, this quantity is equal to the IBT Quantity.

Part ID - The
ID of the part on the IBT line.

Part Description
- A description of the part. This defaults from Part Maintenance.

Stock U/M - The
stock unit of measure of the part. This defaults from Part Maintenance.

IBT U/M - The
selling unit of measure of the part. This defaults from Part Maintenance.

Warehouse ID -
The From Warehouse ID of the IBT line.

Desired Ship Date
- The IBTs desired ship date, or the date on which shipment to the
To Warehouse is most ideal. Provide a Desired Ship Date during IBT
entry.

2. Click the Insert
   button.
3. From the Type list box,
   select I.
4. Double-click <Supply
   Base ID> to view a list of warehouses that contain the
   specified part and the quantities therein

The line item table contains the following
columns for each warehouse line:

Warehouse ID -
The ID of the warehouse.

Available Qty
- The quantity of parts in the warehouse available to allocate to
an IBT line.

Committed Qty - The quantity of parts in
the warehouse that is already committed to future receipts or orders
soon to ship.

Outbound Quantity
- The quantity of parts from interbranch transfers shipped from this
warehouse (From Warehouse) but as yet unreceived at the destination
warehouse (To Warehouse). After parts are received, they lose this
designation.

Expected Qty -
The quantity of the part that you are expecting in the warehouse at
a future date from some source of supply.

Expected/Committed
- The quantity of the part that you are expecting in the warehouse
at a future date from some source of incoming supply that is already
committed to outgoing supply.

5. Select the warehouse
   from which you want to allocate supply and click Ok.

The necessary warehouse information is loaded
in the Supply Links dialog box line item table.

6. In the Allocate Qty
   column, enter the quantity of parts you want to allocate from
   the warehouse to the IBT line.

This value (Allocate Quantity) cannot be
greater than the quantity of the IBT line itself (IBT Qty), or the
quantity of the IBT to which have yet to assign supply (Remaining
Qty). You cannot continue if the value you enter is greater than any
of these values.

7. Click the Save
   button to commit the allocation of supply from inventory to the
   outgoing IBT line.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information