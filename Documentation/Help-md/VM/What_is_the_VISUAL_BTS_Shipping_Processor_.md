What is the VISUAL BTS Shipping Processor?




# What is the VISUAL BTS Shipping Processor?

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

The BTS Shipping program reads from the BTS\_PENDING\_TRANS database
table and writes into the VISUAL Shipping Entry window.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User-defined
Help