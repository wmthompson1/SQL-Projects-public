Transferring Customer Forecasts to Part Forecasts




# Transferring Customer Forecasts to Part Forecasts

If a certain group of customers requires the same
part, you can transfer individual customer production schedule forecasts
to an overall part forecast. By doing this, your production staff
need only concern itself with producing quantities of the part according
to one forecast.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
2. From the File menu,
   select Master Production Schedule.

The Master Production Schedule dialog box
appears.

If you have a part loaded in the main Material
Planning window display with an order policy that is not Master Schedule,
VISUAL warns you that the part is not Master Scheduled. Click Ok to
continue.

3. Click the Customer
   Forecasts button located on the bottom right of the dialog
   box.

The Transfer Customer Forecasts to Part
Forecasts dialog box appears.

4. Specify the following
   Customer Forecast information:

Click the Schd ID
button to select a schedule. You may have schedules for single customers
or a schedule in which all of this customers work orders appear.

Click the From Part ID
button to select the part with which you want to begin the transferring
a forecast.

Click the To Part ID
button to select the part with which you want to end the transfer.

If applicable, from the Product Code list
box, select a Product Code. If you leave this blank, VISUAL transfers
all product codes.

Modify the Start and End date if necessary.
The default time period is one year.

5. Specify the actions
   you want VISUAL to take for the transfer:

Import to Forecast Table
- Select this option button if you want VISUAL to import the customer
forecast to the Forecast (DEMAND\_FORECAST) table.

Import to Master Schedule
Table - Select this option button if you want VISUAL to import
the customer forecast to the Master Schedule table.

Import to Both
- Select this option button if you want VISUAL to import the forecast
to both tables.

Purge Prior Data
- If you select this check box, VISUAL deletes existing forecast data
entirely before importing new data. This only for the parts being
you selected for processing. If you leave this check box cleared,
VISUAL adds or replaces existing forecast entries.

Bucketless Import
- VISUAL stores forecast data using a bucketless method in which the
quantity and date are explicitly stored. When the forecast is displayed
it must be "reoriented." This causes the date-quantities
to be loaded into buckets, a virtual series of numbers. The bucket
that a given date-quantity is loaded into is determined by comparing
the date of the forecast to the date of the bucket.

Period Size Days
- The size, in calendar days, of the planning period. Enter a number
between 4 and 365.

Forecast ID -
A unique ID for this forecast.

6. Click Begin
   to commence the forecast transfer.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.htm) User-defined Help