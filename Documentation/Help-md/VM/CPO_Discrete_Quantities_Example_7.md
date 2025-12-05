CPO Discrete Quantities - Example 7




# CPO Discrete Quantities - Example 7

|  |  |  |
| --- | --- | --- |
| Quantity: | DISCRETE |  |
| Subtract Intransit Qty: | MARKED |  |
| Start Proration from Transm Date: | MARKED |  |
| Include Today in Proration: | NOT Marked |  |
|  |  |  |
| Sample of example SUB lines from CPO0044.VDI file: | |  |
| SUB 0000000000000000000001200203040000000000000217870000 | | |
| SUB 0000000000000000000001200203110000000000000327140000 | | |
|  |  |  |
| The two VDI SUB lines listed above are read as follows: | |  |
| Quantity of 21787 to be shipped by the client during the week of 03/04/2016, where 3/4 is a Monday | | |
| Quantity of 32714 to be shipped by the client during the week of 03/11/2016, where 3/11 is a Monday | | |
|  |  |  |
| After importing via Vmdixchg, the delivery schedules for this customer order line item | | |
| would show up allocated as follows: |  |  |
|  |  |  |
| DATE | QTY |  |
| 3/8/2016 | 18787 |  |
| 3/11/2016 | 6543 |  |
| 3/12/2016 | 6543 |  |
| 3/13/2016 | 6543 |  |
| 3/14/2016 | 6543 |  |
| 3/15/2016 | 6542 |  |
|  |  |  |
| Note: The first discrete quantity in this VDI file is 21787 on 3/4/16. Rather than just dividing up that | | |
| figure as 20% on each weekday (per the layout), the intransit quantity must first be subtracted out | | |
| (because we have that checkbox marked in the layout). To calculate the Intransit Quantity, Vmdixchg | | |
| subtracts Their EDI Accum Quantity from Our Total Shipments (that difference is what we have | | |
| shipped and they have not yet included in their EDI accum quantity). Vmdixchg takes the first | | |
| incoming SUB quantity, subtracts the intransit and then allocates over the days specified in the | | |
| layout. In the line item in this example, Our Total Shipments is 47384 and Their EDI Accum | | |
| Quantity is 44384 resulting in an intransit quantity of 3000. The 21787 quantity less 3000 | | |
| equals 18787. 18787 is the quantity that is allocated for the week of 3/4/16 (20% each weekday) | | |
|  |  |  |
| Since Today is NOT included in the proration, the qty of 18787 is added as a delivery schedule | | |
| for 3/8/16. |  |  |

See the examples below for more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.htm) CPO Discrete Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_2.htm) CPO Discrete Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_3.htm) CPO Discrete Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_4.htm) CPO Discrete Quantities Example 4

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_5.htm) CPO Discrete Quantities Example 5

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_6.htm) CPO Discrete Quantities Example 6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_8.htm) CPO Discrete Quantities Example 8

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.htm) PLN Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.htm) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.htm) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.htm)
Working with Subtract Intransit Quantities (CPO CUM Quantities)