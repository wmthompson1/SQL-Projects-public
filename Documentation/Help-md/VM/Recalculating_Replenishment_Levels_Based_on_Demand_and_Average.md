Recalculating Replenishment Levels Based on Demand and Average Daily Usage




# Recalculating Replenishment Levels Based on Demand and Average Daily Usage

Use the Demand-driven Buffer Analysis dialog to recalculate replenishment
levels based on demand for the part. You can generate new replenishment
levels based on actual usage of the part, or manually specify new
data to use to calculate replenishment levels.

Demand-driven stocked part analysis examines actual usage of a part
during the average daily usage horizon. Any part issued in conjunction
with a customer order or a work order is identified as demand. The
total demand is divided by the average daily usage horizon to determine
the average daily usage. The average daily usage is then used to calculate
a new replenishment level and new emergency stock and yellow stock
percentages.

You can override the system-calculated average daily usage and replenishment
level (top of green). If you specify your own values for these fields,
the emergency stock and yellow stock percentages are calculated for
you.

To calculate replenishment levels and buffer zones:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site that contains the parts to use in the replenishment analysis
   and recalculation. If you are licensed to use a single site, this
   field is unavailable.
3. Select Maintain,
   Demand-driven Stocked Part Analysis.
4. To determine the information
   displayed in the table, specify this information:

Warehouse ID 
If you are planning by independent warehouse, specify the warehouse
to use in the analysis. To analyze your universally planned warehouses,
specify Universal.

Show Current Replenishment
Levels  To show the current replenishment levels for
the parts as specified on the DBR tab, select this check box. If you
do not want to view replenishment levels from the DBR tab, clear this
check box.

Show Changes Only 
This check box is a available if you have edited any of the lines
and have not yet saved your changes. To display only the lines you
have edited, select this check box. To display all lines, clear this
check box.

End Date 
Specify the end date to use when identifying demand. The end date
is used in conjunction with the Average Daily Usage Horizon to calculate
the range of days to use to find demand.

Exception Processing
Specify the settings to use for exception processing. Select from
these options:

Current Replenishment
On-hand Alerts  To display parts that currently have
on-hand replenishment alerts, select this check box. To display parts
both with and without alerts, clear this check box.

Projected Replenishment
On-hand Alerts  To display parts that are projected to
have replenishment alerts, select this check box. To display parts
both with and without projected alerts, clear this check box.

New Replenishment Oh-hand
Alerts  This check box is available only if you have
edited any of the lines in the table and have not yet saved your changes.
To display parts that would currently have on-hand replenishment alerts
based on your new replenishment settings, select this check box. To
display part both with and without alerts, clear this check box.

New Projected Replenishment
On-hand Alerts  This check box is available only if you
have edited any of the lines in the table and have not yet saved your
changes. To display parts that are projected to have on-hand alerts
based on the new replenishment levels, select this check box. To display
parts both with and without projected alerts, clear this check box.

Fabricated/Purchased/All 
Under the table, select the type of part to display in the table.
Click Fabricated to view fabricated parts only. Click Purchased to
view purchased parts only. Click All to view both fabricated and purchased
parts.

5. This information is
   displayed in the table:

Part ID The
ID of the part is displayed.

Description
The description of the part is displayed.

Commodity Code
The commodity code specified for the part is displayed.

Product Code
The product code specified for this part is displayed.

Fab If the part
is a fabricated part, this check box is selected.

Pur If the part
is a purchased part, this check box is selected.

ADU Horizon (in Days)
The average daily usage horizon specified for the part is displayed.

Start Date 
The first date used to find demand is inserted. The start date is
calculated by subtracting the ADU Horizon from the end date. The ADU
Horizon is expressed in working days. When the start date is calculated,
any non-work days, such as weekends that have no shifts scheduled,
are ignored.

Lead Time Buffer (in
days) The lead time buffer you specified for the part in
Part Maintenance is divided by 24 to determine the lead time buffer
in days.

Current Replenishment
Level = Top of Green  The current replenishment level
specified for the part is displayed. This value is equal to the top
of green value. The top of green should equal the sum of the green
zone, the yellow zone, and the red zone.

Total Usage Since Start
Date  The total number of parts issued since the start
date is displayed. Parts can be issued to work orders or in conjunction
with customer orders.

Average Daily Usage 
To calculate this value, the total usage is divided by the ADU Horizon
value.

Minimum Order Qty
The minimum quantity you can order for this part is displayed.

Buffer Profile ID 
The buffer profile ID specified for this part is displayed.

MOQ Green 
If this check box is selected, then the significant minimum order
quantity specified for the part in the Buffer Profile is used to calculate
the green zone quantity. If this check box is cleared, then no minimum
order quantities affect the green zone. If the part is not assigned
to a buffer profile, then this check box is selected.

Green Impact % 
The green impact percentage specified in the buffer profile is displayed.
If this part is not assigned to a buffer profile, then a value of
50 is entered. This value is used to calculate the green zone. The
green impact percentage is multiplied by the size of the yellow zone
to calculate the green zone.

