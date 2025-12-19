PLN Discrete Quantities - Example 4




# PLN Discrete Quantities - Example 4

Quantity: DISCRETE

Subtract Intransit Qty: MARKED

Start Proration from Transm Date: NOT Marked

Include Today in Proration: MARKED

Sample of example HDR lines from PLN0044.VDI file:

HDRGATERU 243615999 20020304000000000000021787000003761-04

HDRGATERU 243615999 20020311000000000000032714000003761-04

The two VDI HDR lines listed above are read as follows:

Quantity of 21787 is forecasted for the week of 03/04/2002, where
3/4 is a Monday

Quantity of 32714 is forecasted for the week of 03/11/2002, where
3/11 is a Monday

After importing via Vmdixchg, the customer forecast records on the
Customer Forecasts screen would show up allocated as follows:

DATE - QTY

3/4/2002 - 3759

3/5/2002 - 3757

3/6/2002 - 3757

3/7/2002 - 3757

3/8/2002 - 3757

3/11/2002 - 6543

3/12/2002 - 6543

3/13/2002 - 6543

3/14/2002 - 6543

3/15/2002 - 6542

Note: The first discrete quantity in this VDI file is 21787 on 3/4/02.
Rather than just dividing up that figure as 20% on each weekday (per
the layout), the intransit quantity must first be subtracted out (because
we have that checkbox marked in the layout). To calculate the Intransit
Quantity, Vmdixchg subtracts Their EDI Accum Quantity from Our Total
Shipments (that difference is what we have shipped and they have not
yet included in their EDI accum quantity). Vmdixchg takes the first
incoming HDR quantity, subtracts the intransit and then allocates
over the days specified in the layout. In the line item in this example,
Our Total Shipments is 47384 and Their EDI Accum Quantity is 44384
resulting in an intransit quantity of 3000. The 21787 quantity less
3000 equals 18787. 18787 is the quantity that is allocated for the
week of 3/4/02 (20% each weekday).

Because the customer forecast (HDR) data received from our trading
partner includes quantities prior to today and we are NOT starting
the proration on the transmission date, Today is automatically included
in the proration. As a result, examples 11 and 12 create the same
set of customer forecasts.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.md) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.md) PLN Discrete Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_2.md) PLN Discrete Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_3.md) PLN Discrete Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_5.md) PLN Discrete Quantities Example 5

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_6.md) PLN Discrete Quantities Example 6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_7.md) PLN Discrete Quantities Example 7

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_8.md) PLN Discrete Quantities Example 8

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.md) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.md) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.md)
Working with Subtract Intransit Quantities (CPO CUM Quantities)