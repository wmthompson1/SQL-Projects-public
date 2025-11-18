1 | P a g e
File: C:\Users\williamt\source\skillsinc\skills-inc-org\IT_TeamProject\Utilities\Python Utilities\Markitdown\Visual Expedite Users Guide 2.2.1.7.md

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

1.  Understanding the panes
1.1.  Exception Pane
1.2.  Netting Pane
1.3.  BOM/Where Used Pane

2.  Understanding the Filters
2.1.  Exception Filters
2.2.  Other Filters
2.3.  Lists
2.4.  Maintaining Cumulative Lead Times

3.  *Purchase Order Generation Window

3.1.  Material Procurement
3.2.  Outside services

4.  *Work Order Generation Window
5.  Part Info Module
6.  Administration

6.1.  Application Settings
6.2.  Adding Users

* Applicable to full EMS users only.

……………….…………………………………………………………………………….2
……………………………………………………………………………………………..3
.…………………………………………………………………………………………….4
.…………………………………………………………………………………………….6
………………………………………………………………………………………..……6
.…………………………………………………………………………………………….6
.…………………………………………………………………………………………….7
.…………………………………………………………………………………………….7
.…………………………………………………………………………………………….9
.…………………………………………………………………………………………….9
.…………………………………………………………………………………………..12
.…………………………………………………………………………………………..14
.…………………………………………………………………………………………..17
.…………………………………………………………………………………………..18
.…………………………………………………………………………………………..18
.…………………………………………………………………………………………..21

2 | P a g e

Exception Pane:

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

After specifying the filtering criteria and clicking the green refresh icon, this pane will populate with the exceptions
written by the generator (run separately on a schedule on the server).

•  This grid can be sorted by most of the columns.
•  Clicking on the excel icon will export only this pane to a new spreadsheet.
•  Highlighting any row will populate the balance of the application:

o  Netting Pane (lower left pane).
o  BOM/Where Used Pane (lower right pane).

▪
▪

If the part is fabricated, it will populate this pane with a bill of material.
If the part is purchased, it will populate this pane with every structure it is used on (where it’s a
component of another bill of material).

o  Part Information fields (adjacent to the filtering tabs).

•

•

•

‘Updated’ Check Box:  This box automatically gets updated by the system when a change is made to the
corresponding documents’ status or due date value.  It can also be manually set by the users.  This is to indicate
to the user that the exception has already been accounted for.  This remains on the document until the
document no longer has the exception (refreshes of the screen won’t make it go away).
‘Locked’ Check Box:  This is a field that is updated by the user to indicate that nothing can be done to remedy
the exception and remains on the corresponding document until the document no longer has the exception.
‘Comments’ Field:  This field is used for purposes of keeping information on the exception.  This information
does not pass through to Visual.

•  Double clicking on the part withing the netting pane will launch the Visual Material Planning Window.

3 | P a g e

Netting Pane:

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

This pane dynamically paints a material netting information (demand, supply, etc.).  This information here is dependent
on which exception row is highlighted:

•  When an exception message is highlighted for a material exception, it will populate with the same information

that is in Visual’s material planning window though it will be arranged differently.

•  When a component on the ‘BOM/Where used’ pane is highlighted, it will transition the material planning

information to be that for the component highlighted.  To revert back to the parent items’ material planning,
the user can re-highlight the exception on the exceptions pane.
If the exception that is highlighted is for an outside service, this pane will reflect the service planning
information with the same information found in Visual’s service planning window.

•

Making Changes:
•  Status:

o  Checking the ‘Cancel’ check box here on a purchase order will:

▪  Toggle the purchase orders’ line items status to ‘Close Short’ (for purchase orders) or change the

status to ‘Cancel’ (for work orders).

▪  Generate a note in the documents’ notes table indicating the change made (along with date and

user).

•  Dates:  Double clicking the date will bring up a dialog box for the user to update the date:

▪  Desired Receive Date (for purchase orders) or Desired want date and Desired Release date(for

work orders).

▪  System automatically generates a note in the documents’ note table indicating the change made

