Setting Up a Calendar to Apply to All Resources of a Specific Schedule




# Setting Up a Calendar to Apply to All Resources of a Specific Schedule

1. Select Weekly
   Calendars from the File menu.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site for which you want to set up a calendar for all resources.
   If you are licensed to use a single site, this field is unavailable.
3. Select the desired Schedule
   ID, and leave Resource ID set to \*\*All\*\*.

To setup a calendar specific to a resource,
but for all schedules, leave Schedule ID set to \*\*All\*\*, and set the
Resource ID for the desired resource.

At any point, the Scheduler is scheduling a specific resource for
a specific schedule. It searches for the calendar in the following
order:

1. Look for a calendar
   specific to the schedule and the resource.
2. If not found, look for
   a calendar specific to the resource, but for all schedules.
3. If not found, look for
   a calendar specific to the schedule, but for all resources.
4. If not found, use the
   calendar for all resources and schedules, which must be defined.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help