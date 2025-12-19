Defining Thermal Labels




# Defining Thermal Labels

|  |  |
| --- | --- |
| POSTIT.gif | Thermal labels are present throughout much of Infor VISUAL. You can print thermal labels in the following programs:  purple_right_sm.gif [Customer Order Entry/Order Management Window](Printing_Customer_Order_Acknowledgment_Thermal_Labels.md)  purple_right_sm.gif [Shipping Entry](Printing_Thermal_Labels_from_Shipping_Entry.md)  purple_right_sm.gif [Physical Inventory Count](Printing_Thermal_Labels_for_Tags_and_Tag_Lists.md)  purple_right_sm.gif [Part Maintenance](Printing_Thermal_Labels_for_Parts_Auto.md)  purple_right_sm.gif [Warehouse Maintenance](Printing_Warehouse_Thermal_Labels.md)  purple_right_sm.gif [Purchase Order Entry](Printing_Purchase_Order_Thermal_Labels.md)  purple_right_sm.gif [Purchase Receipt Entry](Printing_Purchase_Receipt_Thermal_Labels.md)  purple_right_sm.gif [Inventory Transaction Entry](Printing_Part_Thermal_Labels.md)  purple_right_sm.gif [Labor Ticket Entry](Printing_Labor_Ticket_Thermal_Labels.md)  purple_right_sm.gif [Work Order Travellers](Printing_Work_Order_Traveller_Thermal_Labels.md)  purple_right_sm.gif [IBT Shippers](Printing_IBT_Shipper_Thermal_Labels.md)  purple_right_sm.gif [IBT Receivers](Printing_IBT_Receipt_Thermal_Labels.md)  You can also print labels in VISUAL Shop Floor. |

1. Either click the Label ID button to browse a list of all existing
   labels or enter a unique ID into the field.

Also, you can browse by description by clicking
the Description button.

This is the name of the new label format.

2. From the Label
   Type list box, select a [label type](javascript:void(0);) for
   the format.

Depending on your selection, the database
tables to which you have access appear in the available data fields
below.

3. If the label is new,
   enter a description for the label into the Description
   field. Click the Description button to view a list of existing
   labels, by description.
4. From the Label Printer
   list box, select a thermal label printer to use as the default
   printer for this label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Before a printer is eligible for selection, your operating system must recognize it as an installed and configured device, either on a network or locally. See your Windows system documentation for more information installing and configuring printers. |

5. Click the Label
   File button to browse for the Loftware file (the extension
   is .lwl) you want to use for this thermal label.

   |  |  |
   | --- | --- |
   | POSTIT.gif | To access the field names you have used in your label designs, VISUAL must have access to the corresponding .tab file. A .tab file is a text file containing label data fields for the label. |

The path appears in the Label Format field.
For example,

 C:\PROGRAM FILES\Loftware Labeling\LABELS\TEST\_PART.lwl

6. Enter the number of
   copies of this label you want to print into the Copies field.
   VISUAL uses this as the default for this label. You can override
   this value manually before printing the actual labels from a VE
   application.
7. If this label is used
   primarily for shipping and may be placed on shipping cartons,
   select the Multiplier check box. This
   instructs VISUAL to multiply this label by the number of containers
   on a pallet, allowing you to print multiple labels for one carton.

For example, enter 3 to print three labels
for each container.

8. Select which fields
   from the available database fields you want to use for this label.

Available Data Tables
After selecting label type (see step 2), VISUAL displays the database
tables to which you have access in the Available Data Tables list
box. Select a database table to view its columns in the Available
field. See the next item.

Available After
select a database table from the Available Data Tables list box (see
above item), choose which database columns you want to add to the
label by selecting the entry and then double-clicking it or selecting
the entry and clicking the Right arrow button.

Selected Date Field
These are the VISUAL database columns you want to link to Loftware
label fields. To move a column into the Selected Data Field table,
double-click it, drag and drop it, or select the column and click
the Right Arrow button.

9. Match VISUAL database
   columns to Loftware fields by arrange the database fields and
   label fields that you want to associate so that they are next
   to one another in their respective field boxes, as shown in the
   above graphic.

The type of label appears in the Data Type
field. Types include Text, for text-only labels, and barcode, for
conventional barcodes.

10. After you have linked
    the fields and entered all necessary information, click the Save button on the main toolbar or select
    Save from the file menu to save the new label format.
11. After defining labels,
    [test print](Test_Printing_Thermal_Labels.md) them.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Label_Printer_Setup_Utility.md) User-defined Help