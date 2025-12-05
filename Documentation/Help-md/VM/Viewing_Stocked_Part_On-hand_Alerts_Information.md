Viewing Stocked Part On-hand Alerts Information




# Viewing Stocked Part On-hand Alerts Information

This dialog box shows supply problems with stocked parts. Parts
are displayed in this table if their current stock level is less than
or equal to their top of yellow zone quantity. The top of yellow zone
quantity is the total of your top of red zone and the yellow zone.
You can also display parts that are over-stocked. An over-stocked
part is a part whose quantity exceeds the top of green zone.

To view this information:

1. If you are licensed
   to use multiple sites, in the Buffer Management window click the
   Site ID button and select the site
   whose buffer intrusions you want to view. If you are licensed
   to use a single site, this field is unavailable.
2. Select View,
   Stocked Part On-hand Alerts.
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

Include Overstock 
To include parts that are overstocked, click this check box. An overstocked
part has an on-hand quantity that exceeds the top of green level.
To exclude overstocked parts and view only those parts with stock
levels less than or equal to their top of yellow zone, clear this
check box.

Include Green Zone 
To include parts with on-hand buffer statuses in the green zone, select
this check box. To exclude parts with on-hand buffer statuses in the
green zone, clear this check box.

4. View this information
   in the table:

Part ID The
ID of the part is inserted.

On-hand Buffer Status 
The current on-hand buffer status is inserted. This column takes into
consideration only parts that are currently in your inventory. Parts
on order are ignored. This formula is used to calculate the current
on-hand buffer status: ((Replenishment level on-hand quantity) /
Replenishment level) \* 100. The cell is shaded in red if the calculated
buffer status falls into the on-hand red alert zone. If the buffer
status is in the red zone but not in the red alert zone, then the
part is considered to be in the yellow zone for this analysis. If
you are viewing overstocked parts, a negative number indicates that
the part is overstocked.

Fab  If
this part is a fabricated part, then this check box is selected. If
this part is not a fabricate part, then this check box is cleared.

Pur  if
this part is a purchased part, then this check box is selected. If
this part is not a purchased part, then this check box is cleared.

Quantity On-hand
The quantity of this part currently in your inventory is inserted.

Quantity On-order 
The quantity of this part currently on order during the planning lead-time
is inserted. The demand horizon is specified in Part Maintenance.

Quantity In-demand 
The current demand for this part during the planning lead-time is
inserted. The demand horizon is specified in Part Maintenance.

Avail. Buffer Status 
The available buffer status is calculated and inserted in this field.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

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

Planning Lead-time 
The number of days into the future that supply and demand is considered
for this analysis.

To view the information in the table as a graph, click Graph.

To export the information in the table to Microsoft Excel, click
Send to Excel.