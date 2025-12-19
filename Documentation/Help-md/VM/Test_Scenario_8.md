Test Scenario 8




# Test Scenario 8

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 8 refers to line 1 of your customer order. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_C-C-C.gif | Sub Line tab  Scen_02_S.gif |
| VMDI Exchange | |
| Scen_03_S.gif |  |

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
| Total Req to be shipped: 39300 (VDI file) Less 31500 (Their EDI Cumm) =7800 |
| Intransit Qty = 33000 (Our Total Shipments) Less 31500 (Their EDI Cumm)  = 1500 (This is the qty to be ADDED BACK to the most recent shipped delivery schedule - 12/19/05, which was shipped on 12/1); But since DS Insert and Update checkboxes are cleared, the 12/19 delivery schedule cannot be updated or re-inserted again - the 1500 is instead rejected and the message box shows it as "Duplicated Rejected". |
| 7800 - 1500 (Intransit to add back) = 6300 (required qty to be shipped) |
| Unshipped delivery schedule lines 6-9 deleted (dates 12/26, 1/2, 1/9 and 1/16) |
| Insert of Delivery Schedule duplicate lines - Not Applicable |
| Update of Delivery Schedule lines - Not Applicable |
| DS line 11/14/05 for 1500 was over shipped by 300 and Close Partial Shipped changed the qty to 1800; DS line 11/21/05 for 1500 was under shipped by 500 and Close Partial Shipped changed the qty to 1000.  Subtract Intransit - Not Applicable |
| Required Qty Inserted or Updated:  Delivery schedules inserted: 39300-37800 (DS 1/16 for 1500 created), 37800-36300 (DS 1/9 for 1500 created), 36300-34800 (DS 1/2 for 1500 created), 34800-33300 (DS 12/26 for 1500 created). Since 300 left to create (6300-6000), 12/19 DS that was to be created for 1500 would have been created for 1800. However, since the DS Insert and Update checkboxes are cleared, the 12/19 delivery schedule cannot be updated or re-inserted again the 1800 is instead rejected. |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
in the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help