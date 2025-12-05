Selecting a Receipt Exchange Rate




# Selecting a Receipt Exchange Rate

## Purchase Receipts Rate Applied to A/P Invoice

### Use Receiver Date

The purchase order side allows for line level currency exchange
rates as opposed to storing them at the header. The reason for this
stems from the fact that often times there is a sizable delay from
the receipt of the inventory into the warehouse and the receipt of
the payable invoice. From a regulatory point of view, you should book
the goods as a liability at the time of receipt, which VISUAL does
for you.

In an Actual Cost database, when you receive goods into the warehouse,
VISUAL creates a purchase accrual based on the quantity received and
the price of the purchase order. In a Standard Cost database, the
cost you assign to warehouse inventory, is the standard price of the
part (part maintenance). The difference between the price assigned
to the P/O and the standard price booked is the purchase price variance.

In either case, VISUAL records the exchange rate to the goods in
accordance with this setting. Selecting the Use Receiver Date box
determines inventory if the conversion date applies to the A/P Invoice.

## Purchase Receipt Date (Default)

### Use Invoice Dates

The rate VISUAL applies to the A/P Invoice it determines by the
conversion date that you set earlier. The transaction date determines
which exchange rate to apply unless you have opted to use the System
date.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm)