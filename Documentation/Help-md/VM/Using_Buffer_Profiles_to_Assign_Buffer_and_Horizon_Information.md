Using Buffer Profiles to Assign Buffer and Horizon Information




# Using Buffer Profiles to Assign Buffer and Horizon Information

Use the Buffer Profile Parts dialog box to assign buffer and horizon
information to multiple parts at the same time. You can assign this
information:

* Buffer Profile ID
* Lead-time Buffer
* Demand Horizon

## Assigning a Buffer Profile ID to Multiple Parts

To assign a buffer profile ID to multiple parts:

1. Select Inventory,
   Part Maintenance.
2. Select Maintain,
   Buffer Profile IDs.
3. Click View
   Profile Parts.
4. In the Assign to Parts
   section, select Assign Buffer Profile.
5. Specify the parts to
   display in the table. Specify this information:

Site ID Specify
the site whose parts you want to display in the table.

Warehouse ID 
This field is available only if the site you selected plans by independently
planned warehouses. Specify the warehouse whose parts you want to
display in the table. To display the parts in your universally planned
warehouses, select Universal. If the site you selected does not plan
by independently planned warehouses, then this field is unavailable.

Show Parts with Profile 
To display only parts with no buffer profile ID assigned, clear this
check box. to display all parts, clear this check box.

Fabricated/Purchase/All 
Select the type of parts to display in the table. Click Fabricated
to display fabricated parts only. Click Purchase to display purchased
parts only. Click All to display parts of both types.

6. Select the information
   about the parts to view in the table. Specify these settings:

Show Changes Only 
This check box is a available if you have edited any of the lines
and have not yet saved your changes. To display only the lines you
have edited, select this check box. To display all lines, clear this
check box.

Show Current Values 
Selecting or clearing this check box has no impact on the information
displayed in the table.

Show Zone Details 
To display information about the red, yellow, and green zones, select
this check box. When you select this check box, the current and new
green zone size, the current and new top of red zone, the current
and new red zone base, the current and new size of red safety, the
current and new top of yellow, and the current and new yellow zone
size are displayed.

Show Status Details 
To display information about buffer statuses based on your current
supply and demand, select this check box. When you select this check
box, the quantity on hand, quantity in demand over horizon, quantity
on order over horizon, current available buffer status, current and
new low red status, current and new low yellow status, current and
new low alert status, current and new on-hand alert status level,
and current on-hand alert red percentage are displayed.

7. Depending on your selections
   in the Display Options section, this information is displayed:

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

Current Demand Horizon 
The current demand horizon specified for the part is displayed.

Current Demand Horizon
End Date  The end date of the range used to examine demand
is displayed. This date is determined by adding the demand horizon
to the current date. The demand horizon does not consider the work
schedule. For example, if the current date is 6/15/2013 and the demand
horizon is 10, then the Demand Horizon End Date is 6/24/2013, or 10
days from 6/15/2013, inclusive.

ADU Horizon (in Days)
The average daily usage horizon specified for the part is displayed.

Current Leadtime Buffer
(in days)  The lead time buffer you specified for the
part in Part Maintenance is divided by 24 to determine the lead time
buffer in days.

Minimum Leadtime
The minimum leadtime specified for the part is displayed.

Current Replenishment
Level = Top of Green  The current replenishment level
specified for the part is displayed. This value is equal to the top
of green value. The top of green should equal the sum of the green
zone, the yellow zone, and the red zone.

Current Emergency Stock
%  The current emergency stock percentage specified on
the part record is displayed.

New Emergency Stock % 
The new emergency stock percentage based on the profile you applied
is displayed.

Current Yellow Stock
%  The current yellow stock percentage specified on the
part record is displayed.

New Yellow Stock % 
The new yellow stock percentage based on the profile you applied is
displayed.

Minimum Order Qty 
The minimum order quantity specified for the part on the part record
is displayed.

Multiple Order Qty 
The multiple in which you purchase or manufacture this part is displayed.
This information is specified on the part record.

Maximum Order Qty 
The maximum order quantity specified for the part on the part record
is displayed.

Curr. Green Zone Size
The current green zone is displayed. The current green zone is calculate
by multiplying the green impact percentage by the current yellow zone.

New Green Zone Size
The new green zone is calculated based on the profile you applied.

Curr. Top of Red = Red
Zone Size  The current top of red, which is the same
as the red zone size, is displayed. This formula is used to calculate
the top of red size: current replenishment level - (current replenishment
level \* (100 emergency stock percent)/100).

