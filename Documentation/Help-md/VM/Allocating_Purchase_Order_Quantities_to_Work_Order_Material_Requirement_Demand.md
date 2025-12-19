Allocating Purchase Order Quantities to Work Order Material Requirement Demand




# Allocating Purchase Order Quantities to Work Order Material Requirement Demand

1. If it is not already
   open, select Inventory Transaction Entry
   from the Tools menu.

The Inventory Transaction window appears.

2. Select the Issue
   radio button.
3. Click the Work
   Order ID button to select from a list of all currently
   released work orders in your database.
4. Select the appropriate
   work order and click the Ok button.

The work orders Base ID, Lot ID, Split
ID, and Part ID appear.

5. Click the Piece
   Number button to view the selected work orders material
   requirements.

If this is a new material requirement, select
the New Material Requirement check box and
then click the Part ID button to select the material.

6. Select the appropriate
   material requirement and click the Ok
   button.
7. If necessary, click
   the Location ID button to change the
   warehouse location from which you want to issue this the materials.

You can monitor how many parts you have
already issued from inventory to this material requirement by looking
at the section to the right. These are read-only fields.

Required - The
amount required to fulfill the material requirements quantitative
needs.

Issued - The amount
that you have to this point issued to the material requirement from
inventory

Due - The amount
due to fulfill the material requirements quantity.

On Hand - The
amount currently on hand in the warehouses that carry the material
in question.

Available - The
amount of the material currently available in the selected warehouse
location.

8. From the Edit menu,
   select Allocate Supply to this Material.

The Supply Links dialog box appears.

The following read-only information appears
in the header section. Use these fields as a quick reference when
establishing supply links to work order material requirements.

Quantity Required
- The quantity of the material requirement.

Quantity Issued
- The quantity of the material requirement that you have issued from
inventory. If this quantity is equal to the Quantity Required, further
supply is unnecessary. In this case, all of the materials requirements
have been met.

Quantity Allocated
- The quantity that you have allocated from the supplying sources
towards meeting this material requirement. If this quantity is equal
to the Quantity Required, further supply is unnecessary.

Quantity Fulfilled
- The quantity of the material requirement that has been fulfilled
by supply.

Quantity Unallocated
- The quantity of this material requirement to which you have yet
to allocate supply.

Part ID - The
Part ID of this material requirement.

Part Description
- The description of the material requirement Part ID.

Stock U/M - The
stock unit of measure of the part.

Warehouse ID -
The Warehouse ID of the material requirement; also the point from
which you are issuing it.

Required Date
- The date by which you require this material requirement.

9. Click the Insert
   button to begin establishing supply links.
10. From the Type list box,
    select PO.
11. Double-click <Supply
    Base ID> to view a list of all purchase orders in your
    database.

The dialog box that appears contains all
the purchase orders currently in your database. Besides this list
being perhaps too long to scroll through, selection of purchase orders
is arbitrary at this point because you may select a purchase order
line that has a different Part ID or Warehouse ID than the current
customer order line, and these two IDs must be the same in both in
order to establish a supply link.

12. To avoid selecting purchase
    orders at random, double-click <Seq #/Line
    #> to view only those purchase order lines in your database
    with the required Part ID and Warehouse ID.
13. Select a purchase order
    and click the Select/Close button.
14. Double-click <Seq
    #/Line #> to search the selected purchase order for
    eligible lines.

The Purchase Order Lines dialog box appears.

15. Using the options in
    the header section of the dialog box, configure a search within
    the selected purchase order and click the Apply
    button.

Qualifying lines in the selected purchase
order appear.

16. Select the line from
    which you want to allocate supply to meet the current material
    requirement demand and click the Ok
    button.

The line appears in the Supply Links dialog
box line item table.

17. In the Allocate Quantity
    column, enter the quantity that you want to allocate from the
    purchase order line to the work order material requirement.

This quantity cannot be greater than the
Quantity Unallocated of the material requirement or the Supply Quantity
of the purchase order line. If you attempt to enter a quantity here
that will result in the overallocation of supply to the material requirement
(A number greater than the Quantity Unallocated) or the use of more
Supply Quantity than is available (A number greater than the Supply
Quantity), you are warned that this is not possible and you cannot
continue.

18. Click the Save
    button to commit the link of supply from the purchase order line
    to the work order material requirement.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.md) User-defined Help