Allocating Purchase Order Delivery Schedule Quantities to Work Order Material Requirement Demand




# Allocating Purchase Order Delivery Schedule Quantities to Work Order Material Requirement Demand

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
    select PD.
11. Double-click <Supply
    Base ID>, <Seq #/Line #>, or <Piece # >
    to search for qualifying purchase order delivery schedule supply.

The same dialog box appears regardless of
which column heading you double-click.

12. Using the search options
    in the header section, configure a search for purchase order delivery
    schedule lines and click the Apply button.

The Purchase Order Delivery Schedule Supply
dialog box appears.

13. Using the options in
    the header section of the dialog box, configure a search for purchase
    order delivery schedule line supply and click the Apply
    button.

All qualifying purchase order delivery schedule
lines appear.

14. Select the purchase
    order delivery schedule line to which you want to establish a
    link of supply from the current material requirement demand and
    click the Ok button.

The line appears in the Supply Links dialog
box line item table.

15. In the Allocate Quantity
    column, enter the quantity that you want to allocate from the
    purchase order delivery schedule line to the work order material
    requirement.

This quantity cannot be greater than the
Quantity Unallocated of the material requirement or the Supply Quantity
of the purchase order delivery schedule line. If you attempt to enter
a quantity here that will result in the over-allocation of supply
to the material requirement (A number greater than the Quantity Unallocated)
or the use of more Supply Quantity than is available (A number greater
than the Supply Quantity), you are warned that this is not possible
and cannot continue.

16. Click the Save
    button to commit the link of supply from the purchase order delivery
    schedule line to the work order material requirement.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.md) User-defined Help