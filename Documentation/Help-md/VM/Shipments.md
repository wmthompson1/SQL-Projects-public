Shipments




# Shipments

Shipment transactions are related to customer orders
in VISUAL. The transaction entries prepared by Costing Utilities and/or
posted by Post Manufacturing Journals depend on whether the transactions
are linked customer-to- work orders or shipments for inventory.

If the shipments are for customer orders linked to one or more work
orders, VISUAL closes the work order and transfers all costs to inventory.
Subsequently the costs of the work order (now in inventory) are transferred
to Cost of Goods Sold/Manufactured.

If a shipment is for inventory (customer orders not linked to one
or more work orders), Costing Utilities remove costs from inventory
and posts them directly to the Cost of Goods Sold/Manufactured.

Customer orders also affect costing. As mentioned in the Finished
Goods section, the shipment of customer orders may potentially affect
full shipment status, thereby affecting the cost of open work orders
in WIP. Shipments of customer orders or inventory ultimately remove
costs from inventory and reclassify them to Cost of Sales.

To verify costing records:

1. Enter the Starting and
   Ending Order IDs.
2. Click the Check
   button.

This populates the Detail area with transactions. Similar to other
Cost to Check options, any cost inconsistencies are flagged by a note
in the Remark field.

To correct cost inconsistencies:

1. Select the appropriate
   lines to be corrected. To do so, click the corresponding row headers.

This places a check mark (3) in the row
headers, indicating the line will be changed.

2. Click the Set
   Posting Candidate button. This changes the value in the
   P/C column from N to Y.
3. Click the Post
   button.

Costing Tools makes any necessary adjustments to the costs.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Tools.htm) User-defined Help