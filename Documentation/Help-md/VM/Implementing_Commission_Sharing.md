Implementing Commission Sharing




# Implementing Commission Sharing

If the sales people of your company work on a commission
basis, you can implement and carry commissions all the way through
from Customer Order Entry to Accounts Payable.

|  |  |
| --- | --- |
| POSTIT.gif | Commission sharing applies to all line items on the order. You cannot set individual sharing on a line item basis. |

## Setting Commission Sharing

Commission Sharing allows to split commission revenue
dollars between two or more sales reps. This information is initially
entered into the customer table through Customer Maintenance.

The standard Commission Sharing defined in Customer Maintenance
defines a percentage of total commission that is shared between the
specified Sales Rep and another one. Note that this percentage is
a portion of the total commission, not of the total order. For example,
consider an order that totals to $100, where its Sales Rep gets a
10% commission, and has a 20% share percent with another rep. The
Sales Rep receives $8, and the other rep receives $2. The total commission
is 10% of $100, or $10. The primary rep receives 80% of this, and
the other rep receives the share percent of 20%.

The Commission Sharing option within Customer Order Entry allows
you to override the standard sharing. This is particularly useful
when the rep has agreed to share commission for a particular order.
You must enter a valid Sales Rep for the order to view and/or override
commission sharing.

Commission sharing does not affect the total commission paid, but
only how it is distributed between reps. You must assure that each
line item shows the proper total commission.

To view and/or override commission sharing:

Select Commission Sharing from the Edit
menu.

The Commission Sharing dialog box appears.

Standard commission sharing for the sales rep for the current order
appears in the upper table for informational use. Overrides for this
order appear in the lower table. Initially, the standard sharing entries
are copied into the override table. You can then add, delete, or modify
lines.

## Adding A Sharing Entry

1. Click the Insert
   button.

A new line appears at the end of the override
table.

2. Type in the Sales Rep
   ID of the rep sharing the commission.

When you leave this field, VISUAL automatically
completes the Name field.

3. Enter the percent commission
   to share.
4. Click the Save
   button to save the new information.

## Modifying a Sharing Entry

You can modify the Share % as necessary by clicking on the Share
% field in the lower portion of the Commissions dialog box and entering
a new value.

You cannot change the rep. If you need to change the sales rep,
delete the line and add a new one.

## Deleting a Commission

1. Select the line you
   want to delete.
2. Click the Delete
   button.

VISUAL marks the line with an X, indicating
that it is marked for deletion.

3. Click the Save
   button to save the deletion.

VISUAL generates appropriate commissions
when the order has shipped and is invoiced.

## Generating Sales Commissions

Use Infor VISUAL Financials to generate sales commissions. From
the Customer Order Entry window, select Generate Sales Commissions
from the Ledger menu to automatically generate
A/P invoices.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help