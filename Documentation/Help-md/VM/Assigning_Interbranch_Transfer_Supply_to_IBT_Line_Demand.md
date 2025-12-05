Assigning Interbranch Transfer Supply to IBT Line Demand




# Assigning Interbranch Transfer Supply to IBT Line Demand

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
   select WH.
4. Double-click <Supply
   Base ID> to search for qualifying IBT demand lines.

The Interbranch Transfers Demand dialog
box appears.

5. Select how you want
   qualifying IBT lines of demand searched for, and click the Apply button.

If any exist in the database, a list of
qualifying IBT lines of demand appear.

6. Select the IBT line
   from to you want to allocate supply and click Ok.

The necessary IBT line information is loaded
in the Supply Links dialog box line item table.

7. In the Allocate Qty
   column, enter the quantity of parts you want to allocate from
   the current IBT line to the demand IBT line.

This value (Allocate Quantity) cannot be
greater than the quantity of the IBT line itself (IBT Qty), the quantity
of the IBT that you have yet to assign supply to (Available Qty),
or the quantity of the work order material requirement to which you
can still assign supply (Demand Unallocated Quantity). You cannot
continue if the value you enter is greater than any of these three
values.

8. Click the Save
   button to commit the allocation of supply from the current IBT
   line to the demand IBT line.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information