Assigning IBT Ship Quantities to Supply Links




# Assigning IBT Ship Quantities to Supply Links

You can assign an IBT ship quantity to one if its
supply links before shipping.

1. With the IBT line that
   contains the supply links from which you want to assign the ship
   quantities highlighted in the IBT Shipping Entry line item table,
   select Assign Ship Quantities to Supply Links
   from the Edit menu. The Assign to Supply dialog box appears.

The line item table contains the current
IBTs supply links.

The header section contains
the following fields:

Order Quantity
- The order quantity of the current IBT that you are shipping.

Total Shipped Quantity
- The quantity of the Order Quantity that you are shipping. This can
be a greater value (See overshipments) or a partial value (See partial
shipments)

Allocated Quantity
- The quantity of supply that you have allocated to the current IBT.
This value cannot be greater than the Order Quantity.

Fulfilled Quantity -

Shipped Quantity
- The quantity that you have actually shipped. This should be zero
during this process.

Remaining Quantity to
Assign - The remaining quantity of the Order Quantity that
you still may assign to supply links.

The line item table contains
the following columns:

Supply ID - The
ID of the supply link. Enter supply links in the Interbranch Transfer
Entry window.

Assign Quantity
- The portion of the Remaining Quantity to Assign Quantity that you
want to assign to the supply link.

Link Unreceived Quantity
- The supply "Link" quantity that you have yet to receive.

Desired Receive Date
- The date that you want to receive the supply link line. For example,
if the supply link is a P/O, then its the day you want to receive
the P/O.

Supply Unfulfilled Quantity
- The quantity of the supply link line that you have yet to
fulfill.

Supply Quantity
- The order quantity of the supply link line.

Supply Received Quantity
- The quantity of the supply link line that you have received.

Link Allocated Quantity
- The quantity of the supply link line that you have allocated to
the customer order line at hand.

Link Received Quantity
- The linked quantity you have received.

Link Issued Quantity
- The issued quantity you have received.

Supply Part ID
- The ID of the part for the supply link line. This is usually the
same as the Part ID of the C/O line.

Vendor ID - The
ID of the vendor if the supply link is a P/O or P/O delivery schedule
line.

Vendor Part ID
- The Vendors ID of the part.

2. In the Assign Quantity
   column, enter the ship quantity you want to assign to the supply
   link.
3. Click the Ok
   button to commit the assignment of supply to the ship quantity.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Shipping_Entry.htm) User-defined Help