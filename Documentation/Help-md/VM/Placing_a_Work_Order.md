Placing a Work Order




# Placing a Work Order

When the current part is a fabricated part, you can
create an new supply work order for it.

1. If you are placing the
   order to fill specific demand orders, select the line or lines
   containing the orders.

This automatically sets the work order Quantity.

This does NOT link the work order to the
customer order. If you wish to do this, place the new work order first,
then choose Display Demand Order from the Edit menu to call up Customer
Order Entry, then enter the new Job ID information on the customer
order line item.

2. Select Place
   Work Order from the Edit menu.

The Place Work Order dialog box appears.
Customer orders that require the part appear in the table at the left.

3. Click the Warehouse
   button to select a Warehouse ID for the work order.

4. Set the Engineering
   ID of the engineering master to use for the order.
5. If necessary, specify
   the Base ID and Lot ID for the new order.

If you leave these fields blank, Auto Numbering
generates the Work Order ID.

6. Specify the Release
   Date and Want Date for the work order.

If you are placing this order against a
specific demand, you may want to use any Suggested Release Date generated
by Material Netting for this demand. Likewise, the Want Date should
be consistent with the Due Date for the demand order.

7. Modify the quantity,
   if necessary.

If you selected any demand orders in Step
1, the Quantity field defaults to the total of the Net Quantity Due
fields for all the orders selected.

8. Specify the initial
   status for the work order: Unreleased, Firmed, or Released. If
   you create a work order from a master that uses an obsolete resource,
   the system sets the status of the operation that uses the obsolete
   resource to Cancelled.
9. Select the Forward
   Schedule from Release Date check box if you want the order
   to be scheduled in this way. Remember, you must run the Global
   Scheduler, or Schedule Current Work Order, for the new order to
   be recognized in the shop schedule.
10. Select the items to
    copy from the engineering master to the work order:

Copy All Document References
Select this option to copy any document references associated with
the engineering master to the work order.

Copy All Reference Designators
Select this option to copy all reference designators associated
with the materials on the engineering master.

Copy All Alternate Parts
Select this option to copy the list of alternate parts associated
with the materials on the engineering master.

8. Click the Order
   button to create the new work order.

When the order is completed, the dialog
will automatically close, and the Material Planning Window will be
refreshed to show the effects of this new order.

## Viewing and Modifying New Work Orders

You can view and modify the new work order by selecting the appropriate
line from the Material Planning Window and selecting Display
Supply (Due) Order from the Info
menu. The Manufacturing Window appears with the work order in it.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information