EDI Chart




# EDI Chart

|  |  |  |
| --- | --- | --- |
| Line Accumulators: Changes to the way VISUAL calculates values in 6.2.8 | |  |
| Field | Previous Standard Calculation | New 6.2.8 Calculation |
| Theirs Accum Date | The most current EDI shipment date (CUST\_ORDER\_LINE.EDI\_LAST\_SHIPDATE). | N/A |
| Theirs Accum Qty | Sum of the current Accum periods shipped qty. (CUST\_ORDER\_LINE.EDI\_ACCUM\_SHIP\_QTY) | N/A |
| Theirs Discrepancy | Calculated as the difference between the EDI Accum Qty less the VISUAL Total Shipments. (CUST\_ORDER\_LINE.EDI\_ACCUM\_SHIP\_QTY less CUST\_ORDER\_LINE.TOTAL\_USR\_SHIP\_QTY). | N/A |
| Theirs Intransit Qty | Any shipped quantities whose SHIPPER.SHIPPED\_DATE is greater than CUST\_ORDER\_LINE.EDI\_LAST\_SHIPDATE. | N/A |
| Ours Last Ship Date | The most current date in which this customer order line item has been shipped. Max(SHIPPER.SHIPPED\_DATE) | This field will function as standard with the following exception. If the most current ship date is less than the value within CUSTOMER\_ORDER.EDI\_ACCUM\_CLR\_DATE and the value within Theirs Intransit Qty equals zero, then this field will show nothing. |
| Ours Accum Shipments | Sum of the quantity shipped by VISUAL Sum(SHIPPER\_LINE.SHIPPED\_QTY). | Sum of the quantity shipped by VISUAL whose ship date is greater than the value within CUSTOMER\_ORDER.EDI\_ACCUM\_CLR\_DATE. Sum(SHIPPER\_LINE.SHIPPED\_QTY). |
| Ours Shipment Adjust. | User entered EDI adjustment to shipment (CUST\_ORDER\_LINE.EDI\_ACCUM\_SHIP\_ADJ). | N/A |
| Ours Total Shipments | Ours Accum Shipments plus Ours Shipment Adjust | N/A |
| Ours Packlist ID | N/A | The most current Packlist ID that has been shipped against this customer order line. If the most current ship date is less than the value within CUSTOMER\_ORDER.EDI\_ACCUM\_CLR\_DATE and the value within Theirs Intransit Qty equals zero, then this field will |
| Current Fab(Build) | CUST\_ORDER\_LINE.EDI\_FAB\_QTY. | N/A |
| Current Raw (Buy) | CUST\_ORDER\_LINE.EDI\_ACCUM\_FAB\_QTY | N/A |
| High Qty Fab (Build) | Max(CUST\_BOOK\_LINE.EDI\_ACCUM\_FAB\_QTY) | Max(CUST\_BOOK\_LINE.EDI\_ACCUM\_FAB\_QTY) whose CUST\_BOOK\_LINE.EDI\_LAST\_SHIPDATE is greater than CUST\_ORDER\_LINE.EDI\_ACCUM\_CLR\_DATE. |
| High Qty Raw (Buy) | Max(CUST\_BOOK\_LINE.EDI\_ACCUM\_RAW\_QTY). | Max(CUST\_BOOK\_LINE.EDI\_ACCUM\_RAW\_QTY) whose CUST\_BOOK\_LINE.EDI\_LAST\_SHIPDATE is greater than CUST\_ORDER\_LINE.EDI\_ACCUM\_CLR\_DATE. |
| High Date Fab (build) | CUST\_BOOK\_LINE.EDI\_LAST\_SHIPDATE for the corresponding High Qty Fab (Build). | N/A |
| High Date Raw (Buy) | CUST\_BOOK\_LINE.EDI\_LAST\_SHIPDATE for the corresponding High Qty Raw (Buy). | N/A |