CPO Discrete Quantities - Example 5




# CPO Discrete Quantities - Example 5

| Quantity: | DISCRETE |
| Subtract Intransit Qty: | NOT Marked |
| Start Proration from Transm Date: | MARKED |
| Include Today in Proration: | NOT Marked |
|  |  |
| Sample of example SUB lines from CPO0044.VDI file: | |
| SUB  0000000000000000000001200203040000000000000217870000 | |
| SUB 0000000000000000000001200203110000000000000327140000 | |
|  |  |
| The two VDI SUB lines listed above are read as follows: | |
| Quantity of 21787 to be shipped by the client during the week of 03/04/2016, where 3/4 is a Monday | |
| Quantity of 32714 to be shipped by the client during the week of 03/11/2016, where 3/11 is a Monday | |
|  |  |
| After importing via Vmdixchg, the delivery schedules for this customer order line item | |
| would show up allocated as follows: |  |
|  |  |
| DATE | QTY |
| 3/8/2016 | 21787 |
| 3/11/2016 | 6543 |
| 3/12/2016 | 6543 |
| 3/13/2016 | 6543 |
| 3/14/2016 | 6543 |
| 3/15/2016 | 6542 |
|  |  |
|  |  |
| Since Today is NOT included in the proration, the qty of 21787 is added only as a delivery schedule for 3/8/02. | |

See the examples below for more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.md) CPO Discrete Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_2.md) CPO Discrete Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_3.md) CPO Discrete Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_4.md) CPO Discrete Quantities Example 4

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_6.md) CPO Discrete Quantities Example 6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_7.md) CPO Discrete Quantities Example 7

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_8.md) CPO Discrete Quantities Example 8

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.md) PLN Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.md) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.md) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.md)
Working with Subtract Intransit Quantities (CPO CUM Quantities)