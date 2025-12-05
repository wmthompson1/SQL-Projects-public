Setting Concurrent Scheduler Preferences




# Setting Concurrent Scheduler Preferences

Use Concurrent Scheduler Preferences to specify the settings to
use when you run a schedule.

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

In the Global Scheduler window, users must have system administrator
privileges to change scheduler preferences. Other users can view the
preferences but cannot make changes.

The SYSADM user can edit scheduler preferences in Preferences Maintenance.

To specify concurrent scheduler preferences:

1. Select Scheduling,
   Global Scheduler.
2. Perform one of these
   steps:
3. To specify
   tenant-level preferences, do not select a schedule. Select Options, Preferences....
   In the Title bar, Preferences - \*\*Tenant\*\* is displayed.
4. To specify
   site-level preferences, select a schedule for the site. Select
   Options, Preferences.... In the Title
   bar, Preferences - plus the name of the site you selected is displayed.
5. To specify
   schedule-level preferences, select the schedule. Select Options, Schedule Preferences....
   In the Title bar, Preferences - plus the ID of the site and the
   schedule are displayed.

3. Set these preferences:

Schedule Horizon
Enter the maximum number of days into the future you want the Scheduler
to search for work order want dates.

Fit Tolerance
Enter a percentage that represents the capacity necessary relative
to the size of the operation in order for VISUAL to successfully schedule
the operation in finite scheduling mode. For example, a value of 90
indicates that an 8 hour operation can successfully fit into a 7.2
hour open slot. (8 hours x 90% = 7.2 hours)

Schedule Pieces if Run
Minutes per Piece is at Least Use this option with min/max
scheduling. The run minutes per piece must be at least 10 minutes.
The Scheduler does not split the duration for one piece among multiple
units.

For example, if you are scheduling an operation
with 10 pieces on 3 units and the run type is 1 hour per piece, the
Scheduler schedules 4 pieces on unit 0 and 3 pieces each on units
1 and 2.

4. In the Generate section,
   select audit record options you want to use:

Work Order Audit
Select the Work Order Audit check box
to generate an audit record for each pass that the Scheduler makes
when processing a work order. The maximum is three entries per work
order.

Operation Audit
Select the Operation Audit check box to
generate an audit record for each attempt to schedule each operation
of a work order. This option must be active to use the Audit mode
in the Scheduling Window.

Selecting the Operation audit check box
automatically selects the Work order audit check box. Clearing the
Work order audit check box automatically clears the Operation audit
check box.

Throughput Audit
Select this check box to generate the operation audit results required
for Throughput analysis only. Selecting the Throughput Audit check
box automatically selects the Work order audit check box. Clearing
the Work order audit check box automatically clears the Throughput
audit check box.

5. In
   the Apply true infinite capacity to section, select whether full
   infinite capacity will be applied to a resource. Under standard
   scheduling logic (not enabled setting below) an infinite resource
   in VISUAL has a 254 maximum concurrent units of capacity threshold
   so that a resource schedule can be graphically displayed in the
   Scheduling Window. Selecting this setting will allow unlimited
   units of capacity for a resource, stacking operations atop one
   another, when displayed in the Scheduling Window. Generally infinite
   resources are not managed to detailed granularity within the Scheduling
   Window, therefore this option is recommended when more than 254
   operations must be scheduled concurrently or the graphical presentation
   in the Scheduling Window is not required for infinite capacity
   resources.  
     
   Not enabled The
   Concurrent Scheduler will apply standard logic. All infinite resources
   will consider existing load assigning a unit of capacity to each
   limiting to 254 concurrent units of capacity.   
     
   All resources scheduled infinitely 
   The Concurrent Scheduler
   will apply true infinite capacity logic to any resource that is
   scheduled infinitely, ignoring existing load. This applies to
   all resources setup to be infinite in Shop Resource Maintenance,
   as well as resources that are scheduled infinitely due to the
   Schedule ID being marked as an infinite schedule.  
     
   Only resource setup as infinite  The Concurrent Scheduler
   will apply true infinite capacity logic only to resources that
   are setup as infinite in Shop Resource Maintenance, ignoring existing
   load. This includes resources marked as outside contractors, as
   well as any resource with Schedule Normally unchecked or that
   has 0 capacity listed on all 3 shifts.  
     
   Only outside contractor resources  The Concurrent Scheduler
   will apply infinite capacity only to resources that are setup
   as outside contractor resources, ignoring existing load to exceed
   the 254-unit threshold.
6. In the Sort By section,
   select how you want VISUAL to sort the schedule:

Order Want Date
If you want VISUAL to sort the schedule based on the date on which
the order is wanted, select the Order Want Date
option button.

Priority, Want Date
If you want VISUAL to sort your schedule based on priority first
then want date, select the Priority, Want Date
option button.

Priority, Release Date
If you want VISUAL to sort your schedule based on priority first
then release date, select the Priority, Release
Date option button.

6. In the When schedule
   as of is Today section, select how you want VISUAL to handle
   the scheduling time:

Default at time to
midnight If you want time appearing in the Global Schedule
dialog box to appear as Midnight, select the Default at time to
midnight option button.

Default at time to
current time If you want time appearing in the Global Schedule
dialog box to appear as the current system time, select the Default
at time to current time option button.

7. In the Schedule started
   work orders section, select how you want VISUAL to handle work
   orders that are already in progress:

Normally If
you select the Normal option, all started work orders with history
are scheduled in their original position in the work order sort order.

First, dont freeze started
operations If you select this option, all started work orders
are processed first. The sort of the started work orders is still
based upon the sort selection (for example, Want Date). During the
scheduling of these started work orders, any started operations are
not frozen after being scheduled. They will be scheduled normally
if scheduled in a later run.

First, freeze started
operations If you select this option, all started work orders
are processed first. The sort of the started work orders is still
based upon the sort selection (for example, Want Date). During the
scheduling of these started work orders, any started operations are
frozen after being scheduled. They will be scheduled using frozen
operation scheduling logic if scheduled in a future run.

|  |  |
| --- | --- |
| TIP.gif | Depending on the new schedule, your started operations may move. |

8. Click the OK
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_After_Forward_Pass_Options.htm) Setting After Forward Pass Options

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Allocation_Options.htm)
Setting Allocation Options

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Material_Options.htm)
Setting Material Options