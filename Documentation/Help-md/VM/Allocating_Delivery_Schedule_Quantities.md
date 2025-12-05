Allocating Delivery Schedule Quantities




# Allocating Delivery Schedule Quantities

Vmdigen allows you to allocate delivery schedule quantities
over any days of the week. This feature is very useful for EDI users
whose EDI trading partners send them weekly delivery schedule quantities
yet require them to ship a certain percentage of quantity each day.

For PLN Allocations, see the section named Allocating PLN Forecasts
for additional requirements. If you will also need to update Customer
Order Line Item Accumulator fields when importing your PLN documents,
see [Allocating PLN Forecasts](Allocating_PLN_Forecasts.htm)
& [Updating Line
Item Accumulator](Updating_Line_Item_Accumulators.htm) fields.

1. With either a [CPO](javascript:void(0);) or [PLN](javascript:void(0);) Key in the VMDIGEN window,
   select Delivery Schedule Allocation
   from the Options menu.

The Allocate Delivery Schedule dialog box
appears.

2. Click the Customer
   ID button to choose the customer for whom you want to set
   up a delivery schedule allocation scheme.
3. Click the Ship
   To ID button to choose the customer Ship To ID to use.

A customer must have at least one Ship To
ID to complete this procedure.

The Day of Week table is auto-filled.

4. Select the Subtract
   Intransit Quantity and/or Start Proration
   from Transmission Date check boxes as appropriate.

Click [here](Allocation_Examples.htm)
for more information on how these options affect delivery schedule
allocation.

5. Specify a percentage
   of allocation across the seven-day week. The total percentage
   for the week must equal 100.

Use decimals to enter whole number values.
For example, .20 equals 20%.

Saturday - Enter
the percentage out of 100 of allocation to occur on Saturday.

Sunday - Enter
the percentage out of 100 of allocation to occur on Sunday.

Monday - Enter
the percentage out of 100 of allocation to occur on Monday.

Tuesday - Enter
the percentage out of 100 of allocation to occur on Tuesday.

Wednesday - Enter
the percentage out of 100 of allocation to occur on Wednesday.

Thursday - Enter
the percentage out of 100 of allocation to occur on Thursday.

Friday - Enter
the percentage out of 100 of allocation to occur on Friday.

6. Click Save
   to save the customer delivery schedule allocation scheme.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help