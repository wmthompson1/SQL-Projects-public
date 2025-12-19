PLN CUMM Shipped Quantities - Example 7




# PLN CUMM Shipped Quantities - Example 7

|  |  |  |
| --- | --- | --- |
| Quantity: | CUMULATIVE - BASED ON SHIPPED QTY | |
| Subtract Intransit Qty: | MARKED |  |
| Start Proration from Transm Date: | MARKED |  |
| Include Today in Proration: | NOT Marked |  |
|  |  |  |
| Sample of example HDR lines from PLN0001.VDI file: | |  |
| HDRFORDMO EF06A 200203040000000000005649600000XF1E 8594 CA | | |
| HDRFORDMO EF06A 200203110000000000005959040000XF1E 8594 CA | | |
| HDRFORDMO EF06A 200203180000000000005959040000XF1E 8594 CA | | |
|  |  |  |
| In the "Cumm - Based on Shipped Qty" examples, Our Total Shipments is 437680 and Their EDI | | |
| Accum Qty is 434400 |  |  |
|  |  |  |
| After importing via Vmdixchg, the customer forecast records on the Customer Forecasts screen | | |
| would show up allocated as follows: |  |  |
|  |  |  |
| DATE | QTY |  |
| 3/8/2002 | 127280 |  |
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
| Note: when importing PLN transactions with the Cumulative - Shipped Qty settings selected, | | |
| VISUAL searches existing customer orders for one that matches the customer id and part that is | | |
| imported on the PLN. If "Subtract Intransit Qty" is NOT marked, then VISUAL subtracts Their EDI | | |
| Accum Quantity (on the Line Accumulators screen) from the first HDR value of the PLN file; | | |
| If "Subtract Intransit Qty" IS marked, then VISUAL subtracts Our Total Shipments from the first HDR | | |
| value of the PLN file. |  |  |
|  |  |  |
| Note: The first Cumm quantity in this VDI file is 564960 on 3/4/02. Since "Subtract Intransit Qty" IS | | |
| Marked, Our Total Shipments (for the matching customer order's line item) is subtracted | | |
| from the first HDR qty in calculating the first delivery schedule values. | | |
|  |  |  |
| If the resulting qty is negative, then '0' is imported as the delivery schedule quantity and the next | | |
| HDR qty is analyzed. When that resulting qty is positive, that qty is allocated. | | |
| After the first positive qty is allocated, each delivery schedule quantity is compared to the previous | | |
| delivery schedule qty. In Example 31, on 3/4/02, 564960 - 437680 = 127280 (the qty allocated for week). | | |
|  |  |  |
| On 3/11/02, 595904 minus the previous HDR qty (on 3/4/02) of 564960 = 30944 | | |
| On 3/18/02, 595904 minus the previous HDR qty (on 3/11/02) of 595904 = 0 | | |
|  |  |  |
| Since Today is NOT included in the proration, the qty of 127280 is added as a delivery schedule | | |
| for 3/8/02. |  |  |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](CPO_Discrete_Quantities_Example_1.md) CPO Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_Discrete_Quantities_Example_1.md) PLN Discrete Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_1.md) PLN CUMM Shipped Quantities Example
1

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_2.md) PLN CUMM Shipped Quantities Example
2

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_3.md) PLN CUMM Shipped Quantities Example
3

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_4.md) PLN CUMM Shipped Quantities Example
4

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_5.md) PLN CUMM Shipped Quantities Example
5

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_6.md) PLN CUMM Shipped Quantities Example
6

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_Shipped_Quantities_Example_8.md) PLN CUMM Shipped Quantities Example
8

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](PLN_CUMM_FAB_Quantities_Example_1.md) PLN CUMM FAB Quantities Examples

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Test_Scenario_1.md)
Working with Subtract Intransit Quantities (CPO CUM Quantities)