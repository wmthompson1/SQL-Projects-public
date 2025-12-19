Automatic Status Changes




# Automatic Status Changes

The following applications change status of work orders
and their objects automatically. Most of these changes involve automatically
closing an object based on reported completion. Note that automatic
Closes never close subordinate operations or requirements. Each individual
operation or requirement is closed by a labor ticket entry or material
issue.

|  |  |
| --- | --- |
| POSTIT.gif | If you have the work order open in Manufacturing Window when a change occurs, you must use the Refresh function in the File menu to update the display. |

Work Order Travellers - The Work Order
Traveller function allows automatic release of firmed work orders
along with the printing of their travellers. You can choose whether
to release all subordinate operations, legs, and requirements as well.

This is the only function that automatically releases a work order.
You should use Program Security to limit access to this application
to the users who have permission to release a work order.

Customer Order Entry - When you create
a work order through this application, you can specify its status
as Firm or Released.

Inventory Transaction Entry - When all
required material is issued to a requirement, it is automatically
closed. If an Issue/Return is done, the requirement is re-released.

When the desired quantity for a work order has been received into
finished goods, the work order is closed. Note that this does NOT
close subordinate operations and requirements - they should be closed
by Labor Ticket Entry and material issuing, or must be closed manually.
If a Receipt/Return is done, the work order is re-released.

Purchase Receipt Entry - When all required
material is received for a requirement that is linked to a purchase
order, the requirement closes automatically. If returns occur through
Purchase Receipt Entry, the requirement is re-released.

When all required material is received back from a service operation,
the operation is closed automatically.

Service Receipt Entry - When all required
material is received back from a service operation, the operation
is closed automatically.

Labor Ticket Entry - When Quantity completed
for an operation reaches, or exceeds, the End Quantity that is required,
the operation is closed automatically.

If the Resource ID for any previous operations is marked Automatic
Reporting, these operations will also be closed. This allows management
of operations that do not have labor reported against them.

The automatic reporting feature does NOT record any labor hours
against the automatically closed operations they appear with a setup
and run time of zero if you dont report labor tickets against them.

Shipping Entry - Shipping Entry causes
a receipt of finished goods and an issue to a customer order for work
orders that are linked to customer orders.

When this causes the total required quantity to be received, the
work order is closed. If a Ship Return is done, the work order is
re-released.

Material Planning Window - You can modify
the status of supply work orders directly from the Material Planning
Window main screen.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help