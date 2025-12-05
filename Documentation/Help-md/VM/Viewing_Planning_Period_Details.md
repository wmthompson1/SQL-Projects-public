Viewing Planning Period Details




# Viewing Planning Period Details

To view a daily breakdown of supply and demand for a planning period,
open the Planning Period Details dialog.

1. If the standard mode
   is displayed, select View, Show
   Advanced Mode.
2. To start the Advanced
   Material Planning window, select Material Planning
   from the Inventory menu.
3. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
4. Click the Part ID browse
   button and select the part to view.
5. To view part information
   for a particular warehouse, click the Warehouse ID arrow and select
   the warehouse to view. If the Warehouse ID field is not displayed,
   select View, View by Warehouse to display the field.
6. Open the Planning Period
   Details dialog. You can open the dialog in these ways:
7. Double-clicking
   a column header in the Advanced Material Planning table
8. Select a planning
   period column, then select Info, Show Planning Period Details
9. Select a planning
   period column, then click the Planning Period Details toolbar
   button

The header shows summary information for the planning period. If
you have enabled the Calculate Suggested MPS feature, then the Suggested
MPS and Proposed Inventory for the period are also displayed.

To navigate to a different planning period, use the arrows next
to the Planning Period field. You can also select a different period
in the main Advance Material Planning window.

The type of demand is displayed above the table. The type of demand
determines how the gross demand is calculated. These types are used:

Real The gross demand is calculated
by adding customer and dependent demand.

Mixed The gross demand is the greater
of real demand and forecasted demand.

Forecast The gross demand is the forecasted
demand.

To add demand information from active forecasts for the part, select
the Show Active Forecasts check box.

The daily table shows information about each days supply, demand,
and projected inventory. This information is displayed:

Beginning Inventory The quantity on
hand at the beginning of the day. For the first day in the planning
period, the beginning inventory value is the same as the beginning
inventory value in the header. For subsequent days, the beginning
inventory equals the projected inventory from the previous day.

MRP Planned Orders The quantity of all
planned orders for the day.

Suggested MRP Release The quantity of
all planned orders whose suggested release date is equal to the date
in the column header.

Current Firmed Orders The quantity of
all supply orders with a due date that is equal to the date in the
column header.

Gross Supply The total of the beginning
inventory, MRP planned orders, and current firmed orders.

Active Forecasts If you selected the
Show Active Forecasts check box, then all currently active forecasts
for the part are displayed. These forecasts are informational only.
The quantities are not used to calculate demand.

Remaining Forecast The quantity of all
active forecasts that has not yet been consumed by demand is displayed.
These calculations are used:

Real If the period
type is Real, then the Remaining Forecast is zero. Forecasts do not
affect demand in Real planning periods.

Mixed If the period
type is Mixed, then a series of calculations are made to determine
the Remaining Forecast figure.

First, the total real demand for the entire
planning period and the total forecast demand for the entire planning
period are determined. The total real demand is determined by adding
each days customer demand and dependent demand. The total forecast
demand is determined by adding each days demand for all active forecasts.

The total real demand and total forecast demand
are then compared to determine the Remaining Forecast for each day.
This table shows the calculations:

|  |  |
| --- | --- |
| **Condition** | **Remaining Forecast Calculation** |
| Total real demand is greater than total forecast demand | Remaining Forecast for each day= 0 |
| Total real demand = 0 | Remaining Forecast for each day = Total daily quantity for all forecasts. |
| Total real demand does not equal zero and is less than total forecast demand | The Total real demand is subtracted from the forecast entry with the earliest date within the planning period.  If the result is greater than zero, then the result is inserted into the Remaining Forecast column for that date.    If the result is zero or less, then a zero is inserted into the Remaining Forecast column for that date, and the Total real demand is reduced by the forecast entry quantity to show that some of the demand has been applied to a forecast.    Repeat these steps for all remaining forecast entries, or until all real demand has been applied. |

Forecast If the
period type is Forecast, then the Remaining Forecast equals the total
forecasted demand for the date. Real demand is not considered in the
calculation.

Customer Demand The total quantity of
all customer orders for the part with a want date equal to the date
in the column header.

Dependent Demand The total quantity
required by work orders or interbranch transfers with a want date
equal to the date in the column header.

Gross Demand The total demand quantity
for the date. These calculations are used:

Real If the period
type is Real, then Gross Demand = Customer Demand + Dependent Demand.

Mixed If the period
type is Mixed, then Gross Demand = Remaining Forecast + Customer Demand
+ Dependent Demand.

Forecast If the
period type is Forecast, then Gross Demand = Remaining Forecast.

Projected Inventory The quantity projected
to remain in your inventory. This calculation is used: Gross Supply
- Gross Demand.

Current MPS For master scheduled parts,
the scheduled production for the date.

## Viewing Demand and Supply Orders in the Planning Period Details Dialog

When you first open the Planning Period Details dialog, all demand
and supply orders for the period are displayed. To filter the information,
select one or more columns Click a column to view the demand and supply
orders for the day. Press CTRL and click two columns to select a date
range. All orders that fall between the two dates that you select
are displayed.