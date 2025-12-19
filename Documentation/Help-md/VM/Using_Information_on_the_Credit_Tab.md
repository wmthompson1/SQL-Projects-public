Using Information on the Credit Tab




# Using Information on the Credit Tab

On the Credit tab, the system displays the following basic information
about the customers credit:

Credit Status The system inserts the
value from the Credit Status field in the Credit tab of Customer Maintenance.
When you select a customer for an order, use this field to decide
if you should proceed with the order. If the customer has a credit
status of On Hold or Orders on Hold, you will not be able to complete
the customer order.

Credit Limit The system inserts the
credit limit you specified on the Credit tab in Customer Maintenance.

Credit Balance The system displays the
remaining amount of credit. The system subtracts the total of any
outstanding invoices from the credit limit.

Available Credit % The system expresses
the credit available to the customer as a percentage. The system divides
the credit balance by the credit limit then multiplies by 100.

On Time % The system evaluates the frequency
of on-time settlements. The system examines the invoices due over
the period of time you specified in the Settlement Threshold Days
field and expresses the number of invoices paid on time as a percentage.

Recv Age Limit The system inserts the
receivable age limit you specified on the Credit tab in Customer Maintenance.

# Days Oldest Unpaid Invoice The system
identifies the invoice that has been unpaid the longest and inserts
the number of days old the invoice is in the # Days Oldest Unpaid
Invoice field.

Oldest Unpaid Invoice Term Days The
system inserts the number of days from the date of the oldest invoice
that the net payment is due.

The system uses the Recv Age Limit, # Days Oldest Unpaid Invoice,
the Oldest Unpaid Invoice Term Days, and the Oldest Unpaid Invoice
option you selected on the Credit Limit tab in Customer Maintenance
to determine whether it displays a warning message when you save the
order. For example, say your receivable age limit is 2 days. You have
an invoice that is 5 days old based on the invoice date. Net payment
on the invoice is due in 25 days.

If you use the Determined by Invoice Date option in the Oldest Unpaid
Invoice section in Customer Maintenance, the system would display
a message warning you that the customer has an invoice that exceeds
the receivable age limit. The system would consider the invoice 5
days old, which is greater than the 2 day receivable age limit.

If you use the Determined by Due Date option in the Oldest Unpaid
Invoice section in Customer Maintenance, the system would not display
a warning message. The system would compare the invoice date to the
net due payment date and determine that the customer has 20 days to
make the net payment. Because the payment is not yet overdue, the
system would allow you to add customer orders without a warning message.
If the invoice was 30 days old based on the invoice date and net payment
was due 25 days from the date of the invoice, then the system would
calculate that the invoice is 5 days overdue and display a warning
message when you try to save the customer order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help