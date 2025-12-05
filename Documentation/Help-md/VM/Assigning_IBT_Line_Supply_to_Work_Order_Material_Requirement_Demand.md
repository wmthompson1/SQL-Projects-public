Assigning IBT Line Supply to Work Order Material Requirement Demand




# Assigning IBT Line Supply to Work Order Material Requirement Demand

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
   select RQ.
4. Double-click <Supply
   Base ID> to view a list of all the work orders in your
   database.

The Work Orders dialog box appears.

5. Select the work order
   to which you want to allocate supply and click Ok.

The necessary work order line information
is loaded in the Assign to Demand dialog box line item table.

6. Double-click <Seq
   #/Line #> to view a list of work order material requirements
   to which you can assign IBT line supply.

The Work Order Material Requirement Demand
dialog box appears.

7. Using the search and
   sort options in the top portion of the dialog box, select what
   lines of work order material requirement you want displayed in
   the line item table and click Apply.

According to how you configured the search
and sort options all qualifying work order material requirement lines
appear.

8. In the Allocate Qty
   column, enter the quantity of parts you want to allocate from
   the IBT line to the work order material requirement.

This value (Allocate Quantity) cannot be
greater than the quantity of the IBT line itself (IBT Qty), the quantity
of the IBT that you have yet to assign supply to (Available Qty),
or the quantity of the work order material requirement to which you
can still assign supply (Demand Unallocated Quantity). You cannot
continue if the value you enter is greater than any of these three
values.

9. Click the Save
   button to commit the allocation of supply from the IBT line to
   the work order material requirement.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information