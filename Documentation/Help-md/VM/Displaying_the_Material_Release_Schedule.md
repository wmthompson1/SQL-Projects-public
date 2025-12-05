Displaying the Material Release Schedule




# Displaying the Material Release Schedule

Use the Material Release Schedule dialog to view the current state
of the material release schedule. The Material Release Schedule shows
information for the current date only.

To view the material release schedule:

1. Perform one of these
   steps:

* In the DBR
  Scheduler window, select the schedule to use. Then, Select File, Material Release
  Schedule.
* In the Buffer
  Management window, select the site to use. Then, select Info, Material Release
  Schedule.
* In the DBR
  Dashboard, select the site to use. Then, select View,
  Material Release Schedule.

2. By default, all materials
   scheduled for release are displayed. To filter the table, specify
   this information:

Schedule ID 
The schedule you selected in the DBR Scheduler window before you accessed
this dialog box is displayed by default. You can select any other
schedule created for the site.

Part ID 
To view the material release schedule for a particular part, specify
the part ID in this field. Specify the raw material in this field,
not the finished part.

Work Order ID 
To view the material release schedule for a particular work order,
specify the work order ID in this field. The Base ID, Lot ID, and
Split ID for the work order is inserted.

3. Specify the information
   to view in the table. Click one of these options:

Daily Summary 
Click this option to view the total quantity of the materials required.
If you select this option, only the Required Date, Part ID, Warehouse
ID, Remaining Quantity Required, Projected On-hand Quantity, Replenishment
Level, Emergency Level, and Yellow Level are shown.

Daily Detail
Click this option to view each work order that requires material.

Required Date 
Click this option to sort the table by the date each material is required
to be issued to the work order for the work order to be completed
on schedule.

Part ID Click
this option to sort the table by part ID.

Work Order ID
Click this option to sort the table by work order ID.

4. Click the Show
   button.
5. View this information
   in the table:

Required Date 
The date the material is required to be issued to the work order.
The date is displayed in red if the material is late.

Part ID The
ID of the part to be issued.

Work Order ID
The work order ID is inserted.

Oper Seq # The
ID of the operation requiring this material is inserted.

Piece # The
piece number of the material requirement is inserted.

Warehouse ID 
The ID of the warehouse where the finished good is stored is inserted.

Resource ID
The ID of the resource used in the operation is inserted.

Remaining Qty Reqd 
The quantity of material that has not yet been issued to the work
order operation is inserted.

Proj Qty On-hand 
The projected available quantity of the part is inserted. This value
takes supply orders into consideration.

Replenishment Level 
The replenishment level specified for the part in Part Maintenance
is displayed. If you plan by warehouse and an independent warehouse
is displayed in the Warehouse ID column, then the replenishment level
information is the warehouse-specific information. Otherwise, the
replenishment level for your universally planned warehouses is displayed.

Emer. Level 
The emergency stock level for the part is displayed. The emergency
stock level is calculated by multiplying the replenishment level by
emergency stock percentage. If you plan by warehouse and an independent
warehouse is displayed in the Warehouse ID column, then the warehouse-specific
emergency stock percentage and replenishment level is used to calculated
the emergency level. Otherwise, the values specified for your universally
planned warehouses are displayed.

Yellow Level 
The yellow stock level for the part is displayed. The yellow stock
level is calculated by multiplying the replenishment level by yellow
stock percentage. If you plan by warehouse and an independent warehouse
is displayed in the Warehouse ID column, then the warehouse-specific
yellow stock percentage and replenishment level is used to calculated
the yellow level. Otherwise, the values specified for your universally
planned warehouses are displayed.

6. To view information
   about a work order, select a line with a work order and click
   W/O Status. See [Viewing
   Work Order Status Information.](Viewing_Work_Order_Status_Information.htm#XREF_96898_Viewing_Work_Order)

To open the Material Planning Window for
a particular part, select a line with the part and click Planning.

To view the supply order for a particular
material requirement, select the line and click Supply.

To export the information in the table to
Excel, click To Excel....

To exit the dialog box, click Close.