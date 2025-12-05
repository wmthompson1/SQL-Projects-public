Using Material Trace History




# Using Material Trace History

Material Trace History allows you to view multiple
levels of Trace IDs for materials that move through your enterprise.
You can browse by Trace ID or Part ID, view the results in a forward
or backward direction, and print the results.

1. Select Inventory,
   Material Trace History.
2. Click the Site ID drop-down
   arrow and select a site to use.
3. Click the Part ID button to
   specify the part to view.
4. Click the Trace ID browse
   button and specify the trace to view. Only the Trace IDs belonging
   to the Part ID you specified are shown in the browse table.

If you know the Trace ID, you can specify
it first.

5. Select these settings
   for your trace history run:

Filter
by Part ID/Trace ID If you select this check box, then the
table shows only the Part ID and Trace ID that you specified, plus
any other traced parts that are part of the traceability chain. Clear
this check box to view all trace information for the transactions
that match your search criteria. For example, presume you shipped
a quantity of 10 TRACED\_PART\_A. You used trace ID ABC123 for five
of the traced parts, and trace ID XYZ789 for the other five parts.
In Material Traceability History, you specify TRACED\_PART\_A as the
Part ID and ABC123 as the Trace ID, and run a forward trace. If you
select the check box, then only the row for TRACED\_PART\_A and trace
ID ABC123 is displayed, along with any subordinate traced parts that
are included in TRACED\_PART\_A. If you clear the check box, then a
row for TRACED\_PART\_A/ABC123 and a row for TRACED\_PART\_A/XYZ789 are
displayed, along with the subordinate traced parts.

Show
Co-products To show co-products in the history table connected
to the trace if you build co-products on the work order, select the
Show Co-products check box.

Trace History For
Select the number of levels of history to display in the table.
You can select either One Level or All.

Trace Direction
Select the direction to run the trace:

Backward
For the Part ID and Trace ID, select the Backward option to view
from where the trace came.

Forward
For the Part ID and Trace ID, select the Forward option to view
where the trace is going.

Part Type
Select the type of parts to show in the table. You can select All
Parts, Fabricated Parts Only, or Purchased Parts Only.

5. Click Search.

If a trace history exists for the Trace
ID, VISUAL populates the table with trace history lines.

The
table contains the following columns:

Made by - If you
are viewing the trace backward, VISUAL populates this column with
the Part ID associated with the Trace ID. If you are viewing this
trace forward, this column is empty.

The Trace ID in this column was "made
by" the Work Order ID that is displayed in the corresponding
Work Order column.

Used In - If you
are viewing the trace forward (see later), VISUAL populates this column
with the Part ID associated with the Trace ID. If you are viewing
this trace backward, this column is empty.

Level - The level
at which this history exists. If the material trace record is from
a work order, linked to a customer order, it is a level 1.

Trace ID - The
Trace ID associated with the material.

Description -
A description of the Part ID associated with the Trace ID.

Work Order - The
work order to which the part, and thus the Trace ID, is linked.

Cust Order ID
- The customer order to which the part, and thus the Trace ID, is
linked. To view a material trace history for a part, it must be linked
from a customer order to a work order. Upon shipping, VISUAL receives
the finished goods and creates a trace history for the part-from customer
order, to work order.

Receipt Date -
The date on which the part was received, or shipped, to the customer.

Issue Date - The
date on which the part was issued.

Qty - The quantity
of parts received or issued.

Alpha 1-5 - Any
associated alpha properties labels. Enter alpha properties labels
in Part Trace Profile Maintenance.

Num 1-5 - Any
associated numeric properties labels. Enter numeric properties labels
in Part Trace  Profile Maintenance.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Trace_History.htm) User-defined Help