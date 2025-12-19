Printing Purchase Receipt Thermal Labels




# Printing Purchase Receipt Thermal Labels

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from Purchase Receipt Entry?  [RCV TRACEABLE](javascript:void(0);)  [RECEIVING](javascript:void(0);)  [WAREHOUSE](javascript:void(0);)  [WORKORDER](javascript:void(0);)  [PART](javascript:void(0);)  [PO\_LINKED\_WO](javascript:void(0);) |

Purchase Receipt Entry supports the printing of thermal barcode
labels for purchase receipts. Before you try to print any thermal
labels for a purchase order, design the appropriate thermal labels
using the [Label Printer
Setup Utility](What_is_VISUAL_BTS_.md).

1. From the File menu,
   select Print Receiver.

The Print Receiver dialog box appears.

2. Click the Thermal
   Labels button.

The Print Thermal Labels dialog box appears.

3. Click the Label
   ID button to select the appropriate label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Only RCV TRACEABLE, RECEIVING, WAREHOUSE, WORKORDER, PART, and PO\_LINKED\_WO label types appear. |

4. If the label is part
   of a group, click the Label Group ID
   button and select the appropriate group.

All individual labels that makeup the group
appear in the below line item table.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL allows you to choose either an individual label (see step 3) or a group, but not both. |

5. If appropriate, adjust
   the Spool Into location.

VISUAL uses the default location you specified
when setting up Loftware.

6. Specify Label Parameters.

![arrow.gif](arrow.gif "arrow.gif")
For RCV TRACEABLE
label types:

Starting Receiver ID
- Click the Starting Receiver ID button
to choose the first receiver in the print range. Only receivers containing
traceable parts are eligible for selection.

Ending Receiver ID
- Click the Ending Receiver ID button to
choose the ending receiver in the print range. Only receivers containing
traceable parts are eligible for selection.

![arrow.gif](arrow.gif "arrow.gif")
For RECEIVING label types:

Starting Receiver ID
- Click the Starting Receiver ID button
to choose the first receiver in the print range.

Ending Receiver ID
- Click the Ending Receiver ID button to
choose the ending receiver in the print range.

![arrow.gif](arrow.gif "arrow.gif")
For WAREHOUSE label types:

Starting Warehouse ID
- Click the Starting Warehouse ID button
to choose the first warehouse in the print range.

Ending Warehouse ID
- Click the Ending Warehouse ID button to
choose the last warehouse in the print range.

Starting Location ID
- Click the Starting Location ID button
to choose the first location in the print range.

Ending Location ID
- Click the Ending Location ID button to
choose the last location in the print range.

![arrow.gif](arrow.gif "arrow.gif")
For WORKORDER label types:

Starting Base ID
- Click the Starting Base ID button to choose
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
- Click the Starting Part ID button to choose
the first part in the print range.

Ending Part ID
- Click the Ending Part ID button to choose
the last part in the print range.

Starting Warehouse ID
- Click the Starting Warehouse ID button
to choose the first warehouse in the print range.

Ending Warehouse ID
- Click the Ending Warehouse ID button to
choose the last warehouse in the print range.

Starting Location ID
- Click the Starting Location ID button
to choose the first location in the print range.

Ending Location ID
- Click the Ending Location ID button to
choose the last location in the print range.

![arrow.gif](arrow.gif "arrow.gif")
For PO\_LINKED\_WO label types:

Only purchase orders linked to work orders
are eligible for selection

Starting Order ID
- Click the Starting Order ID button to
choose the first linked purchase order for the print range.

Ending Order ID
- Click the Ending Order ID button to choose
the last linked purchase order for the print range.

Starting Base ID
- Click the Starting Base ID button to choose
the first work order Base ID for the print range.

Ending Base ID
- Click the Ending Base ID button to choose
the last work order Base ID for the print range.

If rather than a range you choose an individual
Base ID with associated lots, VISUAL activates the Starting Lot ID
and Ending Lot ID fields. If appropriate, choose a range of lots to
print.

7. If this print session
   is for a label group (see step 4), click the Insert
   button and add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group. Only
RCV TRACEABLE, RECEIVING, WAREHOUSE, WORKORDER, PART, and PO\_LINKED\_WO
label types appear.

Description -
If appropriate, adjust the default thermal label description.

Print Quantity
- Specify a print quantity for this label.

Multiplier - Select
the Multiplier check box if you want VISUAL
to multiply the print quantity by the containers per skid by the total
skids for the label.

This setting is especially useful for container
labels that are part of a label group. When selected, VISUAL automatically
creates the appropriate number of carton labels for a shipment. Make
this setting a default using the [Label
Printer Setup Utility](What_is_VISUAL_BTS_.md)

Label Printer
- If appropriate, adjust the label printer you want to use to print
these labels.

8. Click the Print
   Labels button to print the labels.

Based on your starting and ending preference,
VISUAL prints a range of thermal labels for the specified receivers.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help