(along with date and user).

4 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Other navigation and information:

•  Highlighting a row:  If the user is an EMS user and is highlighting a row that is for a work order, it will change the

BOM/Where used pane into a job status pane.
•  Date: This is the current due date of the document.
•  Act by date: This is the date that the user should act by when considering lead time on the part.
•  New date: This is the new date that the supply should arrive as determined by other planning information.
•  Message: This is the exception message (late, pull, release, etc.).

o  For EMS Users, when double clicking on the ‘Release’ message, it will invoke the application EMS
module (Work Order Generation for fabricated parts or Purchase Order Generation for purchased
parts).

•  Double clicking on other row items will trigger the following:

o  Part ID: This will drill down into the Visual material planning screen.
o  Document (netting pane): This will drill down into the applicable Visual application (Purchase Order
Entry or Manufacturing window) if standard user, otherwise into the applicable EMS module.

o  Date: This invokes the due date change dialog box (mentioned previously).

•

‘Include Planned Orders’ Check Box:  Demand from planned order will always display (indicated by ‘MRP’ as
source) but planned supply orders are only displayed if this check box is checked.

BOM/Where used pane:

This pane is populated with an indented bill of material (for fabricated parts), a where used list (for purchased parts) or a
job status board when a work order item on the netting pane is highlighted.

•

‘Multi-Level’ Check Box: When checked, this turns the pane in to a fully expanded bill of material (hence multi-
level) or a fully expanded where used (multi-level) if the item is a purchased part.

5 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

‘Msg Counts’ Check Box: will toggle the visibility of the exception message counts for the components on or off.

•
•  Direction indicators (↓/↑): This indicates which direction the pane is displaying the information and acts as a

toggle for the direction (a where used view vs an indented bill of material view) when the part is both purchased
and fabricated or when the fabricated part is also a component of another assembly.
‘Show Trans’ Check Box (when in job status mode): This will list the detailed transaction (material issues/labor
tickets) on the items within the job status pane.

•

Navigation:

•  Highlighting any component will re-paint the material planning pane with that components’ material planning

information (demand, supply, etc.).  It will also re-paint the top portion of the window with the components part
information (order policy, lead time, etc.).

•  Double clicking exceptions will bring up a dialog box with those components top 10 exceptions for the exception

clicked on (for the same warehouse).

•  Highlighting any row in the netting pane will change the BOM/Where used pane into a job status pane (full EMS

users only) as illustrated below:

•  Check the ‘All warehouses’ check box on the netting pane to toggle between material planning for the

exceptions’ warehouse or all warehouses.

Use ‘Show Trans’ check box to toggle display of related operation/material transactions.

Material information:

•  Each item highlighted (whether in exceptions grid or BOM/Where Used grid), will populate the part information
at the top of the screen.  It is initially populated with the exceptions’ part warehouse information.  This can be
toggled between part warehouse and the part by clicking the applicable radio button (see yellow highlight).

6 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Understanding the filters:

•  Exception Filters:

o  Fab: Parts that are flagged as fabricated in Visual.
o  Pur: Parts that are flagged as purchased in Visual.
o  Svc: Outside Service Operation Exceptions.
o  Horizon: Difference in days between the ‘Act by Date’ and todays’ date.
o  Days: Applies only to Late, Pushes and Pulls.
Late: How many days late the order is.

▪
▪  Pushes/Pulls:  The difference in days between the current schedule receipt date and the need

date of the order based upon other existing supply and demand.

o  Amount: Value of the exception.  For purchase orders, it is the open value of the PO line.  For work

orders, it is either the average price the unit is sold at, or part master unit price (or standard cost if no
unit price is specified in part maintenance).

o  Pull: Order needs to come in earlier that what it is currently scheduled for.
o  Push: Order is coming in too early and should be postponed to a later receipt date.
o  Late: Order is currently past due.
o  Cancel:  Order should be cancelled because the entire order quantity will be added to stock (no existing

demand will consume any of the order).

