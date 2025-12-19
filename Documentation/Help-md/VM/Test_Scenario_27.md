Test Scenario 27




# Test Scenario 27

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 27 refers to VISUALs allocation of delivery schedules. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_C-C-S.gif | Sub Line tab  Scen_02_S.gif |
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
| Delivery Schedule Allocation Test (Allocating 20% of qty on M,T,W,Th,F) |
| Total Req to be shipped: 39300 (VDI file) Less 1500 (Intransit)  Less 31500 (Their EDI Cumm) = 6300 |
| Unshipped delivery schedule lines 6-9 deleted (dates 12/26, 1/2, 1/9 and 1/16) |
| Insert of Delivery Schedule duplicate lines - Not Applicable |
| Update of Delivery Schedule lines - Not Applicable |
| DS line 11/14/05 for 1500 was over shipped by 300 and Close Partial Shipped changed the qty to 1800; DS line 11/21/05 for 1500 was under shipped by 500 and Close Partial Shipped changed the qty to 1000. |
| Required Qty Inserted or Updated:  Delivery schedules inserted: 39300-37800 (DS 1/16,17,18,19,20 for 300 each for a total of 1500 created), 37800-36300 (DS 1/9, 10, 11, 12, 13 for 300 each for a total of 1500 created), 36300-34800 (DS 1/2, 3, 4, 5, 6 for 300 each for a total of 1500 created), 34800-33300 (DS 12/26, 27, 28, 29, 30 for 300 each for a total of 1500 created). |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
in the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help