Sample Macro: Set Order ID Equal to Today's Date




# Sample Macro: Set Order ID Equal to Today's Date

In this sample macro, an order ID is created by combining the year,
month, day, hour, and minute when you create a new order. This sample
uses the OnNew macro type.

To create this macro:

1. In Customer Order Entry
   or Purchase Order Entry, select Macros, Edit.
2. In the Macro Name field,
   specify OnNew.
3. Enter the following
   code:

Dim n

n = Now

ORDER\_ID = Year(n) & Month(n) & Day(n) &
Hour(n) & Minute(n)

4. Save the code and close
   the dialog.
5. Create a new order.
   The ID is constructed for you.