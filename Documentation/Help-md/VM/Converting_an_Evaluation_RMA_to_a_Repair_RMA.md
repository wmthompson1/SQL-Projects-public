Converting an Evaluation RMA to a Repair RMA




# Converting an Evaluation RMA to a Repair RMA

When you convert an evaluation RMA to a repair RMA, the evaluation
line is closed and a new line is created in the table to track repair
activities.

If you have received the returned materials as part of the evaluation
process, use this procedure to convert an Evaluation RMA to a Repair
RMA:

1. If you created a quote
   as part of the evaluation process, specify whether to use the
   quote pricing as the cost of the repair. To use the quote pricing
   as the cost of the repair, select the Use Quote
   Pricing check box. If you select this check box, you cannot
   use the Price Repair Orders dialog box as the basis of the cost
   of repair. If you do not want to use the quote pricing as the
   cost of repair, clear the Use Quote Pricing
   check box.
2. In the Type field, select
   Repair.
3. Specify how to process
   the return for repair. Select these options:
4. Ship
   from Original Order To use the original order to ship
   the repaired items, select this check box. When you select this
   check box, the Return to Original Order is also selected. The
   receipt and re-shipment of the repaired materials are made against
   the original order. To use a new order to receive and ship the
   repaired items, clear this check box.
5. Under
   Warranty if the returned material is currently under
   warranty, select this check box. If the returned material is not
   under warranty, clear this check box. This check box is informational
   only. Your selection has no effect on how the RMA is processed.

4. If you cleared the Ship from Original Order check box, specify
   this information:

New Customer Order ID
- To ship repaired parts from an existing customer order, click the
browse button and select the order. To ship from a new order, leave
this field blank.

New Customer ID
- Click the browse button and select the customer who will receive
the repaired parts. To ship the repaired parts to the same customer
who placed the original order, leave this field blank.

5. Click Save.
6. In the Repair work order(s)
   dialog, specify whether to create a work order for the repair.
   Click one of these options:

* Use
  evaluation work order(s) - Click this option to reuse the
  work order that was created for the evaluation.
* Copy
  evaluation work order(s) - Click this option to create
  a work order for the repair by copying the evaluation work order.
* Create
  new work order(s) - Click this option to create a work
  order specifically for the repair.
* No
  repair work orders - Click this option if you do not want
  to create a work order for the repair.

7. This message is displayed:
   Evaluation lines include receipts and/or reshipments. Do you
   want VISUAL to create receipt and shipment transactions for these
   balances? Perform one of these actions:

To open the Customer Shipment Return dialog
box now, click Yes. Adjust the information
in the dialog box as necessary, and then click Save. If you created
a work order, the returned parts are issued to the work order. No
part ID is used on the inventory transaction.

To open the Customer Shipment Return dialog
box later, click No. To complete the RMA,
you must open the Customer Shipment Return dialog box manually to
specify return information. To manually open the Customer Shipment
Return dialog box, select Edit, Customer
Shipment Return from the RMA Entry window. If you created a
work order, the returned parts are issued to the work order. No part
ID is used on the inventory transaction.

8. Click the Save
   button. If you selected the Ship from Original Order check box,
   then a new line for the repair is added to the original customer
   order. If you cleared the Ship from Original Order check box,
   a new customer order is created for the repair. If you selected
   the Use Quote Pricing check box, then the quote pricing you set
   up during the evaluation process is used as the price of the repair.
   If you cleared the use Quote Pricing check box, then you can set
   up the cost of repair using the Price Repair Orders dialog box.

If you did not receive the returned materials during the evaluation
process, then use this procedure to convert an Evaluation RMA to a
Repair RMA:

1. If you created a quote
   as part of the evaluation process, specify whether to use the
   quote pricing as the cost of the repair. To use the quote pricing
   as the cost of the repair, select the Use Quote Pricing check
   box. If you select this check box, you cannot use the Price Repair
   Orders dialog box as the basis of the cost of repair. If you do
   not want to use the quote pricing as the cost of repair, clear
   the Use Quote Pricing check box.
2. In the Type field, select
   Repair.
3. Click Save.
4. In the Repair work order(s)
   dialog, specify whether to create a work order for the repair.
   Click one of these options:

* Use
  evaluation work order(s) - Click this option to reuse the
  work order that was created for the evaluation.
* Copy
  evaluation work order(s) - Click this option to create
  a work order for the repair by copying the evaluation work order.
* Create
  new work order(s) - Click this option to create a work
  order specifically for the repair.
* No
  repair work orders - Click this option if you do not want
  to create a work order for the repair.

Process the repair RMA as you normally would.
See [Repair
RMAs](Converting_an_Evaluation_RMA_to_a_Repair_RMA.md).

## Building the Repair Work Order from the Evaluation Quote

If you selected the Use Quote Pricing check box when you converted
an Evaluation RMA to a Repair RMA, you can use the quote master as
the basis of the repair work order. You can either use the Manufacturing
Windows drag-and-drop feature to drag the quote masters structure
onto the repair work order. You can also use the Copy From function
to copy the quote masters structure to the work order.