o  Release:  Shortage that correlates to a planned order.
o  Moves: There is excess stock with no demand and thus should be used for other warehouses demand.
o  Order Point: Inventory that has fallen below it’s order point quantity
o  Shortage: Inventory that is short but does not have a correlating planned order.
o  Safety Stock: Part shortage as a result of safety stock quantity.
o  Exclude Updates: When checked, it will exclude any exception that has already been dealt with.
o  Exclude Locks: Exclude exceptions that previously flagged as locked.  Locked flag is way for user to

indicate that the exception cannot be remedied.

o  Exclude Planned: Exclude any exception where the exception is being driven by a planned order.

•  Other Filters:

o  Code Range: This applies to Planner, Buyer, Product Code and Commodity code filters only.  The above
example uses the ‘Planner’ values.  The ‘From’ and the ‘To’ are a list of distinct values found in the field
(when no master table exists like planner user id or buyer user id) or from the master table when there
is a master table (like product code or commodity code).

o  Show in grid: This will determine if the column is to be displayed in the exceptions pane after the grid is

refreshed.

7 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

o  Maintaining Lists: using lists is a way of grouping certain codes together (within the same classification)

for filtering purposes.  When ‘Lists’ is checked, the top drop down displays the lists vs the codes.

o  Wildcards (%) can only be used on non-drop down fields (part id).
o  Each tab that has a filter applied will be highlighted in yellow.

Maintaining List (under ‘Maintain’ drop down’):

•  Select desired category from list.
•  Assign your desired code to one or more codes on the list.
•  Codes to List values are stored at a per user level.
•  Records are updated as you leave the ‘List ID’ field (no need to ‘Save’ the changes as they are being done as the

entries are being made).
List ID values will be shown on the applicable filter tabs when ‘List’ is checked.

•

Maintaining Cumulative Lead Times (under ‘Maintain’ drop down):
**NOTE** It is imperative to do this on a regular basis as the exceptions’ act-by-date is driven from these calculations

•  Red alert will display when new parts need to be added to the list.
•  Option to calculate only new entries (new entries only check box).
•  Each item can be manually overwritten (override column of grid).
•  Does NOT update Visuals’ part lead time (that must stay at single level).

8 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Column Configurations:

•  Arrangement:  To arrangement order, simply click and hold left mouse button on column header and drag the

column to the desired location.

•  Sizing: To change size of column, navigate cursor to edge of column header and once it becomes a double white

arrow (side to side), click and hold left mouse button and drag size accordingly.

•  Show/Hide Columns (under ‘Maintain’ drop down):

•  Select applicable grid
•  Toggle visible check mark on items you want to show/hide.

•  Settings (arrangement, size and visibility) are stored in the database per user and will be reflected as such on

subsequent launching of the application.

9 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Purchase Order Generation Window:

Header section:

•  Vendor selected drives default FOB, Ship Via, Currency, and Terms.
•  Header specs tab will default to supplier specifications.
•  Notes Tab: Allows users to add notes to the PO or notes to the Vendor.
•  User Defined Tab: Allows users to specify PO Header standard user defined fields.
•

Line Specs tab:  This is populated with the correlating highlighted lines (middle pane) specifications.  Defaults
from part PO spec (if populated) or part spec when purchasing a component.  When purchasing a service, it
defaults to the operations’ specification.
Line and Custom UD’s tab.  This reflects the highlighted lines’ standard and custom user defined fields and the
purchase order header custom user defined fields (in grid fashion).

•

o

If a UDF layout titled ‘PO LINE’ exists, it will proceed to use that as labels for the line standard user
defined fields, otherwise it will revert to the ‘User Defined’ default.

10 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

•  Planned Orders Tab: Lists all the planned orders for this part allowing the user to add to the order/combine

planned orders (will simultaneously remove the planned orders when the order is generated).

•  Addresses tab: Allows the user to specify the ship to address and the contact information.
•  Allocations tab: Displays and allows for the creation of allocations to requirements and or operations (outside

processes).

•  Receipts: Displays receipt activity for the purchase order
•  Approvals: Displays the approvers and related information for the PO (if PO Approvals is turned on via

application global maintenance).

