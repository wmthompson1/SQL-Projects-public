Printing Work Order Traveller Thermal Labels




# Printing Work Order Traveller Thermal Labels

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from the Work Order Traveller window?  [TRACEABLE](javascript:void(0);)  [WO\_LINKED\_CO](javascript:void(0);)  [WORKORDER](javascript:void(0);)  [PART](javascript:void(0);) |

The Work Order Traveller window supports the printing of 4 label
types. Before you try to print any thermal labels for a purchase order,
design the appropriate thermal labels using the [Label
Printer Setup Utility](BARCODE.chm::/What_is_VISUAL_BTS_.htm).

1. From the File menu,
   select Print Thermal Labels.

The Print Thermal Labels dialog box appears.

2. Click the Label
   ID button to select the appropriate label.

|  |  |
| --- | --- |
| POSTIT.gif | Only TRACEABLE, WO\_LINKED\_CO, WORKORDER, and PART label types appear. |

3. If the label is part
   of a group, click the Label Group ID
   button and select the appropriate group.

All individual labels that makeup the group
appear in the below line item table.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL allows you to choose either an individual label (see step 3) or a group, but not both. |

4. If appropriate, adjust
   the Spool Into location.

VISUAL uses the default location you specified
when setting up Loftware.

5. Specify Label Parameters.

![arrow.gif](arrow.gif "arrow.gif")
For TRACEABLE label types:

Starting Part ID
Click the Starting Part ID button to choose
the first traceable part in the print range. Only traceable parts
are eligible for selection.

Ending Part ID
- Click the Ending Part ID button to choose
the ending traceable part in the print range. Only traceable parts
are eligible for selection.

Starting Transaction
ID Click the Starting Transaction ID
button to choose the first trace transaction in the range. VISUAL
displays receipt transactions by ID.

Ending Transaction ID
- Click the Ending Transaction ID button
to choose the last trace transaction in the range.

Starting Trace ID
Click the Starting Trace ID button to
choose the first Trace ID in the range. Only Trace IDs for the selected
part range appear.

Ending Trace ID
- Click the Ending Trace ID button to choose
the last Trace ID for the range. Only Trace IDs for the selected part
range appear.

![arrow.gif](arrow.gif "arrow.gif")
For WO\_LINKED\_CO label types:

Only work orders linked to customer orders
are eligible for selection

Starting Base ID
Click the Starting Base ID button to choose
the first work order the print range.

Ending Base ID
- Click the Ending Base ID button to choose
the last work order for the print range.

If rather than a range you choose an individual
Base ID with associated lots, VISUAL activates the Starting Lot ID
and Ending Lot ID fields. If appropriate, choose a range of lots to
print.

Starting Order ID
Click the Starting Order ID button to
choose the first customer order for the print range.

Ending Order ID
- Click the Ending Order ID button to choose
the last customer order for the print range.

![arrow.gif](arrow.gif "arrow.gif")
For WORKORDER label types:

Starting Base ID
Click the Starting Base ID button to choose
the first work order Base ID for the print range.

Ending Base ID
- Click the Ending Base ID button to choose
the last work order Base ID for the print range.

If rather than a range you choose an individual
Base ID with associated lots, VISUAL activates the Starting Lot ID
and Ending Lot ID fields. If appropriate, choose a range of lots to
print.

![arrow.gif](arrow.gif "arrow.gif")
For PART label types:

Starting Part ID
Click the Starting Part ID button to choose
the first part in the print range.

Ending Part ID
- Click the Ending Part ID button to choose
the last part in the print range.

Starting Warehouse ID
Click the Starting Warehouse ID button
to choose the first warehouse in the print range.

Ending Warehouse ID
- Click the Ending Warehouse ID button to
choose the last warehouse in the print range.

Starting Location ID
Click the Starting Location ID button
to choose the first location in the print range.

Ending Location ID
- Click the Ending Location ID button to
choose the last location in the print range.

6. If this print session
   is for a label group (see step 4), click the Insert
   button and add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group. Only
TRACEABLE, WO\_LINKED\_CO, WORKORDER, and PART label types appear.

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

7. Click the Print
   Labels button to print the labels.

Based on your starting and ending preference,
VISUAL prints a range of thermal labels for the specified work orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Traveller.htm) User-defined Help