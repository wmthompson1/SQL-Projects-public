Printing Labor Ticket Thermal Labels




# Printing Labor Ticket Thermal Labels

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from Labor Ticket Entry?  [LBR TRACEABLE](javascript:void(0);) |

Labor Ticket Entry supports the printing of thermal barcode labels
for Trace IDs. Before you try to print any thermal labels for a purchase
order, design the appropriate thermal labels using the [Label
Printer Setup Utility](BARCODE.chm::/What_is_VISUAL_BTS_.htm).

1. From the File menu,
   select Print Trace Labels.

The Print Trace Labels dialog box appears.

2. Click the Thermal
   Labels button.

The Print Thermal Labels dialog box appears.

3. Click the Site
   ID arrow and select the site to use.
4. Click the Label
   ID button to select the appropriate label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Only LBR TRACEABLE label types appear. |

5. If the label is part
   of a group, click the Label Group ID
   button and select the appropriate group.

All individual labels that makeup the group
appear in the below line item table.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL allows you to choose either an individual label (see step 3) or a group, but not both. |

6. If appropriate, adjust
   the Spool Into location.

VISUAL uses the default location you specified
when setting up Loftware.

7. Specify Label Parameters.

For LBR TRACEABLE label types:

Starting Transaction
ID Click the Starting Transaction ID
button to choose the first trace labor transaction in the print range.

Ending Transaction ID
Click the Ending Transaction ID button
to choose the last trace labor transaction in the print range.

Starting Work Order ID
Click the Starting Work Order ID button
to choose the first work order in the print range.

Ending Work Order ID
- Click the Ending Work Order ID button
to choose the last work order in the print range.

Starting Trace ID
- Click the Starting Trace ID button to
choose the first trace record in the print range.

Ending Trace ID
- Click the Ending Trace ID button to choose
the last trace record in the print range.

8. If this print session
   is for a label group (see step 4), click the Insert
   button and add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group. Only
LBR TRACEABLE label types appear.

Description
If appropriate, adjust the default thermal label description.

Print Quantity
Specify a print quantity for this label.

Multiplier Select
the Multiplier check box if you want VISUAL
to multiply the print quantity by the containers per skid by the total
skids for the label.

This setting is especially useful for container
labels that are part of a label group. When selected, VISUAL automatically
creates the appropriate number of carton labels for a shipment. Make
this setting a default using the [Label
Printer Setup Utility](BARCODE.chm::/What_is_VISUAL_BTS_.htm)

Label Printer
If appropriate, adjust the label printer you want to use to print
these labels.

9. Click the Print
   Labels button to print the labels.

Based on your starting and ending preference,
VISUAL prints a range of thermal labels for the specified labor ticket
thermal labels.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.htm) User-defined Help