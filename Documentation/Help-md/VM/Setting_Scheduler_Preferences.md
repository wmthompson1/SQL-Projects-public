Setting Scheduler Preferences




# Setting Scheduler Preferences

Use DBR Scheduler Preferences to specify the settings to use when
you run a schedule.

If you are licensed to use a single site, you can set up tenant-level
and schedule-level preference settings. When you create a new schedule,
the tenant-level settings are used for the default settings for the
schedule. You can edit the schedule-level preferences to override
the tenant-level settings. If you do not create tenant-level or schedule-level
preference settings, then the system default settings are used.

If you are licensed to use multiple sites, you can set up tenant-level,
site-level, and schedule-level preference settings. When you create
a new schedule in a site, the site-level settings are used for the
default settings for the schedule. If site-level settings are not
available, then the tenant-level settings are used. You can edit the
schedule-level preferences to override the tenant- or site-level settings.
If you do not create tenant-level, site-level, or schedule-level preferences,
then the system default settings are used.

In the DBR Scheduler window, users must have system administrator
privileges to change scheduler preferences. Other users can view the
preferences but cannot make changes.

The SYSADM user can edit DBR schedule preferences in Preferences
Maintenance.

To specify DBR schedule preferences:

1. Select Scheduling,
   DBR Scheduler.
2. Perform one of these
   steps:

* To specify
  tenant-level preferences, do not select a schedule. Select Options, Preferences....
  In the Title bar, Preferences - \*\*Tenant\*\* is displayed.
* To specify
  site-level preferences, select a schedule for the site. Select
  Options, Preferences....
  In the Title bar, Preferences - plus the name of the site you
  selected is displayed.
* To specify
  schedule-level preferences, select the schedule. Select Options, Schedule Preferences....
  In the Title bar, Preferences - plus the ID of the site and the
  schedule are displayed.

3. Click the Options
   tab.
4. Specify these settings:

Schedule Horizon 
Specify the maximum number of days into the future you want the DBR
Scheduler to search for available capacity and demand.

Fit Tolerance 
Specify a percentage that represents the amount of capacity that must
be available relative to the size of the operation in order for the
operation to be successfully scheduled in finite scheduling mode.
For example a value of 90 indicates that an 8 hour operation can successfully
fit into a 7.2 hour open slot. (8 hours x 90% = 7.2 hours)

Max Days to Save Setup 
If you are saving resource setups, specify the number of days after
the original setup you want the scheduler to save the resource setup
before it uses that resource for another operation.

Generate Audit Records 
To generate audit records, select the Generate
Audit Records check box. Audit records show each attempt
the scheduler made to schedule work orders.

Do Not Switch Op's w/mat'l
w/problem op's  Specify how to handle operations on the
CCR that lack material. To switch these operations with other operations
with material on the CCR resource, clear this check box. To prevent
operations from being switched, select this check box.

Suppress C/O Allocation
Links Creation  To prevent the scheduler from creating
links between work orders and customer orders, select this Suppress
C/O Allocation Links Creation check box. To allow the
scheduler to create links between work orders and customer orders,
clear this check box.

At the beginning of a run, the scheduler
deletes any links it created in previous runs but does NOT delete
those set by the user.

Save Incidental Setups 
To save similar resource setups the scheduler encounters between
one operation and the next, select the Save Incidental
Setups check box.

Link Non-stocked P/O's
to Matl Req's  To create links between work orders with
material requirements that can be satisfied by non-stocked material
purchase orders, select the Link Non-stocked P/O's
to Matl Req's check box. To prevent non-stocked purchase
orders from being linked to material requirement, clear this check
box.

Mark Unreleased Work
Orders for Reuse  To mark all work orders that are set
to unreleased during the scheduling process so that those work orders
can be reused on the next scheduling run, select the Mark
Unreleased Work Orders for Reuse check box. To prevent
unreleased work orders from being used in a subsequent scheduling
run, clear this check box.

When Schedule as of is
today If the schedule as of date is todays date, specify
the time of day to use as the default start of the schedule. Click
Default at time to midnight to start the
schedule at midnight. Click Default at time to
current time to use the time the scheduler is run as the start
time of the schedule.

5. To specify the information
   recorded in the DBR scheduler log file, click the Log
   tab.
6. Use the check boxes
   to specify the information to record in the log files. This table
   shows the check boxes that you can select, the log file that is
   generated when you select the check box, and a description of
   the information that is written to the file:

| **Check box** | **Description** |
| Loaded Root Work Orders | Select the check box to include the work order ID, warehouse ID, quantity required, and allocated quantities in the log file. Clear the check box to include only the number of work orders that were processed. |
| Part Netting | Select the check box to record information about the supply that the scheduler assigned to demand. |
| Work Orders Schedule Backward Infinite | Select the check box to add a list of work orders that are schedule backwards with infinite capacity to the log. |
| Material Release Schedule Feasibility | Select the check box to add details of the material feasibility pass to the log. |
| Work Order Created, Deleted, or Modified | Select the check box to add a list of work orders that were created, deleted, or changed to the log. |

7. Click the OK
   button.