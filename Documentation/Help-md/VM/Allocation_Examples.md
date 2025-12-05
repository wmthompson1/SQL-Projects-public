Allocation Examples




# Allocation Examples

The following examples illustrate how various combinations
of checkboxes and radio buttons selected in your Vmdigen CPO and PLN
layouts affect the way your customer order data is imported into Customer
Order Entry, and customer forecast data into the Customer Forecast
screen.

The Close Partial Shipped Scheds option
takes any delivery schedules for the imported line that have had partial
payments made against them and changes the delivery schedule quantity
to match the total quantity shipped for the delivery schedule.

For example, if you had a delivery schedule of 200, against which
you had already shipped 195, the next time that line item is updated
via Vmdixchg, the delivery schedule quantity is changed to 195. This
setting prevents partially shipped delivery schedules from being shipped
against further.

|  |  |
| --- | --- |
| POSTIT.gif | For all 36 examples, the transmission date (i.e. today's date) is March 7, 2002. |

CPO layout Settings used with the examples in
this section:

Vmdigen - allocation percentages 20% on Monday, Tuesday, Wednesday,
Thursday, and Friday

Vmdixchg - "Delete Unshipped Lines" checkbox - MARKED

Vmdixchg - "Delete Unshipped Schedules" checkbox - MARKED

Vmdixchg - "Close Partial Shipped Scheds" checkbox - MARKED

PLN layout Settings used with the examples in
this section:

Vmdigen - allocation percentages 20% on Monday, Tuesday, Wednesday,
Thursday, and Friday

|  |  |
| --- | --- |
| POSTIT.gif | CPO Transactions may be imported with Quantity settings of either Discrete, or Cumulative based on Shipped Qty. PLN Transactions may be imported with Quantity settings of either Discrete, Cumulative based on Shipped Qty, or Cumulative based on FAB (Build) qty. |

For CPO transactions, the lines in your VDI file that create the
customer order delivery schedules are called "SUB" records.

For PLN transactions, the lines in your VDI file that create the
customer forecast records are called "HDR" records.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.htm) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.htm) PLN Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.htm) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.htm) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.htm)
Working with Subtract Intransit Quantities (CPO CUM Quantities)