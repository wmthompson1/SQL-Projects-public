Assigning Released Work Order Receipt Quantities to Demand Links




# Assigning Released Work Order Receipt Quantities to Demand Links

If a source of demand is linked to a work order, you
can specify how much of the receipt quantity to assign to the demand
when you receive the work order in Inventory Transaction Entry.

You can use the Assign Released Work Order Receipt Quantities to
Demand Links function to assign receipts to existing demand only.
You cannot create a new demand link in this dialog. To create a new
demand link, see [Allocating
Released Work Order Quantities to Demand](Allocating_Released_Work_Order_Quantities_to_Demand.htm).

To specify the quantity to assign to demand:

1. Select Inventory,
   Inventory Transaction Entry.
2. Click Receipt
   by WO.
3. Click the Work
   Order ID button to select the work order to receive.
4. In the Quantity field,
   specify the receipt quantity.
5. Select Edit,
   Assign Receipt Quantity to Demand Links.
   A list of the demand transactions linked to the work order is
   displayed. These fields are displayed:

Order Quantity
- The order quantity of the current work order.

Total Received Quantity
- The quantity of the work order that you have received into inventory.

Allocated Quantity
- The portion of the work order Order Quantity that you have allocated
to demand.

Fulfilled Quantity
- The quantity that you have allocated to demand successfully used
in order fulfillment.

Fulfill Overage Quantity
- The quantity successfully allocated to demand in excess of the allocated
quantity.

Demand Overage Quantity
- The quantity, if the receive quantity that you assign to a link
plus the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the work order that you are receiving.

Remaining Quantity to
Assign - The portion of the received quantity that you still
can allocate to demand. When this value equals zero, you cannot make
any further allocations to demand. This value is arrived at by subtracting
the work orders Allocated Quantity from the Received Quantity.

6. The table lists the
   sources of demand linked to the transaction. In the Assign Quantity
   column, specify the quantity to assign to demand. The quantity
   you assign cannot exceed the quantity you are receiving.
7. Click Ok.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.htm) User-defined Help