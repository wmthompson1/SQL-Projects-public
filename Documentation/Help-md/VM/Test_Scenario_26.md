Test Scenario 26




# Test Scenario 26

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 26 refers to line 2 of your customer order. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_S-C-C.gif | Sub Line tab  Scen_02_S.gif |
| VMDI Exchange | |
| Scen_03_S.gif |  |

## Input File:

The imported CPO file: the input data imported by VMDI Exchange
into Customer Order Entry.

|  |
| --- |
| LIN,CUMMTEST,RAW\_MATERIAL\_2,1,20060103000000,987,ONE,MMC-MAIN,20060103000000,412000000  SUB,CUMMTEST,20060109000000,415000000,ONE,A  SUB,CUMMTEST,20060116000000,435000000,ONE,F  SUB,CUMMTEST,20060123000000,455000000,ONE,P |

## Import Results:

RESULTS after import Customer Order CUMMTEST with VMDI Exchange:

|  |
| --- |
| Total Req to be shipped: 45500 (VDI file) Less 41200 (Their EDI Cumm) = 4300 |
| Intransit Qty = 41800 (Our Total Shipments) Less 41200 (Their EDI Cumm)  = 600 (This is the qty to be ADDED BACK to the most recent shipped delivery schedule - 1/9/06, which was shipped on 1/3); Since DS Update checkbox is cleared, the 1/09/06 delivery schedule is NOT updated but instead a new 1/09 delivery schedule for 600 is created. |
| 4300 - 600 (Intransit to add back) = 3700 (required qty to be shipped) |
| Unshipped delivery schedule lines 2,3 deleted (dates 1/16 and 1/23) |
| Delivery Schedule duplicates Inserted: none |
| Update of Delivery Schedule lines - Not Applicable |
| DS line 1/09/06 for 1500 was under shipped by 500 and Close Partial Shipped changed the qty to 1000. |
| Subtract Intransit - Not Applicable |
| Required Qty Inserted or Updated:  Delivery schedules inserted: 45500-43500 (DS 1/23 for 2000 created), Since 1700 left to create (3700-2000), DS 1/16 created for 1700. |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
in the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help