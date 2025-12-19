Linking Material Planning to Projects




# Linking Material Planning to Projects

If you are working in VISUALs Material Resource Planning
window with a material you have specified on a project, that materials
project details appear in the material tables.

|  |  |
| --- | --- |
| POSTIT.gif | In order for you to view the project details of your parts, you must clear the selection for Show Advanced on Startup in the View menu. |

When you select parts you have specified on projects, the following
information appears in the Material Planning window:

Required WBS The work breakdown structure
on which you specifies the material or part appear in the Required
WBS column.

Demand Order ID The customer order on
which you have specified the need for the material or part appears
in the Demand Order ID column.

Warehouse ID The appropriate warehouse
name appears in the Ware house ID column. For materials and parts
on a project, this should be the same as your project warehouse name.

## Viewing Project-Related Resources in the Material Planning Window

You can limit the warehouses that appear in the Warehouse ID drop-down
list to project-only warehouses or project warehouses for a certain
program manager. To limit the warehouses that appear in the Warehouse
ID drop-down list, click the Warehouse Filters button. The Warehouse
Filters dialog box appears.

Select from the following options:

Exclude MRP Exempt Warehouses Select
this check box to remove MRP exempt warehouses from the drop-down
list. You can designate a warehouse as MRP Exempt in Warehouse Maintenance.

Project Warehouses Only Select this
check box if you would like to view only project-related warehouses
in the drop-down list. If you select this check box, the Program Manager
drop-down list becomes active.

Program Manager Click the Program Manager
arrow to select the program manager whose project warehouses you would
like to view. Select a Program Manager in the Contract General window
located in Project Maintenance.

Active Click the Active check box to
apply the filter. Clear the check box to remove the filter from the
list.

## Processing Project-Related Resources in Material Requirements Planning

Material Requirements Planning is an optional module that generates
planned demand and supply orders for a part based on the parts Order
Policy, demand, and master production schedule (for a master scheduled
part). These orders appear in material netting in the same way as
actual orders. You can then firm and release the planned orders into
real purchase and/or work orders. For more information on Material
Requirements Planning, see [What is the
Material Planning Window?](VMPLNWINWhat.md).

If you have assigned any supply or demand orders to warehouses that
are MRP-exempt, material requirements planning will ignore these orders
during processing.

1. In the Material Planning
   Window, from the File menu select the Material
   Requirements Planning option.

The MRP dialog box appears.

1. To process project-related
   materials, select Project from the Warehouse
   arrow. When you select Project, the Program Manager field becomes
   active.
2. Click the Program Manager
   drop-down to select the program manager whose projects you would
   like to process. When you select a Program Manager, the only the
   projects connected to the Program Manager appear in the list.
   Select a Program Manager in the Contract General window located
   in Project Maintenance.
3. Continue the Material
   Requirement Planning process as you would for commercial warehouses..

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_General_Project_Topics.md) User-defined Help