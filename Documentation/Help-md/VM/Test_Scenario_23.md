Test Scenario 23




# Test Scenario 23

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 23 refers to line 1 of your customer order. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_C-S-C.gif | Sub Line tab  Scen_02_C.gif |
| VMDI Exchange | |
| Scen_03_C.gif |  |

## Input File:

The imported CPO file: the input data imported by VMDI Exchange
into Customer Order Entry.

|  |
| --- |
| LIN,CUMMTEST,RAW\_MATERIAL\_1,1,20051205000000,1234,ONE,MMC-MAIN,20051205000000,315000000  SUB,CUMMTEST,20051205000000,315000000,ONE,A  SUB,CUMMTEST,20051212000000,330000000,ONE,F  SUB,CUMMTEST,20051219000000,333000000,ONE,F  SUB,CUMMTEST,20051226000000,348000000,ONE,P  SUB,CUMMTEST,20060102000000,363000000,ONE,P  SUB,CUMMTEST,20060109000000,378000000,ONE,P  SUB,CUMMTEST,20060116000000,393000000,ONE,P |

## Import Results:

RESULTS after import Customer Order CUMMTEST with VMDI Exchange:

|  |
| --- |
| Total Req to be shipped: 39300 (VDI file) Less 31500 (Their EDI Cumm) |
| Less 500 (for any open requirements that were under shipped) = 7300 |
| Intransit Qty = 33000 (Our Total Shipments) Less 31500 (Their EDI Cumm)  = 1500 (This is the qty to be ADDED BACK to the most recent shipped delivery schedule - 12/19/05, which was shipped on 12/1); the order qty of the 12/19/05 delivery schedule is changed from 1500 to 3000 |
| 7300 - 1500 (Intransit to add back) = 5800 (required qty to be shipped) |
| Delete Unshipped Schedules - Not Applicable |
| Insert of Delivery Schedule duplicate lines - Not Applicable |
| Delivery Schedule lines 4-9 Updated for: 12/05, 12/19, 1/16, 1/9, 1/2 and 12/26 |
| Close Partial Shipped Delivery Schedules - Not Applicable |
| Subtract Intransit - Not Applicable |
| Required Qty Inserted or Updated:  Delivery schedules Updated (none inserted): 39300-37800 (DS 1/16 to 1500), 37800-36300 (DS 1/9 to 1500), 36300-34800 (DS 1/2 to 1500).Since 1300 left to update (5800-4500), 12/26 DS updated to 1300. |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
 the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help