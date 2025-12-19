Setting Resource Calendar Exceptions




# Setting Resource Calendar Exceptions

In some instances a resource may not be available
as defined by the weekly calendar. In these cases, you can define
an exception for the resource. For example, if a resource is not available
for use during a plant shut down or on holidays, use the exception
table to define these dates. Resource calendar exceptions allows specification
of alternate availability AND capacity by date.

You can express any dimension of capacity for a resource through
the Resource Calendar Exceptions selection
from the Edit menu. It is similar to the
Calendar Exceptions selection under the
Maintain menu of Application Global Maintenance.
The difference is that entries here can apply to one or all schedules
and one or all resources. Changing the calendar exceptions that apply
to \*\*All\*\* Resources and \*\*All\*\* Schedules is, in fact, changing the
schedule exceptions from Calendar Exceptions from Application Global
Maintenance.

When VISUAL needs to know the capacity in a schedule for a given
date at a given resource, it first looks for a calendar exception
specifically referencing that Resource ID and that Schedule ID. If
it does not find such an exception, it looks for a calendar exception
specifically referencing \*\*All\*\* resources and that specific Schedule
ID.

If it does not find such an exception, it looks for a calendar exception
specifically referencing \*\*All\*\* schedules and that specific Resource
ID.

If it does not find such an exception, it looks for a calendar exception
specifically referencing \*\*All\*\* schedules and \*\*All\*\* resources.

If it does not find such an exception, VISUAL looks for a calendar
which specifically references that Schedule ID and that Resource ID.

If VISUAL does not find such a calendar, it looks for a calendar
that specifically references that Schedule ID and \*\*All\*\* Resources.

If it does not find such a calendar, VISUAL looks for a calendar
that specifically references that Resource ID and \*\*All\*\* Schedules.

If VISUAL does not find such a calendar, it looks for at the Global
Calendar.

## The order of precedence is:

1. Exception for Specific
   Schedule, Specific Resource
2. Exception for Specific
   Schedule, \*\*All\*\* Resources
3. Exception for \*\*All\*\*
   Schedules, Specific Resource
4. Exception for \*\*All\*\*
   Schedules, \*\*All\*\* Resource
5. Calendar for Specific
   Schedule, Specific Resource
6. Calendar for Specific
   Schedule, \*\*All\*\* Resources
7. Calendar for \*\*All\*\*
   Schedules, Specific Resource
8. Calendar for \*\*All\*\*
   Schedules, \*\*All\*\* Resource

## To set resource calendar exceptions:

1. Choose the resource
   to set the exception for and select Resource
   Calendar Exceptions from the Edit
   menu.

The Calendar Exception dialog box appears.

By default, \*\*All\*\* appears in the Schedule
ID field, indicating that all schedules are affected.

2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site that contains the schedule to which to apply exceptions.
   If you select \*\*All\*\* the default calendar exceptions defined
   in Application Global Maintenance are displayed. You cannot change
   the default calendar exceptions in this dialog box.
3. If you are licensed
   to use a single site, this field is not available.
4. If the exception is
   to affect only one schedule, pull down the Schedule ID menu and
   select the appropriate Schedule ID.
5. Click the Insert
   button.

A blank line appears at the end of the current
exceptions.

6. Enter the start date
   and end date for the exception. For example if the resource will
   not be available on the 25th of December 2001, enter 12/25/2001
   for the start and end date.
7. Enter the 1st shift
   start time and the shift duration for the exception.

If the resource is not to be operated during
the shift, enter zero (0) for the duration. You must enter a start
time for the exception, whether all shifts are zero or not. The Scheduler
uses the information you enter here to adjust the normal weekly calendar
setting for the date of the exception, thereby giving an accurate
estimation of resource availability.

8. Enter the duration (time)
   and capacity (number of simultaneous operations) for each shift.
   The capacity columns are disabled when editing for \*\*All\*\* resources.
9. Click the Save
   button to save the changes.

Your changes will take effect the next time
you run the [Concurrent Scheduler](VMGLBSCHWhat.md).

10. Click the Close
    button to return to the Shop Resource Maintenance window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shop_Resource_Maintenance.md) User-defined Help