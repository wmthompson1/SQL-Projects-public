Test Printing Thermal Labels




# Test Printing Thermal Labels

After designing a label using [Loftware](http://www.loftware.com/)
and then associating VISUAL database fields to that label, youre
ready to print them. Before printing the label in any of the windows
that support the printing of thermal labels, try test printing a batch
first to avoid having to re-print later.

1. From the File menu,
   select Test Print or click the Test Print button on the main toolbar.

The VISUAL Print Thermal Labels dialog box
appears.

2. Click the Label
   ID button to select the appropriate label.

* |  |  |
  | --- | --- |
  | POSTIT.gif | All existing labels appear. This is the only place in VISUAL where you can print all labels. When printing in a specific application, such as Customer Order Entry, VISUAL allows you access to only those labels applicable to the application. |

3. If the label is part of a group,
   click the Label Group ID button instead
   and select the appropriate group. All individual labels that makeup
   the group appear in the below line item table.

   |  |  |
   | --- | --- |
   | POSTIT.gif | VISUAL allows you to choose either an individual label (see step 3) or a group, but not both. |
4. If appropriate, adjust the Spool
   Into location.

VISUAL uses the default location you specified
when setting up Loftware.

5. Specify label parameters
   according to the [label](Master_Thermal_Label_List.md)
   selected.

|  |
| --- |
| arrow.gif For [TRACEABLE](javascript:void(0);) label types:  Starting Part ID Click the Starting Part ID button to choose the first traceable part in the print range. Only traceable parts are eligible for selection.  Ending Part ID - Click the Ending Part ID button to choose the ending traceable part in the print range. Only traceable parts are eligible for selection.  Starting Transaction ID Click the Starting Transaction ID button to choose the first trace transaction in the range. VISUAL displays receipt transactions by ID.  Ending Transaction ID - Click the Ending Transaction ID button to choose the last trace transaction in the range.  Starting Trace ID Click the Starting Trace ID button to choose the first Trace ID in the range. Only Trace IDs for the selected part range appear.  Ending Trace ID - Click the Ending Trace ID button to choose the last Trace ID for the range. Only Trace IDs for the selected part range appear. |
| arrow.gif For [WO\_LINKED\_CO](javascript:void(0);) label types:  Only work orders linked to customer orders are eligible for selection  Starting Base ID Click the Starting Base ID button to choose the first work order the print range.  Ending Base ID - Click the Ending Base ID button to choose the last work order for the print range.  If rather than a range you choose an individual Base ID with associated lots, VISUAL activates the Starting Lot ID and Ending Lot ID fields. If appropriate, choose a range of lots to print.  Starting Order ID Click the Starting Order ID button to choose the first customer order for the print range.  Ending Order ID - Click the Ending Order ID button to choose the last customer order for the print range. |
| arrow.gif For [WORKORDER](javascript:void(0);) label types:  Starting Base ID Click the Starting Base ID button to choose the first work order Base ID for the print range.  Ending Base ID - Click the Ending Base ID button to choose the last work order Base ID for the print range.  If rather than a range you choose an individual Base ID with associated lots, VISUAL activates the Starting Lot ID and Ending Lot ID fields. If appropriate, choose a range of lots to print. |
| arrow.gif For [PART](javascript:void(0);) label types:  Starting Part ID Click the Starting Part ID button to choose the first part in the print range.  Ending Part ID - Click the Ending Part ID button to choose the last part in the print range.  Starting Warehouse ID Click the Starting Warehouse ID button to choose the first warehouse in the print range.  Ending Warehouse ID - Click the Ending Warehouse ID button to choose the last warehouse in the print range.  Starting Location ID Click the Starting Location ID button to choose the first location in the print range.  Ending Location ID - Click the Ending Location ID button to choose the last location in the print range. |
| arrow.gif For [PHYSICAL](javascript:void(0);) label types:  Starting Count ID Click the Starting Count ID button to choose the first count in the print range.  Ending Count ID - Click the Ending Count ID button to choose the ending count in the print range.  Before you can choose a tag range, be sure to specify both a starting and ending Count ID.  Starting Tag Number Click the Starting Tag Number button to choose the starting tag number in the print range.  Ending Tag Number - Click the Ending Tag Number button to choose the ending tag number in the print range.  Before you can choose a part range, be sure to specify both a starting and ending Count ID and a starting and Ending Tag Number.  Starting Part ID Click the Starting Part ID button to choose the first part in the print range.  Ending Part ID - Click the Ending Part ID button to choose the ending part in the print range.  Before you can choose a location range, be sure to specify a starting and ending Count ID, a starting and Ending Tag Number, and a starting and ending Part ID.  Starting Location ID Click the Starting Location ID button to choose the first location in the print range.  Ending Location ID - Click the Ending Location ID button to choose the ending location in the print range. |
| arrow.gif For [ORDERING](javascript:void(0);) label types:  Starting Order ID Click the Starting Order ID button to choose the first order in the print range.  Ending Order ID - Click the Ending Order ID button to choose the last order in the print range.  If this print session is for a label group (see step 4), click the Insert button and add individual Label IDs as appropriate. |
| arrow.gif For [SHIPPING](javascript:void(0);) label types:  Starting Packlist ID Click the Starting Packlist ID button to choose the first pack list in the print range.  Ending Packlist ID - Click the Ending Packlist ID button to choose the last pack list in the print range. |
| arrow.gif For [SHP TRACEABLE](javascript:void(0);) label types:  Starting Line Number Click the Starting Line Number button to choose the starting line number in the pack list.  Ending Line Number - Click the Ending Line Number button to choose the ending line number in the pack list. |
| arrow.gif For [PART\_SHIPPING](javascript:void(0);) label types:  Part ID Click the Part ID button to choose a part to print. Only the parts youve specified [carton information](Creating_Containers_for_Parts.md) for appear as possible choices.  Ship To ID - If there is more than one Shipto ID for this part, click the Shipto ID button and choose the appropriate customer Shipto ID.  On choosing an ID, VISUAL auto-fills the Customer ID and Container Part ID fields. If you have established defaults for this customer [Shipto ID](Creating_Containers_for_Parts.md) VISUAL also auto-fills the Containers per Skid and Pcs per Container field.  Trace ID - Click the Trace ID button to select a Trace ID for the part. A Trace ID is the equivalent of a serial number. If youd rather let VISUAL assign Trace IDs, select the Automatically Assign Trace IDs check box.  Container Per Skid Enter the number of containers per skid into the Containers per Skid field.  Pieces Per Container - Enter the number of pieces per container into the Pieces per Container field. VISUAL auto-fills the Skid Qty field with the multiplied value of these two fields.  For example, if you specify 10 containers per skid, and pieces per container is 10, VISUAL multiplies the two and displays 100 in the Skid Quantity field.  If VISUAL is pre-assigning Trace IDs, adjust the Skid Qty and number of Total Skids. |
| arrow.gif For [WAREHOUSE](javascript:void(0);) label types:  Starting Warehouse ID Click the Starting Warehouse ID button to choose the first warehouse in the print range.  Ending Warehouse ID - Click the Ending Warehouse ID button to choose the last warehouse in the print range.  Starting Location ID Click the Starting Location ID button to choose the first location in the print range.  Ending Location ID - Click the Ending Location ID button to choose the ending location in the print range. |
| arrow.gif For [LBR TRACEABLE](javascript:void(0);) label types:  Starting Transaction ID Click the Starting Transaction ID button to choose the first trace labor transaction in the print range.  Ending Transaction ID Click the Ending Transaction ID button to choose the last trace labor transaction in the print range.  Starting Work Order ID Click the Starting Work Order ID button to choose the first work order in the print range.  Ending Work Order ID - Click the Ending Work Order ID button to choose the last work order in the print range.  Starting Trace ID - Click the Starting Trace ID button to choose the first trace record in the print range.  Ending Trace ID - Click the Ending Trace ID button to choose the last trace record in the print range. |
| arrow.gif For [PO\_LINKED\_WO](javascript:void(0);) label types:  Only purchase orders linked to work orders are eligible for selection  Starting Order ID Click the Starting Order ID button to choose the first linked purchase order for the print range.  Ending Order ID - Click the Ending Order ID button to choose the last linked purchase order for the print range.  Starting Base ID Click the Starting Base ID button to choose the first work order Base ID for the print range.  Ending Base ID - Click the Ending Base ID button to choose the last work order Base ID for the print range.  If rather than a range you choose an individual Base ID with associated lots, VISUAL activates the Starting Lot ID and Ending Lot ID fields. If appropriate, choose a range of lots to print. |
| arrow.gif For [PURCHASING](javascript:void(0);) label types:  Starting Order ID Click the Starting Order ID button to choose the first purchase order for the print range.  Ending Order ID - Click the Ending Order ID button to choose the last purchase order for the print range.  If rather than a range you choose an individual purchase order with multiple lines, VISUAL activates the Starting Line Number and Ending Line Number fields. If appropriate, choose a range of purchase orders to print. |
| arrow.gif For [RCV TRACEABLE](javascript:void(0);) label types:  Starting Receiver ID Click the Starting Receiver ID button to choose the first receiver in the print range. Only receivers containing traceable parts are eligible for selection.  Ending Receiver ID - Click the Ending Receiver ID button to choose the ending receiver in the print range. Only receivers containing traceable parts are eligible for selection. |
| arrow.gif For [RECEIVING](javascript:void(0);) label types:  Starting Receiver ID Click the Starting Receiver ID button to choose the first receiver in the print range.  Ending Receiver ID - Click the Ending Receiver ID button to choose the ending receiver in the print range. |

6. If this print session
   is for a label group (see step 4), click the Insert
   button and add individual Label IDs as appropriate.

Enter information as follows:

<Label Format>
- Double-click the <Label Format>
column header to choose an individual label to add to the group.

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
Printer Setup Utility](VMBTSLPfrmLabelSetup.md)

Label Printer
If appropriate, adjust the label printer you want to use to print
these labels.

7. Click the Print
   Labels button to print the labels.

Based on your starting and ending preference,
VISUAL prints a range of thermal labels for the specified work orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Label_Printer_Setup_Utility.md) User-defined Help