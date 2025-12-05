Viewing Stocked Parts Projected Buffer Alerts




# Viewing Stocked Parts Projected Buffer Alerts

This dialog box shows potential supply problems with stocked parts.
Parts are displayed in this table if their current stock level is
less than or equal to the alert buffer status. This calculation is
used to calculate the alert buffer status: (replenishment level -
(replenishment level \* yellow stock percent / 100)) / replenishment
level \* 100.

In this analysis, the actual average daily usage for a part is used
to calculate anticipated use during the planning lead-time period.

To view this information:

1. If
   you are licensed to use multiple sites, in the Buffer Management
   window click the Site ID button
   and select the site whose buffer intrusions you want to view.
   If you are licensed to use a single site, this field is unavailable.
2. Select View,
   Stocked Part Projected On-hand Alerts.
3. Specify the information
   to view in the analysis. Specify this information:

Warehouse ID 
This field is displayed only if you plan by warehouse. To view information
for a particular independently planned warehouse, specify the warehouse
in this field. To view information for your universally planned warehouses,
specify Universal. To view information for all warehouses, specify
All Warehouses.

Part Type 
Under the warehouse ID field, specify the type of part to view in
the analysis. To view fabricated parts only, click Fabricated. To
view purchased parts only, click Purchased. To view all parts, click
All.

Include Projected Overstock 
To include parts that are projected to be overstocked, click this
check box. An overstocked part has an on-hand quantity that exceeds
the top of green level. To exclude projected overstocked parts and
view only those parts with projected stock levels less than or equal
to their top of yellow zone, clear this check box.

Include Projected Green
Zone  To include parts with projected on-hand buffer
statuses in the green zone, select this check box. To exclude parts
with projected on-hand buffer statuses in the green zone, clear this
check box. Parts in the green zone are not presenting supply issues.

4. View this information
   in the table:

Part ID The
ID of the part is inserted.

Avail. Buffer Status 
The available buffer status is calculated and inserted in this field.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

Status Comment
If a projected buffer issue exists, a description of the problem
is inserted. These messages are used:

* Stock out
  in # days, where # is the number of days from the current date
  when stock out is projected to occur.
* Stock out
  w/demand in # days, where # is the number of days from the current
  date when stock out is projected to occur.
* % buffer status
  in # days, where % is the buffer status and # is the number of
  days from the current date when this buffer status is projected
  to occur.

Fab  If
this part is a fabricated part, then this check box is selected. If
this part is not a fabricate part, then this check box is cleared.

Pur  if
this part is a purchased part, then this check box is selected. If
this part is not a purchased part, then this check box is cleared.

Planning Lead-time 
The number of days into the future that supply and demand is considered
for this analysis.

Quantity On-hand
The quantity of this part currently in your inventory is inserted.

Quantity In-demand Over
Lead Time  The current demand for this part during the
planning lead-time is inserted. The demand horizon is specified in
Part Maintenance.

Average Daily Usage 
The average daily usage of this part is inserted. This value is calculated
by identifying the quantity of this part issued during the average
daily usage horizon, and then dividing the quantity by the average
daily usage horizon. The average daily usage horizon is specified
in Part Maintenance.

Avg. Daily Usage Over
Lead-time  The average daily usage of this part is multiplied
by the planning lead-time to calculate the anticipated average daily
usage of this part.

Quantity On-order 
The quantity of this part currently on order during the planning lead-time
is inserted. The demand horizon is specified in Part Maintenance.

Planning Horizon End
Date  The last date used to find supply and demand for
this part. The planning lead-time value is added to the current date
to calculate this value.

Low Red Zone 
The buffer status that defines the bottom of the red zone is inserted.

Low Yellow Zone 
The buffer status that defines the bottom of the yellow zone is inserted.

Low Alert Status
The buffer status that defines the bottom of the red alert zone
is inserted.

To view the information in the table as a graph, click Graph.

To export the information in the table to Microsoft Excel, click
Send to Excel.

## Viewing Part Planning Information

To view the planning information for a part in either the Stocked
Part On-hand Alerts dialog or the Stocked Part Projected On-hand Alerts
dialog, double-click the parts line in the dialog box.

To determine the information to display in the table, specify these
options:

Planning Horizon  The planning horizon
value from the on-hand alerts dialog is inserted. You can specify
a different end date.

Net Available Quantity  To net this
part based on available quantity, select this check box. Available
quantity is the quantity on-hand minus any quantity allocated to a
demand order. To net this part based on on-hand quantity, clear this
check box.

Deduct Safety Stock  To deduct the
safety stock quantity defined for the part from the available quantity,
select this check box. To include the safety stock in the available
quantity, clear this check box.

Include Planned Orders  To include
planned orders generated by the DBR scheduler, select this check box.
To omit planned orders, clear this check box.

Show Detail Quantity  To include
detailed quantity information, select this check box. When you select
this check box, these columns are displayed:

* Total Qty Required
* Qty Issued
* Qty Ordered
* Qty Received

To include summary quantity information only, clear this check box.

Show Unreleased  To include unreleased
orders in the material netting calculation, select this check box.
To omit unreleased orders in the material netting calculation, clear
this check box.

Show Firmed  To include firmed orders
in the material netting calculation, select this check box. To omit
firmed orders in the material netting calculation, clear this check
box.

Show On-hold  To include on-hold
orders in the material netting calculation, select this check box.
To omit on-hold orders in the material netting calculation, clear
this check box.

View this information in the table:

Demand Warehouse  If a warehouse
is associated with the demand order, the warehouse ID is inserted.

Date Required The date that the demand
is required to be met is inserted.

Total Qty Required The total quantity
of part required on the demand order is inserted.

Qty Issued The total quantity of part
that has been issued to meet the demand is inserted.

Qty Required  The remaining quantity
required by the demand. This is equal to the total quantity required
minus the quantity issued.

Stat The status of the demand order
is inserted. These statuses are used:

R The order is
released.

F The order
is firmed.

U The order
is unreleased.

O The order
is on hold.

Peg To  The ID of the demand order
is inserted. To open the demand order, double-click in the Peg To
field.

Demand Dimensional Info  If the
part is a dimensional part, the dimensions from the demand order are
inserted.

Required WBS  If you are licensed
to use Project/A&D, the WBS code associated with the demand order
is inserted.

Projected Quantity  The projected
quantity for the line is inserted. This is the projected on-hand quantity
after a supply order has been received and the demand order has consumed
its requirement from the supply order and any existing on-hand balance.

Supply Warehouse If the supply order
is associated with a particular warehouse, the warehouse ID is inserted.

Qty Ordered The quantity of the supply
order is inserted.

Qty Received The quantity of the supply
order received is inserted.

Net Due Qty The remaining quantity of
the supply order that is due to be received is inserted.

Due Date The date that the supply order
is due to be received is inserted.

Rls Date The date the supply order was
released is inserted.

Stat  The status of the supply order
is inserted. These statuses are used:

R The order is
released.

F The order
is firmed.

U The order
is unreleased.

O The order
is on hold.

Issue Late  If the supply should
have already been issued, the number of days ago that the supply should
have been issued is inserted.

Ord Late If the supply order is late,
the number of days late is inserted.

Rls Late If the release of the order
is late, the number of days late is inserted.

Sugg Rls Late If the suggested release
date is in the past, the number of days late is inserted.

Ord Proj Early  If the supply order
is scheduled to be complete earlier than its due date, the number
of days early is inserted.

Ord Proj Late  If the supply order
is scheduled to be complete later than its due date, the number of
days late is inserted.

Stock Out If demand is greater than
supply, the quantity of demand in excess of supply is inserted.

Over Stock If supply is greater than
demand, the quantity of supply in excess of demand is inserted.

Exception If a material netting issue
exists, a description of the issue is inserted.

Suggested Release The suggested release
date of the supply order is inserted.

Sched Start The date that the supply
order is scheduled to start is inserted.

Sched Finish The date that the supply
order is scheduled to be complete is inserted.

Supply Dimensional Info  If the
part is a dimensional part, the dimensions from the supply order are
inserted.

Due WBS  If you are licensed to
use Project/A&D, the WBS code associated with the supply order
is inserted.

Rls Near If the orders release date
is in the near future, this check box is selected.

Sugg Rls Near If the suggested release
date is in the near future, this check box is selected.

To export the information in the window to Microsoft Excel, click
Send to Excel.