Line Item section:

•  Requires applicable project information when buying to project (WBS, Cost Category, etc.).

•

•

•

•

 used to add a new line.

 used to delete a line (line must be highlighted first).

 used to copy a line (project data cannot be changed on copied lines).

 used to add delivery schedule to the line.  When using delivery schedules, only relevant information on the
first delivery is editable (unit price, mfg name, etc.). When changes are made to the first delivery, it will replicate
that information to the other delivery schedule lines.  Subsequent delivery lines are in gray and read only (with
the exception of delivery schedule specific fields like quantity, dates, etc.)

•  Clicking in date field invokes a calendar for easy date selection.

11 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

•  When month, day, or year is highlighted within a date field, you can use up and down arrows to increment or

decrement the value by factor of one for each keystroke.

•  Warehouse, UM, GL Account, Warehouse, Department, Cost Category, and Ship To are all drop down lists.

•

 Invokes the WBS search screen (warehouse must be populated first) for the user to select the WBS

information (WBS, Sub & Sequence).

Information Section:

•  History Tab: Shows purchase history for item being purchased.
•  Quotes & RFQ’s shows active part pricing and approved RFQ’s for item.

12 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

•  Open PO’s tab reflects open PO’s (requires a vendor be selected first).

o  Double clicking on the open PO will prompt user to append to that PO.
o  Highlight the PO header to view PO specs (to the right) or line (below) to see line specs.

•  Exceptions tab show other exceptions for the item being purchased.  User can then flag those exceptions as

being addressed (in the event more than just the one exception will be procured for).

Purchasing Outside Services:

•  Planned orders tab turns into the ‘Work Orders’ tab.

o  Existing, un-purchased open work order operations that call out the same outside service are illustrated

on this tab.
o  Highlights:

▪  Green: Indicates operation has labor posted to preceding operation.
▪  Yellow: Either the 2nd or 3rd prior operation to the outside service operation has labor posted

o  Preceding 3 operations to the outside service (provided they are on the same leg) are listed in columns

Pred-1, Pred-2, and Pred-3.

o  Hovering over any Preceding operation preceded with a * will display the hours that have been charged

to it (no * indicates no labor).

13 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

o  Clicking on the ‘Inc’ check box will add the line item to the PO and create the allocation at the time of

placing the order.

•  Allocations tab displays existing allocations and allows for the creation of allocations:

o  When highlighting the line, the necessary link information will get populated.  Accept or change the
quantity make/edit the allocation.  *Note* PO Line item must be saved before making allocations.
o  When specifying ‘Available Allocation’ it will only display released (if ‘Released’ is checked) and/or

firmed (if ‘Firmed’ is checked) requirements that haven’t been allocated.

o  When specifying ‘Existing Allocations’, the system will replace the contents of the grid to display those

items that are linked to the line.

o  *Note* You can only link to lines that do not have delivery schedules (Visual ERP application logic rule).

Upon saving/updating/creating a PO, the system will display a print option.  If forms (SQL Server Reporting Services
Reports) have been setup and configured via Application Global Maintenance, then user will have the option to pick
which form to print.

14 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Work Order Generation:

•

Information defaults to the information held on the engineering master when creating new work orders.

•  User Defined Tab: Standard User Defined fields (works the same way Visual Manufacturing user defined tab).

This also includes a grid displaying all the custom user defined fields assigned.  The Visual tab is listed in the ‘Tab’
column of the grid.

•  Documents:  Linked documents to the Engineering Master.  If they are to be referenced on the work order as
well, be sure to check the ‘Copy Doc’s’ check box.  You can also add documents to existing work orders

•  Variables: Similar to Visual.  Input the variable information.

15 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

•  Co-Products: Lists all of the co-products on the Engineering master that will carry over to the work order.  Items
can be removed or added (provided work order exists – i.e., on new work orders, the work order must be saved
before specifying co-products).

•  Planned Orders tab: List of planned orders for this part.  Including (checking the ‘Inc’ check box) additional

