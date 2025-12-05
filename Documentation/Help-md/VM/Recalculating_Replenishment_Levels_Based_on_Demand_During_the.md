Recalculating Replenishment Levels Based on Demand During the Lead-time Buffer




# Recalculating Replenishment Levels Based on Demand During the Lead-time Buffer

Use the Replenishment Buffer Analysis dialog to calculate new replenishment
levels based on demand during a specified number of lead-time buffers.

The lead-time buffer is the amount of time it takes to restock the
product. For fabricated parts, this is the amount of time it takes
to fabricate a part. For purchased parts, this is the amount of time
it takes to receive the part from a vendor.

In Replenishment Buffer Analysis, actual demand for the part during
the lead-time buffer is used to calculate a new recommended replenishment
level. You can specify the number of lead-time cycles to use in the
demand calculation. For example, if your lead-time buffer is 24 hours,
you can choose to examine demand over any multiple of the lead-time,
such as 48, 72, and so on. The number of issue inventory transactions
for the part is retrieved, and the average number of issue transactions
per lead-time buffer period is calculated. This average is used as
the recommended replenishment level.

You can increase the recommended buffer by specifying an additional
quantity to include in the buffer. You can add either a percentage
of the recommended replenishment level or a specify number of units.

In addition, you can review the number of times your inventory quantity
fell into the yellow level or into the emergency level. You can use
this information to determine whether a larger replenishment level
is required.

To recalculate replenishment levels based on demand during the lead-time
buffer:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow
   and select the site that contains the parts to use in the replenishment
   analysis and recalculation. If you are licensed to use a single
   site, this field is unavailable.
3. Select Maintain,
   Replenishment Buffer Analysis.
4. Specify the information
   to display in the table. Specify these options:

Warehouse ID 
If the site you selected plans by independently planned warehouses,
specify the warehouse whose parts you want to view. Specify Universal
to view parts in your universally planned warehouses. If the site
you selected does not plan by independently planned warehouses, this
field is unavailable.

Show Current Replenishment
Levels  To display the current replenishment level for
the parts, select this check box. To hide the current replenishment
level for the parts, clear this check box. When you select this check
box, this information is displayed for each part in the table:

Current Replenishment
Level Minus Average Issues  After you specify a demand
period (see next step), this field is calculated by subtracting the
average number of issues per buffer during the demand period from
the current replenishment level.

Current Replenishment
Emergency Level  The current replenishment emergency
level is displayed. This is calculated by multiplying the current
replenishment level by the emergency stock percentage.

Current Replenishment
Yellow Level The current yellow level is displayed. This
is calculated by multiplying the current replenishment level by the
yellow stock percentage.

Current Replenishment
% Buffers with Emergency Intrusions  The percentage of
buffers during the demand period where the stocked quantity fell below
the current replenishment emergency level.

Current Replenishment
% Buffers with No Yellow Intrusions  The percentage of
buffers during the demand period where the stocked quantity did not
enter the yellow zone. This is the percentage of buffers where the
stocked quantity was in the green zone.

Show Changes Only 
This check box is a available if you have edited any of the lines
and have not yet saved your changes. To display only the lines you
have edited, select this check box. To display all lines, clear this
check box.

Fabricated/Purchase/All 
Specify the type of part to display in the table. Click Fabricated
to display fabricated parts only. Click Purchase to display purchased
parts only. Click All to display part of both types.

5. Specify the time period
   to use to examine demand. In the Issue Selection Options section,
   specify this information:

Number of Lead-time Buffers 
Specify the number of lead-time buffers to examine.

End Date Specify
the last date of the demand period.

6. After you specify these
   values, the number of lead-time buffers you specified is multiplied
   by the lead-time buffer duration. This amount of time is subtracted
   from the End Date to calculate the first date used to find demand.
   In the table, these columns are updated:

Start Date The
first date of the demand period is inserted.

Issued Qty Since Start
Date  The number of units issued during the demand period
is displayed.

Avg. Issues Per Lead-time
Buffer  The number of units issued during the demand
period is divided by the number of lead-time buffers specified on
the header. This is the average number of material issues per each
lead-time buffer.

Curr. Repl. Level Minus
Avg. Issues  This column is displayed if you have selected
the Show Current Replenishment Levels check box. The average number
of issues is subtracted from the current replenishment buffer. A low
number indicates that you are replenishing your stock of this part
appropriately.

7. To specify a new replenishment
   level, perform one of these steps:
8. To manually
   specify a new replenishment level, specify the new quantity in
   the New Replenishment Level column.
9. To calculate
   a new replenishment level, first specify the number of units to
   add to the Average Issues Per Lead-time quantity. You can add
   units based on a percentage of the Average Issues Per Lead-time
   quantity or add a particular number of units to the Average Issues
   Per Lead-time Quantity. To specify a percentage, click the % option, then specify the percentage
   in the New Repl. = Calc. Repl. Plus field. To specify a number
   of units, click the Qty option,
   then specify the number of units in the field. Click Recalc
   selected parts.

8. After you specify a
   new replenishment level, these values are calculated based on
   the new replenishment level:
9. New Replenishment
   Level Minus Average Issues
10. New Replenishment
    Emergency Level
11. New Replenishment
    Yellow Level
12. New Replenishment
    % Buffers with Emergency Intrusions
13. New Replenishment
    % Buffers with No Yellow Intrusions

9. Use the Exceptions Processing
   section to filter the table to display only parts with exceptions.
   Specify these settings:

Curr. Repl. w/ Emergency
Level Intrusions  Select this check box to display only
parts with emergency level intrusions based on the current replenishment
level. Any part with an emergency level intrusion greater than 0%
is displayed. Clear this check box to display part both with and without
emergency level intrusions.

Curr. Repl. w/No Yellow
Level Intrusions  Select this check box to display only
parts with no yellow level intrusions based on the current replenishment
level. Only parts with 100% in the Curr Repl % w/No Yellow Level Intrusions
are displayed. Clear this check box to display parts both with and
without yellow level intrusions.

New Repl. w/Emergency
Level Intrusions  Select this check box to display only
parts with emergency level intrusions based on the new replenishment
level. Any part with an emergency level intrusion greater than 0%
is displayed. Clear this check box to display part both with and without
emergency level intrusions.

New Repl. w/No Yellow
Level Intrusions  Select this check box to display only
parts with no yellow level intrusions based on the new replenishment
level. Only parts with 100% in the Curr Repl % w/No Yellow Level Intrusions
are displayed. Clear this check box to display parts both with and
without yellow level intrusions.

10. Click the Save button.
11. Click Close.
    You are prompted to print the Replenishment Level Changes Report.
    Click Yes to print the report.
12. You are prompted to
    permanently change the replenishment level fields for the part.
    Click Yes to update the part record
    with the new replenishment level. Click No to
    exit the dialog without updating your parts. To exit the dialog
    without editing your parts, click Close.

## Generating the Replenishment Level Changes Report

The Replenishment Level Changes Report displays a list of the changes
you made to the replenishment levels in the Replenishment Buffer Analysis
dialog box.

From the Replenishment Buffer Analysis dialog, click Print.
Or, click Yes when prompted to print
the report when you exit the Replenishment Buffer Analysis dialog
box after saving changes to your replenishment levels.

The report is generated. This information is included in the report:
part ID, part Description, method used to recalculate the replenishment
level, the lead-time buffer, product code, new and previous replenishment
level, new and previous emergency level, new and previous yellow level.