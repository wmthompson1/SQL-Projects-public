Vendor View Panel Chart




# Vendor View Panel Chart

The Vendor View Panel shows information about your outstanding transactions
with the vendor. Information is shown at the accounting entity level.

In Purchase Order Entry, the Purchase Management Window, Purchase
Requisition Entry, the Material Planning Window, and AP Invoice Entry,
the chart shows information for the parent accounting entity of the
site specified on the header.  In Vendor Maintenance and Accounts
Payable Inquiry, use the drop-down menu at the top of the panel to
specify the accounting entity.

In the Material Planning Window, the panel is displayed for purchased
parts only. Information is shown for the preferred vendor of the part.
In all other cases, information is shown for the vendor selected in
the main window.

All values are shown in the accounting entitys functional currency.

This table shows information about the bars in the chart:

| Bar | This bar shows... | Click a bar to view... |
| Orders | The total amount of open orders. If any lines on the order have been completely received, then those lines are not included in the calculation. An open order has the status of Firmed or Released.  Sales tax and VAT are not included in the amount calculations. | Order ID The ID of the purchase order is displayed. Click an ID to open the order in Purchase Order Entry. If you are viewing the Vendor View Panel in Purchase Order Entry, then the order you select replaces the order you were viewing in order entry.  Desired Recv Date The date that you want to receive the order is displayed.  Order Amt The monetary value of the order line. If the order is late, then the amount is displayed in red. An order is considered to be late if it has not been received the desired receive date.  Received Amt The monetary value of any receipts made against the order. Only partial receipts are considered. If a particular line on the purchase order is closed, the line is not considered in the calculation.  Currency ID The functional currency ID of the current sites parent accounting entity is displayed.  Site ID The Site ID associated with the transaction is displayed. |
| Received | The total amount of uninvoiced receipts.  Sales tax and VAT are not included in the amount calculations. | Receiver ID The ID of the receiver and the receiver line are displayed. Click the ID to open the receipt in Purchase Receipt Entry.  Received Amount The monetary value of the receipt. Only uninvoiced values are shown. If the order was not received before the desired receive date, then the value is displayed in red.  Received Date The date that the order was received is displayed.  Purchase Order ID The ID of the purchase order that was received. Click the ID to open the order in Purchase Order Entry.  Ship Via The shipping method that the vendor used to ship the order is displayed.  Currency ID The functional currency ID of the current sites parent accounting entity is displayed.  Site ID The Site ID associated with the transaction is displayed. |
| Invoices | The total amount of unpaid invoices.  Sales tax and VAT are included in the amount calculations. | Voucher ID The ID of the voucher is displayed. Click the ID to open the voucher in Accounts Payable Invoice Entry.  Balance Amount The total outstanding balance is displayed. If the amount is overdue, then the amount is displayed in red.  Invoice Date The date of the invoice is displayed.  Invoice Amount The total amount of the invoice is displayed. If the amount is overdue, then the amount is displayed in red.  Paid Amount The amount paid to date is displayed.  Currency ID The functional currency ID of the current sites parent accounting entity is displayed.  Site ID The Site ID associated with the transaction is displayed. |
| Total | The total amount of open orders, uninvoiced receipts, and unpaid invoices. | Information about all transactions that contribute to your open balance with the vendor. The information shown in the table is a combination of the other three bars. The Type column shows whether the transaction is a purchase order, a receiver, or an invoice. Click an ID to open the transaction. |