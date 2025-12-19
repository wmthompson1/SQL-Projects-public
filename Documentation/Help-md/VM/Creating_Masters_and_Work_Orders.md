Creating Masters and Work Orders




# Creating Masters and Work Orders

Masters and work orders are extremely similar. Work
orders have more information and functions to handle because they
represent an actual manufacturing process, rather than a template
for one.

This section discusses using the Manufacturing Window to manipulate
masters. This also covers a large area that is identical for work
orders. See Managing Work Orders for more information on working with
work orders.

|  |  |
| --- | --- |
| POSTIT.gif | The Program Security function of Application Global Maintenance can limit the ability to create and edit master/work orders on a per-user basis. You can, for example, give a user the ability to edit engineering and quote masters, but not work orders. |

## Creating Masters

1. Select New
   from the File menu.

The Engineering Master/Work Order dialog
box appears.

If another master/work order is currently
loaded in the Manufacturing Window, it is automatically closed when
you finish creating this new one.

2. Click the Engineering
   Master radio button.
3. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you are creating this engineering master. If you
   are licensed to use a single site, this field is unavailable.
4. Enter a Part ID.

All engineering masters specify the production
process for a fabricated part. If you havent done so yet, you must
define the part master using Part Maintenance. You should mark the
master as Fabricated, indicating that an engineering master exists
for the in-house fabrication of this part.

5. Enter the Part ID for
   the part, or select it by pressing Part ID to call up the parts
   browse. You can also browse by part description by pressing the
   Part Description button.

If the Part ID doesnt exist, the system
asks you if you would like to create a new part here.

If you click Yes,
the New Part dialog box appears.

Enter a Description for the part, whether
it is Purchased, Fabricated, and/or Detail Only. This allows you to
continue the process without the interruption of using Part Maintenance.
You must return to Part Maintenance at some point, however, to define
the other information for the part.

6. Enter an Engineering
   ID (Eng ID).

The Engineering ID allows multiple revisions
of the master for a fabricated part. In Part Maintenance, you specify
the Engineering ID of the default master to use in creating work orders
for the part. Other masters can exist, but you must explicitly provide
the engineering ID to use.

The conventional default for Eng ID is zero
if this is a new part, specify 0 for the Eng ID.

Specify the Quantity for a standard lot
size for this part.

7. Enter the following
   Engineering Information:

Specifications
- This is a multi-line text field that lets you enter specification
text to describe the engineering master. Use the Copy
and Paste buttons to copy the entire contents
of the Specifications window, or to replace the entire contents of
the window with the clipboard.

Engineered By
- Specifies the person responsible for the master.

Engineered Date
- Date associated with this revision of the master. Selection of Engineering
Date can also be done from the Calendar object provided.

Drawing Number
- Drawing number of the engineering drawing for this master.

Drawing Rev -
Revision of the drawing number for this master.

Drawing File
The path to drawing file.

Entered By The
method used to create the master. This field is populated by the system.
See [Working
with Information in the Entered By Field](Working_with_Information_in_the_Entered_By_Field_in_the_Manufacturing_Window.md).

Product Code -
The Code associated with a product of this master. Each product code
can have a unique G/L account for inventory, WIP, and cost of goods
sold. Select a product code from the drop down menu.

Commodity Code
- The Code associated with a Commodity of this master. Select a commodity
from the drop down menu. You can also enter the Commodity Code and
save the information by clicking the Save
button.

Traveller Printed
The date and time the work order traveller report printed.

Current Stage/Rev
If an engineering change notice has been applied to this master,
the system inserts the current ECN stage and revision level.

Original Stage/Rev
If an engineering change has been applied to this master, the system
inserts the original ECN stage and revision level.

Stock U/M The
system inserts the stock unit of measure as defined in Part Maintenance.

Customer Priority
This field is used in conjunction with VISUAL Shop Floor. Optionally,
specify a priority level for this work order. You can specify a value
between 0 and 3. For example, if this work order is for a particularly
important customer, you could specify a priority of 1. In the VISUAL
Shop Floor app, the priority level is indicated with a 1, 2, and 3
icon. If you specify 0 for the customer priority, no priority icon
is displayed in VISUAL Shop Floor. This field is reserved for a future
feature of VISUAL Shop Floor.

