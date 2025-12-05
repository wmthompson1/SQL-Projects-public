Placing a Purchase Order




# Placing a Purchase Order

When the current part is a purchased part, you can
create a new purchase order for it. You can purchase materials to
inventory or directly to jobs.

1. If you want to purchase
   materials specifically for one or more jobs, select the lines
   containing the demand work order operations for the jobs, then
   select Purchase to Jobs from the Edit menu.

If you want to purchase materials to inventory,
select Purchase to Inventory from the Edit menu.

The Purchase Material dialog appears.

Each selected demand work order operation
appears in the table at the upper left.

The total Required Quantity for any work
order operations you selected appears in the Reqd Qty field.

Note: If you are
ordering a piece tracked part, the number of whole pieces required
to meet the demand is ordered. As a result, the total quantity ordered
could exceed the required quantity.

2. If you wish to order
   any additional quantity, enter it in the Addl Qty field.

VISUAL automatically adjusts the Order Quantity
to equal Required Quantity + Additional Quantity.

If you change the Order Quantity, VISUAL
automatically adjusts the Additional Quantity. If you are linking
this purchase to jobs, however, Order Quantity cannot be less than
the Required Quantity for the jobs you selected.

If you are ordering a piece tracked part,
this field is unavailable.

3. Select a vendor.

If there is a primary vendor defined for
the part, the Vendor ID default to this vendor. You can select from
the other vendors specified for this part by selecting one from the
drop down menu. You are not restricted to these vendors; you can use
the Vendor ID for any vendor, if needed.

If you specified an internal vendor in the
Vendor ID field, then the Internal Order check box is selected. Select
the check box to use the automated internal buy/sell process. Specify
the ID of the internal customer in the Customer ID field. When you
create the purchase order, the corresponding sales order is created.

4. Specify an Order ID
   in the Order ID field, if necessary.

Otherwise, VISUALs auto numbering feature
assigns the Purchase Order ID.

5. Choose the purchase
   order status.

Click the appropriate radio button for Firm
or Release purchase order status.

6. Specify requirement
   linking.

If you are purchasing to jobs, you may wish
to link the purchases directly to the work order requirements. This
earmarks the purchase for the job, and enables automatic issuing of
the material when it is received.

If you selected Purchase to Jobs, the Link
to Each Requirement box is checked by default. If you do not wish
to link purchases to jobs, clear this box.

If you are unsure of which jobs may already
have linked purchases, you can select each work order requirement
from the table. VISUAL lists any existing linked POs for this requirement
in the table at the bottom of the dialog box.

Additionally, the Total Quantity Required
and Total Quantity Issued for the requirement appear. This allows
you to assess what quantities have already been purchased to the job,
and which are still needed.

If you selected Purchase to Inventory, the
Link to Each Requirement option does not apply.

7. If you specified an
   internal vendor in the Vendor ID field, then the Internal Order
   check box is selected. Select the check box to use the automated
   internal buy/sell process. Specify the ID of the internal customer
   in the Customer ID field. When you create the purchase order,
   the corresponding sales order is created.
8. Click the Order
   button to place the order.

VISUAL creates the new purchase order. The
purchase order has a separate line item for each requirement purchased
to, and an extra line for any additional quantity. If purchasing to
inventory, the purchase order contains a single line item for the
total Order Quantity.

The Purchase Material dialog box closes
after VISUAL creates the purchase order. The Material Planning Window
refreshes so netting shows the effects of the new order.

At any point in this process, click the
Close button to cancel without placing the
order.

You can view and modify the new purchase
order by selecting Display Supply (Due) Order from the Info menu,
or by opening Purchase Order Entry directly.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information