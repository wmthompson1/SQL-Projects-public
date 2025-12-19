Creating New Work Orders




# Creating New Work Orders

Creating a new work order is similar to creating an
engineering master. You use the same Engineering Master/Work Order
dialog box, but you need to enter the extra data especially for work
orders: Release Date and Want Date (and Split ID, if appropriate).

1. Select New
   from the File menu.

The Engineering Master\Work Order dialog
box appears.

If another master/work order is currently
loaded in the Manufacturing Window, it is automatically closed when
you finish creating this new one.

2. Click the Work Order
   radio button.
3. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site for the work order. If you are licensed to use a single site,
   this field is unavailable.
4. Enter a Part ID.

All work orders specify the production process
for a fabricated part. If you havent done so yet, you must define
the part master using Part Maintenance. You should mark the master
as Fabricated, indicating that an engineering master exists for the
in-house fabrication of this part.

Enter the Part ID for the part, or select
it by pressing Part ID button to call up
the parts browse. You can also browse by part description by pressing
the Part Description button.

If the Part ID doesnt exist, the system
asks you if you would like to create a new part here.

If you click Yes,
the New Part dialog box appears.

Enter a Description for the part, whether
it is Purchased, Fabricated, and/or Detail Only. This allows you to
continue the process without the interruption of using Part Maintenance.
You must return to Part Maintenance at some point, however, to define
the other information for the part.

5. Enter a Base ID/Job
   ID.

The Base ID is also known as the Job ID.
This uniquely identifies the work order.

6. Enter a Lot ID.

The Lot ID identifies a specific lot within
a larger work order specified by the Base ID. This allows all of the
lots to have the same Base ID.

7. Enter a Split ID.

The Split ID uniquely identifies the child
lots of a work order lot that was split. In this way, all splits can
have the same Base ID/Lot ID as the parent lot. You can use this field
to allow a manual split.

8. Enter a Release Date.

This is the earliest date the work order
can start production. You can use the calendar option to select a
date.

9. Enter a Want Date.

This is the date the finished goods from
the work order should be available.

10. Enter a Quantity.

This is the desired quantity that should
be received into finished goods. This information ultimately drives
the actual run time of each operation, and thus the entire schedule.

11. Enter the following
    Engineering Information:

Specifications
- This is a multi-line text field that lets you enter specification
text to describe the work order. Use the Copy and Paste buttons to
copy the entire contents of the Specifications window, or to replace
the entire contents of the window with the clipboard.

Engineered By
- Specifies the person responsible for the master.

Engineered Date
- Date associated with this revision of the master. Selection of Engineering
Date can also be done from the Calendar object provided.

Drawing Number
- Drawing number of the engineering drawing for this work order.

Drawing Rev -
Revision of the drawing number for this work order.

Product Code -
The Code associated with a product of this work order. Each product
code can have a unique G/L account for inventory, WIP, and cost of
goods sold. Select a product code from the drop down menu.

Commodity Code
- The Code associated with a Commodity of this work order. Select
a commodity from the drop down menu. You can also enter the Commodity
Code and save the information by clicking the Save
button. See the Material Planning Window for more information.

All of these fields are optional.

12. Select the Forward Schedule
    from Release Date check box to specify the default setting for
    scheduling of work orders. If left unchecked, work orders are
    scheduled backwards from their want date.
13. Click the Pict/Object
    button to associated a graphic or OLE2 object with the work order.
    This provides shop floor access to the object.
14. Click the Variables
    button to define variable dimensions referenced in material requirements.

The Work Order Variables dialog box appears.
For a new work order, this window is empty.

To add a variable to the work order, click
the Insert button to add a new line to the
table, then enter the following information on the new line:

Name - Name that
VISUAL uses to reference the variable in material requirement dimensions.

Variable - Numerical
value that the variable assumes.

Continue to add as many lines as needed
using this procedure. For example, you might add variables named LENGTH,
WIDTH, and DEPTH.

Click Ok when
finished.

When a work order is created from this master,
VISUAL copies the value you specify here as the default. You can then
modify the variable values for each new work order. This allows you
to adjust work order required quantities without modifying individual
material requirements.

15. Click the G/L
    Accts button to override WIP G/L Accounts.

The Work Order WIP Accounts dialog box appears.

If you are using the Infor VISUAL Financials
interface, there are four general ledger accounts associated with
a work order. These are Work in Process accounts for each of the four
cost categories: Material, Labor, Burden, and Service.

Normally, VISUAL reads these accounts from
the Product Code definition, if one is associated with the Part ID,
or from the default G/L account interface settings.

If you wish to override them for any work
order produced from this master, press the G/L accounts, enter each
account, or select one by pressing the appropriate button.

Click Ok to save
the changes.

16. Click the Save
    button to create the new work order.

The master header appears in the window
in home position, and the dialog box automatically closes.

This function does NOT copy the engineering
master for the Part ID specified a single work order header is created.
This function is most useful for creating custom work orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help