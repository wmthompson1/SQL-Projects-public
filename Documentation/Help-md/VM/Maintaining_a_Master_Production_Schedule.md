Maintaining a Master Production Schedule




# Maintaining a Master Production Schedule

The Master Production Schedule specifies actual quantities
and due dates for production. MRP transforms these quantities into
planned orders.

The following information applies to schedule entries:

Forecast Date - The date on which you
plan on receiving the part.

Forecast Quantity - The quantity of the
part that you plan on receiving.

Required Quantity - The total requirements
for all demand orders with required dates within the period. This
only appears on forecast lines.

Schedule Date - A date for a scheduled
supply order to be completed. MRP uses this as the Due Date when creating
a planned order to meet this schedule.

Day of Week - This displays the day of
the week for the Schedule Date, for reference purposes.

Schedule Quantity - The quantity of the
part scheduled to be completed on the Schedule Date.

Order Quantity - The total of existing
supply orders for the part scheduled to come due in the period defined
by the Schedule Date and the next Schedule Date or Forecast Date.

Available to Promise - This is the Schedule
Quantity minus the Required Quantity. This specifies how much of the
scheduled order is still available to be promised for other demand
orders.

Cumulative ATP - This is a netting of
the customer demand for a part versus the master schedule.

Firm - A Yes appears when the planned
order corresponding to the master schedule period is firmed into a
work order or purchase order. This prevents any older master schedules
from reappearing.

You can define and maintain the Master Production Schedule by three
methods. Note that a forecast is not required to maintain a Master
Production Schedule.

## Copying Forecasts

Click the Copy Forecast button to copy
all Forecast Dates and Forecast Quantities to Schedule Date and Scheduled
Quantity. This produces a production plan where the total quantity
due in a period is scheduled to be completed on the first day of the
period.

## Manually Inserting and Editing Lines

You may wish to use different Scheduled Dates than the forecast,
or to schedule multiple quantities within a forecast period. You may
not be using a forecast at all.

To insert a schedule line:

1. If you are licensed
   to use multiple sites, in the Material Planning Window click the
   Site ID arrow and select the site ID to use. If you are licensed
   to use a single site, this field is unavailable.
2. Select Master
   Production Schedule from the File
   menu.

The Master Production Schedule dialog box
appears.

3. Click the Insert
   button.

A new line appears at to the bottom of the
table.

4. Enter the schedule date
   for which you are scheduling a quantity to be delivered.

The day of week appears for the schedule
date.

5. Click the Save
   button.

All Forecast and Schedule entries appear
in date order. This presents a list of forecast periods, inside of
which can be one or more scheduled orders. Order Quantity is always
the quantity scheduled to come due between the date on the current
line, and the next line, whether the dates are Forecast Dates or Schedule
Dates.

You can also enter a Schedule Date and Quantity
for an existing forecast line. If the Schedule Date you enter is different
from the Forecast Date, then when you click the Save button, VISUAL
creates a new line for the schedule entry.

## Auto Filling Schedule Entries

Use Auto Fill for schedule entries in the exact same way as for
forecast entries. Select the Schedule radio button instead of Forecast.
Schedule Date and Schedule Quantity fill in automatically.

Click the Save button to save the changes
to the Master Production Schedule.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information