Lifecycle Drill To and Drill From Buttons




# Lifecycle Source and Target Buttons

If you are viewing a transaction, such as a purchase
order, you can use the drill to and drill from toolbar buttons to
view related transactions. Use the drill from button to view the previous
transaction in the lifecycle. Use the drill to button to view the
next transaction in the lifecycle.

For example, in Purchase Order Entry, Drill To and Drill From buttons
are available. Click the Drill From button to view the purchase requisition
used to create the purchase order you are viewing. Use the Drill To
button to view receipts made for the purchase order. The tooltips
for the buttons show which window is opened when you click the button.

If more than one transaction is associated with the transaction
you are viewing, you can select the transaction to view when you click
the Drill To or Drill From button. For example, if you are viewing
a purchase order and multiple purchase receipts were made for the
order, you can select the receipt to view when you click the Drill
To button.

The toolbar buttons are active only if the related transaction exists.
For example, if you are viewing a purchase order but have not received
any portion of the order, the Receipt Entry button is unavailable.

This table shows where drill to and drill from toolbar buttons are
available:

| **If you are viewing the...** | **The source window is...** | **The target window is...** |
| Estimating Window | n/a | Customer Order Entry |
| Customer Order Entry | Estimating Window | Shipping Entry |
| Shipping Entry | Customer Order Entry | Accounts Receivable Invoice Entry |
| Accounts Receivable Invoice Entry | Shipping Entry | Cash Application |
| Cash Application | Accounts Receivable Invoice Entry | n/a |
| Purchase Requisition Entry | n/a | Purchase Order Entry |
| Purchase Order Entry | Purchase Requisition Entry | Purchase Receipt Entry |
| Purchase Receipt Entry | Purchase Order Entry | Accounts Payable Invoice Entry |
| Accounts Payable Invoice Entry | Purchase Receipt Entry | Accounts Payable Payment Entry |
| Accounts Payable Payment Entry | Accounts Payable Invoice Entry | n/a |