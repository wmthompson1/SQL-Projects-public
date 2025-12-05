Assigning IBT Receipt Quantities to Customer Order Demand




# Assigning IBT Receipt Quantities to Customer Order Demand

1. If it is not already
   open, select Interbranch Transfer Receipts
   Entry from the Infor VISUAL Tools menu. The Interbranch
   Transfer Receipts window appears.
2. Click the IBT ID button
   to select the IBT you want to receive.
3. In the Receive Quantity
   column, enter what portion of the total IBT Order Quantity you
   want to receive.

By default, the entire Order Quantity appears
in this column. See [Receiving Interbranch
Transfer Entries](VMIBTRCVfrmReceiving.htm) for more information.

Besides being the receipt quantity, this
quantity is now what is available to you to assign to demand.

4. From the Edit menu,
   select Assign Receipt Quantity to Demand Links.
   The Assign to Demand dialog box appears.

The following fields
appear in the header section:

Order Quantity
- The order quantity of the current IBT.

Total Received Quantity
- The quantity of the current IBT that you have received into inventory.
Unless this IBT has remained open due to a prior receipt of partial
quantities, this value should be zero.

Allocated Quantity
- The quantity of supply that you allocated to the IBT during the
creation of the IBT from a source of supply using the Assign
Supply to IBT Line option in the IBT Entry window. For example,
if you allocated full supply to this IBT from a purchase order, this
value is equal to the IBT Order Quantity. See [Allocating
Supply to IBT Lines](Allocating_Supply_to_Interbranch_Transfers.htm) more information.

Fulfilled Quantity
- The portion of the quantity that you have allocated to demand successfully
used in order fulfillment.

Fulfill Overage Quantity
- The quantity, if the receive quantity that you assigned to a link
results in the link received quantity being greater than the link
allocated quantity.

Demand Overage Quantity
- The quantity, if the receive quantity that you assign to a link
plus the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the IBT line that you are receiving. The quantity
you entered in Step 3 appears here.

Remaining Quantity to
Assign - The portion of the received quantity that you can
allocate to demand. When this value equals zero, you cannot use this
IBT to make any further allocations to demand without editing the
original Receipt Quantity.

5. Click the Insert
   button to begin adding demand link information.
6. From the Type
   list box, select CO.
7. Double-click <Demand
   Base ID> to view a list of customer orders. The customer
   orders that appear are all the customer orders currently in your
   database. Though this may be helpful, you probably want to view
   only those customer order lines with the same Part ID as the current
   IBT, the only ones to which you can attach a link.

To avoid selecting a customer order that
may not contain the same Part ID, skip step 5. Instead, double-click
<Seq #/ Line # > to view all
existing customer lines with unallocated quantities for the focus
Part ID. Skip to step 7.

8. If you are selecting
   a customer order from the customer order dialog box (having double-clicked
   <Demand Base ID>), select the
   appropriate customer order and click the Select/Close
   button. Skip the next step.

If you are selecting a customer order line
from a list of customer order lines for that Part ID only, double-click
<Seq #/Line #> to view all customer
order lines in your database with that Part ID. Skip to step 8. The
Customer Order Demand dialog box appears.

If you selected a customer order already
from the Customer Orders dialog box, only the lines from that specific
order appear in this dialog box now.

9. Configure a search using
   the options in the header section and then click the Apply
   button.

For searches within one customer order only,
any of the line items of the selected customer order that meet your
search criteria appear.

10. Select the appropriate
    line and click the Ok button. The selected
    customer order line information appears in the Assign to Demand
    dialog box line item table.
11. In the Assign
    Quantity column, enter what portion of the IBT receipt
    line's Remaining Quantity to Assign
    you want to allocate to this customer order line.

This quantity cannot be greater than the
Remaining Quantity to Assign of the IBT
receipt quantity or the Unallocated Requirement
Quantity of the customer order line.

12. Click the Ok
    button to commit the allocation of supply from the IBT receipt
    quantity to the customer order line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Receipt_Entry.htm) User-defined Help