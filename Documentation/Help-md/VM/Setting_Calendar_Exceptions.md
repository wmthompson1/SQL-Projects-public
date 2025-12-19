Setting Calendar Exceptions




# Setting Calendar Exceptions

Use the calendar exceptions option to set calendar
exceptions for all schedules, all resources, or for specific schedules
and resources.

A calendar exception is a holiday, planned shutdown, or other interruption
of capacity that does not occur at regular, recurring times. If the
capacity you are defining occurs in a cyclical manner (i.e. weekly),
you should define it as a function of the weekly calendar, as discussed
in the previous section.

1. Select Calendar
   Exception... from the File menu
   of the Global Scheduler.

The Calendar Exception dialog box appears.
By default, the Schedule ID and Resource ID fields default to \*\*All\*\*.

2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site for which you are setting up a calendar exception. If you
   are licensed to use a single site, this field is unavailable.
3. From the Schedule ID
   drop down box, select the schedule for which you want to establish
   the calendar. If the exception is to affect only one resource,
   select the appropriate Resource ID from the drop down box.

If no weekly calendar exceptions have been
set for this schedule, the calendar exceptions box is blank.

4. Click the Insert
   button to add an exception to the calendar.

A blank line appears at the end of the current
exceptions.

5. Enter the start date
   and end date for the exception. For example, if the resource will
   not be available on the 25th of December, enter 12/25/2001 for
   the start and end date.
6. Enter the 1st shift
   start time and the shift duration for the exception. If the resource
   is not to be operated during the shift, enter zero (0).

The Scheduler uses the information you enter
here to adjust the normal weekly calendar setting for the date of
the exception, thereby giving an accurate estimation of resource availability.

You can edit any field by clicking in the
desired field and making the change.

You may either increase or decrease the
shift duration for a given period of time. For instance, if you are
going to work a half day on a Saturday, specify that for the given
date by entering 8/5/96 for the date, 8AM for the start time, and
4 hours for the first shift duration.

If the user specifies a particular resource
whose calendar is to be affected, three additional columns appear.
They are capacity, in terms of machines or individuals, for each shift.
This allows the user to override (e.g. increase or decrease) the capacity
of the particular resource during the period specified.

7. Click the Save
   button to save your calendar exceptions.

To delete an exception, highlight the exception
line and click the Delete button.

An X appears to the left of a deleted exception
line. The exception is deleted when you click the Save
button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.md) User-defined Help