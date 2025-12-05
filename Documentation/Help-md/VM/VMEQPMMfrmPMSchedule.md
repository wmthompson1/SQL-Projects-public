Creating Maintenance Schedules




# Creating Maintenance Schedules

After you have entered equipment and equipment profiles
into your database, you can generate a maintenance schedule that reflects
current equipment/profile relationships.

1. From the File Menu,
   select Create Schedule or click the
   Create Schedule toolbar button.

The Create Planned Maintenance Schedule
dialog box appears.

Scheduled lines appear in the table. Click
the Clear Sched button if you want to clear
the display. Use the features in the top part of the window as a filter
to control what you want to include in the schedule.

2. Specify this information:

Date From/To - Click
the Calendar buttons to select a date range.

Profile ID - Click
the Profile ID arrow to select the maintenance profile ID of the equipment.
The profile instructs VISUAL when to schedule the equipment for service.
Profiles dictate to VISUAL the number of days it should allow to lapse
between servicing, as part of a daily, weekly, monthly, or yearly
schedule. Without profiles, VISUAL cannot schedule maintenance for
a piece of equipment.

Equipment - Click
the Equipment browse button to select the ID of the piece of equipment.
You specify this during new equipment entry.

Type - Click the
Type browse button to select the type of Equipment ID. You specify
this during new equipment entry.

Model - Click
the Model browse button to select the model of the Equipment ID. You
specify this during new equipment entry.

Resource - Click
the browse button to select a shop resource to use.

Site
- Click the Site ID browse button and select a site to use.

Customer - Click
the Customer browse button to select the ID of the customer for whom
you are performing the equipment maintenance.

Area - Click the
Area browse button to select an equipment area

Branch - Click
the Branch browse button to select a branch for the equipment.

Eng ID - Click
the Eng ID browse button to select the engineer ID for the equipment.
You specify this during new equipment entry.

Select one of these options:

Internal - Select
Internal if a maintenance job is internal. You specify job location
during new equipment entry.

External - Select
External if a maintenance job is external.

Both - Select
Both is the maintenance job is both internal and external.

3. To exclude from the
   schedule with information displaying in the data fields, select
   the Exclude check boxes to the right.
   This feature is useful if you want to run different scheduling
   scenarios without deleting and modifying filter preferences. The
   check boxes, however, are only available if the corresponding
   data fields are active as well.
4. Click the Schedule
   button to begin the scheduling process.

A dialog box appears in which you can see
the progress of the scheduling run.

After VISUAL completes the scheduling run,
another dialog box appears summarizing the number of new job records
created and the range for the jobs.

Scheduling results appear in the line item table, one line per job.

The line item table contains the following
columns:

Site - The site
selected for the scheduled maintenance job.

Job
Date - The date on which the maintenance job is scheduled to
occur. For a piece of equipment with a profile for which you have
set a daily frequency preference, using an occurrence rate of every
six days, with a coverage range of 3/3/2004 - 5/31/2004, VISUAL schedules
a series like this:

3/9/2004, 3/15/2004, 3/21/2004, 3/27/2004,
4/2/2004, 4/8/2004, 4/14/2004, 4/20/2004, 4/26/2004, 5/2/2004, 5/8/2004,
5/14/2004, 5/20/2004, 5/26/2004.

Job ID - The Job ID of the maintenance job.

Customer- The
ID of the customer for whom you are performing the equipment maintenance.

Equipment - The
ID of the piece of equipment. You specify this during new equipment
entry.

Model - The model,
if any, of the Equipment ID. You specify this during new equipment
entry.

Type - The type,
if any, of the Equipment ID. You specify this during new equipment
entry.

Service Area -
The service area, if any, of the Equipment ID. You specify this during
new equipment entry.

Branch - The branch,
if any, of the Equipment ID. You specify this during new equipment
entry.

Engineer - The
Engineer ID for the equipment. You specify this during new equipment
entry.

WO Base ID - The
Base ID of the work order.

Eng ID - The equipment
Maintenance Engineering ID. You specify this during new equipment
entry.

Def Status - The
status of the work order.

WO
Create Date - The date on which VISUAL created the work order.

Internal - Either
a Y or an N displays in the column. If a maintenance job is internal,
a Y appears; if it is external, an N appears. You specify job location
during new equipment entry.

Sales Order -
If a sales order was created in conjunction with this maintenance
record, the ID of the sales order is inserted.

Line No - The
line number of the sales order for this maintenance record.

Last Invoice -
The date of the last invoice for this maintenance record.

Invoice Flag -

5. You can change what
   appears in the line item table by selecting the option buttons
   in the Planned Maintenance Status section.

The following option buttons allow you to
include and exclude certain kinds of maintenance jobs.

Planned - Select the Planned
option button to view planned orders.

WO
Created - Select the WO Created option
button to view new work orders.

WO Closed - Select the WO Closed
option button to view closed work orders.

CO Created - Select the CO
Created option button to view new customer orders.

Billed - Select the Billed
option button to view billed customer orders.

All - Select the All
option button to view all orders.

Internal - Select the Internal
option button to view only internal jobs.

External - Select the External
option button to view only external jobs.

Both - Select the Both
option button to view both Internal and External jobs. This is the
default.

6. If you want the information
   in the table to appear in reverse order, select the Descending check
   box.

|  |  |
| --- | --- |
| POSTIT.gif | Depending on Status object you select, the Search Set check box indicates if you are searching within a set. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Planned_Maintenance.htm) User-defined Help