A system administrator can control access
to this field.

8. Select the Forward
   Schedule from Release Date check box to specify the default
   setting for scheduling of work orders. If left unchecked, work
   orders are scheduled backwards from their want date. You can change
   this option for each individual work order created from this master.
9. Specify how to report
   labor for all operations in this master. The settings that you
   specify are copied to work orders that you generate from the master.
   If the fields listed below are unavailable, then the information
   has been specified in Site Maintenance and cannot be customized
   for this master:

Percent Complete
To record labor by percentage complete instead of quantity complete,
select this check box. When a user selects an operation that uses
percentage complete reporting, labels in the labor ticket entry programs
are updated to indicate that quantities are reported as percentages.
If you use BTS, a Percent Completed prompt is displayed.

Quantity Complete by
Hours To automatically calculate quantity complete or percentage
of completion based on the hours reported on the labor ticket, select
this check box.

If you report labor based on quantity complete,
then this calculation is made to determine the quantity completed
during the labor ticket:

(hours reported on ticket/total estimated hours
for operation) \* operation quantity

If you report labor based on percentage
complete, then this calculation is made to determine the percentage:

(hours reported on ticket/estimated hours for
operation) \* 100

The operation is automatically closed when
the quantity or percentage complete equals or exceeds the operation
quantity.

If you select the Quantity Complete by Hours
check box in Site Maintenance, then all run type labor transactions
are automatically calculated. .

Max Percent Completed
If you selected the Quantity Complete by Hours check box, use this
field to specify the maximum percentage that can be calculated automatically.
When the percentage complete meets the threshold that you specify,
automatic calculation of quantity complete is stopped. The operation
remains on your schedule until the operation is manually closed. This
formula is used to calculate the number of hours for the operation
that remain on your schedule:

((100 - value specified in Max Percent Completed
field)/100) \* total hours required for the operation

To complete the labor on an operations,
users must manually close the operation. See [Completing
Labor on Operations with Max Percent Complete Thresholds](VMLABENTfrmLaborEntry.md#CompletingLaborMaxPercent).

10. To prevent this engineering
    master from being used to generate a work order or to be considered
    in planning and scheduling, select the Inactive check box. You
    can select this check box if the engineering master is in process
    and not yet complete. You can only select this check box if the
    engineering master is not specified in the Eng Master ID field
    in Part Maintenance.

To allow this engineering master to be used
to generate a work order and to be used in scheduling and planning,
clear the Inactive check box.

 This option is available on the Engineering
Master header card only.

11. Select
    the Allow Alternate Parts check box
    to allow alternate parts to be used in place of the material requirements
    specified on the master. When you select this option, the system
    activates the Alternate Parts tab on any material requirements
    you add to the master. If the originally specified part is unavailable
    when the master goes into production, you can use an alternate
    part instead. Clear the check box to prevent the use of alternate
    parts on a master.

12. Click the Pict/Object
    button to associated a graphic with the engineering master. This
    provides shop floor access to the object.
13. Click the Variables
    button to define variable dimensions referenced in material requirements.

The Work Order Variables dialog box appears.
For a new master, this window is empty.

To add a variable to the master, click the
Insert button to add a new line to the table,
then enter the following information on the new line:

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

14. Click the G/L
    Accts button to override WIP G/L Accounts.

The Work Order WIP Accounts dialog box appears.

If you are using the Infor VISUAL Financials
interface, there are four General Ledger accounts associated with
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

15. Click the User Defined
    tab, and select a User Defined Field Layout ID if appropriate.
16. Click the Engineering
    tab to designate this master as [eligible
    for updating](Designating_Legs_and_Engineering_Masters_as_Eligible_for_Updating.md) with the Master Updater function. This tab also
    displays [information
    about when the master was last updated](Viewing_Update_Information.md). This tab is available
    on Engineering masters and Legs only.
17. Click the Save
    button to create the new master.

The master header appears in the window
in home position, and the dialog box automatically closes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help