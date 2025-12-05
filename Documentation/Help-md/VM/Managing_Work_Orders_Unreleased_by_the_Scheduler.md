Managing Work Orders Unreleased by the Scheduler




# Managing Work Orders Unreleased by the Scheduler

When you run the scheduler, the scheduler identifies work orders
that are not used to meet demand and unreleases them. You can choose
to reuse these work orders in subsequent scheduling runs. Manage your
unreleased work orders in the Work Orders Unreleased by DBR dialog
box.

To manage these work orders:

1. In the DBR Scheduler
   window, select the schedule to use.
2. Select File,
   Work Orders Unreleased by DBR.
3. By default, all work
   orders unreleased by DBR are displayed. To filter the work orders
   displayed in the table, specify this information:

Part ID 
To view unreleased work orders for a particular part, specify the
ID of the part in this field.

Show All Unreleased Work
Orders  To display all work orders with a status of unreleased,
select this check box. When you select this check box, any unreleased
work order is displayed, not only the work orders unreleased by DBR.
To display only the work orders unreleased by DBR, clear this check
box.

List Reuse Work Orders
First  To display the work order that DBR marked for
reuse first, select this check box. To display the work orders in
the sort order specified regardless of the reuse status, clear this
check box.

4. In the Sort section,
   specify how to sort the work orders. Click Desired
   Want Date, Part ID, or Order ID.
5. View this information
   in the table:

Work Order ID
The ID of the work order is inserted.

Part ID The
finished good made by the work order is inserted.

Unrel by DBR 
If the scheduler unreleased this work order, then this check box is
selected. If the work order was unreleased manually, then this check
box is cleared.

Reuse  If
the scheduler marked this work order for reuse, then this check box
is selected. You can decide which work orders to reuse. See the next
step.

Desired Want Date
The date that the work order is due to be complete is inserted.

Desired Qty
The quantity on the work order is inserted.

Received Qty
The quantity of the part received into inventory is inserted.

Allocated Qty
The quantity of the work order allocated to a demand order.

Fulfilled Qty
The portion of the allocated quantity that has been delivered to
the demand order.

Last Piece(s) Sub ID/Seq
# The location of the earliest unfinished operation is inserted.

6. To specify which work
   orders to reuse, perform any of these steps:
7. To select
   a single work order for reuse, select the Reuse check
   box for the work order in the table.
8. To select
   all work orders for reuse, click the Reuse
   All button.
9. To designate
   no work orders for reuse, click the Reuse None
   button.
10. To restore
    the selections to the previously saved settings, click the Restore button. Use the Restore button
    to undo all of your changes since your last save.

7. Click the Save
   button.
8. Click the Close
   button.

You can perform these additional actions:

To view a work order in the Manufacturing Window, highlight the
work order line in the table and then click View
W/O....

To view a part in the Planning Window, highlight the part line in
the table and then click Planning....

To export the contents of the table to Microsoft Excel, click Export to Excel.