New Top of Red = Red
Zone Size The new top of red is calculated based on the profile
you applied.

Curr Size of Red Zone
Base  The current red zone base is displayed. This value
is calculated by multiplying the red impact percentage by the current
yellow zone.

New Size of Red Zone
Base  The new red zone size is calculated based on the
profile you applied.

Current Size of Red Safety 
The current red safety size is displayed. This formula is used to
calculate the current size of red safety: current top of red / (1
+ (100 / variability red safety percent)).

New Size of Red Safety
The new size of red is calculated based on the profile you applied.

Current Top of Yellow 
The current top of yellow is displayed. This formula is used to calculate
the current top of yellow: current replenishment level (current
replenishment level \* (100 yellow stock percent) / 100).

New Top of Yellow
The new top of yellow is calculated based on the profile you applied.

Current Yellow Zone Size 
The current yellow zone size is displayed. This formula is used to
calculate the current yellow zone size: top of yellow top of red.

New Yellow Zone Size 
The new yellow zone size is calculated based on the profile you applied.

Current On-hand Buffer
Status  The current on-hand buffer status is displayed.
This formula is used to calculate the current on-hand buffer status:
((Replenishment level on-hand quantity) / Replenishment level) \*
100.

Quantity On Hand
The number of units currently in stock is displayed.

Quantity In Demand Over
Horizon  The number of units of this part in demand during
the demand horizon.

Quantity On Order Over
Horizon  The number of units of this part on order during
the demand horizon.

Current Avail. Buffer
Status  The current available buffer status is displayed.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

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

Current Low Red Status 
The current lowest buffer status value that is in the red zone is
displayed.

New Low Red Status 
The new lowest buffer status value that is in the red zone is displayed.

Current Low Yellow Status
The lowest buffer status value that is in the yellow zone is displayed.

New Low Yellow Status 
The new lowest buffer status value that is in the yellow zone is displayed.

Current Low Alert Status 
The lowest buffer status value that triggers an alert is displayed.

New Low Alert Status
The new lowest buffer status value that triggers an alert is displayed.

Current On-hand Alert
Level  The current on-hand alert level is displayed.
This formula is used to calculate the current on-hand alert level:
top of red \* on-hand alert red percent / 100

New On-hand Alert Level 
The new on-hand alert level is calculated based on the profile you
applied.

Current On-hand Alert
Level  The current on-hand alert level specified on the
part record is displayed.

8. Select the rows for
   the parts to which you are applying the new buffer profile ID.
9. Click Set
   selected parts profile ID. The new profile is applied,
   and new replenishment level, buffer levels, and alert levels are
   calculated.
10. Click Save to
    apply the new buffer profile ID, replenishment level, buffer levels,
    and alert levels to the selected parts.

## Assigning a New Leadtime Buffer to Buffer Profile Parts

You can assign new leadtime buffers to parts assigned to a particular
buffer profile. You can use the lead-time buffer field in the header
to apply the same lead-time buffer to all selected parts, or you can
manually specify a new buffer for each part in the line table. To
assign a new leadtime buffer:

1. Select Inventory,
   Part Maintenance.
2. Select Maintain,
   Buffer Profile IDs.
3. Click View
   Profile Parts.
4. In the Assign to Parts
   area, select Assign Leadtime Buffer.
5. Specify the parts to
   display in the table. Specify this information:

Profile ID 
Select the buffer profile whose parts you are assigning a new leadtime
buffer. After you select a profile ID, information about the profile
is inserted in the header.

Site ID Specify
the site whose parts you want to display in the table.

Warehouse ID 
This field is available only if the site you selected plans by independently
planned warehouses. Specify the warehouse whose parts you want to
display in the table. To display the parts in your universally planned
warehouses, select Universal. If the site
you selected does not plan by independently planned warehouses, then
this field is unavailable.

Fabricated/Purchase/All 
Select the type of parts to display in the table. Click Fabricated to
display fabricated parts only. Click Purchase to
display purchased parts only. Click All to
display parts of both types.

6. Select the information
   about the parts to view in the table. Specify these settings:

Show Changes Only 
This check box is a available if you have edited any of the lines
and have not yet saved your changes. To display only the lines you
have edited, select this check box. To display all lines, clear this
check box.

Show Current Values 
Selecting or clearing this check box has no impact on the information
displayed in the table.

Show Zone Details 
To display information about the red, yellow, and green zones, select
this check box. When you select this check box, the current green
zone size, top of red zone, red zone base, size of red safety, top
of yellow, and yellow zone size are displayed.