planned orders will flag those planned orders for deletion and increment the lines’ quantity value.

•  Allocations tab: List the allocations for the work order

•  Exceptions tab: Lists the other exceptions for this same part.  Allows users to flag them as ‘Updated’.

16 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

•  You can review the structure by clicking the ‘View BOM’ which toggles to ‘Hide BOM’ once clicked and

presented the grid as illustrated below.  The three remaining tabs (Operation, Material, & Activity) correlating to
the BOM entry selection will be enabled and populated.

•  As an example, once clicking on a material card, the material card tab is displayed with information.  It will also

populate the operation card and activity tabs as well (related to that material requirement)

•  Material, legs and operation cards can be added and/or copied on the fly here as well with the + icons.  For

placement, simply highlight the record you want it to be added prior to and then click the + button.  It will then
add between that record and the preceding one (provided there is room in sequence numbering).

•  Within the grid you can remove items by checking the ‘Delete’ check box.  It will delete that record as well as

any subordinate items provided there is no activity on them.

•  You can also print a work order traveler provided it has been setup (SQL Server Reporting Services Report built

and specified in application global maintenance).

17 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Part Info Screen (accessed via

 icon next to the ‘Qty Avail’ field of the main form):

•  For informational purposes only.  No edits can be made on this screen.
•  Applicable available (non-zero) information displayed:

o  Trace Data.
o  Piece Data.
o  Location Data.
o  Safety Stock Designations
o  Transaction Data.
o  Selling History.
o  Purchase History.

•  Transaction pane displays activity for the part.

o

o

Initially displays 1 years’ worth of history.

 to append an addition years’ worth of data to the transaction pane.

  to retract a years’ worth of data from the transaction pane.

o
o  Types of transactions can be toggled on and off via the checkboxes above the pane.

•  When highlighting either a location, trace or piece, the transaction grid will highlight (in grey) the transactions

affecting the selected item as illustrated above for a location.

•  Buy / Sell History tab:  Illustrates purchase and/or selling history for the item inquired.

18 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

Admin / Setup:
This is done by clicking ‘Maintain’ and then ‘Application Global Maintenance’.  *Note* Only SYSADM has rights to
access this screen.

You’ll need to populate the values in the 3 tabs

Generator Tab:

License Key: Product License Key.

•
•  Maximum messages: This indicates how many of the same type of message for the same warehouse and the same

part is generated before it moves on to the next warehouse/part combination.  If, for example, the release messages
written for warehouse X, part Y is at 20 as illustrated above, but any other message (push, pull, etc.) is less than 20,
it will continue to write those messages for that warehouse/part combination but it won’t write any further release
messages (as it has reached the limit for that part/warehouse combination).  Once it moves to a new
part/warehouse, it resets the message limit counter.

•  Process Horizon (default 0): This determines how many days out in the future it will evaluate planning information.

This should be set at a minimum of the largest cumulative lead time item with activity.  If set to 0, there is no
horizon (processes all planning data).

•  Product Code Source: Value used by the generator to determine the source of the product code when generating

the exceptions.  Input either W for work order or P for part.

•  Commodity Code Source: Value used by the generator to determine the source of the commodity code when

generating the exceptions.  Input either W for work order or P for part.

•  Segregate Hard Allocations:  This is if you exercise hard allocating PO’s to work order demand for components.  If
set to Y, it will segregate these and treat them independently.  This only applies when ‘Cascade Gen Method’ is set
to ‘N’.

•  Generator Location and file name: Needs to be stored if you want the user to be able to run the generator (a long

process) from the interface.  If you don’t want them to be able to run it, then leave this blank.

•  Cascade Gen Method.  When set to ‘Y’ it will push all demand accordingly vs the bare minimum.  As an example,

there is demand of 10 on July 1, Aug 1 and Sep 1 – all of which resulted in purchase orders to satisfy that demand.
Now that demand slides by a month.  If this setting is set to Y, the system will write exception messages for all 3
delivery lines: Move July 1 to Aug 1, Aug 1 o Sep 1 and Sept 1 to Oct 1.  If set to N, it would suggest that you push
line 1 delivery from July 1 to Oct 1 and do nothing to the other two deliveries.

