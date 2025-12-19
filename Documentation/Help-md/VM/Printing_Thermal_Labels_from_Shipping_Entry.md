Printing Thermal Labels from Shipping Entry




# Printing Thermal Labels from Shipping Entry

|  |  |
| --- | --- |
| question_blue.gif | Which types of labels can I print from Shipping Entry?  [SHIPPING](javascript:void(0);)  [SHP TRACEABLE](javascript:void(0);)  [PART\_SHIPPING](javascript:void(0);) |

Shipping Entry supports the printing of thermal barcode labels for
pack lists. Before you try to print any thermal labels for a customer
order or acknowledgment, design the appropriate thermal labels using
the [Label Printer Setup Utility](Defining_Thermal_Labels.md).

1. From the File menu,
   select Print Pack Lists.

The Print Pack List box appears.

2. Click the Thermal
   Labels button.

The Print Thermal Labels dialog box appears.

3. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
4. Click the Label
   ID button to select the appropriate label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Only SHIPPING, SHP TRACEABLE, AND PART\_SHIPPING label types appear. |

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

![arrow.gif](arrow.gif "arrow.gif")
For SHIPPING label types:

Starting Packlist ID
- Click the Starting Packlist ID button
to choose the first pack list in the print range.

Ending Packlist ID
- Click the Ending Packlist ID button to
choose the last pack list in the print range.

![arrow.gif](arrow.gif "arrow.gif")
For SHP TRACEABLE label types:

Starting Line Number
- Click the Starting Line Number button
to choose the starting line number in the pack list.

Ending Line Number
- Click the Ending Line Number button to
choose the ending line number in the pack list.

![arrow.gif](arrow.gif "arrow.gif")
For PART\_SHIPPING label types:

Part ID - Click
the Part ID button to choose a part to print.
Only the parts you've specified [carton
information](Creating_Containers_for_Parts.md) for appear as possible choices.

Ship To ID - If
there is more than one Shipto ID for this part, click the Shipto
ID button and choose the appropriate customer Shipto ID.

On choosing an ID, VISUAL auto-fills the
Customer ID and Container Part ID fields. If you have established
defaults for this customer Shipto ID, VISUAL also auto-fills the Containers
per Skid and Pcs per Container field.

Trace ID - Click
the Trace ID button to select a Trace ID
for the part. A Trace ID is the equivalent of a serial number. If
you'd rather let VISUAL assign Trace IDs, select the Automatically
Assign Trace IDs check box.

Container Per Skid
- Enter the number of containers per skid into the Containers per
Skid field.

Pieces Per Container
- Enter the number of pieces per container into the Pieces per Container
field. VISUAL auto-fills the Skid Qty field with the multiplied value
of these two fields.

For example, if you specify 10 containers
per skid, and pieces per container is 10, VISUAL multiplies the two
and displays 100 in the Skid Quantity field.

If VISUAL is pre-assigning Trace IDs, adjust
the Skid Qty and number of Total Skids.

If you already selected a Trace ID, these
fields are unavailable.

8. If this print session
   is for a label group (see step 4), click the Insert
   button and add individual Label IDs as appropriate.

Enter information as follows:

Label Format -
Double-click the Label Format column header
to choose an individual label to add to the group. Only ORDERING label
types apply.

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
creates the appropriate number of carton labels for the shipment.
Make this setting a default using the [Label
Printer Setup Utility](Defining_Thermal_Labels.md)

Label Printer
- If appropriate, adjust the label printer you want to use to print
these labels.

9. Click the Print
   Labels button to print the labels.

 Based on your starting and ending
preference, VISUAL prints a range of thermal labels for the specified
pack lists.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help