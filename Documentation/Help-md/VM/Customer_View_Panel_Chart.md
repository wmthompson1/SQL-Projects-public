Customer View Panel Chart




# Customer View Panel Chart

The Customer View Panel shows information about the customers credit
and outstanding balances. The chart has two lines and four bars. All
values are shown in the accounting entitys functional currency.

In Customer Order Entry, the Estimating Window, the Order Management
Window, and AR Invoice Entry, the chart shows information for the
parent accounting entity of the site specified on the header. In Customer
Maintenance, the chart shows information for the accounting entity
specified on the Entity Credit Limit tab. In Receivable Inquiry, use
the drop-down menu at the top of the panel to specify the site whose
parent entity information you want to view.

These two lines are shown:

Credit Limit A line is displayed for
the customers credit limit in the selected entity.

Credit Balance A line is displayed for
the customers credit balance in the selected entity. If the customer
has a negative credit balance, then no line is displayed.  If
you view the Customer View Panel Chart in Customer Order Entry or
the Order Management window, then the credit balance line value matches
the value shown in the Credit Balance field on the Credit tab. The
credit balance is calculated by subtracting the customers outstanding
balance from the credit limit. Specify how to calculate customer outstanding
balance in Accounting Entity Maintenance.

The chart has four bars. The bars show totals for all sites in the
selected accounting entity, including sites you are not allowed to
access. When you click a bar, a grid is displayed showing transactions
that contribute to the total value of the bar.  The grid shows
transactions created in your allowable sites only. As a result, the
total of the transactions shown in the grid may not match the total
shown by the bar.

This table shows information about the bars in the chart:

| Bar | This bar shows... | Click a bar to view... |
| Orders | The total amount of open order lines. A line is open if one of these conditions is true:   * The line has a status   of On Hold, Firmed, or Released. * The line has a status   of Inherit, and the status of the header is On Hold, Firmed,   or Released.   Tax and VAT amounts are not included in the amount calculations. | Order ID The ID of the customer order is displayed. Click an ID to open the order in Customer Order Entry. If you are viewing the Customer View Panel in Customer Order Entry, then the order you select replaces the order you were viewing in order entry.  Desired Ship Date The date that the customer wants the order shipped is displayed.  Order Amt The monetary value of the order. If the order is late, then the amount is displayed in red. An order is considered to be late if it has not shipped by the desired ship date.  Shipped Amt The monetary value of any shipments made against the open lines of the order. Shipments made against closed lines are not included in the calculation.  Currency ID The functional currency ID of the selected accounting entity is displayed.  Site ID The ID of the site where the transaction was created is displayed. |
| Shipped | The total amount of uninvoiced shipments.  Tax and VAT amounts are not included in the amount calculations. | Packlist ID The ID of the packlist used to ship the order. Click the ID to open the shipment in Shipping Entry.  Shipped Amount The monetary value of the shipment. If the order did not ship before the desired ship date, then the value is displayed in red.  Shipped Date The date that the order shipped is displayed.  Ship Via The shipping method used to ship the order is displayed.  Currency ID The functional currency ID of the selected accounting entity is displayed.  Site ID The ID of the site where the transaction was created is displayed.  Order ID The ID of the customer order is displayed. Click an ID to open the order in Customer Order Entry. If you are viewing the Customer View Panel in Customer Order Entry, then the order you select replaces the order you were viewing in order entry. |
| Invoices | The total amount of unpaid invoices.  Tax and VAT amounts are included in the amount calculations. | Invoice ID The ID of the invoice is displayed. Click the ID to open the invoice in Invoice Entry.  Balance Amount The total outstanding balance is displayed. If the amount is overdue, then the amount is displayed in red.  Invoice Date The date of the invoice is displayed.  Invoice Amount The total amount of the invoice is displayed. If the amount is overdue, then the amount is displayed in red.  Paid Amount The amount paid to date is displayed.  Currency ID The functional currency ID of the selected accounting entity is displayed.  Site ID The ID of the site where the transaction was created is displayed. |
| Total | The sum of the orders, shipments, and invoices bars. | View information about all transactions that contribute to the customer balance. The information shown in the table is a combination of the other three bars. The Type column shows whether the transaction is a customer order, a packlist, or an invoice. Click an ID to open the transaction. |