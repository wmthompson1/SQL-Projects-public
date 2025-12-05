Clearing Accumulators




# Clearing Accumulators

The Clear Accumulators feature of Customer Order Entry
allows you to zero a customer's accumulators at your discretion.

When you choose to clear a customer's accumulators for an order
or a specific subset of orders, VISUAL does not remove Pack list IDs,
inventory transactions, or Trace IDs associated with the order. All
support data remains in the database.

See the chart below for more information on the fields VISUAL clears
when you choose to clear a customer's accumulators.

|  |  |
| --- | --- |
| VISUAL clears the following fields in the CUST\_ORDER\_LINE table: | VISUAL clears the following fields in the CUSTOMER\_ORDER table: |
| EDI\_ACCUM\_SHIP\_QTY | EDI\_ACCUM\_SHIP\_QTY |
| EDI\_ACCUM\_SHIP\_ADJ | EDI\_ACCUM\_AUTH\_QTY |
| EDI\_ACCUM\_FAB\_QTY | EDI\_ACCUM\_BUY\_QTY |
| EDI\_ACCUM\_RAW\_QTY | EDI\_ACCUM\_SHIP\_ADJ |
| EDI\_ACCUM\_QTY\_REC | EDI\_ACCUM\_ORD\_ADJ |
| EDI\_ACCUM\_QTY\_REL |  |
| EDI\_ACCUM\_USR\_REC |  |
| EDI\_ACCUM\_USR\_REL |  |

1. To clear a customer's
   accumulators, select Customer Order Entry
   from the Sales menu.

The Customer Order Entry window appears.

2. From the EDI menu, select
   Clear Cumms.

The Clear Cumms dialog box appears.

3. Enter date in the Accum
   Clear Date field or select an Accum Clear Date by clicking the
   calendar button. You can also right-click the [calendar
   button](Using_the_Calendar_Button.htm) and choose one of 7 different date options, though
   only the 3 "Back..." options are valid selections for
   this field. See the below note.

   |  |  |
   | --- | --- |
   | POSTIT.gif | The date you choose must be prior to the current system date. |

4. From the Order Selection
   section, select the appropriate option:

Current Order Only
- Select the Current Order Only option button if you want to clear
the accumulators of the order currently in the Customer Order Entry
window. This option is unavailable, if you are performing this procedure
without a customer order in the Customer Order Entry window.

To use this option, after step 2 above,
click the Our Order ID button and choose
an EDI order, or begin creating a new EDI order. For more on creating
new sales orders, click [here](VMORDENTfrmCustomerOrder.htm).

by Customer -
Select the by Customer option button if you want to view a list of
all customers for whom there are orders with accumulators.

by Order - Select
the by Order option button if you want to view a list of all customers
orders, for all customers, with accumulators.

5. If you choose by Customer
   or by Order, select which customers or orders you want to clear
   by selecting the line. To select multiple, non-contiguous lines,
   hold down the CTRL key when selecting
   lines.

To select all lines, click the Select
All button located at the bottom of the window.

6. Select the Suppress
   Closed Orders check box if you want VISUAL to ignore customer
   orders that are closed. You may want to select this check box
   to prevent VISUAL from changing information in any orders that
   are closed and approved for invoicing.

Selecting this check box may affect the
number of orders and the customers eligible for clearing in the line
item table.

7. When you have select
   all the lines you want to clear, click the Ok
   button.

VISUAL prompts you to confirm your choices
before it proceeds.

8. Click the Yes
   button to continue or the No button
   to cancel the operation.

VISUAL clears the specified accumulators.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help