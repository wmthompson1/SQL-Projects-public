Test Scenario 24




# Test Scenario 24

|  |  |
| --- | --- |
| POSTIT.gif | Test scenario 24 refers to line 1 of your customer order. |

## Settings:

|  |  |
| --- | --- |
| VMDI Generate | |
| Header tab  Scen_01_C-C-C.gif | Sub Line tab  Scen_02_C.gif |
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
| Intransit Qty = 33000 (Our Total Shipments) Less 31500 (Their EDI Cumm)  = 1500 (This is the qty to be ADDED BACK to the most recent shipped delivery schedule - 12/19/05, which was shipped on 12/1); But since DS Insert and Update checkboxes are cleared, the 12/19 delivery schedule cannot be updated or re-inserted again - the 1500 is instead rejected and the message box shows it as "Duplicated Rejected". |
| 7300 - 1500 (Intransit to add back) = 5800 (required qty to be shipped) |
| Delete Unshipped Schedules - Not Applicable |
| Insert of Delivery Schedule duplicate lines - Not Applicable |
| Update of Delivery Schedule lines - Not Applicable |
| Close Partial Shipped Delivery Schedules - Not Applicable |
| Subtract Intransit - Not Applicable |
| Required Qty Inserted or Updated:  39300-37800 (DS 1/16 for 1500 already exists), 5800-1500=4300 (req qty to ship), 37800-36300 (DS 1/9 for 1500 already exists), 36300-34800 (DS 1/2 for 1500 already exists). Since 1300 left to create (5800-4500), 12/26 should have been updated to 1300. However, the DS Duplicate Update checkbox is cleared so updates of this kind are rejected. The result is that DS 12/26 remains at a qty of 1500. |

For more information on which schedules VISUAL inserted, updated,
and deleted, use a text viewer to look at the CPO####G.log file located
in the directory where your executables are installed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help