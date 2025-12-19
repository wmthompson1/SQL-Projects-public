Finished Goods




# Finished Goods

Finished goods result from either work order receipts
or shipments of work orders to customers.

When parts assigned to a work order are received into inventory
(Finished Goods), the number of units and cost of the work order is
assigned a FIFO layer in inventory. The costs associated with the
work order are removed from WIP and classified to Inventory. When
goods are shipped (if they are attached to a work order), VISUAL,
through the Costing Utilities, first removes the cost from WIP and
books the costs to inventory. Second, VISUAL, through the Costing
Utilities, immediately removes this cost from inventory and books
it to Cost of Goods Sold/Manufactured. If the goods are in inventory
(finished goods) VISUAL removes the cost of the FIFO layers to the
Cost of Goods Sold/Manufactured.

## Checking the costs of a single work order or range of work orders

The Detail area of the window populates based on the selections
made in the Options section.

As with any other Cost to Check option, any cost inconsistencies
are flagged by a note in the Remark column.

## Correcting cost inconsistencies

1. Select the appropriate
   lines to be corrected. To do so, click in the corresponding row
   headers.

This places a check (3) mark in the row
headers, indicating the lines to be corrected.

2. Click the Set
   Posting Candidate button.
3. After all inconsistencies
   are selected for change, click the Post
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_DBR_Maintenance.md) User-defined Help