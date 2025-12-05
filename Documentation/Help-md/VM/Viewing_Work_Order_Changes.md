Viewing Work Order Changes




# Viewing Work Order Changes

To view the work order changes made by the DBR Scheduler after a
scheduling run, use the Work Order Changes dialog box.

The Work Order Changes dialog box is populated with all of the changes
the DBR Scheduler made to your work orders, the part involved, and
what changes were made. The information is written to the VMDBRWOC.CSV
file stored in your program directory. The Work Order Changes dialog
is populated from the file.

You can open the VMDBRWOC.CSV file by selecting the Open option
on the File menu. The associated program is started and the VMDBRWOC.CSV
file is opened. For example, if Microsoft Office Excel is associated
with .csv files, Excel is started and VMDBRWOC.CSV is opened.

You can view work order changes by schedule only.

To view work order changes in the Work Order Changes dialog box:

1. In
   the DBR Scheduler window, select the schedule to use.
2. Select File,
   Work Order Changes....
3. View this information:

Event No 
The sequence in which this event was written to the log file. The
event number indicates the order in which this change to a work order
was processed.

Type The type
of change is inserted. These types are used:

Date  This
indicates that the want date of the work order was changed.

Deleted  This
indicates that the work order was deleted.

New This indicates
that a new work order was created.

Quantity This indicates
that the quantity on the work order was changed.

Status This indicates
that the work order status was changed.

Work Order 
The ID of the work order is inserted. To open the work order in the
Manufacturing Window, double-click the cell.

Part ID 
The ID of the part manufactured in the work order is inserted. To
open the work order in the Material Planning Window, double-click
in the cell.

Message 
A description of the action took by the scheduler is inserted.

4. To hide any of the columns
   in the table, use the Display menu.
5. Select File,
   Exit to close the dialog box.