19 | P a g e

Expedite Tab

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

License Key: Product License key

•
•  Visual Directory: This is specified so users can drill down into applicable VM application (material planning, part

maintenance, etc.)

•  Planned Order Horizon (default 120): When populating the planning pane and ‘Include Planned Orders’ is checked,
it will only pull in those planned orders that have a release date less than today plus this value.  If set to 0, there is
no horizon (includes all planned orders).

•  PO Status (default Released): Options are Released, Firmed, Unreleased, Closed and Cancelled. This provides the

default status when generating a purchase order.

•  WO Status (default Released): Options are Released, Firmed, Unreleased, Closed and Cancelled. Provides the

default status when generating a work order.

•  Forms and Reports: This table contains the pertinent information - forms, path, parameter, applicable module and

applicable user and/or groups for the purchase order forms and work order traveler forms that are used for printing
the documents within the EMS system.

20 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

PO Approval Tab **NOTE** These controls can be circumvented by users when they go into Visual Purchase Order
Entry.  In order to take advantage of this option, you would need to ensure they can’t use Visual PO Entry.

•  Enable PO Approvals by checking the ‘PO Approvals Enabled’ box.
•  By enabling this feature, PO’s cannot be changed to ‘Released’ until the approvals have been signed off.  This

utilizes the ‘Task’ feature in Visual (i.e., creates an Approval task in VM).

•  Changes may or may not be abled to be executed depending on the ‘Changes Permitted’ section.

o

In Process: PO’s that have started (at least one approver has signed off on their task) but has not
reached the end of the PO approval process.

▪  None: No changes can be made once someone has approved their task.
▪  Non $: Only non-monetary changes can be made (date changes, notes, etc.)
▪
Less $: Changes can be made when the change results in a lesser PO value (total all lines)
▪  More $: Changes can be made when the change results in a greater PO value (total all lines).
▪

If any of the aforementioned are checked, it enables the ‘Restart Auth’ check box.  When that
is checked, it will allow for that change but will restart the PO approval over again (making
users sign-off again for the PO).

o  Released: These are for PO’s that are released (prior to turning on the PO Approval feature or ones
that have run through the approval process). None, Non $, Less $ and More $ operate in the same
fashion as ‘In Process’ option.

•

If ‘Dept Required’ is enabled, it will force them to select a Department for every PO line.  It will also provide
the ability to have sign-off authority on a department-by-department level.  For instance, if 3 lines where for
Department 100, and 2 other lines for department 400, it would look for and assign buy-offs for each
applicable level 1 users for department 100 and 400 factoring in the amounts for each department.
•  DB Mail profile (SQL Server Mail) needs to be populated if you want specific users to be notified via email

when they get an approval task assigned to them (specified by the email check box in the grid of the users).
•  Authorization levels are the incremental blocks.  If there is no-one at a specific level, it will find and apply the
task to the next level user.  I.e., if PO is 5K and levels are set to 2K, 7K, and 10K and no one is specified for
level 7K but there is one set to the level 10K, the task will be assigned to user defined in 10K once the 4K level
user has signed off.

Users are maintained via ‘Maintain’ and ‘Users’.

21 | P a g e

            E x c e p t i o n   M a n a g e m e n t   S y s t e m

These are the users that can access the EMS system.

•  User ID is the Visual User ID
•  MPS Available entries:

o  Y: Has ability to open internal PO and WO forms (along with edit abilities)
o  N: Does not have ability to open PO and WO forms.  Instead, it will launch the applicable Visual

application (provided they have it installed and they have rights).

o  W: Has ability to open internal WO form but not PO (PO will revert to Visual PO Entry)
o  P: Has ability to open internal PO form but not WO (WO will revert to Visual Mfg Window)

•  User SYSADM Should be in this list as it is the only way to access the maintenance screens.
o  **Note** User ID SYSADM does not count towards user license count consumption.

