Setting Work Order Priorities




# Setting Work Order Priorities

This option gives you the ability to set the priority
(global rank) of firmed and released work orders. You can also reset
the priority of these work orders by Want Date. By setting priorities,
those work orders that you want to have first opportunity at shop
resources are scheduled first, with all remaining orders scheduled
around them.

1. Choose Work
   Order Priority from the File menu of the Global Scheduler.

The Work Order Priority dialog box appears.
If you are licensed to use multiple sites, the table shows only the
work orders created in the site associated with the schedule you selected.
If you are licensed to use multiple sites, the table shows all work
orders eligible to be scheduled.

2. Move to the Priority
   (Rank) field and enter the rank for this work order.

To browse work orders, click the Search
button.

The system automatically assigns a rank
of 50. You can edit this value. The highest priority is 0. You may
enter any two-digit number.

To have the system set the priority according
to want date, click the Reset priority by Want
Date button.

This reverts all priorities back to 50.

3. Click the Save
   button to save the work order priority.

You should adjust work order priority only
on an exception basis. If the want date is not sufficient to indicate
the relative priority of the work order, then use priority to increase
the work orders chance at receiving available capacity. You may need
to give a particular work order a higher priority in the following
situations:

1. It is for your most important customer.
2. It has an undependable estimated
   time and may take longer than expected.
3. Its total production time is longer
   than your usual work order, and competes with shorter leadtime
   orders for the same want date.

There are also reasons you may want to reduce
a work orders priority. These decisions are generally unique to your
business. In summary, the Global Scheduler does everything it can
with the existing information to produce an appropriate schedule.
When you know about external factors that affect the schedule, priority
is your tool to adjust how the Scheduler treats work orders.

A suggested method of assigning priorities
is to pick 0 for your highest priority, and then 10, 20, 30, and 40
for groups of orders that have varying levels of priority that are
less than the highest priority orders, but greater than the lowest
(remember, 50 is the default). You can then use these as standard
priority "buckets." You should not attempt to assign individual
priorities on an order-by-order basis you will essentially be trying
to do one of the Schedulers jobs. Instead, use priority to handle
the special cases.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help