Red Impact % 
The red impact percentage specified in the buffer profile is displayed.
If this part is not assigned to a buffer profile, then a value of
50 is entered. This value is used to calculate the red zone base.
The red impact percentage is multiplied by the size of the yellow
zone to calculate the red zone base.

Var. Red Safety % 
The variability red safety percentage specified in the buffer profile
is displayed. If this part is not assigned to a buffer profile, then
a value of 50 is entered. This value is used to calculate the red
safety sub-zone. The red impact percentage is multiplied by the size
of the red zone base to calculate the red safety sub-zone.

Curr. Green Zone Size
The current green zone is displayed. The current green zone is calculate
by multiplying the green impact percentage by the current yellow zone.

Curr. Top of Red = Red
Zone Size  The current top of red, which is the same
as the red zone size, is displayed. This formula is used to calculate
the top of red size: current replenishment level - (current replenishment
level \* (100 emergency stock percent)/100).

Curr Size of Red Zone
Base  The current red zone base is displayed. This value
is calculated by multiplying the red impact percentage by the current
yellow zone.

Current Size of Red Safety 
The current red safety size is displayed. This formula is used to
calculate the current size of red safety: current top of red / (1
+ (100 / variability red safety percent)).

Current Top of Yellow 
The current top of yellow is displayed. This formula is used to calculate
the current top of yellow: current replenishment level (current
replenishment level \* (100 yellow stock percent) / 100).

Current Yellow Zone Size 
The current yellow zone size is displayed. This formula is used to
calculate the current yellow zone size: top of yellow top of red.

Current On-hand Buffer
Status  The current on-hand buffer status is displayed.
This formula is used to calculate the current on-hand buffer status:
((Replenishment level on-hand quantity) / Replenishment level) \*
100.

Demand Horizon (in Days)
The demand horizon specified for this part is displayed.

Quantity On Hand
The number of units currently in stock is displayed.

Quantity In Demand Over
Leadtime  The number of units of this part in demand
during the demand horizon.

Quantity On Order Over
Leadtime  The number of units of this part on order during
the demand horizon.

Current Avail. Buffer
Status  The current available buffer status is displayed.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

Demand Horizon End Date 
The end date of the range used to examine demand is displayed. This
date is determined by adding the demand horizon to the date specified
in the End Date field in Usage Selection Options section. Unlike the
average daily usage horizon, the demand horizon does not consider
the work schedule. For example, if the end date in the Usage Selection
field is 6/15/2013 and the demand horizon is 10, then the Demand Horizon
End Date is 6/24/2013, or 10 days from 6/15/2013, inclusive.

Current Low Red Status 
The lowest buffer status value that is in the red zone is displayed.

Current Low Yellow Status
The lowest buffer status value that is in the yellow zone is displayed.

Current Low Alert Status 
The lowest buffer status value that triggers an alert is displayed.

Current Emergency Stock
%  The current emergency stock percentage specified on
the part record is displayed.

Current Yellow Stock
%  The current yellow stock percentage specified on the
part record is displayed.

6. Calculate the new replenishment
   level and buffers. To calculate the new level, perform one of
   these steps:
7. To calculate
   the new replenishment level and buffers based on actual demand,
   select the part lines and click Recalc Selected
   Parts. The new replenishment level and associated buffers
   are calculated. To indicated that the new replenishment level
   and buffers are based on actual demand, Issue History is displayed
   in the New Replenishment Level Based On column.
8. To manually
   specify a new replenishment level, specify the new level in the
   New Level = Top of Green field. To indicate that the new replenishment
   level and buffers are based on a manually specified replenishment
   level, Manual Replenish is displayed in the New Replenishment
   Level Based On column.
9. To calculate
   a new replenishment level based on a manually specified average
   daily usage, specify the new average daily usage in the New Daily
   Usage field. To indicate that the new replenishment level and
   buffers are based on a manually specified average daily usage,
   Manual Daily USage is displayed in the new Replenishment Based
   On column.

7. After the new replenishment
   level is calculated or manually specified, new buffer information
   is calculated for the part. The formulas used for the new buffers
   are the same as the formulas used for the existing buffers, except
   that the new replenishment level is used in the calculations instead.
   These information is calculated:
8. New Replenishment
   Level = Top of Green (If you generated the replenishment level
   based on actual demand or based on a manually specified average
   daily usage, the new replenishment level is inserted.)
9. New Daily
   Usage (If you generated the replenishment level based on actual
   demand or based on a manually specified replenishment level, the
   new replenishment level is inserted.)
10. New Green
    Zone Size
11. New Top of
    Red = Red Zone
12. New Size of
    Red Zone Base
13. New Size of
    Red Safety
14. New Top of
    Yellow
15. New Yellow
    Zone Size
16. New On-hand
    Buffer Status
17. New Avail.
    Buffer Status
18. New Low Red
    Status
19. New
    Low Yellow Status
20. New Low Alert
    Status
21. New
    Emergency Stock %
22. New Yellow
    Stock %.

8. To use the new replenishment
   level and buffer zones, click the Save button.
   On the DBR tab for the parts you updated, the new Replenishment
   Level, Emergency Stock %, Yellow Stock %, and On-hand Emergency
   % are inserted. To retain your current replenishment level and
   buffer settings, close the dialog without clicking Save.