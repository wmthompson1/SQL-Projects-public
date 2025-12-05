Test Scenario 25




# Test Scenario 25

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 25 refers to line 2 of your customer order. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_S-S-S.gif | Sub Line tab  Scen_02_S.gif |
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
| Total Req to be shipped: 45500 (VDI file) Less 600 (Intransit) |
| Less 41200 (Their EDI Cumm) = 3700 |
| Unshipped delivery schedule lines 2,3 deleted (dates 1/16 and 1/23) |
| Delivery Schedule duplicates Inserted: none |
| Delivery Schedule lines 1 Updated for date: 1/09 |
| DS line 1/09/06 for 1500 was under shipped by 500 and Close Partial Shipped changed the qty to 1000. |
| Required Qty Inserted or Updated:  Delivery schedules inserted: 45500-43500 (DS 1/23 for 2000 created). Since 1700 left to create (3700-2000), DS 1/16 created for 1700. |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
in the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help