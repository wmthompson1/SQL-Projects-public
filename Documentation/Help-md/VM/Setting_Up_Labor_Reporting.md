Setting Up Labor Reporting




# Setting Up Labor Reporting

You can set up labor reporting preferences in Labor Ticket Entry,
Site Maintenance, and the Manufacturing Window.

Use the settings available in the Administrator Setup dialog in
Labor Ticket Entry to set up personal preferences. The preferences
that you specify are applied to your user ID only and are also stored
in Preferences Maintenance. This table shows the settings that you
can specify in the Administrator Setup dialog:

| **Setting** | **Description** |
| Automatically compute qty complete | Select this check box to automatically calculate the quantity complete by dividing the elapsed hours of the labor ticket by the run time of the operation. The calculation can result in fractional quantities.  When the total elapsed hours for all labor tickets for the operation exceed the estimated time for the operation, the Run Complete check box is selected and the operation is closed.  If the Quantity Complete by Hours check box has been selected on the operation to which you are reporting labor, then the Automatically Compute qty complete setting is ignored. The Quantity Complete by Hours check box can be selected on the operation itself, on the work order header, or in Site Maintenance. |
| Use Decimal time format | Select this check box to use the last two digits of a four digit number as a percentage of an hour. For example, if you type 1250 into the Clock Out field, 12:30 is entered into the field. The 50 is interpreted as 50% of an hour.  If you clear the check box, then the last two digits are read as minutes. If you type 1250 into the Clock Out field, then 12:50 is entered into the field. |
| Edit qty complete vs. standard | Select this check box to specify a quantity complete that is greater than the quantity specified for the operation. Use the Allowable percentage over standard field to specify the amount over the operation quantity that you can enter. |
| Allow reporting to obsolete resource | Select this check box to create labor tickets for obsolete resources. A message is displayed if you attempt to create a labor ticket for an obsolete resource, but you can save the labor ticket. If you clear this check box, you cannot create a labor ticket for an obsolete resource. |

Use the settings available in Site Maintenance and the Manufacturing
Window to set up these labor reporting functions:

| **Function** | **Set up** |
| **Report labor by percentage complete instead of quantity complete.**  Replace the Qty Remaining and Qty Completed fields with Percent Remaining and Percent Completed fields. | Select the **Percent Complete** check box |
| **Enable automatic calculation of quantity complete based on hours.**  Automatically calculate quantity or percentage complete based on the number of hours reported on the labor ticket.  This feature functions in the same way as the quantity complete function available in the administrator set up of Labor Ticket Entry,. | Select the **Quantity Complete by Hours** check box. |
| **Deactivate automatic closing of operations.**  Automatically stop calculating the quantity or percentage at a threshold that you specify.  This feature is useful if you engineer to order and actual time spent on operations frequently exceeds the estimates. When you specify a threshold, the automatic calculation stops when the threshold is reached. The operation remains open, and the remaining time remains on your schedule.  To close the operation, the user must select the Run Complete check box on the labor ticket or manually update the completed quantity to 100%. You can also change the status of the Operation to closed in the Manufacturing Window. | Select the **Quantity Complete by Hours** check box.  Specify a value in the Max Percent Completed field. |

The settings that you specify at the site level are used for all
masters and operations in the site. If you do not specify settings
at the site level, then you can specify settings on the header card
on masters. Settings that you specify on the header card are applied
to all operations in the master, including operations in legs. If
you do not specify settings at the site level or header card level,
you can specify settings on individual operations.