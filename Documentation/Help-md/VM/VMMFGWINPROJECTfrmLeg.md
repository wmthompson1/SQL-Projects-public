Adding Legs to Projects




# Adding Legs to Projects

Use legs to specify the WBS elements of your projects.

Projects do not require Part IDs. If you want to use VISUALs Break
point technology to automatically plan material by WBS, you must specify
the appropriate Part ID.

For example: You have customer demand for product A, which requires
the manufacture of two complex sub assemblies B and C. You have assigned
the final assembly of product A to WBS 1.0 (project header card) but
you want to manage the design and production of B and C on different
WBSs (legs) on the Project, WBS 1.1 and 1.2 respectively. To accomplish
this, you would assign subassembly B to the leg detail card of WBS
1.1 and subassembly C to the leg detail card of WBS 1.2. When VISUALs
MRP engine plans all the lower level requirements for product A, it
looks to the associated project and automatically assigns the appropriate
WBS to both planned demand and supply. VISUAL automatically assigns
the correct WBSs to subsequent work orders you release to the shop
floor.

To add a leg to a project:

1. Select the task to which
   you want to add the leg.
2. Select Add
   Leg/Detail from the Edit menu.

You can also click the Add
Leg/Detail button on the Form toolbar, press the CTRL+L keys
or, if your popup menu is active, right-click the header card and
select Add Leg/Detail.

The Leg/Detail dialog box appears with the
Project tab open.

VISUAL automatically selects the Leg/Detail
option button.

VISUAL automatically numbers to leg you
are adding.

3. If you want to change
   the Piece Number or Sub ID, click in the appropriate fields and
   make the changes you want.
4. If the leg you are adding
   is for a specific part, specify a Part ID for a leg by clicking
   the Part ID button and selecting the
   part you want to use.

Selecting a Part ID for a leg indicates
that the leg corresponds to a part that is also a separate inventory
part.

5. Click the WBS
   button and select the WBS code that corresponds to the leg you
   are adding.
6. The description for
   the WBS code you select appears next to the WBS field.
7. Click the Save
   icon on the toolbar.

VISUAL creates the leg and adds it to your
project structure and the Leg/Detail dialog box clears and is ready
to add another leg to the same task.

## Entering Information on Quantities Tabs

If you are entering information for a manufactured part, use the
Quantities tab to enter additional information about the part.

Click the Quantities tab and enter the following:

Quantity Per Click in the Qty Per field and enter the quantity
of this part per unit that you want.

To select at what point you want the Quantity Per to apply, select
either the Qty per (start qty) or Qty per (end qty) option buttons.

Fixed Quantity If you do not want VISUAL to calculate start or
finish quantities based on Quantity Per and Scrap values, click in
the Fixed Qty field and enter the value you want to use.

Scrap% Click in the Scrap% field and enter the percentage value
you want to use for the amount of scrap you want VISUAL to use in
its calculations.

Dimensions If you are using dimensional inventory, click in the
Dimensions field and enter the formula for the dimensions of this
part.

Reference # Click in the Reference # field and enter a reference
number.

Issued Quantity Click in the Issued Qty field and enter the quantity
you want to issue to this leg. This field is only available if the
legs part is consumable.

Usage Unit of Measure Click the Usage U/M button and select a
unit of measure for this part.

## Entering Information on Specifications Tabs

Use the Specifications tab to enter notes and comments

Click the Specifications tab.

The Specifications tab appears.

Click in the Specifications field and enter any comments or notes
you want about this leg.

Enter any appropriate engineering information for the following:

Drawing Number Click in the Drawing # field and enter a drawing
number for this leg.

Rev If the drawing number you entered has a specific revision
number, enter it in the Rev # field.

Drawing File If the drawing number you entered has a picture file,
navigate to and select the appropriate file.

## Viewing Information in the Costs Tab

If you selected a Part ID for the Leg, click the Costs tab to view
the costs associated with the part. You can set up the costs for a
part through Part Maintenance. Please refer to your VISUAL documentation
for more information.

## Entering Information on the User Defined Tab

Use the User Defined tab to enter additional information about the
task.

To bring the focus to the User Defined tab, click the User Defined
tab.

Click the User Defined Field Layout ID arrow and select the layout
for the tab. Enter the information you want in the appropriate fields.

For more information on setting up User Defined Fields, refer to
your VISUAL documentation.

When you have finished entering user defined information for this
project, click the Save button on the toolbar.

## Viewing Information in the Budget Summary Tab

Click the Budget Summary tab to view the current budget for the
tasks attached to the leg.

You can enter budgets on the task cards or in Budget Maintenance.

## Viewing Information in the ETC Summary Tab

Click the ETC tab to view current estimate to complete figures for
the tasks attached to the leg.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Window.md) User-defined Help