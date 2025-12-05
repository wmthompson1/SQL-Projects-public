Viewing Material Availability Information




# Viewing Material Availability Information

Use the Material Availability window to examine the availability
of all inventory parts required on the master/work order, and the
potential impact of each requirement on inventory levels for that
part.

The inventory quantities shown in this dialog box depend upon the
value you choose for the  UseUniversalForMaterialAvailability
in Preferences Maintenance. If you specify Y for this preference setting,
then inventory in all universally planned warehouses is displayed
in the Project Available (after issue), On Hand, and Available columns.
If you specify N for this preference setting and a specific universally
planned warehouse is identified for the material, then only the inventory
in the specified warehouse is displayed. See [Setting
the UseUniversalForMaterialAvailability Preference](Setting_the_UseUniversalForMaterialAvailability_Preference.htm).

If you perform an action that affects material availability, such
as creating a purchase order or updating and recalculating material
quantities, you can click the Refresh button
on the Manufacturing Window toolbar to refresh the information in
the Material Availability dialog.

To view material availability information:

1. Select Info,
   Material Availability.
2. To view leg header part
   IDs, select the Include Leg Header Requirements
   check box. To view only material requirements attached to operations,
   clear the Include Leg Header Requirements
   check box.
3. For each material requirement,
   this information is displayed:

Detail - Operation
Number, Piece Number, Part ID, and Description of the material requirement.
If the part is a non-inventory part, then the Specification from the
material requirement is shown instead of the Part ID.

Part ID - The
ID of the required part.

Stock UM - The
unit of measure used to stock the part.

Subord Sub ID
The sub ID of the leg header.

Seq # - The operation
sequence number.

Pc # - The material
piece number.

Quantity Required
- The required quantity of the material for the operation.

Quantity Issued
- The quantity that you have issued to the material requirement thus
far.

Unit Cost The
cost of per unit of the material as specified on the material card.

Fixed Cost The
fixed cost charged for the part as specified on the material card.

Vendor Part ID
The ID the vendor uses for the part.

Required Date
- The date the material must be available for the operation, as determined
by the Concurrent Scheduler. If the work order has not been scheduled,
or this is a master, this field reads Not Sched.

Projected Available (after
issue) - This column displays the total quantity remaining
in warehouse locations with a status of Available after the part is
issued to all outstanding work orders.

The supply calculation depends upon whether
a warehouse ID is displayed in the Warehouse ID column and the value
specified for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the quantity remaining in available locations
  in the specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the total quantity remaining in all universal
  warehouse locations with a status of Available. If you are using
  multiple sites, the quantity shown is for the site specified in
  the order header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the quantity stored in available locations
  for the specified warehouse.
* If you did
  not specify a warehouse on the line, then this column shows the
  total quantity remaining in all universal warehouse locations
  with a status of Available. If you are using multiple sites, the
  quantity shown is for the site specified in the order header only.

Warehouse - The
Warehouse ID of the material requirement.

On Hand - For
inventory parts only. Gives the current total on hand quantity of
this part in all locations.

On Hand This
column shows the quantity currently stored in warehouse locations
with any status.

The calculation depends upon whether a warehouse
ID is displayed in the Warehouse ID column and the value specified
for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the current quantity in all locations in the
  specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all universal warehouse
  locations. If you are using multiple sites, the quantity shown
  is for the site specified in the order header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all locations in
  the specified warehouse only.
* If you did
  not specify a warehouse on the line, then this column shows the
  current quantity in all universal warehouse locations. If you
  are using multiple sites, the quantity shown is for the site specified
  in the order header only.

Available This
column shows the quantity currently stored in warehouse locations
with the Available status.

The calculation depends upon whether a warehouse
ID is displayed in the Warehouse ID column and the value specified
for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the current quantity in available locations
  in the specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all universal warehouse
  locations with the status of Available. If you are using multiple
  sites, the quantity shown is for the site specified in the order
  header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in available locations
  in the specified warehouse only.
* If you did
  not specify a warehouse on the line, then this column shows the
  current quantity in all universal warehouse locations with the
  status of Available. If you are using multiple sites, the quantity
  shown is for the site specified in the order header only.

Dimensional Info
- If any parts are piece tracked, the number of pieces, the length,
width, and height dimensions, and the dimension unit-of-measure appear
in the Dimensional Info column.

# Pieces The
quantity of material required per unit.

Dimension UM
If this is a piece-tracked part, then unit used to measure the parts
dimensions.

Vendor The ID
of the preferred vendor.

Purchase Order
- If material has been purchased directly to this requirement, then
a purchase order number appears.

Status - The status
of the purchase order.

Desired Recv Date
- The date the customer should receive the order.

Original Promise Date
- The date by which you originally promised to have completed the
work order and delivered it to the customer.

Qty Ordered -
The total of all orders.

Potential PO Supply Orders The total quantity
on order that could meet demand.

To calculate the quantity, firmed and released
purchase orders for eligible warehouses are identified. This table
shows the purchase orders that are used depending on the warehouse
that is specified on the Material card:

|  |  |
| --- | --- |
| **Material requirement warehouse type** | **Purchase Orders** |
| Independently planned | Only purchase orders for the independently planned warehouse are considered. |
| Universally planned | The purchase orders that are included depend upon the value that is specified for the UseUniversalForMaterialAvaillability entry in the Visual Mfg section of Preferences Maintenance:   * If the UseUniversalForMaterialAvailability   entry is false or not specified, then only purchase orders   for the warehouse that is specified on the requirement   are included in the calculation. * If the UseUniversalForMaterialAvailability   entry is true, then purchase orders for all universally   planned warehouses are included in the calculation. Purchase   orders with no warehouse are also included. |
| Warehouse not specified | Purchase orders for all universally planned warehouses and purchase orders with no warehouses are included in the calculation. Purchase orders for independently planned warehouses are not included. |

Received or allocated quantities on eligible
purchase orders are subtracted from the total quantity that has been
ordered or fulfilled. Purchase order lines with negative quantities
are not included in the calculation. The result is displayed in the
Potential PO Supply Orders column.

Link Quantity Allocated
- The portion of this material's Quantity Required
that you have allocated through the establishment of supply links
to the requirement or demand links from the requirement.

Link Quantity Received
- The portion of a linked quantity that you have received. For example,
if there is a purchase order link to a material requirement, after
you receive that purchase order, the portion of the P/O Order Quantity
that you allocated appears here.

Required Quantity Allocated
- The portion of the material requirement's Required
Quantity that you have accounted for through the use of allocations.

Required Quantity Fulfilled
- The portion of the material requirement's Required Quantity that
has been fulfilled through the use allocations.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help