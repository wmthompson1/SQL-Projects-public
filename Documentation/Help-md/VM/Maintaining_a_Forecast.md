Maintaining a Forecast




# Maintaining a Forecast

A forecast consists of a list of periods and predictions
of quantity demanded for each period. You have complete flexibility
in choosing the sizes of your forecast periods. The Forecast Quantity
specified on a line applies to the period starting with the Forecast
Date for the line, and ending with the Forecast Date on the next line.
You can define and maintain the forecast in the two ways described
below.

## Manually Inserting and Editing Lines

To add a line to the parts forecast:

1. Select Master
   Production Schedule from the File
   menu.

The Master Production Schedule dialog box
appears.

2. Click the Insert
   button.

A new line appears at to the bottom of the
table.

3. Enter the forecasted
   date of demand in the Forecast Date column and the Forecast Quantity
   in the Forecast Qty column.
4. Continue this process
   for all lines you need to insert.
5. Click the Save
   button.

VISUAL saves the forecast and re-sorts the
table by Forecast Date.

## Auto Filling Forecast Entries

Use the Auto Fill command to generate forecast entries for a specified
number of periods of fixed size.

## Follow these steps to use Auto Fill to generate a forecast:

1. Click the Forecast radio
   button in the Auto Fill area of the Master Production Schedule
   dialog box.
2. Specify the fill quantity
   in the Fill Quantity field.

Auto Fill propagates a specified quantity
into multiple forecast periods.

3. Specify the period size
   in number of days.

VISUAL creates entries based on a number
of equally sized periods. If you leave this field blank, VISUAL uses
a default period size of 7 days.

4. Specify the horizon
   or select the number of lines to fill.

There are two ways to control the number
of periods generated. By specifying the horizon, you can control how
many periods are generated.

You can also select a number of existing
lines to fill. When you do this, VISUAL ignores the Horizon value.

5. Specify the beginning
   of the week date in the Week Begin field.

Use the Week Begin day to determine the
first date to generate. Select the day of the week from the drop down.
VISUAL uses the next occurrence of that day after the current date
for the first Forecast Date. For example, if today is 01/31/97, which
is a Friday, and you specify a week begin of Monday, the first Forecast
Date is 02/07/97.

6. Click the Fill
   Selected or All button to generate
   the forecast entries.

If no lines were selected:

If the table was empty, then Horizon + 1
new entries appear in the table. For example, if you specified 5 as
the Horizon, VISUAL creates 7 entries. The forecast date of the first
entry is the next occurrence of the Week Begin after the current date.
VISUAL determines the other forecast dates by adding the Period Size
to each successive date. VISUAL uses the Fill Quantity for all quantities.

If there were more entries already in the
table than the specified Horizon, VISUAL ignores the Horizon and generates
a new date and quantity for each of the existing entries.

If existing lines were selected:

VISUAL ignores the Horizon value and sets
Forecast Date and Forecast Quantity for all selected lines.

If the first entry in the table is one of
the selected rows, then the Forecast Date of the first entry is determined
as described above. Otherwise, the Period Size is added to the Forecast
Date of the previous row to determine the Forecast Date of the first
row. The other forecast dates will be determined by adding the Period
Size to each successive date, and the Fill Quantity will be used for
all Forecast Quantities.

7. Click the Save
   button to commit the additions and changes.

You can also use Zero Selected or All button
to blank the Forecast Date and Forecast Quantities for all selected
rows, or all rows if none are selected.

When you save, the total Required Quantity
for all unreleased, firm, and released demand orders in the period
appears. Note that unreleased orders are included, and any quantity
already issued to the requirement is not subtracted from the total.
This quantity will be recalculated whenever the Master Production
Schedule window is refreshed.

8. Click the Import/Export
   forecast button to import forecast from or to export to
   a particular file.

You need to specify the path of the file.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information