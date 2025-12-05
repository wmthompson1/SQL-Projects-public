Setting Up Soft Allocations




# Setting Up Soft Allocations

Every time you run soft allocations, supply (work
orders and inventory) is matched up with demand (customer orders)
to determine throughput. Through the creation of soft allocations,
material and service cost data can be retrieved to subtract from selling
price data for each customer order line item.

Soft allocations, informal allocations matched to
supply and demand, are calculated on a schedule-byschedule basis.

You can execute soft allocations manually at any time.
From the Throughput Window select File,
Create Soft Allocations.

If you are licensed to use multiple sites, this procedure
sets up soft allocations for all of your sites.

To set up and schedule soft allocations:

1. From the Throughput
   Window, select File, Soft
   Allocation Setup.
2. Select the week days
   and specify the times when you want Soft Allocations executed.
   The Throughput Window needs to be running when the scheduled time
   occurs.
3. Select the Round
   Late Time If After check box and in the associated time
   field specify the cut-off time when the work order finish dates
   will be defined as being finished on the following day. For example,
   a work order is finished at 10:10:00 PM on Day 1, but the round
   late time if after is set to 10:00:00 PM. That work order will
   display as finished on Day 2.
4. Select the Work Order
   Cost Method. You can choose either:

Part Selling Price
- Select this option to use the selling price from Part Maintenance.

Projected/Unit Cost
- Select this option to use the projected cost of the work order.
If the projected cost is zero or the costing method is Standard, then
the part's costs from Part Maintenance is used.

5. Specify the percentage
   of Opportunity Lost Yield in the Customer
   Service Management section. The yield percentage specified relates
   to the opportunity lost reported in the Customer Service Impact
   data.
6. If you want to allocate
   linked orders first, select the Allocate Linked
   Orders First check box.

If you want to allocate unavailable inventory,
select the Allocate Unavailable Inventory
check box.

If you want to allocate on-hold inventory,
select the Allocate On-Hold Inventory check
box.

7. Specify the periods
   for Monthly Buckets, Weekly
   Buckets, and Daily Buckets. The
   buckets define how many months, weeks, and days to display in
   the graph.
8. If you want to view
   the status meter while soft allocations are calculated, select
   the Show Status Meter While Calculating
   check box.
9. If you want to display
   four auditng table windows during soft allocation generation,
   select the Show Audit Windows During Allocation
   Generation check box. When selected the four audit windows
   list demand, inventory supply, work order and purchase supply,
   and soft allocations. You can select site and schedule information
   from the Site and Schedule drop-down buttons within the audit
   windows.
10. Click Create.
11. Click Save
    to save any changes to the Soft Allocations Setup dialog.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Throughput_Window.htm) User-defined Help