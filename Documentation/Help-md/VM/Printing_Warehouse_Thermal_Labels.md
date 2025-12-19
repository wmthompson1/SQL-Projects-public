Printing Warehouse Thermal Labels




# Printing Warehouse Thermal Labels

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from Warehouse Maintenance?  [PHYSICAL](javascript:void(0);)  [WAREHOUSE](javascript:void(0);) |

Warehouse Maintenance supports the printing of thermal barcode labels
for physical inventory counts and warehouse locations. Before you
try to print any thermal labels for a customer order or acknowledgment,
design the appropriate thermal labels using the [Label
Printer Setup Utility](What_is_VISUAL_BTS_.md).

1. From
   the File menu, select Print.

The Print dialog box appears.

2. Click
   the Thermal Labels button.

The Print Thermal Labels dialog box appears.

3. Click
   the Label ID button
   to select the appropriate label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Only PHYSICAL and WAREHOUSE label types apply. |

4. If
   the label is part of a group, click the Label
   Group ID button
   and select the appropriate group.

All individual labels that makeup the group
appear in the below line item table.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL allows you to choose either an individual label (see step 3) or a group, but not both. |

5. If
   appropriate, adjust the Spool Into location.

VISUAL uses the default location you specified
when setting up Loftware.

6. Specify
   Label Parameters.

![arrow.gif](arrow.gif "arrow.gif")
For PHYSICAL label types:

Starting Count ID
Click the Starting Count ID button to
choose the first count in the print range.

Ending Count ID
- Click the Ending Count ID button to choose
the ending count in the print range.

|  |  |
| --- | --- |
| POSTIT.gif | Before you can choose a tag range, be sure to specify both a starting and ending Count ID. |

Starting Tag Number
Click the Starting Tag Number button to
choose the starting tag number in the print range.

Ending Tag Number
- Click the Ending Tag Number button to
choose the ending tag number in the print range.

|  |  |
| --- | --- |
| POSTIT.gif | Before you can choose a part range, be sure to specify both a starting and ending Count ID and a starting and Ending Tag Number. |

Starting Part ID
Click the Starting Part ID button to choose
the first part in the print range.

Ending Part ID
- Click the Ending Part ID button to choose
the ending part in the print range.

|  |  |
| --- | --- |
| POSTIT.gif | Before you can choose a location range, be sure to specify a starting and ending Count ID, a starting and Ending Tag Number, and a starting and ending Part ID. |

Starting Location ID
Click the Starting Location ID button
to choose the first location in the print range.

Ending Location ID
- Click the Ending Location ID button to
choose the ending location in the print range.

![arrow.gif](arrow.gif "arrow.gif")
For WAREHOUSE label types:

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
choose the ending location in the print range.

7. If
   this print session is for a label group (see step 4), click the
   Insert button
   and add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group. Only
PHYSICAL and WAREHOUSE label types apply.

Description
If appropriate, adjust the default thermal label description.

Print Quantity
Specify a print quantity for this label.

Multiplier Select the Multiplier
check box if you want VISUAL to multiply the
print quantity by the containers per skid by the total skids for the
label.

This setting is especially useful for container labels
that are part of a label group. When selected, VISUAL automatically
creates the appropriate number of carton labels for a shipment. Make
this setting a default using the [Label Printer
Setup Utility](What_is_VISUAL_BTS_.md)

Label
Printer If appropriate, adjust the label printer you want
to use to print these labels.

8. Click the Print Labels
   button to print the labels.

Based
on your starting and ending preference, VISUAL prints a range of thermal
labels for the specified warehouse or counts.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Warehouse_Maintenance.md) User-defined
Help