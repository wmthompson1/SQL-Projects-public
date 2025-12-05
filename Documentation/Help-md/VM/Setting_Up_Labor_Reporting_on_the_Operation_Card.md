Setting Up Labor Reporting on the Operation Card




# Setting Up Labor Reporting on the Operation Card

If percent complete, quantity complete by hours, and max percent
completed information has not been set up in Site Maintenance or on
the Header card, you can specify the information on the Operation
card.

1. Select Eng/Mfg,
   Manufacturing Window.
2. Open the master that
   contains the operation.
3. Open the operation card.
4. Click the Other
   tab.
5. Specify this information:

Percent Complete
To record labor by percentage complete instead of quantity complete,
select this check box. When a user reports labor for the run of this
operation, labels in the labor ticket entry programs are updated to
indicate that quantities are reported as percentages.

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

If you select the Quantity Complete by Hours
check box in Site Maintenance, then all run type labor transactions
are automatically calculated.

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

To complete the labor on an operations,
users must manually close the operation. See [Completing
Labor on Operations with Max Percent Complete Thresholds](VMLABENTfrmLaborEntry.htm#CompletingLaborMaxPercent)..

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMFGWINfrmOperation.htm)
Adding an Operation