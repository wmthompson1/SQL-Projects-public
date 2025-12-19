Planning Calendars




# Planning Calendars

Planning Calendars allow you to show supply and demand
for a specific Part ID in different sized buckets. You can only set
one calendar as "Current" at a given time; you can add virtually
unlimited calendars, however. Planning calendars feature:

* An Origin Date that VISUAL
  uses to calculate the three ranges.
* User definable ranges -
  the number of days and number of periods in each.

The size and number of periods in each range effect how VISUAL summarizes
supply and demand. For example, you may want to see 10 periods of
single, day-sized buckets, followed by 8 buckets of a weeks worth
of data, followed by 10, month-sized buckets. You can build many different
sized ranges and save each as a different calendar. Though it is important
to remember that calendars are NOT part specific. You can display
the same part using different calendars.

Demand fences and planning calendars work together and separately.
Changing a planning calendar does not change the demand fence (the
colored ranges and hence gross demand calculations). Changing the
planning calendars does affect the demand fence by adding or subtracting
buckets to a range. VISUAL evaluates each bucket to see which bucket
it is in. This is apparent for time buckets between the first and
second fence. For example, if the buckets are only a single day, and
for each day of a week there is a real demand quantity of 100, but
Friday has a forecast quantity of 800, the gross demand for Monday,
Tuesday, Wednesday, and Thursday is 100. On Friday, gross demand is
800. If you change the bucket size to 7 days (one week), gross demand
is only 800 - as it is greater than the 500 of real demand - for the
entire week.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.md) User-defined Help