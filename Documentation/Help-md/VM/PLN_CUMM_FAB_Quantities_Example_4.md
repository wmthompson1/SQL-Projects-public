PLN CUMM FAB Quantities - Example 4




# PLN CUMM FAB Quantities - Example 4

|  |  |  |
| --- | --- | --- |
| Quantity: | CUMULATIVE - BASED ON FAB QTY | |
| Subtract Intransit Qty: | N/A (because Cumm is based on FAB qty, not Shipped qty) | |
| Start Proration from Transm Date: | MARKED |  |
| Include Today in Proration: | MARKED |  |
|  |  |  |
| Sample of example HDR lines from PLN0001.VDI file: | |  |
| HDRFORDMO EF06A 200203040000000000005649600000XF1E 8594 CA | | |
| HDRFORDMO EF06A 200203110000000000005959040000XF1E 8594 CA | | |
| HDRFORDMO EF06A 200203180000000000005959040000XF1E 8594 CA | | |
|  |  |  |
| Note: The sample PLN0001records listed above are used in Examples 33 - 36 | | |
|  |  |  |
| In the "Cumm - Based on FAB Qty" examples, Our Total Shipments is 437680, Their EDI Accum Qty | | |
| is 434400, and FAB (Build) is 451680. | |  |
|  |  |  |
| After importing via Vmdixchg, the customer forecast records on the Customer Forecasts screen | | |
| would show up allocated as follows: |  |  |
|  |  |  |
| DATE | QTY |  |
| 3/7/2002 | 56640 |  |
| 3/8/2002 | 56640 |  |
| 3/11/2002 | 6189 |  |
| 3/12/2002 | 6189 |  |
| 3/13/2002 | 6189 |  |
| 3/14/2002 | 6189 |  |
| 3/15/2002 | 6188 |  |
| 3/18/2002 | 0 |  |
| 3/19/2002 | 0 |  |
| 3/20/2002 | 0 |  |
| 3/21/2002 | 0 |  |
| 3/22/2002 | 0 |  |
|  |  |  |
| Note: when importing PLN transactions with the Cumulative - FAB Qty settings selected, | | |
| VISUAL searches existing customer orders for one that matches the customer id and part that is | | |
| imported on the PLN. VISUAL subtracts the FAB (Build) qty (on the Line Accumulators screen) | | |
| from the first HDR value of the PLN file in calculating the first delivery schedule values. | | |
|  |  |  |
| If the resulting qty is negative, then '0' is imported as the delivery schedule quantity and the next | | |
| HDR qty is analyzed. When that resulting qty is positive, that qty is allocated. | | |
| After the first positive qty is allocated, each delivery schedule quantity is compared to the previous | | |
| delivery schedule qty. In Example 36, on 3/4/02, 564960 - 451680 = 113280(the qty allocated for week). | | |
|  |  |  |
| On 3/11/02, 595904 minus the previous HDR qty (on 3/4/02) of 564960 = 30944 | | |
| On 3/18/02, 595904 minus the previous HDR qty (on 3/11/02) of 595904 = 0 | | |
|  |  |  |
| Since Today IS included in the proration, the qty of 113280 is added as delivery schedules for | | |
| 56640 on 3/7/02 and 56640 on 3/8/02. |  |  |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.htm) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.htm) PLN Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.htm) PLN CUMM Shipped Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.htm) PLN CUMM FAB Quantities Example 1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_2.htm) PLN CUMM FAB Quantities Example 2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_3.htm) PLN CUMM FAB Quantities Example 3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.htm)
Working with Subtract Intransit Quantities (CPO CUM Quantities)