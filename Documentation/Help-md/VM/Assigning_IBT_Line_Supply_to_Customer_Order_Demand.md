Assigning IBT Line Supply to Customer Order Demand




# Assigning IBT Line Supply to Customer Order Demand

1. With the IBT line from
   which you want to assign part quantities to demand highlighted,
   select Assign Demand to IBT Line from
   the Edit Menu.

The Assign to Demand dialog box appears.

The following read-only information appears
in the header section:

IBT ID/Line# -
The ID of the current IBT; the line of the IBT from which you are
assigning part quantities to demand.

IBT Qty - The
order quantity of the IBT line.

Received Qty -
The quantity of the IBT line that you have received. Unless you have
partially received this line and chosen to keep it open with a balance
pending possible future shipments, the value is zero for new IBTs.

Allocated Qty
- The portion of the IBT Qty you have allocated to demand. Before
you establish any demand links, this value is zero.

Fulfilled Qty
- The allocated quantity that has been fulfilled by the supplying
source.

Available Qty
- The quantity available to assign to demand. Before you establish
any demand links, this quantity is equal to the IBT Quantity.

Part ID - The
ID of the part on the IBT line.

IBT U/M - The
selling unit of measure of the part. This defaults from Part Maintenance.

Warehouse ID -
The To, or destination, Warehouse ID of the IBT line.

Desired Recv Date
- The IBTs desired receive date, or the date on which reception of
the line at the To Warehouse is most ideal. Provide a Desired Recv
Date during IBT entry.

2. Click the Insert
   button.
3. From the Type list box,
   select CO.
4. Double-click <Supply
   Base ID> to search for qualifying customer order line
   supply

The Customer Orders dialog box appears.

The line item table contains a list of all
the customer orders in your database.

5. Select a customer order
   and click the Select/Close button.
6. In the Supply Links
   dialog box, double-click <Seq#/Line#>
   to view the lines items of the customer order to which you can
   allocate supply.

The Customer Order Lines dialog box appears.

7. Select how you want
   qualifying C/O demand lines searched for, and click the Apply button.

If any exist in the database, a list of
qualifying customer order lines appears.

8. Select the line to which
   you want to allocate IBT supply and click Ok.

The necessary C/O line information is loaded
in the Assign to Demand dialog box line item table.

9. In the Allocate Qty
   column, enter the quantity of parts you want to allocate from
   the IBT line to the customer order line.

This value (Allocate Quantity) cannot be
greater than the quantity of the IBT line itself (IBT Qty), the quantity
of the IBT that you have yet to assign supply to (Available Qty),
or the quantity of the C/O delivery schedule to which you can still
assign supply (Demand Unallocated Quantity). You cannot continue if
the value you enter is greater than any of these three values.

10. Click the Save
    button to commit the allocation of supply from the IBT line to
    the customer order line.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information