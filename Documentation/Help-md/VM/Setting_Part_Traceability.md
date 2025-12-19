Setting Part Traceability




# Setting Part Traceability

Traceability in Labor Ticket Entry records traceability
information associated with the reporting of completed parts for an
operation. This shifts the start of traceability to the point where
pieces are completed, rather than when they are received into finished
goods inventory.

Each Engineering Master for a traceable fabricated part has one
operation that is specially marked Begin Traceability At This Operation.
When completed pieces are reported for this operation, traceability
information is required.

The Traceability button at the lower right
of the Labor Ticket Entry window becomes active if the following conditions
are true:

* Reporting against a work
  order for a fabricated part that is traceable
* Reporting labor for the
  work order operation that is marked Begin Traceability At This
  Operation
* Reporting Run labor (not
  setup)
* Reporting a Quantity Completed

If the transaction or line items refer to traceable parts, you should
first enter all data to complete the transaction or transaction line
items in the normal way.

1. Click the Part
   Traceability button.

The Traceability dialog box appears.

In the Part Traceability dialog box, you
can view a part's history. The dialog box displays the quantity reported,
the lot number, comments, and the part's expiration date.

2. To override the trace
   quantity from the Labor Ticket Entry window, click in the Quantity
   and enter a new quantity.

If you change the quantity reported, VISUAL
asks you to confirm your new quantity.

3. Click Ok
   to set the new quantity, or Cancel to
   return to the Traceability dialog box.
4. If you are assigning
   numbers now, rather than using preassigned numbers, click the
   Insert button.

A new line appears in the table.

5. Enter the lot number
   or allow it to be auto-assigned. This depends upon the setting
   in the trace profile for the part.
6. Enter a quantity in
   the quantity field.

You are allowed to have a Quantity be greater
than or less than Total Quantity. When you click the Close
button, the dialog box shown above appears. If you choose to override
the quantity, Quantity Completed automatically adjusts to the Numbered
Quantity.

7. Enter comments in the
   Comments column.
8. Enter an Expiration
   Date.

If the part you are reporting has a finite
shelf life, the expiration date is set when the lot number is created
by adding the shelf life to the creation date of the trace record.
If necessary, you can override this date here.

9. Click the Close
   button to exit the Traceability dialog box.
10. Click the Save
    button in the Labor Ticket Entry window to complete the transaction.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.md) User-defined Help