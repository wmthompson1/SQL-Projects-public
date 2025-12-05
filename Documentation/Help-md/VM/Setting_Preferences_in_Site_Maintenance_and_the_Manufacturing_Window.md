Setting Preferences in Site Maintenance and the Manufacturing Window




# Setting Preferences in Site Maintenance and the Manufacturing Window

If you specify the Percent Complete, Quantity Complete By Hours,
and Max Percent Completed settings in Site Maintenance, then all operations
in your site inherit the settings. The settings cannot be overridden
at the header card level or operation level in the Manufacturing Window.

If you do not specify the settings in Site Maintenance, then you
can specify the settings at the header card level. All operations
in the work order, quote master, or engineering master inherit the
settings that you specify.

If you do not specify the settings in Site Maintenance or at the
header card level, then you can specify the settings on individual
operation cards.

1. Decide the level at
   which you want to set up percentage of completion functions:
2. To specify
   the settings at the site level, select Admin,
   Site Maintenance. Click the Defaults
   tab.
3. To specify
   the settings at the header level, select Eng/Mfg,
   Manufacturing Window and open the header
   card of the work order, engineering master, or quote master.
4. To specify
   the settings at the operation level, select Eng/Mfg,
   Manufacturing Window and open the operation.

2. Specify this information:

Percent complete
To report labor based on percentage complete instead of quantity
complete, select this check box. These changes are made:

* In Labor Ticket
  Entry, Qty Remaining and Qty Completed labels are replaced with
  Percent Remaining and Percent Completed labels.
* In Wedge Barcode
  Labor Entry, Op Qty Completed, Op Qty Remaining, and Op Qty Remaining
  labels are replaced with Op Prcnt Complete, Op Prcnt Remaining,
  and Percent Completed prompts.
* In
  ALTS, the Quantity Completed prompt is replaced by a Percent Completed
  prompt.

Quantity Complete by
Hours To automatically calculate quantity complete or percentage
of completion based on the hours reported on the labor ticket, select
this check box.

If you report labor based on quantity complete,
then this calculation is made to determine the quantity completed
during the labor ticket:

(hours reported on ticket/total estimated hours
for operation) \* operation quantity

If you report labor based on percentage
complete, then this calculation is made to determine the percentage:

(hours reported on ticket/estimated hours for
operation) \* 100

The operation is automatically closed when
the quantity or percentage complete equals or exceeds the operation
quantity.

Max Percent Completed
If you selected the Quantity Complete by Hours check box, use this
field to specify the maximum percentage that can be calculated automatically.
When the percentage complete meets the threshold that you specify,
automatic calculation of quantity complete is stopped. The operation
remains on your schedule until the operation is manually closed. This
formula is used to calculate the number of hours for the operation
that remain on your schedule:

((100 - value specified in Max Percent Completed
field)/100) \* total hours required for the operation

3. Click Save.