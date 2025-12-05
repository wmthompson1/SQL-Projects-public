Allocating Work Order Quantities to Inventory




# Allocating Work Order Quantities to Inventory

|  |  |
| --- | --- |
| POSTIT.gif | You can establish a demand link from a work order to inventory if you want to prevent other allocations of demand to supply. However, because the default destination is always inventory, you dont need to establish a link. In order to make an allocation of current work order supply to inventory, the Warehouse ID you select must be the same as the work order Warehouse ID. |

1. With the work order
   from which you want to allocate demand open, point to the work
   order header card and select Allocate Demand
   to this Work Order from the Edit
   menu. The Assign to Demand dialog box appears.
2. Click the Insert
   button to begin adding demand allocation information.
3. From the Type
   list box, select I.
4. Double-click <Demand
   Base ID> to view a list of warehouses that carry the
   work order part to which you can allocate supply. The Warehouses
   for Part dialog box appears.

The Warehouses for Part
dialog box line item table contains the following columns.

Warehouse ID -
The ID of the warehouse.

Available Quantity
- The quantity of parts that the warehouse currently has available
for use.

Committed Quantity
- The quantity of parts that you have committed through allocation
or order fulfillment.

Expected Quantity
- The quantity of parts that you are expecting to receive in the warehouse.
These parts could be from IBTs or purchase receipts.

Expected/Committed Quantity
- The quantity of expected parts that you have already committed.

5. Select the appropriate
   warehouse and click the Ok button.
6. In the Allocate Quantity
   column, enter the quantity you want to assign to inventory. Remember,
   because inventory (Warehouse ID) is the default destination for
   these parts, the link that you are now establishing is a preventative
   measure against other links of demand.

The quantity you enter here cannot be greater
than the Available Quantity of the work order itself.

7. Click the Save
   button to commit the allocation of work order supply to inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help