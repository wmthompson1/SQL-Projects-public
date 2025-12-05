Assigning Work Order Supply to Outgoing IBT Lines




# Assigning Work Order Supply to Outgoing IBT Lines

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
   select W0.
4. Double-click <Supply
   Base ID> to view a list of all the work orders in your
   database.

The Work Orders dialog box appears.

5. Select the work order
   from which you want to allocate supply and click Ok.

The necessary work order line information
is loaded in the Supply Links dialog box line item table.

6. In the Allocate Qty
   column, enter the quantity of parts you want to allocate from
   the work order to the current IBT line.

This value (Allocate Quantity) cannot be
greater than the quantity of the IBT line itself(IBT Qty), the quantity
of the IBT that you have yet to assign supply to (Remaining Qty),
or the quantity of the co-product line that is available to you (Supply
Unallocated Quantity). You cannot continue if the value you enter
is greater than any of these three values.

7. Click the Save button
   to commit the allocation of supply from the work order to the
   outgoing IBT line.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Assigning
Supply to Outgoing IBT Lines User Defined Information