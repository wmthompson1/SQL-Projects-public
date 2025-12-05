Master Scheduling and MRP




# Master Scheduling and MRP

The master schedule for each part scheduled in this
manner determines the quantity to be produced and the date of production.
Typically, a master schedule states quantities for each week. The
week begin date is normally the due date used for each quantity. For
example, if the week begin day is Monday, then the quantity due for
that date is the quantity produced in the preceding week.

Infor VISUALs Planning Window has always presented the Master Schedule
vertically. In Advanced Material Planning, this presentation is too
limiting. This same is true of production schedules for MRP parts.
The horizontal format is more common and much more useful.

Consider the following grid:

|  |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  | Jan6 | Jan13 | Jan20 | Jan27 | Feb3 | Feb10 | Feb17 |
| Forecast 1\* | 100 | 110 | 120 | 130 | 140 | 150 | 160 |
| Forecast 2 | 125 | 125 | 125 | 125 | 125 | 125 | 125 |
| Forecast 3 | 150 | 160 | 130 | 180 | 190 | 140 | 120 |
| Summary Forecast | 100 | 110 | 120 | 130 | 140 | 150 | 160 |
| Customer Demand | 112 | 140 | 110 | 0 | 0 | 190 | 0 |
| Dependant Demand | 0 | 20 | 40 | 0 | 0 | 10 | 0 |
| Gross Demand | 112 | 160 | 150 | 130 | 150 | 150 | 150 |
| Current MPS | 150 | 150 | 150 | 150 | 150 | 150 | 150 |
| Current MRP plan | 150 | 150 | 150 | 150 | 150 | 150 | 150 |
| Current Firmed Orders | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Projected Inventory | 38 | 28 | 30 | 48 | 52 | 58 | 92 |
|  |  |  |  |  |  |  |  |
| Suggested MPS | 112 | 160 | 150 | 130 | 140 | 150 | 160 |

More rows are considered. For instance, Scheduled MPS as a function
of scheduling planned orders.

Projected inventory includes consideration for safety stock which
is not illustrated in the example above.

Master Schedule parts show the "Current MPS" row and the
"Current MRP plan" row. MRP parts only show the "Current
MRP plan" row. If MRP has not been run on a part recently, the
two rows may disagree. For instance, if the user has changed the master
schedule since the last MRP run, the planned orders generated for
the last MPS shows instead of the plan for the current MPS.

Note the "Summary Forecast" row. This permits the program
to show more than one forecast as active. By combining forecasts the
user can enter separate information for sales, repair and spare parts
demand. (When only one forecast is active, the program may make this
row invisible since it is then redundant). The current active forecasts
for a part are indicated in the planning forecast table by showing
an asterisk at the end of the name.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information