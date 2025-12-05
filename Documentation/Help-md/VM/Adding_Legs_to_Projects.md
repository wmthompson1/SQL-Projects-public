Adding Legs to Projects




# Adding Legs to Projects

Use legs to specify the WBS elements of your projects.

Projects do not require Part IDs. If you want to automatically plan
material by WBS, you must specify the appropriate Part ID on each
leg/WBS. Material Planning will use the WBS for the leg with the Part
ID versus the higher-level WBS.

For example: You have customer demand for product A, which requires
the manufacture of two complex sub assemblies B and C. You have assigned
the final assembly of product A to WBS 1.0 (project header card) but
you want to manage the design and production of B and C on different
WBSs (legs) on the Project, WBS 1.1 and 1.2 respectively. To accomplish
this, you would assign subassembly B to the leg detail card of WBS
1.1 and subassembly C to the leg detail card of WBS 1.2. When all
the lower level requirements for product A are planned in MRP, the
associated project is looked to, and the appropriate WBS is automatically
assigned to both planned demand and supply. The correct WBSs are
assigned to subsequent work orders you release to the shop floor.

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

The Leg/Detail option button is automatically
selected.

The leg you are adding is automatically
numbered.

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

The description for the WBS code you select
appears next to the WBS field.

6. Inherit
   Demand Warehouse - Select this check box if you would like
   the part to be assigned to the warehouse specified in the Header
   Card. Clear the check box if you do not want to assign the part
   to the warehouse specified in the Header Card (for example, if
   you use universal planning for the part).

If you selected the Do Not Inherit Demand
Warehouse for the part in Part Maintenance, the system does not allow
you to assign the part to the warehouse in the Header Card. The system
disables the Inherit Demand Warehouse on the Material Card.

6. Click the Save
   button on the toolbar.
7. The leg is created and
   added to your project structure and the Leg/Detail dialog box
   clears and is ready to add another leg to the same task.

## Entering Information on the Quantities Tab

If you are entering information for a manufactured part, use the
Quantities tab to enter additional information about the part.

Click the Quantity tab and enter the following:

Quantity Per Click in the Qty Per field
and enter the quantity of this part per unit that you want.

To select at what point you want the Quantity Per to apply, select
either the Qty per (start qty) or Qty per (start qty) option buttons.

Fixed Quantity If you do not want to
calculate start or finish quantities based on Quantity Per and Scrap
values, click in the Fixed Qty field and enter the value you want
to use.

Scrap % Click in the Scrap % field and
enter the percentage value you want to use for the amount of scrap
you want to use for calculations.

>Dimensions If you are using dimensional
inventory, click in the Dimensions field and enter the formula for
the dimensions of this part.

Click in the Length, Width, and Height fields and enter the appropriate
values.

Reference # Click in the Reference #
field and enter a reference number.

Issued Quantity Click in the Issued
Qty field and enter the quantity you want to issue to this leg.

Usage Unit of Measure Click the Usage U/M button and select a unit of measure
for this part.

Entering Information in the Specifications Tab

Click the Specifications tab.

The Specifications tab appears.

Click in the Specifications field and enter any comments or notes
you want about this leg.

Enter any appropriate engineering information for the following:

Drawing Number Click in the Drawing
# field and enter a drawing number for this leg.

Rev If the drawing number you entered
has a specific revision number, enter it in the Rev # field.

Drawing File If the drawing number you
entered has a picture file, navigate to and select the appropriate
file.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Window.htm) User-defined Help