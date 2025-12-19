Linking Work Orders to Projects




# Linking Work Orders to Projects

Whenever you create work orders to manufacture products
or components you have specified on projects, you must link the work
orders to their respective projects by entering the appropriate linking
information.

You link work orders to projects via the work orders header card.

To link work orders to projects:

1. Open the Manufacturing
   Window and select the Work Order to which you want to link your
   project.
2. Click the Warehouse
   ID button and select the Warehouse ID that matches the
   Project ID.
3. Click the WBS
   button and select the work breakdown structure you want
   to link to the header card. The default Proj Ref Seq No and Proj
   Ref Sub ID appear.
4. If you want to override
   the Seq No for the WBS Code you selected, click the Proj
   Ref Seq # button and select the number you want to use.

|  |  |
| --- | --- |
| POSTIT.gif | You cannot save project related work orders without valid WBS, Proj Ref Seq No, Proj Ref Sub ID, and Dept ID combinations. |

When you finished linking the work order to the project, save the
work order.

## Planning Project Linked Work Order Material Requirements

Using Infor VISUAL for Project-Based Manufacturers, you have the
ability to plan for some parts to be bought and built to a project
warehouse and for others to be purchased and fabricated in a common
warehouse or company owned inventory. This allows you to commingle
the requirements across multiple or all projects (or contracts) for
selected parts. To use this feature, select a different Warehouse
ID on the engineering master or work order breaking the link to the
project ware house.

Locate the material card whose warehouse you want to change.

VISUAL automatically selects the Inherit Warehouse from Header check
box and populates the Warehouse ID with the warehouse you named on
the header card. VISUAL directs the demand and supply to the appropriate
header card warehouse. By clearing the Inherit Ware house from Header
check box and specifying a warehouse on the mate rial card, VISUAL
directs the demand and supply to the material card warehouse.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_General_Project_Topics.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enforcing_Referential_Integrity.md) Enforcing Referential Integrity