Traceability in Labor Ticket Entry




# Traceability in Labor Ticket Entry

Use Traceability in Labor Ticket Entry to record traceability
information associated with the reporting of completed parts for an
operation. This shifts the start of traceability to the point where
pieces are completed, rather than when they are received into finished
goods inventory.

Each Engineering Master for a traceable fabricated part has one
operation that is specially marked Begin Traceability At This Operation.
When completed pieces are reported for this operation, traceability
information is required. When this option is used, this is usually
the starting point of traceability, and preassigned lot numbers are
often used.

The following context triggers traceability in Labor Ticket Entry:

* Reporting against a work
  order for a fabricated part that is traceable.
* Reporting labor for the
  work order operation that is marked Begin Traceability At This
  Operation.
* Reporting Run labor (not
  setup).
* Reporting a Quantity Completed.

If all these criteria are true, then the Traceability
button at the lower right of the Labor Ticket Entry window becomes
active. For manual Labor Ticket Entry, enter Traceability normally.

1. Click the Traceability
   button.

The Traceability dialog box appears.

2. Create and/or Enter
   Lot Numbers.

The trace record for each existing lot number
that has an unreported quantity appears. Unreported quantities have
yet to be reported through the process being described here. These
lot numbers are usually numbers that were preassigned using Part Trace
Maintenance.

3. Set the quantities.

VISUAL automatically fills in the Quantity
fields of the existing lines, whether they are new lot numbers or
existing ones to distribute the reported quantity completed across
the available lot numbers.

If you are assigning numbers now, click
the Insert button to insert a new line,
and enter the lot number or allow it to be auto-assigned. This depends
upon the setting in the trace profile for the part.

You can keep track of how much of the total
Unreported Quantity you have accounted for by watching the Numbered
Quantity field at the upper right.

This field is the total of all entries in
the Quantity column. You usually want this to equal Total Quantity.

Numbered Quantity can be greater than or
less than Total Quantity. When you click the Close
button, VISUAL warns you and gives you the option of canceling or
accepting the override. If you choose to override, VISUAL automatically
adjusts Quantity Completed to the Numbered Quantity.

4. Enter Properties and
   Comments.

When you create a new lot number, you must
enter all properties at that point; afterwards, you can only change
them using Part Trace Maintenance. If a property is marked as Required
in the traceability profile for the part, you cannot complete the
transaction until you enter a value for the property. Additionally,
you may enter any comments at this point.

5. Modify the Expiration
   Date, if necessary.

If the part you are reporting has a finite
shelf life, the expiration date is set when the lot number is created
by adding the shelf life to the creation date of the trace record.
If necessary, you can override this date at any point.

6. Click the Close
   button to exit the Traceability dialog box.

If Numbered Quantity doesnt equal Total
Quantity, VISUAL gives you the option of aborting the close or overriding
the quantity. If you override, VISUAL resets the Quantity Complete
for the line to the current Numbered Quantity.

If you are using Labor Ticket Entry, click
the Save button to complete the transaction.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help