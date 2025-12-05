Adding a New Shop Resource




# Adding a New Shop Resource

If you are licensed to use multiple sites, you can select a site
and define all resource information when you are creating the resource.
Some of the information you define is stored at the tenant level.
If you click the Save button before you complete the resource record,
you must select the \*\*Tenant\*\* option in the Site ID field to continue
specifying information for certain fields.

If you are licensed to use a single site, the Site ID field is not
available. You can edit all other fields without restriction.

To add a shop resource:

1. If
   you are licensed to use multiple sites, click the Site ID drop-down
   button and select the site to which you are adding the resource.
   If you are licensed to use a single site, this field is unavailable.
2. Enter the new Resource ID in the Resource ID field.
3. Enter a brief description for the resource in the Description
   field.
4. Move to the Costs area
   and enter the costing information that applies to the resource.
   Specify the costs as:

Setup
per hour - cost per hour to setup this resource.

Run
per hour - cost to run the resource for one hour.

Run per unit - cost to run the resource per unit
produced.

5. In the Labor
   G/L Acct ID field, enter the General Ledger account VISUAL credits
   when you use this resource.

You can click the Labor G/L
Acct ID button to call up a table of available account IDs.

6. Click the Cost Category button and select the Cost category
   you want to assign to this resource.
7. Click the Department ID
   button and select the department to which this resource belongs.
8. In the Bid Rate Category
   field, specify the bid rate category for this part. Use bid rate
   categories to analyze budgets and quotes for this part. Set up
   bid rate categories in Application Global Maintenance.
9. Move to the Burden Cost
   area and enter the burden that applies to the resource. Specify
   Burdens as:

Burden/hour
(setup) - This is the burden cost per hour of setup time. Use
the Percent field to the right of this field to specify set up burden
as a percentage of the Setup per hour cost. The system adds this percentage
amount to the total dollar amount in the Burden/hour (setup) to give
a total burden cost.

Burden/hour
(run) - This is the burden cost per run of the resource. Use
the Percent field to the right of this field to set a percentage of
the Setup per hour cost. VISUAL adds this percentage amount to the
total dollar amount in the Burden/hour (run) to give a total burden
cost.

Burden/unit
(run) - This is the burden cost per unit produced.

Fixed
Burden - A onetime cost (burden) charged when this resource
is used.

10. In the Burden
    G/L Acct ID field, enter the General Ledger account VISUAL credits
    with burden costs when you use this resource.

You can click the Burden
G/L Acct ID button to call up a table of available account
IDs.

11. Click the Other tab
    to view additional information.
12. If this resource reports
    to a higher-level resource, click the Automatic Reporting check box.

This is also known as "back flushing."

For example, if you are reporting pieces
complete at a higher level and you have defined lower levels as "

Automatic Reporting, "VISUAL also reports
quantities complete at the lower level operations. This feature has
limited implementation. VISUAL does not create Labor tickets for lower
level operations.

13. If you want VISUAL to
    schedule the resource "normally," select the Schedule Normally
    check box.

Select this check box if you want the Scheduler
to use the capacities established for this resource.

If you do not check this box, or if capacity
is set to zero, the Scheduler assumes that the resource has unlimited
capacity.

14. If the resource is a
    group resource, select the Schedule Members by Shift check box. Activated,
    VISUAL selects a group member resource to schedule for each shift.
    Each time VISUAL encounters a new shift during the scheduling
    process, a group member resource is selected (it may be the same
    or different member selected on the prior shift, depending upon
    availability of the group members.)

Disabled, VISUAL selects a group member
resource and schedules that member across shiftsthat
is, one group member is selected for the entire duration needed.

15. If you want VISUAL to
    be able to schedule operations that require this resource discontinuously,
    select the Schedule Discontinuous check box, then enter
    the minimum
    number of hours of run that should be scheduled in one segment.

The Concurrent Scheduler can schedule operations
"discontinuously," which allows you to complete operations
in "segments." See [Setting
Up Discontinuous Operations](Setting_Up_Discontinuous_Operations.htm).

16. Define the type of resource
    by selecting the appropriate radio button in the Type area:

Work Center - Use this type to define a resource
as a physical machine or work station.

Individual/Team
- Use this type to define a person, skill level, or team.

Contractor
- Use this type to identify the resource as an outside service. Selecting
this type disables the Cost and Burden Cost fields and enables the
Service ID field and other service related data.

Group
- This type defines the resource as part of a Group. This sets up
a work center as a group center. You can further define this group
using the Shop Groups command from the Edit
menu.

17. In the Capacity area, define a capacity
    for each shift.

Enter the maximum number of complete functions/processes
per shift that this resource can perform at one time. The maximum
number for this field is 254.

If left blank its assumed to be unlimited
capacity, with the limit of 254 concurrent unit. See *Setting
Concurrent Scheduler Preferences* for more information on
scheduling unlimited units of capacity to exceed the 254 unit threshold.

18. If you selected Group
    as the type of resource, select the proper Group
    Exclusivity button.

Group centers may have subordinate centers
that are scheduled inclusively or exclusively.

Schedule
All - Indicates that all members of the group are needed simultaneously
to accomplish any operation that references this resource.

Schedule
One - By default this is marked to Sched One. Select this to
have the Scheduler select only one resource to schedule a job.

19. If you are using DBR and want to monitor
    the planned load for this resource, select the Monitor Planned
    Load check box. Enter the Service Buffer and number of hours you
    want DBR to use when planning this resource.
20. Select the Obsolete check box
    if you no longer use this resource.

If you select this option, users can no
longer use the resource in Work Orders, Engineering Masters, and Quotes.

If the resource is used in an active operation
on a work order, you cannot mark the resource obsolete. If the resource
is used on any active Work Order, Engineering Master, or Quote, the
system warns you when you attempt to designate the resource obsolete.
You can choose to mark the part obsolete, or choose to keep the resource
active.

21. Click the Save
    button to save the new resource information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shop_Resource_Maintenance.htm) User-defined Help