Creating Master Production Schedules in Advanced Planning Mode




# Creating Master Production Schedules in Advanced Planning Mode

Master Production Schedules have two main uses:

Setting and maintaining a forecast of demand for the current part.

Setting and maintaining the parts master production schedule for
MRP to use when generating planned orders.

To perform both of these functions, use the Master Production Schedule
dialog box.

If you are licensed to use multiple sites, set up master production
schedules on a site-by-site basis. If you are licensed to use a single
site, set up master schedules on an enterprise-wide basis.

If the Order Policy for this Part ID is not Master Schedule, you
are warned before you can continue. You can set up a forecast and
master production schedule for any part, but planned orders are generated
only if the parts order policy is Master Schedule. Set order policies
for parts in Part Maintenance.

You can define master schedules for individual parts and for individual
customers.

To set up a master production schedule:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site ID to use in the forecast. If you are
   licensed to use a single site, this field is unavailable.
2. Select File,
   Master Production Schedule.
3. In the Part Type section,
   select which type of part to view. To view real parts, click the
   Real option. To view parts you set up in Planning Bill of Materials,
   click the Planned option.
4. In the Part ID field,
   click the browse button and select the part for which you are
   defining the master production schedule. If you selected Real
   in the Part Type section, the browse table displays the master
   scheduled parts in your database only. If you selected Planned,
   the browse table displays the parts you set up in Planning Bill
   of Materials. If you are licensed to use multiple sites, both
   browses are filtered to show only parts that belong to the selected
   site.
5. In the Warehouse ID
   field, click the arrow to select the warehouse to use in the plan.
   The drop-down list displays all independently planned warehouses.
   Select an independently planned warehouse, or select Universal
   to create the schedule for all universally planned warehouses.
6. In the Period Want Day
   field, specify the day in the period to use as the want date on
   planned orders. You cannot specify a value greater than the length
   of the planning period. If you use different period lengths for
   each range in your planning calendar, then the value you specify
   in this field cannot be greater than the shortest period.

For example, presume your planning periods
are each 14 days long and you specified 3 in the Period Want Day field.
If the first planning period began on September 1, then the want date
for planned orders during the period would be September 3. If the
period began on September 29th, then the want date for planned orders
during the period would be October 1, the third day in the planning
period.

7. The table displays the
   current Master Production Schedule, any Part Forecasts you set
   up, and the current actual demand. To create the current MPS,
   click in a cell in the Current MPS line and specify the quantity
   of part to order. You can also edit the part forecasts by clicking
   in the cells in a part forecast line and changing the quantity.
8. Click Save.