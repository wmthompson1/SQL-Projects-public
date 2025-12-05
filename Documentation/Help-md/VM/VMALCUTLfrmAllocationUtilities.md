About the Allocation Utility Window




# About the Allocation Utility Window

Use the Allocation Utility to establish allocations,
or "links," of supply to customer orders by part and/or
warehouse and reduce the time that you would spend in Customer Order
Entry looking for suitable links of supply for customer orders, one
line at a time.

## Starting the Allocation Utility Window

Select Admin, Allocation
Utilities.

## Concepts

This table shows links to the concepts behind the Allocation Utility
Window.

| Concept | Description |
| [Allocation Processing](Allocation_Processing.htm) | This topic describes how the utility processes allocations. |
| [Allocation Utilities at Work](Allocation_Utilities_at_Work.htm) | This topic provides a specific example of how the Allocation Utility allocates supply to a customer order when on-hand quantities cannot satisfy demand. |

## Tasks

This table shows the tasks that you can complete in the Allocation
Utilities window:

| Task | Description |
| [Starting the Allocation Utilities](Starting_the_Allocation_Utilities.htm) | Use this procedure to start the Allocation Utilities window |
| [Setting Allocation Utility Preferences](Setting_Allocation_Utility_Preferences.htm) | Use this procedure to specify the criteria to use for the allocation process. |
| [Running the Allocation Utility](Running_the_Allocation_Utility.htm) | Use this procedure to run the allocation utility. |

## Fields

Site ID

Specify the site where you are running allocations.

Starting
Part ID and Ending
Part ID

Specify the parts to allocate. To run the utility for one part,
specify the same value in the Starting Part ID and Ending Part ID
fields. To run the utility for a range of parts, specify the first
part in the range in the Starting Part ID field and the last part
in the range in the Ending Part ID field. To run the utility for all
parts, leave both fields blank.

Starting
Warehouse ID and Ending
Warehouse ID

Specify the warehouses to include in the allocation. To run the
utility for one warehouse, specify the same value in the Starting
Warehouse ID and Ending Warehouse ID fields. To run the utility for
a range of warehouses, specify the first warehouse in the range in
the Starting Warehouse ID field and the last warehouse in the range
in the Ending Warehouse ID field. To run the utility for all warehouses,
leave both fields blank.

Allocate
On-hold Inventory

Select this check box if you want the Allocation Utility to allocate
inventory that is currently on-hold. Classify parts as on-hold in
Warehouse Maintenance.

Allocate
Unavailable Inventory

Select this check box if you want the Allocation Utility to allocate
inventory that is currently unavailable. Classify parts as unavailable
in Warehouse Maintenance.

Reevaluate
Partial Allocations

Select this check box if you want the Allocation Utility to your
past partial allocations.

Allocate
Future Supply Orders

Select this check box if you want the Allocation Utility to consider
supply orders as it allocates supply to customer order demand.

Relevant supply order types include purchase orders, work orders,
work order coproducts, interbranch transfers, and possibly planned
orders.

Allocate
Unreleased Orders

This option is not available until you select the Allocate
Future Supply Orders check box. Select this check box if you
want the Allocation Utility to allocate unreleased work order quantities
to customer order demand.

Allocate
Firmed Orders

This option is not available until you select the Allocate
Future Supply Orders check box. Select this check box if you
want the Allocation Utility to allocate firmed work order quantities
to customer order demand.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Allocation_Utilities.htm) User-defined Help