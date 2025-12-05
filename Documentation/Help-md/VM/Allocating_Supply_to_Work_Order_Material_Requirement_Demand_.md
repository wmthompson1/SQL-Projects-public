Allocating Supply to Work Order Material Requirement Demand




# Allocating Supply to Work Order Material Requirement Demand in Inventory Transaction Entry

You can allocate these sources of supply to work order
material requirements:

* Existing stock in inventory
* Purchase order lines
* Purchase order delivery
  schedule lines
* Coproduct supply
* Interbranch transfers
* Other work orders

To allocate supply to work order demand:

1. Select Inventory,
   Inventory Transaction Entry.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site that contains the work order. If you
   are licensed to use a single site, this field is not available.
3. Click the Issue
   option.
4. Click the Work
   Order ID browse button and select the work order to assign
   to supply.
5. Click the Piece
   No browse button and select the material requirement to
   assign to supply.
6. If necessary, click
   the Location browse button and change the warehouse and location
   from which to assign supply.
7. Select Edit,
   Allocate Supply to this Material. This
   information is displayed in the Supply Links dialog box header:

Quantity Required
The quantity of the material required by the demand.

Quantity Issued
The quantity of the material requirement that you have issued to
the work order from inventory. If this quantity is equal to the Quantity
Required, further supply is unnecessary: you have met all of the demands
requirements.

Quantity Allocated
The quantity that you have allocated from the supplying sources
towards meeting this material requirement. If this quantity is equal
to the Quantity Required, further supply is unnecessary.

Quantity Fulfilled
The quantity of the material requirement that has been fulfilled
by supply.

Quantity Unallocated
The quantity of this material requirement to which you have yet
to allocate supply.

Part ID The
Part ID of this material requirement.

Part Description
The description of the material requirement Part ID.

Stock U/M The
stock unit of measure of the part.

Warehouse ID
The Warehouse ID of the material requirement; also the point from
which you are issuing it.

Required Date
The date by which you require this material requirement.

8. Click Insert.
9. Click the arrow in the
   Type column and select the source of supply. You can select:
10. CP
     Coproducts
11. I
    Inventory
12. PD
    Purchase Delivery Schedule Lines
13. PO
    Purchase Orders
14. WH
    Interbranch Transfers
15. WO
    Work Orders

10. Perform one of these
    steps:
11. If you selected
    CP, double-click the Supply Base ID browse button to view a list
    of work orders that generate the part ID as a co-product. You
    can view work orders with unallocated supply only or view all
    work orders that produce the part ID as a co product. Use the
    date fields to filter the work orders based on want date. Use
    the Sort by options to sort the table by work order ID, desired
    want date, or part ID. Select the work order to use as the supply,
    and then click Ok.
12. If you selected
    I, double-click the Supply Base ID browse button to view a list
    of warehouse locations that store the part. Select the location,
    and then click Ok.
13. If you selected
    PD, double-click the Piece # browse button to view a list of purchase
    order delivery schedules that supply the part. You can view purchase
    order delivery schedule lines with unallocated supply only or
    view all purchase order delivery schedule lines that supply the
    part ID. Use the date fields to filter the purchase order delivery
    schedule lines based on desired receive date. Use the Sort by
    options to sort the table by purchase order ID, desired receive
    date, or part ID. Select the purchase order delivery schedule
    to use as the supply, and then click Ok.
14. If you selected
    PO, double-click the Seq #/Line # browse button to view a list
    of purchase orders that supply the part ID. You can view purchase
    order lines with unallocated supply only or view all purchase
    order lines that supply the part ID. Use the date fields to filter
    the purchase order lines based on desired receive date. Use the
    Sort by options to sort the table by purchase order ID and line
    number, desired receive date, or part ID. Select the purchase
    order line to use as the supply, and then click Ok.
15. If you selected
    WH, double-click the Seq #/Line # browse button to view a list
    of interbranch transfers that supply the part ID. You can interbranch
    transfers with unallocated supply only or view all purchase order
    lines that supply the part ID. Use the date fields to filter the
    interbranch transfers based on desired receive date. Use the Sort
    by options to sort the table by IBT ID and line number, desired
    receive date, or part ID. Select the interbranch transfer line
    to use as the supply, and then click Ok.
16. If you select
    WO, double-click the Supply Base ID browse button to view a list
    of work order. Select the work order to use as the supply, and
    then click Ok.

11. In the Allocate Quantity
    column, enter the quantity of the supply to allocate to the demand.
    The quantity you enter cannot be greater than the available demand
    quantity.
12. Click Save.

If you linked a purchase order to demand, you can view the purchase
order. Select the line containing the purchase order, and then click
Purchase Order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.htm) User-defined Help