PLN Discrete Quantities - Example 8




# PLN Discrete Quantities - Example 8

Quantity: - DISCRETE

Subtract Intransit Qty: - MARKED

Start Proration from Transm Date: - MARKED

Include Today in Proration: - MARKED

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

3/7/2002 - 9394

3/8/2002 - 9393

3/11/2002 - 6543

3/12/2002 - 6543

3/13/2002 - 6543

3/14/2002 - 6543

3/15/2002 - 6542

Because Today IS included in the proration, the qty of 18787 is
added as delivery schedules for 9394 on 3/7/02 and 9393 on 3/8/02.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.md) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.md) PLN Discrete Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_2.md) PLN Discrete Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_3.md) PLN Discrete Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_4.md) PLN Discrete Quantities Example 4

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_5.md) PLN Discrete Quantities Example 5

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_6.md) PLN Discrete Quantities Example 6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_7.md) PLN Discrete Quantities Example 7

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.md) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.md) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.md)
Working with Subtract Intransit Quantities (CPO CUM Quantities)