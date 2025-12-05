Working with the Buffer Table




# Working with the Buffer Table

After you have generated the buffers for a CCR ID,
the information appears in the Buffer table of the DBR Maintenance
window. Each line in the window appears for each buffer of each work
order or engineering master.

The Buffer table window contains the following information:

Work Order ID -
The identification number for the work order appears in the Work Order
ID column.

Seq No. - The appropriate
sequence number of the work order appears in the Seq No. column.

Piece No. - The
appropriate piece number appears in the Piece No. column.

Type - The Type
column contains the type of buffer to which this line refers.

State - The State
column contains the state of the buffer to which this line refers.

Active, Closed,
or M (Engineering Master) may appear in the State column.

Factor - The factor
by which you want to multiply the default buffer size to which this
line refers, appears in the Factor column.

If you want to change this factor at this
time, click the appropriate factor and make the changes you want.
Click Save.

Service Time - The
cumulative service time (in hours) of all the service operations covered
by this buffer, appears in the Service Time column.

Size in Hours -
The size (in hours) of the buffer to which this line refers appears
in the Size in Hours column.

W/O DBR Type - The
type of work order to which the line refers appears in the W/O DBR
Type column.

|  |  |
| --- | --- |
| TIP.gif | The W/O DBR Type only appears on lines that refer to shipping buffers. |

W/O DBR Types are:

Replenishment (R) order
- The DBR priority for a replenishment order depend on the replenishment
and emergency level settings you make on the DBR tab of the Part Maintenance
window.

Make-to-order (O)
- The DBR priority for make-to-order work orders depends on the due
date.

Make-to-stock s
- DBR assigns make-to-stock work orders the lowest priority.

W/O DBR Priority
- The priority of the work order to which this line refers appears
in the W/O DBR Priority column.

|  |  |
| --- | --- |
| TIP.gif | The W/O DBR Priority only appears on lines that refer to shipping buffers. |

W/O DBR Priorities are:

Emergency (E) -
If your stock level falls below the emergency stock percentage level
(DBR tab of the Part Maintenance window), DBR assigns a priority of
Emergency.

On-time (O) - Make
this order on time without pushing the order to a future date to satisfy
material availability.

Normal (N) - Make
this order normally.

Part ID - The part
identification number associated with the work order to which this
line refers appears in the Part ID column.

|  |  |
| --- | --- |
| TIP.gif | The Part ID only appears on lines that refer to shipping buffers. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_DBR_Maintenance.htm) User-defined Help