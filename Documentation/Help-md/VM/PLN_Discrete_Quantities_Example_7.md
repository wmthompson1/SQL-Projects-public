PLN Discrete Quantities - Example 7




# PLN Discrete Quantities - Example 7

Quantity: - DISCRETE

Subtract Intransit Qty: - MARKED

Start Proration from Transm Date: - MARKED

Include Today in Proration: - NOT Marked

Sample of example HDR lines from PLN0044.VDI file:

HDRGATERU 24361599920020304000000000000021787000003761-04

HDRGATERU 24361599920020311000000000000032714000003761-04

The two VDI HDR lines listed above are read as follows:

Quantity of 21787 is forecasted for the week of03/04/2002, where
3/4 is a Monday

Quantity of 32714 is forecasted forthe week of03/11/2002, where
3/11 is a Monday

After importing via Vmdixchg, the customer forecast records on the
Customer Forecasts screen would show up allocated as follows:

DATE - QTY

3/8/2002 - 18787

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
yet included in their EDI accum quantity).Vmdixchg takes the first
incoming HDR quantity, subtracts the intransit and then allocates
over the days specified in the layout. In the line item in this example,
Our Total Shipments is 47384 and Their EDI Accum Quantity is 44384
resulting in an intransitquantity of 3000.The 21787 quantity less
3000 equals 18787. 18787 is the quantity that is allocated for the
week of 3/4/02 (20% each weekday). Because Today is NOT included in
the proration, the qty of 18787 is added only as a delivery schedule
for 3/8/02.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.htm) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.htm) PLN Discrete Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_2.htm) PLN Discrete Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_3.htm) PLN Discrete Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_4.htm) PLN Discrete Quantities Example 4

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_5.htm) PLN Discrete Quantities Example 5

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_6.htm) PLN Discrete Quantities Example 6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_8.htm) PLN Discrete Quantities Example 8

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.htm) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.htm) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.htm)
Working with Subtract Intransit Quantities (CPO CUM Quantities)