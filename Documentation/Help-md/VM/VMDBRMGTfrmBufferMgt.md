Viewing Buffer Status Information




# Viewing Buffer Status Information

After you generate buffer statuses, use the filters to select which
buffers to view in the table. To filter the buffer status table:

1. To filter the parts
   in the table, specify this information:

Part ID 
To view the buffer statuses for a particular part, specify the part
ID.

Warehouse ID 
If you plan by warehouse, specify the warehouse whose part buffers
you want to view. Select a specific independently planned warehouse
from the list to view the buffers for that warehouse. To view buffer
information for your universally planned warehouses, specify Universal.
To view buffer information for all of your warehouse, specify All
Warehouses.

Product Code 
To view buffers for parts assigned to particular product code, specify
the product code ID in this field.

Customer ID 
To view buffer statuses for parts sold to a particular customer, specify
the customer ID.

2. In the Display section,
   specify which buffers to display in the table. You can select:

Time Buffers 
Select this option to view buffers specified in hours. When you select
this option, the Show time buffers of type section becomes available.
Use this section to specify which time buffers to display in the table.

W/O Replenishment Buffers 
Select this option to view work order replenishment buffers.

Purchase Order Buffers
Select this option to view purchase order buffers.

Stocked Material Buffers 
Select this option to view the buffers for your stocked parts. You
can view fabricated stocked parts, purchased stocked parts, or both.

Max Rows 
Specify the maximum number of buffers to view in the table.

3. In
   the Show Zones section, specify which buffer zones to view in
   the table. You can select Red, Yellow, and Green.
4. In the header, the number
   of intrusions and open items for the type of buffer you selected
   in the Display section is inserted in these fields:

Buffer Intrusions 
The total number of buffer intrusions is inserted. Buffer intrusions
are recorded based on your Collect Data for Intrusions setting for
the CCR in DBR Maintenance.

Open Items 
The total number of open items is inserted. An open item can be a
work order or a purchase order is inserted.

Emergency Zone Intrusions
The total number of emergency buffer zone intrusions is inserted.

5. In the table, view information
   about your buffers. The information displayed in the table changes
   based on the buffer type you selected in the Display section.

Status 
The percentage of the buffer consumed is inserted. For time buffers,
the buffer status is the percentage of the time passed relative to
the buffer length. A value over 100 percent indicates that the buffer
time has elapsed and the order is taking longer to complete than anticipated.
For stock buffers, the percentage is calculated by subtracting the
on-hand inventory from the replenishment level, and then dividing
by the replenishment level. This value is multiplied by 100.

Est. % Complete 
An estimate of the percentage of the work order that is complete is
inserted. This information is displayed for time buffers only.

CCR ID 
The ID of the CCR is inserted. For time buffers, either the resource
ID of your CCR or Free W/O is inserted. For work order replenishment
buffers, STOCKED\_PART is inserted.

Work Order ID 
The identification number for the work order is displayed in
the Work Order ID column. This information is displayed for time buffers
and work order replenishment buffers only.

Purchase Order ID 
The ID and the line number of the purchase order is inserted. This
information is displayed for purchase order buffers only.

Part ID 
For time buffers and work order replenishment buffers, the ID of the
part made by the work order is inserted. For purchase order buffers,
the part ID on the purchase order line is inserted. For stocked material
buffers, the stocked part ID is inserted.

Stocked If the
part is a stocked part, then this check box is selected. If the part
is a made-to-order part, then this check box is cleared.

Seq No. 
The operation sequence number where the CCR is used. This information
is displayed for time buffers only. The sequence number is inserted
for resources defined as your CCR only.

Piece No 
The piece number of the material requirement is inserted. The piece
number is displayed only if a buffer is associated with it.

Type  The
type of buffer described on the line is inserted.

Size (in hours)
The size of the buffer in hours is inserted.

Warehouse ID
The ID of the warehouse where the part will be received is inserted.

Buffer Due Date
The date that this buffer is due to be completed is inserted.

Due/Reqd Date 
For time buffers, the date the want date of the work order is inserted.
For purchase order buffers, the desired received date is inserted.

W/O Start Date
The date on which the work order is scheduled to start is displayed.
This information is displayed for time buffers only.

W/O Finish Date
The date on which the work order is scheduled to finish is
displayed. This information is displayed for time buffers only.

Days Late 
If the work order is overdue, the number of days it is late appears.

Emerg. Status 
The emergency status percentage is inserted. This is calculated by
subtracting the Emergency Zone percentage specified in DBR Maintenance
from 100. When a buffer has the emergency status percentage or less
remaining, it is in the red zone.

Yellow Status 
The yellow status percentage is inserted. The top of the yellow status
range is calculated by subtracting the Yellow Zone percentage specified
in DBR Maintenance from 100. When the percentage of buffer remaining
is between this calculation and the emergency status percentage, it
is in the yellow zone.

Desired Qty 
The quantity of material produced by the work order or ordered on
a purchase order is displayed.

Received/Issued Qty 
The quantity of the work order or purchase order is displayed.

Allocated Qty
The quantity of the work order allocated to a customer order line
is displayed.

Fulfilled Qty
The amount of the allocated quantity you have received from the
work order is displayed.

W/O DBR Type 
The type of work order is inserted. These types are used:

R The order is
a made-to-stock order, which is the same as a replenishment order.

O  The order
is made-to-order.

W/O DBR Priority
The priority of the work order is inserted. These priorities are
used:

Emergency (E) 
If your stock level falls below the emergency stock percentage level
(DBR tab of the Part Maintenance window), DBR assigns a priority of
Emergency.

On-time (O) 
This order should be made on time without pushing the order to
a future date to satisfy material availability.

Normal (N) 
This order is scheduled normally.

Problem Class 
To assign a problem class to the item on this line, highlight
the line and select Edit, Buffer Status Problem Class. Specify the
Problem Class, and add comments if necessary. After you assign the
problem class, the problem class code is inserted in this column.
Define problem classes in DBR Maintenance.

Last Piece(s) Sub ID/Seq
ID  The location of the earliest unfinished operation
of each work order leg is inserted.

Emergency Stock Status 
For stocked parts only, the emergency stock percentage for the part.

Yellow Stock Status
For stocked parts only, the yellow stock percentage for the part.