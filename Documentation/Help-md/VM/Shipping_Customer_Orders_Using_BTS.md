Shipping Customer Orders Using BTS




# Shipping Customer Orders Using BTS

Use the BTS Shipping program to scan outgoing shipments
at the loading dock and send the data to your VISUAL database for
processing. After scanning and processing, the data is available in
your VISUAL database as if you entered the transactions using the
standard Shipping Entry window.

The window is simple to operate. All scanned transactions appear
in the first table window, "Pending Transactions." All processed
transactions appear in the second table window, "Completed Transactions."

The BTS Shipping program runs on a timer, meaning that, at user
specified intervals, the program processes each row in the Pending
Transactions window and looks for more pending transactions from the
database.

The database to which the user is connected and the name of the
user appears in the top left hand corner of the window.

The BTS Shipping program reads from the database table - BTS\_PENDING\_TRANS,
and writes into the VISUAL Shipping Entry window.

The following prompts appear on the scanner/reader when you scan
a shipping transaction:

* Employee ID
* Customer Order ID
* Customer Order Line
* \*From Warehouse ID
* \*From Location ID
* \*Trace ID
* \*Alpha Propertys
* \*Numeric Propertys
* Qty

The prompts marked with an asterisk(\*) are optional and determined
by the customer order origin and/or part traceability of the inventory
being scanned.

The scanner program runs on the reader/scanner and enters the scanned
data after validations into the BTS\_PENDING\_TRANS table.

In the standard VISUAL Shipping Entry window, as part of a standard
transaction, VISUAL prompts you to take actions actions regarding
Ship Quantity values. For example, if you enter a Ship Quantity greater
than the Order Quantity, VISUAL warns you that this will result in
an over-shipment. If you enter a Ship Quantity less than the Order
Quantity, VISUAL asks you what you would like to do with the remaining
balance of the line.

Because these options are not available as the BTS Shipping Transaction
Processor is processing these transactions, VBTS must makes certain
assumptions. Where there is ambiguity, the program generates a log
file and stores the records with a different flag so you can manually
process exceptional transactions using the VISUAL Shipping Entry window.

The assumptions are as follows:

Partial Shipment - VBTS always leave the
order open. There is no backorder

Over Shipment - Do not over ship. The
program does not make an over shipment, but instead writes to a log
file (VMBTSERROR.LOG) and saves the pending transaction with "E"
as the pending\_flag. In this case, VBTS does not save the shipping
transaction in the VISUAL Shipping Entry window.

Close Line Balance - VBTS never closes
a line balance. Instead it assumes that you have additional quantities
to ship. If you want to close this line, you must use the standard
VISUAL Shipping Entry window to do so.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Shipping
Customer Orders Using BTS User Defined Information