Show Status Details 
To display information about buffer statuses based on your current
supply and demand, select this check box. When you select this check
box, the quantity on hand, quantity in demand over horizon, quantity
on order over horizon, current available buffer status, current low
red status, current yellow status, current low alert status, current
on-hand alert status level, and current on-hand alert red percentage
are displayed.

7. Depending on your selections
   in the Display Options section, this information is displayed:

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

Current Demand Horizon 
The current demand horizon specified for the part is displayed.

Current Demand Horizon
End Date  The end date of the range used to examine demand
is displayed. This date is determined by adding the demand horizon
to the current date. The demand horizon does not consider the work
schedule. For example, if the current date is 6/15/2013 and the demand
horizon is 10, then the Demand Horizon End Date is 6/24/2013, or 10
days from 6/15/2013, inclusive.

ADU Horizon (in Days)
The average daily usage horizon specified for the part is displayed.

Current Leadtime Buffer
(in days)  The lead time buffer you specified for the
part in Part Maintenance is divided by 24 to determine the lead time
buffer in days.

Current Covered ADU 
The average daily usage based on the current average daily usage horizon
is displayed.

Minimum Leadtime
The minimum leadtime specified for the part is displayed.

Current Replenishment
Level = Top of Green  The current replenishment level
specified for the part is displayed. This value is equal to the top
of green value. The top of green should equal the sum of the green
zone, the yellow zone, and the red zone.

Current Emergency Stock
%  The current emergency stock percentage specified on
the part record is displayed.

Current Yellow Stock
%  The current yellow stock percentage specified on the
part record is displayed.

Minimum Order Qty 
The minimum order quantity specified for the part on the part record
is displayed.

Multiple Order Qty 
The multiple in which you purchase or manufacture this part is displayed.
This information is specified on the part record.

Maximum Order Qty 
The maximum order quantity specified for the part on the part record
is displayed.

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

Quantity On Hand
The number of units currently in stock is displayed.

Quantity In Demand Over
Horizon  The number of units of this part in demand during
the demand horizon.

Quantity On Order Over
Horizon  The number of units of this part on order during
the demand horizon.

Current Avail. Buffer
Status  The current available buffer status is displayed.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

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

Current Low Red Status 
The current lowest buffer status value that is in the red zone is
displayed.

Current Low Yellow Status
The lowest buffer status value that is in the yellow zone is displayed.

Current Low Alert Status 
The lowest buffer status value that triggers an alert is displayed.

Current On-hand Alert
Level  The current on-hand alert level is displayed.
This formula is used

Current On-hand Alert
Level  The current on-hand alert level specified on the
part record is displayed.

8. Specify the new lead-time
   buffer. Perform one of these steps:
9. To specify
   a single buffer to apply to multiple parts in the table, specify
   the new lead-time buffer In the New Lead-time Buffer field in
   the header. Specify the buffer value in days. Select the parts
   in the table to which to apply the new buffer, and then click
   Set selected parts lead-time buffer.
10. To specify
    a new buffer on a part-by-part basis, specify the new buffer in
    the New Lead-time Buffer (in days) column in the table.

After you specify a new buffer, the New
Covered Average Daily Usage is calculated. If you applied the new
buffer using the New Lead-time Buffer field in the header, then Set
from header is inserted in the New Lead-time Buffer Based On column.
If you applied new buffers on a part-by-part basis, then Manual Row
Entry is inserted in the New Lead-time Buffer Based On column.

9. Click Save
   to apply the new lead-time buffer to the parts.

## Assigning a New Demand Horizon to Buffer Profile Parts

You can assign new demand horizons to parts assigned to a particular
buffer profile. You can use the demand horizon field in the header
to apply the same demand horizon to all selected parts, or you can
manually specify a new demand horizon for each part in the line table.
To assign a new demand horizon:

1. Select Inventory,
   Part Maintenance.
2. Select Maintain,
   Buffer Profile IDs.
3. Click View
   Profile Parts.
4. In the Assign to Parts
   area, select Assign Demand Horizon.
5. Specify the parts to
   display in the table. Specify this information:

Profile ID Select
the buffer profile whose parts you are assigning a new demand horizon.
After you select a profile ID, information about the profile is inserted
in the header.

Site ID Specify
the site whose parts you want to display in the table.

