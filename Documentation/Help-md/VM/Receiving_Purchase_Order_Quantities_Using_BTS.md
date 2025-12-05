Receiving Purchase Order Quantities Using BTS




# Receiving Purchase Order Quantities Using BTS

The BTS Receiving program can be used for ease of
data entry. In fact, no data entry is required at all. You can scan
the shipments you receive at the receiving dock using a scanner program.
The data then goes to your VISUAL database. The BTS Receiving program
read the database for all the receiving scanned transactions, processes
them, and then enter them into the VISUAL database. After this process,
they are available to the VISUAL System as if you entered them using
the standard Purchase Receipts Entry screen.

After you have scanned the label or barcode, transactions move from
the Pending Transaction table to the Completed Transactions table.
VISUAL BTS processes the transactions as you scan the appropriate
labels or barcodes.

The reader inserts transactions into the BTS\_PENDING\_TRANS table
through the following prompts:

* Employee ID
* Purchase Order ID
* Purchase Order Line
* \*To Warehouse ID
* \*To Location ID
* \*To Workorder/Lot/Split/Sub/Operation
  Seq No/Material Seq No
* \*Trace ID
* \*Alpha Propertys
* \*Numeric Propertys
* Qty

The prompts that are marked with an asterisk(\*) are optional and
depend on the scanned purchase order.

[Click
here for an example of the receipt of goods from a purchase order
using VBTS](An_Example_of_the_Receipt_of_Goods_From_a_Purchase_Order_Using_VBTS.htm)

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Receiving
PO Quantities using BTS User Defined Information