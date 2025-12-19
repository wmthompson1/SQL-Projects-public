Printing Customer Order Acknowledgment Thermal Labels




# Printing Customer Order Acknowledgment Thermal Labels

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from Customer Order Entry?  [ORDERING](javascript:void(0);) |

Customer Order Entry supports the printing of thermal barcode labels
for customer orders and customer order acknowledgments. The default,
and exclusive Label Type for customer orders is ORDERING.

Before you try to print any thermal labels for a customer order
or acknowledgment, design the appropriate thermal labels using the
[Label Printer Setup Utility](VMBTSLPfrmLabelSetup.md).

1. From the File menu,
   select Print Acknowledgment.

The Print dialog box appears.

2. Click the Thermal
   Labels button.

The Print Thermal Labels dialog box appears.

3. Click the Site
   ID arrow and select a site to use.
4. Click the Label
   ID button to select the appropriate label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Only ORDERING (the default customer order label type) label types appear. |

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

7. Specify Label Parameters:

Starting Order ID
Click the Starting Order ID button to
choose the first order in the print range.

Ending Order ID
- Click the Ending Order ID button to choose
the last order in the print range.

If this print session is for a label group
(see step 4), click the Insert button and
add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group. Only
ORDERING label types apply.

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
creates the appropriate number of carton labels for the shipment.
Make this setting a default using the [Label
Printer Setup Utility](VMBTSLPfrmLabelSetup.md)

Label Printer
If appropriate, adjust the label printer you want to use to print
these labels.

8. Click the Print
   Labels button to print the labels.

Based on your starting and ending preference,
VISUAL prints a range of thermal labels for the specified acknowledgments.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help