Warehouse ID 
This field is available only if the site you selected plans by independently
planned warehouses. Specify the warehouse whose parts you want to
display in the table. To display the parts in your universally planned
warehouses, select Universal. If the site
you selected does not plan by independently planned warehouses, then
this field is unavailable.

Fabricated/Purchase/All
Select the type of parts to display in the table. Click Fabricated to
display fabricated parts only. Click Purchase to
display purchased parts only. Click All to
display parts of both types.

6. Select the information
   about the parts to view in the table. Specify these settings:

Show Changes Only 
This check box is a available if you have edited any of the lines
and have not yet saved your changes. To display only the lines you
have edited, select this check box. To display all lines, clear this
check box.

Show Current Values 
Selecting or clearing this check box has no impact on the information
displayed in the table.

Show Zone Details 
To display information about the red, yellow, and green zones, select
this check box. When you select this check box, the current green
zone size, top of red zone, red zone base, size of red safety, top
of yellow, and yellow zone size are displayed.

Show Status Details 
To display information about buffer statuses based on your current
supply and demand, select this check box. When you select this check
box, the quantity on hand, quantity in demand over horizon, quantity
on order over horizon, current available buffer status, current low
red status, current yellow status, current low alert status, current
on-hand alert status level, and current on-hand alert red percentage
are displayed.

7. Depending on your selections
   in the Display Options section, this information is displayed:

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

Current Demand Horizon 
The current demand horizon specified for the part is displayed.

Current Demand Horizon
End Date  The end date of the range used to examine demand
is displayed. This date is determined by adding the demand horizon
to the current date. The demand horizon does not consider the work
schedule. For example, if the current date is 6/15/2013 and the demand
horizon is 10, then the Demand Horizon End Date is 6/24/2013, or 10
days from 6/15/2013, inclusive.

ADU Horizon (in Days)
The average daily usage horizon specified for the part is displayed.

Current Leadtime Buffer
(in days)  The lead time buffer you specified for the
part in Part Maintenance is divided by 24 to determine the lead time
buffer in days.

Current Covered ADU 
The average daily usage based on the current average daily usage horizon
is displayed.

Minimum Leadtime
The minimum leadtime specified for the part is displayed.

Current Replenishment
Level = Top of Green  The current replenishment level
specified for the part is displayed. This value is equal to the top
of green value. The top of green should equal the sum of the green
zone, the yellow zone, and the red zone.

Current Emergency Stock
%  The current emergency stock percentage specified on
the part record is displayed.

Current Yellow Stock
%  The current yellow stock percentage specified on the
part record is displayed.

Minimum Order Qty 
The minimum order quantity specified for the part on the part record
is displayed.

Multiple Order Qty 
The multiple in which you purchase or manufacture this part is displayed.
This information is specified on the part record.

Maximum Order Qty 
The maximum order quantity specified for the part on the part record
is displayed.

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

Quantity On Hand
The number of units currently in stock is displayed.

Quantity In Demand Over
Horizon  The number of units of this part in demand during
the demand horizon.

Quantity On Order Over
Horizon  The number of units of this part on order during
the demand horizon.

Current Avail. Buffer
Status  The current available buffer status is displayed.
This formula is used to calculate the current available buffer status:
(replenishment level - (qty on-hand + qty on-order - qty in-demand))
/ replenishment level \* 100.

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

Current Low Red Status 
The current lowest buffer status value that is in the red zone is
displayed.

Current Low Yellow Status
The lowest buffer status value that is in the yellow zone is displayed.

Current Low Alert Status 
The lowest buffer status value that triggers an alert is displayed.

Current On-hand Alert
Level The current on-hand alert level is displayed. This
formula is used

Current On-hand Alert
Level  The current on-hand alert level specified on the
part record is displayed.

8. Specify the new demand
   horizon. Perform one of these steps:
9. To specify
   a single demand horizon to apply to multiple parts in the table,
   specify the new demand horizon In the New Demand Horizon field
   in the header. Specify the demand horizon in days. Select the
   parts in the table to which to apply the new demand horizon, and
   then click Set selected parts demand horizon.
10. To specify
    a new demand horizon on a part-by-part basis, specify the new
    demand horizon in the New Demand Horizon column in the table.

After you specify a new demand horizon,
the New Demand Horizon End Date is calculated. If you applied the
new demand horizon using the New Demand Horizon field in the header,
then Set from header is inserted in the New Demand Horizon Based On
column. If you applied new demand horizons on a part-by-part basis,
then Manual Row Entry is inserted in the New Demand Horizon Based
On column.

9. Click Save
   to apply the new demand horizon to the parts.