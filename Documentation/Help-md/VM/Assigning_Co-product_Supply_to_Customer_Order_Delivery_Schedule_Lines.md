Assigning Co-product Supply to Customer Order Delivery Schedule Lines




# Assigning Co-product Supply to Customer Order Delivery Schedule Lines

If you are unsure about which lines customer order
lines are delivery schedule lines, scroll down the Customer Order
Entry window line item table until you find the Del
Sched column. If a check appears in the column, the line is
a delivery schedule; if not, there are no delivery schedule lines
for this customer order line.

1. With the customer order
   that contains the delivery schedule to which you want to assign
   supply displaying in the Customer Order Entry window, highlight
   the appropriate customer order line and click the Del
   Sched tab. The Edit Delivery Schedule Dialog box appears
   with all delivery schedule line items for the customer order line
   displaying in the line item table.
2. Select the line to which
   you want to allocate supply and click the Supply
   button. The Supply Links dialog box appears.

The following information
appears in the header section of the dialog box:

Order ID/Line #/Del Sched
Line # - The Order ID of the current customer order; the line
number of the customer order delivery schedule line in the customer
order; the line number of the delivery schedule line in the delivery
schedule.

Order Qty - The
order quantity of the customer order delivery schedule line.

Total Shipped Qty
- The quantity of the customer order delivery schedule line that you
have shipped. Unless you have performed a partial shipment for this
line and chosen to keep the order open with a balance pending possible
future shipments, this value is zero for new customer order delivery
schedules.

Allocated Qty
- The portion of the Order Qty to which you have allocated supply.
Before you establish any links to supply, this value is zero.

Fulfilled Qty
- The quantity that has been fulfilled from the supplying source.

Remaining Qty
- The quantity to which you have yet to assign supply. Before you
establish any links of supply, this quantity is equal to the Order
Quantity of the line.

3. From the Type list box,
   select the source of supply for this delivery schedule line.

CP - To assign
coproduct supply to this delivery schedule line, select CP.

I - To assign
warehouse inventory to this delivery schedule line, select I.

PD - To assign
purchase order delivery schedule supply to this delivery schedule
line, select PD.

PO - To assign
purchase order supply to this delivery schedule line, select PO.

WH - To assign
inter-branch transfer supply to this delivery schedule line, select
WH.

WO - To assign
work order supply to this delivery schedule line, select WO.

4. Depending on your choice
   in step 3, double-click the <Supply Base
   ID> column header to search for qualifying supply quantities.

For type CP, a dialog box appears that allows
you to search work orders for qualifying coproduct supply.

For type I, a list of warehouses that contain
the part appear.

For type PD, a dialog box appears that allows
you to search for qualifying purchase order delivery schedules.

For type PO, a dialog box appears listing
all purchase orders.

For type WH, a dialog box appears that allows
you to search for qualifying inter-brach transfers.

For type WO, a dialog box appears listing
all work orders.

5. If any lines appear
   that meet your search criteria, select the appropriate line and
   click the Ok button.
6. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   available supply to the customer order delivery schedule line.
   This quantity cannot be greater than the Supply Unallocated Quantity
   of the line or the Remaining Quantity to Assign of the customer
   order delivery schedule line.
7. Click the Ok
   button to commit the allocation of supply to the customer order
   line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help